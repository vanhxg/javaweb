package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CategoryDAO;
import model.Category;

/**
 * Servlet implementation class categoryController
 */
@WebServlet("/quanly-danhmuc")
public class categoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public categoryController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDao = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDao.selectAll();
		// 1. Gửi request lên server:
		request.setAttribute("listCategory", listCategory);
		
		// 2. Chuyển dữ liệu từ server lên trang giao diện category.jsp:
//		System.out.println("Số lượng category: " + listCategory.size());
//		for (Category cat : listCategory) {
//		    System.out.println(cat.getCategoryId() + " - " + cat.getCategoryName());
//		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/category.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	

}
