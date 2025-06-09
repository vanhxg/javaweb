package homeController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDAO;
import model.Product;


@WebServlet("/home")
public class loadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loadProduct() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ProductDAO dao = new ProductDAO();
		ArrayList<Product> accessories = dao.selectByCategoryId("C010");
		System.out.println("Số phụ kiện tìm thấy: " + accessories.size());

		// 1. Gửi request lên server:
		request.setAttribute("accessories", accessories);
		
		// 2. Chuyển dữ liệu từ server lên trang giao diện brand.jsp:
		RequestDispatcher dispatcher = request.getRequestDispatcher("/homepage/home.jsp");
		dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
