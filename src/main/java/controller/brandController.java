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

import database.BrandDAO;
import model.Brand;

/**
 * Servlet implementation class brandController
 */
/* @WebServlet("/quanly-ncc") */
@WebServlet(name = "BrandServlet", urlPatterns = {"/quanly-ncc", "/addBrand", "/editBrand", "/deleteBrand"})

public class brandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BrandDAO brandDao;
	
	@Override
    public void init() {
        brandDao = new BrandDAO();
    }
	
    public brandController() {
        super();
        // TODO Auto-generated constructor stub
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

	    
		// Bỏ dòng này đi
		/* BrandDAO brandDao = new BrandDAO(); */
		ArrayList<Brand> listBrand = brandDao.selectAll();
		
		// 1. Gửi request lên server:
		request.setAttribute("listBrand", listBrand);
		
		// 2. Chuyển dữ liệu từ server lên trang giao diện brand.jsp:
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/brand.jsp");
		dispatcher.forward(request, response);

	}

	
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
                response.sendRedirect("quanly-ncc");
                break;
        }
	}
	
	 private void handleAdd(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
		 	//Tự động sinh ra mã brand mới nhớ hàm generateNextBrandId()s
		 	String brandId = brandDao.generateNextBrandId();
	        String name = request.getParameter("brandName");
	        String address = request.getParameter("brandAddress");
	        String phone = request.getParameter("brandMobiphone");

	        Brand brand = new Brand();
	        brand.setBrandId(brandId);
	        brand.setBrandName(name);
	        brand.setBrandAddress(address);
	        brand.setBrandMobiphone(phone);

	        int result = brandDao.insert(brand);
			if (result > 0) {
				request.getSession().setAttribute("message", "Thêm nhà cung cấp thành công!");
			} else {
				request.getSession().setAttribute("message", "Thêm nhà cung cấp thất bại!");
			}

	        // Chuyển hướng về trang danh sách sau khi thêm
	        response.sendRedirect("quanly-ncc");
	    }
	
	private void handleEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("brandId");
		String name = request.getParameter("brandName");
		String address = request.getParameter("brandAddress");
		String phone = request.getParameter("brandMobiphone");

		Brand brand = new Brand(id, name, address, phone);
		
		int result = brandDao.update(brand);
		if (result > 0) {
		    request.getSession().setAttribute("message", "Sửa nhà cung cấp thành công!");
		} else {
		    request.getSession().setAttribute("message", "Sửa nhà cung cấp thất bại!");
		}


		response.sendRedirect("quanly-ncc");
	}
	
	private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String id = request.getParameter("brandId");
        
        Brand brand = new Brand();
        brand.setBrandId(id);
        
        int result = brandDao.delete(brand);
        if (result > 0) {
            request.getSession().setAttribute("message", "Xóa nhà cung cấp thành công!");
        } else {
            request.getSession().setAttribute("message", "Xóa nhà cung cấp thất bại!");
        }


        response.sendRedirect("quanly-ncc");
    }

}
