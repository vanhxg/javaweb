package homeController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

import database.JDBCUtil;

import javax.servlet.annotation.*;

@WebServlet("/momo/payment")
public class MomoPaymentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String orderId = request.getParameter("orderId");
        String amount = request.getParameter("amount");

        System.out.println("🪙 Đang giả lập thanh toán Momo cho đơn hàng " + orderId + " với số tiền " + amount);

        // Giả lập xử lý 1s delay
        try { Thread.sleep(1000); } catch (InterruptedException e) { e.printStackTrace(); }

        // Trả về JSON success
        String json = "{ \"result\": \"success\" }";
        response.getWriter().write(json);
    }
}
