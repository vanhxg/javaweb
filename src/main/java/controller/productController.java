package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import java.io.File;
import java.nio.file.Paths;
import javax.servlet.http.Part;


import database.ProductDAO;
import database.BrandDAO;
import database.CategoryDAO;

import model.Product;
import model.Brand;
import model.Category;

@WebServlet(name = "ProductServlet", urlPatterns = {"/quanly-sanpham", "/addProduct", "/editProduct", "/deleteProduct"})
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 10,  // 10MB
	    maxRequestSize = 1024 * 1024 * 20 // 20MB
)
public class productController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDao;
    private BrandDAO brandDao;
    private CategoryDAO categoryDao;

    @Override
    public void init() {
        productDao = new ProductDAO();
        brandDao = new BrandDAO();
        categoryDao = new CategoryDAO();
    }

    public productController() {
        super();
    }

    //  xử lý hiển thị danh sách sản phẩm
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ArrayList<Product> listProduct = productDao.selectAll();
        ArrayList<Category> listCategory = categoryDao.selectAll();
        ArrayList<Brand> listBrand = brandDao.selectAll();

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listBrand", listBrand);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/product.jsp"); 
        dispatcher.forward(request, response);
    }

    // Xử lý thêm, sửa, xóa 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";

        switch(action) {
            case "add":
                handleAdd(request, response);
                break;
            case "edit":
                handleEdit(request, response);
                break;
            case "delete":
                handleDelete(request, response);
                break;
            default:
                response.sendRedirect("quanly-sanpham");
                break;
        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = productDao.generateNextProductId();
        String productName = request.getParameter("productName");
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int productCost = Integer.parseInt(request.getParameter("productCost"));
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String productDescription = request.getParameter("productDescription");

        Part filePart = request.getPart("productImage");
        String productImage = null;

        if (filePart != null && filePart.getSize() > 0) {
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                request.getSession().setAttribute("message", "Vui lòng chọn file ảnh hợp lệ!");
                request.getSession().setAttribute("messageType", "danger");
                response.sendRedirect("quanly-sanpham");
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String newFileName = System.currentTimeMillis() + "_" + fileName; // đổi tên file để tránh trùng
            String uploadPath = getServletContext().getRealPath("") + File.separator + "adimgs";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + newFileName);
            productImage = "adimgs/" + newFileName;
        } else {
            // Nếu không upload ảnh mới, bạn có thể set ảnh mặc định hoặc báo lỗi
            productImage = "adimgs/default.png"; // hoặc null tùy bạn xử lý
        }

        Brand brand = brandDao.selectById(new Brand(brandId, null, null, null));
        Category category = categoryDao.selectById(new Category(categoryId, null));

        Product product = new Product(productId, productName, productImage, productQuantity, productCost, category, brand, productDescription);

        int result = productDao.insert(product);
        HttpSession session = request.getSession();
        if (result > 0) {
            session.setAttribute("message", "Thêm sản phẩm thành công!");
            session.setAttribute("messageType", "success");
        } else {
            session.setAttribute("message", "Thêm sản phẩm thất bại!");
            session.setAttribute("messageType", "danger");
        }
        response.sendRedirect("quanly-sanpham");
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int productCost = Integer.parseInt(request.getParameter("productCost"));
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String productDescription = request.getParameter("productDescription");
        String oldImage = request.getParameter("oldImage");

        Part filePart = request.getPart("productImage");
        String productImage = oldImage; // mặc định dùng ảnh cũ

        if (filePart != null && filePart.getSize() > 0) {
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                request.getSession().setAttribute("message", "Vui lòng chọn file ảnh hợp lệ!");
                request.getSession().setAttribute("messageType", "danger");
                response.sendRedirect("quanly-sanpham");
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String newFileName = System.currentTimeMillis() + "_" + fileName;
            String uploadPath = getServletContext().getRealPath("") + File.separator + "adimgs";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + newFileName);
            productImage = "adimgs/" + newFileName;
        }

        Brand brand = brandDao.selectById(new Brand(brandId, null, null, null));
        Category category = categoryDao.selectById(new Category(categoryId, null));

        Product product = new Product(productId, productName, productImage, productQuantity, productCost, category, brand, productDescription);

        int result = productDao.update(product);
        HttpSession session = request.getSession();
        if (result > 0) {
            session.setAttribute("message", "Cập nhật sản phẩm thành công!");
            session.setAttribute("messageType", "success");
        } else {
            session.setAttribute("message", "Cập nhật sản phẩm thất bại!");
            session.setAttribute("messageType", "danger");
        }
        response.sendRedirect("quanly-sanpham");
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");

        Product product = new Product();
        product.setProductId(productId);

        int result = productDao.delete(product);
        HttpSession session = request.getSession();
        if (result > 0) {
            session.setAttribute("message", "Xóa sản phẩm thành công!");
            session.setAttribute("messageType", "success"); 
        } else {
            session.setAttribute("message", "Xóa sản phẩm thất bại!");
            session.setAttribute("messageType", "danger"); 
        }
        response.sendRedirect("quanly-sanpham");
    }
}
