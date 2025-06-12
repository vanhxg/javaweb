package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

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

@WebServlet(name = "CustomerServlet", urlPatterns = {"/quanly-tk", "/addCustomer", "/editCustomer", "/deleteCustomer", "/trash", "/restoreCustomer", "/hardDeleteCustomer"}, loadOnStartup = 1)

public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ScheduledExecutorService scheduler;
       
  private CustomerDAO customerDao;
  public void init() {
	  customerDao = new CustomerDAO(); 
	  customerDao.encryptExistingPasswords();
	  scheduler = Executors.newSingleThreadScheduledExecutor();
      scheduler.scheduleAtFixedRate(() -> {
          int deletedCount = customerDao.autoDeleteOldRecords();
          System.out.println("Auto xóa cứng " + deletedCount + " bản ghi");
      }, 0, 24, TimeUnit.HOURS);
  }
    public userController() {
        super();
       
    }
    public void destroy() {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");

	    HttpSession session = request.getSession();
	    String msg = (String) session.getAttribute("message");
	    if (msg != null) {
	        request.setAttribute("message", msg);
	        session.removeAttribute("message");
	    }

	    String action = request.getParameter("action");
	    if (action == null) action = "";

	    switch (action) {
	        case "view":
	            // Quay lại danh sách tài khoản chưa xóa
	            ArrayList<Customer> listCustomer = customerDao.selectAll(); // is_deleted = false
	            request.setAttribute("listCustomer", listCustomer);
	            RequestDispatcher viewDispatcher = request.getRequestDispatcher("/dashboard/customer.jsp");
	            viewDispatcher.forward(request, response);
	            break;

	        default:
	            // Mặc định xử lý theo URI như trước
	            String uri = request.getRequestURI();

	            if (uri.contains("/trash")) {
	                ArrayList<Customer> deletedCustomers = customerDao.selectAllDeleted();
	                request.setAttribute("deletedCustomers", deletedCustomers);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/trash.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                ArrayList<Customer> list = customerDao.selectAll();
	                request.setAttribute("listCustomer", list);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/customer.jsp");
	                dispatcher.forward(request, response);
	            }
	            break;
	    }
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
            case "restore":
                handleRestore(request, response);
                break;
            case "hardDelete":
                handleHardDelete(request, response);
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

	    	    int result = customerDao.softDelete(id); // gọi hàm xóa mềm
	    	    if (result > 0) {
	    	        request.getSession().setAttribute("message", "Tài khoản đã được đưa vào thùng rác!");
	    	    } else {
	    	        request.getSession().setAttribute("message", "Không thể xóa tài khoản!");
	    	    }

	    	    response.sendRedirect("quanly-tk");
	    }
	    private void handleRestore(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        String id = request.getParameter("customerId");
	        int result = customerDao.restore(id);
	        if (result > 0) {
	            request.getSession().setAttribute("message", "Khôi phục tài khoản thành công!");
	        } else {
	            request.getSession().setAttribute("message", "Khôi phục thất bại!");
	        }
	        response.sendRedirect("trash");
	    }

	    private void handleHardDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        String id = request.getParameter("customerId");
	        int result = customerDao.hardDelete(id);
	        if (result > 0) {
	            request.getSession().setAttribute("message", "Xóa tài khoản vĩnh viễn thành công!");
	        } else {
	            request.getSession().setAttribute("message", "Xóa vĩnh viễn thất bại!");
	        }
	        response.sendRedirect("trash");
	    }
	}