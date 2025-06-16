<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Xác nhận thanh toán</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/assets/adimgs/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/adimgs/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/adcss/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/adcss/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/adcss/user.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/hpcss/style.css">

</head>

<body class="product-details-page">
	<jsp:include page="parts/header.jsp" />

	<main class="main">

		<!-- Page Title -->
		<div class="page-title light-background">
			<div class="container">
				<nav class="breadcrumbs">
					<ol>
						<li><a href="index.html">Trang chủ</a></li>
						<li class="current">Xác nhận đơn hàng</li>
					</ol>
				</nav>
				<h1>Xác nhận đơn hàng</h1>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Order Confirmation Section -->
		<section id="order-confirmation" class="order-confirmation section">

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="order-confirmation-3">
					<div class="row g-0">
						<!-- Left sidebar with order summary -->
						<div class="col-lg-4 sidebar" data-aos="fade-right">
							<div class="sidebar-content">
								<!-- Success animation -->
								<div class="success-animation">
									<i class="bi bi-check-lg"></i>
								</div>

								<!-- Order number and date -->
								<div class="order-id">
									<h4>Đơn hàng #${order.orderId}</h4>
									<div class="order-date">Ngày ${order.createDate}</div>
								</div>

								<!-- Price summary -->
								<div class="price-summary">
									<h5>Tóm tắt đơn hàng</h5>
									<div class="item">
										<div class="item-details">
											<h4>${detail.product.productName}</h4>

											<ul class="summary-list">
												<li><span>Số lượng</span> <span>${detail.quantityOrder}</span></li>
												<li><span>Tạm tính</span> <span>$${detail.totalPrice}</span></li>
												<li><span>Phí vận chuyển</span> <span>$0.00</span></li>
												<li><span>Thuế</span> <span>$0.00</span></li>
												<li class="total"><span>Tổng cộng</span> <span>$${detail.totalPrice}</span></li>
											</ul>
										</div>
									</div>
								</div>

							</div>
						</div>

						<!-- Main content area -->
						<div class="col-lg-8 main-content" data-aos="fade-in">
							<!-- Thank you message -->
							<div class="thank-you-message">
								<h1>Cảm ơn bạn đã đặt hàng!</h1>
								<p>Chúng tôi đã nhận được đơn hàng của bạn và sẽ tiến hành
									xử lý ngay lập tức. Chúng tôi sẽ gửi cập nhật qua email khi đơn
									hàng của bạn được xử lý.</p>
							</div>

							<!-- Action buttons -->
							<div class="action-area" data-aos="fade-up">
								<div class="row g-3">
									<div class="col-md-6 d-flex gap-3 flex-wrap">
										<a
											href="${pageContext.request.contextPath}/xuathoadon?type=pdf"
											class="btn btn-outline-danger d-flex align-items-center gap-2"
											target="_blank"> <i
											class="bi bi-file-earmark-pdf-fill fs-5"></i> Xuất hóa đơn
											(PDF)
										</a> <a
											href="${pageContext.request.contextPath}/xuathoadon?type=docx"
											class="btn btn-outline-primary d-flex align-items-center gap-2"
											target="_blank"> <i
											class="bi bi-file-earmark-word-fill fs-5"></i> Xuất hóa đơn
											(Word)
										</a>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>

			</div>

		</section>
	</main>

</body>
</html>
