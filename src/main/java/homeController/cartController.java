package homeController;

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
import model.Cart;
import model.CartItem;
import model.Product;


@WebServlet("/quanly-giohang")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private ProductDAO productDao = new ProductDAO(); // DAO lấy sản phẩm từ DB

  
    public cartController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("productId");
        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("/homepage/cart.jsp"); // xử lý lỗi nếu không có id
            return;
        }

        Product product = productDao.selectById2(productId);

        if (product == null) {
            response.sendRedirect("/homepage/cart.jsp"); // xử lý nếu không tìm thấy sản phẩm
            return;
        }

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        cart.addItem(product);
        session.setAttribute("cart", cart);

        response.sendRedirect("/homepage/cart.jsp"); // hoặc trở lại trang cũ
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
