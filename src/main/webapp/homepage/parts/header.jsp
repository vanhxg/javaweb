<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style type="text/css">
            	/* User Dropdown Styles */
				.user-menu-item {
				    position: relative;
				    height: 100%;
				    display: flex;
				    align-items: center;
				}
				
				.user-dropdown {
				    position: relative;
				    height: 100%;
				    display: flex;
				    align-items: center;
				}
				
				.user-icon-wrapper {
				    display: flex;
				    align-items: center;
				    justify-content: center;
				    width: 40px;
				    height: 40px;
				    border-radius: 50%;
				    transition: all 0.3s ease;
				}
				
				.user-icon {
				    font-size: 22px;
				    color: #333;
				    transition: all 0.3s;
				}
				
				.user-dropdown:hover .user-icon {
				    color: #ff6b6b;
				}
				
				.dropdown-content {
				    display: none;
				    position: absolute;
				    top: 100%;
				    right: 0;
				    background-color: white;
				    min-width: 220px;
				    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
				    z-index: 1000;
				    border-radius: 4px;
				    padding: 8px 0;
				    margin-top: 5px;
				    border: 1px solid #eee;
				}
				
				.dropdown-content a {
				    color: #333;
				    padding: 10px 16px;
				    text-decoration: none;
				    display: block;
				    font-size: 14px;
				    white-space: nowrap;
				    transition: all 0.2s;
				}
				
				.dropdown-content a i {
				    width: 20px;
				    margin-right: 10px;
				    text-align: center;
				}
				
				.dropdown-content a:hover {
				    background-color: #f8f9fa;
				    color: #ff6b6b;
				    padding-left: 20px;
				}
				
				.user-dropdown:hover .dropdown-content {
				    display: block;
				    animation: fadeIn 0.3s;
				}
				
				@keyframes fadeIn {
				    from { opacity: 0; transform: translateY(10px); }
				    to { opacity: 1; transform: translateY(0); }
				}
            </style>
<header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
                                <div class="logo">
                                  <a href="${pageContext.request.contextPath}/homepage/home.jsp"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>                                                
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${pageContext.request.contextPath}/homepage/home.jsp">Trang chủ</a></li>
	                                        <li><a href="nam.html">Nam</a></li>
	                                        <li><a href="nu.html">Nữ</a></li>
	                                        <li><a href="phu-kien.html">Phụ kiện</a></li>
	                                        <li><a href="tin-tuc.html">Tin tức</a>
	                                            <ul class="submenu">
	                                                <li><a href="tin-tuc.html">Tin mới</a></li>
	                                                <li><a href="tin-tuc-chi-tiet.html">Chi tiết tin</a></li>
	                                            </ul>
	                                        </li>
	                                        <li><a href="lien-he.html">Liên hệ</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div> 
                            <div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
                                <ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
                                    <li class="d-none d-xl-block">
                                        <div class="form-box f-right ">
                                            <input type="text" name="Search" placeholder="Search products">
                                            <div class="search-icon">
                                                <i class="fas fa-search special-tag"></i>
                                            </div>
                                        </div>
                                     </li>
                                    <li class=" d-none d-xl-block">
                                        <div class="favorit-items">
                                            <i class="far fa-heart"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="shopping-card">
                                            <a href="cart.html"><i class="fas fa-shopping-cart"></i></a>
                                        </div>
                                    </li>
                                   	<li class="d-none d-lg-block user-menu-item">
	                                    <div class="user-dropdown">
	                                        <div class="user-icon-wrapper">
	                                            <i class="fas fa-user-circle user-icon"></i>
	                                        </div>
	                                        <div class="dropdown-content">
	                                            <a href="thong-tin-tai-khoan.html"><i class="fas fa-user"></i> Thông tin tài khoản</a>
	                                            <a href="lich-su-mua-hang.html"><i class="fas fa-history"></i> Lịch sử mua hàng</a>
	                                            <a href="${pageContext.request.contextPath}/dashboard/login.jsp"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
	                                            <a href="${pageContext.request.contextPath}/dang-xuat"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
	                                        </div>
	                                    </div>
	                                </li>
                                </ul>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>