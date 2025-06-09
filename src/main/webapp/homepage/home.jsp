<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

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
            	.single-product .cart {
				    position: absolute;
				    bottom: 20px;
				    left: 50%;
				    transform: translateX(-50%);
				    opacity: 0;
				    transition: all 0.3s ease-in-out;
				    background-color: #000;
				    padding: 6px 14px;
				    border-radius: 25px;
				}
				
				.single-product .cart a {
				    color: #fff;
				    font-size: 14px;
				    text-decoration: none;
				}
				
				.product-img {
				    position: relative;
				    overflow: hidden;
				}
				
				.single-product:hover .cart {
				    opacity: 1;
				    bottom: 30px;
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
    
	<jsp:include page="parts/header.jsp" />
    

    <main>

        <jsp:include page="parts/slider.jsp" />
        
        <jsp:include page="parts/bosuutap.jsp" />
        
        <!-- Latest Products Start -->
		<section class="latest-product-area padding-bottom">
		    <div class="container">
		        <!-- Title + Tab buttons -->
		        <div class="row product-btn d-flex justify-content-end align-items-end">
		            <div class="col-xl-4 col-lg-5 col-md-5">
		                <div class="section-tittle mb-30">
		                    <h2>Sản phẩm</h2>
		                </div>
		            </div>
		            <div class="col-xl-8 col-lg-7 col-md-7">
		                <div class="properties__button f-right">
		                    <nav>
		                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
		                            <a class="nav-item nav-link active" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab">Tất cả</a>
		                            <a class="nav-item nav-link" id="nav-new-tab" data-toggle="tab" href="#nav-new" role="tab">Mới nhất</a>
		                            <a class="nav-item nav-link" id="nav-accessory-tab" data-toggle="tab" href="#nav-accessory" role="tab">Phụ kiện</a>
		                        </div>
		                    </nav>
		                </div>
		            </div>
		        </div>
		
		        <!-- Tab contents -->
		        <div class="tab-content" id="nav-tabContent">
		
		            <!-- Tất cả -->
		            <div class="tab-pane fade show active" id="nav-all" role="tabpanel">
		                <div class="row">
		                    <div class="col-xl-4 col-lg-4 col-md-6">
		                        <div class="single-product mb-60">
		                            <div class="product-img">
		                                <img src="${pageContext.request.contextPath}/assets/img/categori/product1.png" alt="">
		                                <div class="new-product"><span>New</span></div>
		                                <div class="cart">
		                                    <a href="#"><i class="ti-shopping-cart"></i> Thêm vào giỏ</a>
		                                </div>
		                            </div>
		                            <div class="product-caption">
		                                <h4><a href="#">Váy hoa xanh</a></h4>
		                                <div class="price"><ul><li>400.000đ</li></ul></div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		
		            <!-- Mới nhất -->
		            <div class="tab-pane fade" id="nav-new" role="tabpanel">
		                <div class="row">
		                    <div class="col-xl-4 col-lg-4 col-md-6">
		                        <div class="single-product mb-60">
		                            <div class="product-img">
		                                <img src="${pageContext.request.contextPath}/assets/img/categori/product2.png" alt="">
		                                <div class="new-product"><span>New</span></div>
		                                <div class="cart">
		                                    <a href="#"><i class="ti-shopping-cart"></i> Thêm vào giỏ</a>
		                                </div>
		                            </div>
		                            <div class="product-caption">
		                                <h4><a href="#">Áo sơ mi trắng</a></h4>
		                                <div class="price"><ul><li>350.000đ</li></ul></div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		
		            <!-- Phụ kiện -->
		            <div class="tab-pane fade" id="nav-accessory" role="tabpanel">
		            	<div class="row">
		            		<c:forEach var="product" items="${accessories}">
				                <div class="col-xl-4 col-lg-4 col-md-6">
				                    <div class="single-product mb-60">
				                        <div class="product-img">
				                            <img src="${product.productImage}" alt="">
				                            <div class="cart">
				                                <a href="#"><i class="ti-shopping-cart"></i> Thêm vào giỏ</a>
				                            </div>
				                        </div>
				                        <div class="product-caption">
				                            <h4><a href="#">${product.productName}</a></h4>
				                            <div class="price"><ul><li>${product.productCost}đ</li></ul></div>
				                        </div>
				                    </div>
				                </div>
				            </c:forEach>
				        </div>
		            </div>
		
		        </div>
		    </div>
		</section>
		        
		        
        
        
        <jsp:include page="parts/dangkynhanbantin.jsp" />
        
        <jsp:include page="parts/chinhsach.jsp" />

    </main>
   
   <jsp:include page="parts/footer.jsp" />
   
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