package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
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

/**
 * Servlet implementation class userController
 */

@WebServlet(name = "CustomerServlet", urlPatterns = {"/quanly-tk", "/addCustomer", "/editCustomer", "/deleteCustomer"},loadOnStartup = 1)

public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  private CustomerDAO customerDao;
  public void init() {
	  customerDao = new CustomerDAO(); 
	  customerDao.encryptExistingPasswords();
  }
    public userController() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String msg = (String) session.getAttribute("message");
		if(msg != null) {
		    request.setAttribute("message", msg);
		    session.removeAttribute("message"); // xóa luôn tại đây
		}
		
		
		ArrayList<Customer> listCustomer = customerDao.selectAll();
		
		// 1. Gửi request lên server:
		request.setAttribute("listCustomer", listCustomer);
		
		// 2. Chuyển dữ liệu từ server lên trang giao diện brand.jsp:
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/customer.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String action = request.getParameter("action"); // Lấy action từ form hoặc URL

        if (action == null) action = ""; // tránh null

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
                // Nếu không có action hợp lệ, quay lại trang danh sách
                response.sendRedirect("quanly-tk");
                break;
        }
	    }

	 private void handleAdd(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
		 	
		 	String customerId = customerDao.generateNextCustomerId();
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
	       
	        String customerName = request.getParameter("customerName");
	        String customerGender = request.getParameter("customerGender");
	        String customerDate = request.getParameter("customerDate");
	        String customerAddress = request.getParameter("customerAddress");
	        String customerMobiphone = request.getParameter("customerMobiphone");
	        String customerEmail = request.getParameter("customerEmail");
	        String customerAdmin = request.getParameter("customerAdmin");  
	        
	        Customer customer = new Customer();
	        customer.setCustomerId(customerId);
	        customer.setUsername(username);
	        customer.setPassword(password);
	        customer.setCustomerName(customerName);
	        customer.setCustomerGender(customerGender);
	        try {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // đúng định dạng của input type="date"
	            java.util.Date utilDate = sdf.parse(customerDate);
	            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	            customer.setCustomerDate(sqlDate);
	        } catch (Exception e) {
	            e.printStackTrace();
	            customer.setCustomerDate(null); // fallback nếu lỗi
	        }
	        customer.setCustomerAddress(customerAddress);
	        customer.setCustomerMobiphone(customerMobiphone);
	        customer.setCustomerEmail(customerEmail);
	        customer.setIsAdmin(customerAdmin);

	        int result = customerDao.insert(customer);
			if (result > 0) {
				request.getSession().setAttribute("message", "Thêm tài khoản thành công!");
			} 

	        // Chuyển hướng về trang danh sách sau khi thêm
	        response.sendRedirect("quanly-tk");
	    }

	   
	
	    private void handleEdit(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	    	String id = request.getParameter("customerId");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
		       
	        String name = request.getParameter("customerName");
	        String gender = request.getParameter("customerGender");
	        String date = request.getParameter("customerDate");
	        String address = request.getParameter("customerAddress");
	        String phone = request.getParameter("customerMobiphone");
	        String email = request.getParameter("customerEmail");
	        String admin = request.getParameter("customerAdmin");
	       
	       

	        Customer customer = new Customer();
	        customer.setCustomerId(id);
	        customer.setUsername(username);
	        customer.setPassword(password);
	        customer.setCustomerName(name);
	        customer.setCustomerGender(gender);
	        customer.setCustomerDate(Date.valueOf(date)); // java.sql.Date
	        customer.setCustomerAddress(address);
	        customer.setCustomerMobiphone(phone);
	        customer.setCustomerEmail(email);
	        customer.setIsAdmin(admin);
	       
	        

	        int result = customerDao.update(customer);
			if (result > 0) {
			    request.getSession().setAttribute("message", "Sửa nhà thông tin thành công!");
			}

	        response.sendRedirect("quanly-tk"); // chuyển hướng về trang quản lý tài khoản
	    }

	    private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	    	String id = request.getParameter("customerId");
	        
	        Customer customer = new Customer();
	        customer.setCustomerId(id);
	        
	        int result = customerDao.delete(customer);
	        if (result > 0) {
	            request.getSession().setAttribute("message", "Xóa tài khoản thành công!");
	        }

	        response.sendRedirect("quanly-tk");
	    }
	}