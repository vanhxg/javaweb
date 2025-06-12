<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Giỏ hàng - Mộc Store</title>
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
            
            <!-- Font hỗ trợ tiếng Việt -->
			<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600&display=swap" rel="stylesheet">
			
			<style>
			  body {
			    font-family: 'Quicksand', sans-serif !important;
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
        
        
        <!--================Cart Area =================-->
		<section class="cart_area section_padding">
		  <div class="container">
		    <h2 class="mb-4">Giỏ hàng của bạn</h2>
		    <div class="cart_inner">
		      <div class="table-responsive">
		        <table class="table">
		          <thead class="thead-light">
		            <tr>
		              <th scope="col">Sản phẩm</th>
		              <th scope="col">Giá</th>
		              <th scope="col">Số lượng</th>
		              <th scope="col">Tổng</th>
		              <th scope="col">Hành động</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td>
		                <div class="media align-items-center">
		                  <div class="d-flex mr-3">
		                    <img src="assets/img/categori/product1.png" alt="" style="width: 100px; height: auto;" />
		                  </div>
		                  <div class="media-body">
		                    <p>Váy hoa xanh</p>
		                  </div>
		                </div>
		              </td>
		              <td>
		                <h5>400.000đ</h5>
		              </td>
		              <td>
		                <div class="product_count">
		                  <input class="input-number" type="text" value="2" readonly>
		                </div>
		              </td>
		              <td>
		                <h5>800.000đ</h5>
		              </td>
		              <td>
		                <a href="#" class="btn btn-danger btn-sm">Xóa</a>
		              </td>
		            </tr>
		            <tr>
		              <td>
		                <div class="media align-items-center">
		                  <div class="d-flex mr-3">
		                    <img src="assets/img/categori/product2.png" alt="" style="width: 100px; height: auto;" />
		                  </div>
		                  <div class="media-body">
		                    <p>Áo sơ mi trắng</p>
		                  </div>
		                </div>
		              </td>
		              <td>
		                <h5>350.000đ</h5>
		              </td>
		              <td>
		                <div class="product_count">
		                  <input class="input-number" type="text" value="1" readonly>
		                </div>
		              </td>
		              <td>
		                <h5>350.000đ</h5>
		              </td>
		              <td>
		                <a href="#" class="btn btn-danger btn-sm">Xóa</a>
		              </td>
		            </tr>
		            <tr>
		              <td colspan="3" class="text-right"><strong>Tổng cộng:</strong></td>
		              <td colspan="2">
		                <h5>1.150.000đ</h5>
		              </td>
		            </tr>
		          </tbody>
		        </table>
		      </div>
		      <div class="checkout_btn_inner float-right">
		        <a class="btn btn-outline-dark" href="homepage/home.jsp">Tiếp tục mua sắm</a>
		        <a class="btn btn-primary" href="#">Thanh toán</a>
		      </div>
		    </div>
		  </div>
		</section>
        
        
		        
		        
        
        
        

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