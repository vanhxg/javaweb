package homeController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDAO;
import model.Product;

@WebServlet("/product-details")
public class productdetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy productid từ request
        String productId = request.getParameter("productid");
        
        if (productId == null || productId.trim().isEmpty()) {
            response.getWriter().write("Lỗi: productid không tồn tại!");
            return;
        }
        
		/*
		 * if (productId == null || productId.trim().isEmpty()) { // Nếu không có
		 * productid, chuyển hướng về trang chủ hoặc trang lỗi
		 * response.sendRedirect("home"); return; }
		 */

        // Lấy chi tiết sản phẩm từ DAO
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.selectById(new Product(productId, null, null, 0, 0, null, null, null));

        if (product == null) {
            // Nếu không tìm thấy sản phẩm, chuyển hướng về trang lỗi
            response.sendRedirect("notfound.jsp");
            return;
        }
		/*
		 * // Lấy danh sách sản phẩm liên quan ArrayList<Product> relatedProducts =
		 * productDAO.getRelatedProducts(product.getCategory().getCategoryId());
		 */
        // Đưa dữ liệu lên request
        request.setAttribute("product", product);
        //request.setAttribute("relatedProducts", relatedProducts);

        // Forward tới view productdetails.jsp
        RequestDispatcher rd = request.getRequestDispatcher("/homepage/product-details.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
