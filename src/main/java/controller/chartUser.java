package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CustomerDAO;
import database.DetailOrderDAO;
import database.OrderDAO;
import model.ProductStat;


@WebServlet("/chartUser")
public class chartUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public chartUser() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		// Lấy số user
		CustomerDAO customerDao = new CustomerDAO();
		int userCount = customerDao.getCountUser();
		
		
		// Lấy số đơn hàng trong tháng hiện tại
	    Calendar cal = Calendar.getInstance();
	    int month = cal.get(Calendar.MONTH) + 1; // Tháng bắt đầu từ 0
	    int year = cal.get(Calendar.YEAR);

	    OrderDAO orderDao = new OrderDAO();
	    int orderCount = orderDao.getCountOrderByMonth(month, year);
		
	    // Lấy doanh thu tháng hiện tại
	    DetailOrderDAO detailDao = new DetailOrderDAO();
	    int revenue = detailDao.getRevenueByMonth(month, year); // Trả về kiểu int
	    
	    // Lấy top 5 sản phẩm bán chạy
	    ArrayList<ProductStat> topProducts = detailDao.getTop5BestSellingProducts();
	    
	    // Lấy doanh thu 12 tháng
	    ArrayList<Integer> monthlyRevenue = new ArrayList<>();
	    for (int m = 1; m <= 12; m++) {
	        int monthlyRev = detailDao.getRevenueByMonth(m, year);	// year: lấy từ phần số đơn hàng trong tháng
	        monthlyRevenue.add(monthlyRev);
	    }
	    
	    // Lấy số lượng customer theo giới tính
	    int maleCount = customerDao.getCountGender("Nam");
	    int femaleCount = customerDao.getCountGender("Nữ");
	    int otherCount = customerDao.getCountGender("Khác");
	    
	    
		
		// 1. Gửi request lên server:
        request.setAttribute("userCount", userCount); // Gửi dữ liệu sang JSP
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("revenue", revenue);
        request.setAttribute("topProducts", topProducts);
        request.setAttribute("monthlyRevenue", monthlyRevenue);
        request.setAttribute("maleCount", maleCount);
        request.setAttribute("femaleCount", femaleCount);
        request.setAttribute("otherCount", otherCount);

        
        
        // 2. Chuyển dữ liệu từ server lên trang giao diện brand.jsp:
 		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/index.jsp");
 		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
