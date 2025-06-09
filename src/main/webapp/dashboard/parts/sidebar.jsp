<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="${pageContext.request.contextPath}/chartUser">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
		
		<li class="nav-item">
        	<a class="nav-link collapsed"  href="${pageContext.request.contextPath}/quanly-tk">
          	<i class="bi bi-person"></i>
          	<span>Quản lý người dùng</span>
        	</a>
      	</li><!-- End Quản lý sản phẩm Nav -->
		
      	<li class="nav-item">
        	<a class="nav-link collapsed"  href="${pageContext.request.contextPath}/quanly-sanpham">
          	<i class="bi bi-menu-button-wide"></i>
          	<span>Quản lý sản phẩm</span>
        	</a>
      	</li><!-- End Quản lý sản phẩm Nav -->

		<li class="nav-item">
        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/quanly-donhang">
          <i class="bi bi-bag"></i>
          <span>Quản lý đơn hàng</span>
        </a>
        </li><!-- End Quản lý đơn hang Nav -->
        
        <li class="nav-item">
        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/quanly-danhmuc">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>Quản lý danh mục</span>
        </a>
        
        <li class="nav-item">
        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/quanly-ncc">
          <i class="bi bi-gem"></i>
          <span>Quản lý nhà cung cấp</span>
        </a>
       
        
      </li><!-- End Quản lý đơn hàng Nav -->


      
      <li class="nav-heading">Pages</li>

      

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="register.jsp">
          <i class="bi bi-card-list"></i>
          <span>Register</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/dashboard/login.jsp">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      

      

    </ul>

  </aside><!-- End Sidebar-->