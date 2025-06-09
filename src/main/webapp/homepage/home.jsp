<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang chủ - Mộc Store</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/hpcss/style.css">
            
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
   </head>

   <body>
       
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

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
                                  <a href="index.html"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>                                                
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="index.html">Trang chủ</a></li>
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

    <main>

        <!-- slider Area Start -->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height" data-background="${pageContext.request.contextPath}/assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="${pageContext.request.contextPath}/assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">60% Discount</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">Winter <br> Collection</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">Best Cloth Collection By 2020!</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="industries.html" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider slider-height" data-background="${pageContext.request.contextPath}/assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="${pageContext.request.contextPath}/assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">60% Discount</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">Winter <br> Collection</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">Best Cloth Collection By 2020!</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="industries.html" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <!-- Category Area Start-->
        <section class="category-area section-padding30">
            <div class="container-fluid">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center mb-85">
                            <h2>Bộ Sưu Tập</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img">
                                <img src="${pageContext.request.contextPath}/assets/img/categori/cat1.jpg" alt="">
                                <div class="category-caption">
                                    <h2>Owmen`s</h2>
                                    <span class="best"><a href="#">Best New Deals</a></span>
                                    <span class="collection">New Collection</span>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img text-center">
                                <img src="${pageContext.request.contextPath}/assets/img/categori/cat2.jpg" alt="">
                                <div class="category-caption">
                                    <span class="collection">Discount!</span>
                                    <h2>Winter Cloth</h2>
                                   <p>New Collection</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img">
                                <img src="${pageContext.request.contextPath}/assets/img/categori/cat3.jpg" alt="">
                                <div class="category-caption">
                                    <h2>Man`s Cloth</h2>
                                    <span class="best"><a href="#">Best New Deals</a></span>
                                    <span class="collection">New Collection</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Category Area End-->
        
        <!-- Latest Products Start -->
        <section class="latest-product-area padding-bottom">
            <div class="container">
                <div class="row product-btn d-flex justify-content-end align-items-end">
                    <!-- Section Tittle -->
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="section-tittle mb-30">
                            <h2>Latest Products</h2>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7 col-md-7">
                        <div class="properties__button f-right">
                            <!--Nav Button  -->
                            <nav>                                                                                                
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Tất cả</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Mới nhất</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Phụ kiện</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
                
                <!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="row">
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product1.png" alt="">
                                        <div class="new-product">
                                            <span>New</span>
                                        </div>
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product2.png" alt="">
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product3.png" alt="">
                                        <div class="new-product">
                                            <span>New</span>
                                        </div>
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                        </div>
                    </div>
                    <!-- Card two -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div class="row">
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product4.png" alt="">
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product5.png" alt="">
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product6.png" alt="">
                                        <div class="new-product">
                                            <span>New</span>
                                        </div>
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                        </div>
                    </div>
                    <!-- Card three -->
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <div class="row">
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product2.png" alt="">
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product3.png" alt="">
                                        <div class="new-product">
                                            <span>New</span>
                                        </div>
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/assets/img/categori/product1.png" alt="">
                                        <div class="new-product">
                                            <span>New</span>
                                        </div>
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star low-star"></i>
                                            <i class="far fa-star low-star"></i>
                                        </div>
                                        <h4><a href="#">Green Dress with details</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>$40.00</li>
                                                <li class="discount">$60.00</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            
                        </div>
                    </div>
                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
        
        
        <!-- Latest Offers Start -->
        <div class="latest-wrapper lf-padding">
            <div class="latest-area latest-height d-flex align-items-center" data-background="${pageContext.request.contextPath}/assets/img/collection/latest-offer.png">
                <div class="container">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-5 col-lg-5 col-md-6 offset-xl-1 offset-lg-1">
                            <div class="latest-caption">
                                <h2>Nhận tin tức ưu đãi mới nhất từ chúng tôi</h2>
                                
                                <p>Đăng ký nhận bản tin</p>
                            </div>
                        </div>
                         <div class="col-xl-5 col-lg-5 col-md-6 ">
                            <div class="latest-subscribe">
                                <form action="#">
                                    <input type="email" placeholder="Email của bạn">
                                    <button>Đăng ký ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- man Shape -->
                <div class="man-shape">
                    <img src="${pageContext.request.contextPath}/assets/img/collection/latest-man.png" alt="">
                </div>
            </div>
        </div>
        <!-- Latest Offers End -->
        <!-- Shop Method Start-->
        <div class="shop-method-area section-padding30">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-package"></i>
                            <h6>Miễn phí vận chuyển</h6>
                            <p>Áp dụng cho mọi đơn hàng, giao hàng nhanh chóng đến tay bạn.</p>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-unlock"></i>
                            <h6>Thanh toán an toàn</h6>
                            <p>Bảo mật tuyệt đối mọi thông tin giao dịch cá nhân của bạn.</p>
                        </div>
                    </div> 
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-reload"></i>
                            <h6>Đổi trả dễ dàng</h6>
                            <p>Yên tâm mua sắm với quy trình đổi trả đơn giản, nhanh chóng.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Method End-->
        

    </main>
   
   <footer class="modern-footer">
	    <div class="footer-container">
	        <!-- Main Footer Content -->
	        <div class="footer-grid">
	            <!-- Company Info -->
	            <div class="footer-section">
	                <a href="index.html" class="footer-logo">
	                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo2_footer.png" alt="Company Logo">
	                </a>
	                <p class="footer-description">
	                    Chúng tôi cam kết mang đến những sản phẩm chất lượng và dịch vụ tốt nhất cho khách hàng.
	                </p>
	            </div>
	
	            <!-- Quick Links -->
	            <div class="footer-section">
	                <h3 class="footer-title">Liên kết nhanh</h3>
	                <ul class="footer-links">
	                    <li><a href="/about">Về chúng tôi</a></li>
	                    <li><a href="/products">Sản phẩm</a></li>
	                    <li><a href="/promotions">Khuyến mãi</a></li>
	                    <li><a href="/blog">Tin tức</a></li>
	                    <li><a href="/contact">Liên hệ</a></li>
	                </ul>
	            </div>
	
	            <!-- Support -->
	            <div class="footer-section">
	                <h3 class="footer-title">Hỗ trợ</h3>
	                <ul class="footer-links">
	                    <li><a href="/faq">Câu hỏi thường gặp</a></li>
	                    <li><a href="/shipping">Chính sách vận chuyển</a></li>
	                    <li><a href="/returns">Đổi trả & Hoàn tiền</a></li>
	                    <li><a href="/privacy">Chính sách bảo mật</a></li>
	                    <li><a href="/terms">Điều khoản dịch vụ</a></li>
	                </ul>
	            </div>
	
	            <!-- Contact Info -->
	            <div class="footer-section">
	                <h3 class="footer-title">Liên hệ</h3>
	                <ul class="footer-contact">
	                    <li>
	                        <i class="fas fa-map-marker-alt"></i>
	                        <span>Bắc Từ Liêm - Hà Nội</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-phone"></i>
	                        <span>(+84) 123 456 789</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-envelope"></i>
	                        <span>info@gmail.com</span>
	                    </li>
	                    <li>
	                        <i class="fas fa-clock"></i>
	                        <span>Thứ 2 - Thứ 7: 8:00 - 17:00</span>
	                    </li>
	                </ul>
	            </div>
	        </div>
	
	        <!-- Footer Bottom -->
	        <div class="footer-bottom">
	            <div class="copyright">
	                &copy; <script>document.write(new Date().getFullYear())</script> Bản quyền thuộc về Nhom9.
	            </div>
	            <div class="payment-methods">
	                <i class="fab fa-cc-visa"></i>
	                <i class="fab fa-cc-mastercard"></i>
	                <i class="fab fa-cc-paypal"></i>
	                <i class="fab fa-cc-amazon-pay"></i>
	            </div>
	            <div class="social-links">
	                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
	                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
	                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
	                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
	                <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
	            </div>
	        </div>
	    </div>
	</footer>

	<style>
	.modern-footer {
	    background-color: #2c3e50;
	    color: #ecf0f1;
	    padding: 60px 0 0;
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	.footer-container {
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 0 20px;
	}
	
	.footer-grid {
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	    gap: 30px;
	    margin-bottom: 40px;
	}
	
	.footer-section {
	    margin-bottom: 30px;
	}
	
	.footer-logo img {
	    max-width: 180px;
	    margin-bottom: 20px;
	}
	
	.footer-description {
	    color: #bdc3c7;
	    line-height: 1.6;
	    margin-bottom: 20px;
	    font-size: 14px;
	}
	
	.footer-title {
	    color: #fff;
	    font-size: 18px;
	    margin-bottom: 20px;
	    position: relative;
	    padding-bottom: 10px;
	}
	
	.footer-title::after {
	    content: '';
	    position: absolute;
	    left: 0;
	    bottom: 0;
	    width: 50px;
	    height: 2px;
	    background-color: #3498db;
	}
	
	.footer-links {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-links li {
	    margin-bottom: 10px;
	}
	
	.footer-links a {
	    color: #bdc3c7;
	    text-decoration: none;
	    transition: color 0.3s;
	    font-size: 14px;
	}
	
	.footer-links a:hover {
	    color: #3498db;
	    padding-left: 5px;
	}
	
	.footer-contact {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-contact li {
	    display: flex;
	    align-items: flex-start;
	    margin-bottom: 15px;
	    font-size: 14px;
	    color: #bdc3c7;
	}
	
	.footer-contact i {
	    margin-right: 10px;
	    color: #3498db;
	    margin-top: 3px;
	}
	
	.footer-newsletter h4 {
	    color: #fff;
	    font-size: 16px;
	    margin-bottom: 15px;
	}
	
	.newsletter-form {
	    display: flex;
	}
	
	.newsletter-form input {
	    flex: 1;
	    padding: 10px;
	    border: none;
	    border-radius: 4px 0 0 4px;
	    font-size: 14px;
	}
	
	.newsletter-form button {
	    background-color: #3498db;
	    color: white;
	    border: none;
	    padding: 0 15px;
	    border-radius: 0 4px 4px 0;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	.newsletter-form button:hover {
	    background-color: #2980b9;
	}
	
	.footer-bottom {
	    border-top: 1px solid rgba(255, 255, 255, 0.1);
	    padding: 20px 0;
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.copyright {
	    color: #bdc3c7;
	    font-size: 13px;
	}
	
	.payment-methods i {
	    font-size: 24px;
	    margin: 0 8px;
	    color: #bdc3c7;
	}
	
	.social-links a {
	    display: inline-block;
	    width: 36px;
	    height: 36px;
	    background-color: rgba(255, 255, 255, 0.1);
	    color: #fff;
	    border-radius: 50%;
	    text-align: center;
	    line-height: 36px;
	    margin-left: 8px;
	    transition: all 0.3s;
	}
	
	.social-links a:hover {
	    background-color: #3498db;
	    transform: translateY(-3px);
	}
	
	@media (max-width: 768px) {
	    .footer-grid {
	        grid-template-columns: 1fr 1fr;
	    }
	    
	    .footer-bottom {
	        flex-direction: column;
	        text-align: center;
	    }
	    
	    .copyright, .payment-methods, .social-links {
	        margin: 10px 0;
	    }
	}
	
	@media (max-width: 480px) {
	    .footer-grid {
	        grid-template-columns: 1fr;
	    }
	}
	</style>
   
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${pageContext.request.contextPath}/assets/hpjs/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/slick.min.js"></script>

		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/wow.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/hpjs/animated.headline.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.nice-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/hpjs/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${pageContext.request.contextPath}/assets/hpjs/contact.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.form.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/assets/hpjs/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/assets/hpjs/main.js"></script>
        
    </body>
</html>