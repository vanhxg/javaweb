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

import org.mindrot.jbcrypt.BCrypt;

import database.CustomerDAO;
import model.Customer;


@WebServlet("/dang-nhap")
public class DangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DangNhap() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
	     
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAO();
        ArrayList<Customer> list = dao.selectAll();

        boolean found = false;

        for (Customer c : list) {
        	if (c.getUsername().equals(username) && BCrypt.checkpw(password, c.getPassword())) {
                found = true;

                HttpSession session = request.getSession();
                session.setAttribute("user", c); // Lưu cả đối tượng Customer

                if ("Admin".equalsIgnoreCase(c.getIsAdmin())) {
                    // Là Admin → vào giao diện NiceAdmin
                    response.sendRedirect(request.getContextPath() + "/dashboard/index.jsp");
                } else {
                    // Là khách hàng bình thường → vào trang người dùng
                    response.sendRedirect(request.getContextPath() + "/homepage/home.jsp");
                }
                return;
            }
        }

        if (!found) {
            request.setAttribute("thongbao", "Sai username hoặc password!");
            RequestDispatcher rd = request.getRequestDispatcher("/dashboard/login.jsp");
            rd.forward(request, response);
        }
	}

}
