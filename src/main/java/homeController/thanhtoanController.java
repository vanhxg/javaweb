package homeController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CustomerDAO;
import database.ProductDAO;
import model.Customer;
import model.Product;

@WebServlet("/thanhToan")
public class thanhtoanController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy productId từ request
            String productId = request.getParameter("productid");
            String quantityStr = request.getParameter("quantity");
            int quantity = 1; // Mặc định

            try {
                quantity = Integer.parseInt(quantityStr);
            } catch (Exception e) {
                // fallback giữ quantity = 1
            }

            request.setAttribute("quantity", quantity);

            System.out.println("➡️ thanhtoanController đang chạy với productid = " + productId);

            // Kiểm tra productId hợp lệ
            if (productId == null || productId.trim().isEmpty()) {
                response.sendRedirect("notfound.jsp");
                return;
            }

            // Lấy thông tin sản phẩm từ DAO
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.selectById(new Product(productId, null, null, 0, 0, null, null, null));

            if (product == null) {
                response.sendRedirect("notfound.jsp");
                return;
            }

            // Gửi thông tin sản phẩm tới JSP
            request.setAttribute("product", product);
            int amount = product.getProductCost() * quantity;
            request.setAttribute("amount", amount);
            request.setAttribute("productId", productId); // nếu cần cho momo link

    
            
        //Lấy tt khách hàng từ session
        Customer loggedInCustomer = (Customer) request.getSession().getAttribute("user");

        if (loggedInCustomer != null) {
            Customer fullInfo = new CustomerDAO().getCustomerById(loggedInCustomer.getCustomerId());
            request.setAttribute("customer", fullInfo);
        }
        
     // Forward tới trang thanh toán
        request.getRequestDispatcher("/homepage/thanhToan.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}