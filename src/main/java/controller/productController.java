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


import database.ProductDAO;
import database.BrandDAO;
import database.CategoryDAO;

import model.Product;
import model.Brand;
import model.Category;

@WebServlet(name = "ProductServlet", urlPatterns = {"/quanly-sanpham", "/addProduct", "/editProduct", "/deleteProduct"})
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
        String productImage = request.getParameter("productImage");
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int productCost = Integer.parseInt(request.getParameter("productCost"));
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String productDescription = request.getParameter("productDescription");

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
        String productImage = request.getParameter("productImage");
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int productCost = Integer.parseInt(request.getParameter("productCost"));
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String productDescription = request.getParameter("productDescription");

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
