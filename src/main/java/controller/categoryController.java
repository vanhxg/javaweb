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

import database.CategoryDAO;
import model.Category;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/quanly-danhmuc", "/addCategory", "/editCategory", "/deleteCategory"})
public class categoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CategoryDAO categoryDao;
    
    @Override
    public void init() {
        categoryDao = new CategoryDAO();
    }

    public categoryController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String msg = (String) session.getAttribute("message");
        if(msg != null) {
            request.setAttribute("message", msg);
            session.removeAttribute("message");
        }
        
        ArrayList<Category> listCategory = categoryDao.selectAll();
        request.setAttribute("listCategory", listCategory);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/category.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";

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
                response.sendRedirect("quanly-danhmuc");
                break;
        }
    }
    
    private void handleAdd(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String categoryId = categoryDao.generateNextCategoryId();
        String name = request.getParameter("categoryName");

        Category category = new Category(categoryId, name);

        int result = categoryDao.insert(category);
        if (result > 0) {
            request.getSession().setAttribute("message", "Thêm danh mục thành công!");
        } else {
            request.getSession().setAttribute("message", "Thêm danh mục thất bại!");
        }

        response.sendRedirect("quanly-danhmuc");
    }
    
    private void handleEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("categoryId");
        String name = request.getParameter("categoryName");

        Category category = new Category(id, name);
        
        int result = categoryDao.update(category);
        if (result > 0) {
            request.getSession().setAttribute("message", "Sửa danh mục thành công!");
        } else {
            request.getSession().setAttribute("message", "Sửa danh mục thất bại!");
        }

        response.sendRedirect("quanly-danhmuc");
    }
    
    private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String id = request.getParameter("categoryId");
        
        Category category = new Category();
        category.setCategoryId(id);
        
        int result = categoryDao.delete(category);
        if (result > 0) {
            request.getSession().setAttribute("message", "Xóa danh mục thành công!");
        } else {
            request.getSession().setAttribute("message", "Xóa danh mục thất bại!");
        }

        response.sendRedirect("quanly-danhmuc");
    }
}