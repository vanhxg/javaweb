package homeController;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import database.OrderDAO;
import model.Customer;
import model.DetailOrder;
import model.Order;
import model.Product;

@WebServlet("/momo-callback")
public class momocallbackController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	        throws ServletException, IOException {

    	    HttpSession session = request.getSession();

    	    Customer customer = (Customer) session.getAttribute("user");
    	    Product product = (Product) session.getAttribute("product");

    	    String quantityParam = request.getParameter("quantity");
    	    int quantity = (quantityParam != null && !quantityParam.trim().isEmpty()) ? Integer.parseInt(quantityParam) : 1;

    	    String priceParam = request.getParameter("price");
    	    int price = (priceParam != null && !priceParam.trim().isEmpty()) ? Integer.parseInt(priceParam) : 0;

    	    String momoResult = request.getParameter("momoResult"); // thêm tham số để biết thanh toán momo hay không

    	    // Tạo đơn hàng
    	    Order order = new Order();
    	    order.setOrderId(UUID.randomUUID().toString());
    	    order.setCustomer(customer);
    	    order.setDeliveryAddress("Chưa cập nhật");
    	    order.setCreateDate(new Date(System.currentTimeMillis()));

    	    if ("success".equals(momoResult)) {
    	        order.setOrderState("Đã thanh toán");
    	        order.setPaymentMethod("Momo");
    	    } else {
    	        order.setOrderState("Chờ xác nhận");
    	        order.setPaymentMethod("COD"); // hoặc gì đó nếu đặt hàng không thanh toán online
    	    }
    	    
    	    DetailOrder detail = new DetailOrder();
    	    detail.setDetailOrderId(UUID.randomUUID().toString());
    	    detail.setOrder(order);
    	    detail.setProduct(product);
    	    detail.setProductName(product.getProductName()); 
    	    detail.setProductImage(product.getProductImage()); 
    	    detail.setQuantityOrder(quantity);
    	    detail.setTotalPrice(quantity * price);

    	    
    	    ArrayList<DetailOrder> details = new ArrayList<>();
    	    details.add(detail);
    	    order.setOrderDetails(details);
    	    
    	    // Lưu DB
    	    OrderDAO.saveOrder(order);
    	    OrderDAO.saveOrderDetail(detail);

    	    request.setAttribute("order", order);
    	    request.setAttribute("detail", detail);
    	   

    	    // Lưu đơn hàng vào session để xuất hóa đơn sau
    	    session.setAttribute("orderConfirm", order);

    	    request.setAttribute("order", order);
    	    request.setAttribute("detail", detail);

    	    request.getRequestDispatcher("/homepage/orderConfirm.jsp").forward(request, response);
    	}

}
