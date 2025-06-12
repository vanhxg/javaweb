<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Xem sản phẩm</title>
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
						<li><a
							href="${pageContext.request.contextPath}/homepage/home.jsp"
							style="color: #4aa5ff; font-weight: bold;">Trang chủ</a></li>
						<li class="current">Chi tiết sản phẩm</li>
					</ol>
				</nav>
				<h1>Chi tiết sản phẩm</h1>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Product Details Section -->
		<section id="product-details" class="product-details section">

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row g-5">

					<!-- Product Images Column -->
					<div class="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right"
						data-aos-delay="200">
						<div class="product-gallery">
							<!-- Main Image -->
							<div class="main-image-wrapper">
								<div class="image-zoom-container"
									style="width: 100%; text-align: center;">
									<a href="${product.productImage}" class="glightbox"
										data-gallery="product-gallery"> <img
										src="${product.productImage}" alt="Product Image"
										class="img-fluid main-image drift-zoom"
										id="main-product-image" data-zoom="${product.productImage}"
										style="width: 100%; max-width: 100%; height: auto; object-fit: contain; border-radius: 8px;" />
										<div class="zoom-overlay">
											<i class="bi bi-zoom-in"></i>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>


					<!-- Product Info Column -->
					<div class="col-lg-6" data-aos="fade-left" data-aos-delay="200">
						<div class="product-info-wrapper" id="product-info-sticky">
							<!-- Product Meta -->
							<div class="product-meta">
								<div
									class="d-flex justify-content-between align-items-center mb-3">
									<span class="product-category">${product.category.categoryName}</span>

									<div class="product-share position-relative">
										<button class="share-btn" aria-label="Share product"
											onclick="toggleShareDropdown()">
											<i class="bi bi-share"></i>
										</button>

										<div
											class="share-dropdown d-flex gap-2 p-2 rounded shadow align-items-center"
											id="shareDropdown"
											style="display: none; position: absolute; top: 100%; right: 0; background: white;">
											<!-- Facebook -->
											<a
												href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.requestURL}"
												target="_blank"
												class="share-icon d-flex justify-content-center align-items-center">
												<i class="bi bi-facebook"></i>
											</a>

											<!-- Zalo -->
											<a
												href="https://zalo.me/share?url=${pageContext.request.requestURL}"
												target="_blank"
												class="share-icon d-flex justify-content-center align-items-center">
												<img
												src="https://stc-zaloprofile.zdn.vn/pc/v1/images/logo.svg"
												alt="Zalo" style="width: 18px; height: 18px;">
											</a>

											<!-- Copy link -->
											<button onclick="copyLink()"
												class="share-icon d-flex justify-content-center align-items-center border-0" style="width: 36px; height: 36px; border-radius: 50%;">
												<i class="bi bi-clipboard" style="color: #333;"></i>
											</button>
										</div>
									</div>
								</div>

								<h1 class="product-title">${product.productName}</h1>

								<div class="product-rating">
									<div class="stars">
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-half"></i> <span class="rating-value">4.5</span>
									</div>
									<a href="#reviews" class="rating-count">42 Reviews</a>
								</div>
							</div>

							<!-- Product Price -->
							<div class="product-price-container">
								<div class="price-wrapper">
									<span class="current-price">$${product.productCost}</span>
								</div>

								<span class="discount-badge">Save 17%</span>
								<div class="stock-info">
									<i class="bi bi-check-circle-fill"></i>

									<%-- Trạng thái kho --%>
									<c:choose>
										<c:when test="${product.productQuantity > 0}">
											<span>Còn hàng</span>
										</c:when>
										<c:otherwise>
											<span>Hết hàng</span>
										</c:otherwise>
									</c:choose>

									<%-- Hiển thị số lượng --%>
									<span class="stock-count"> ( ${product.productQuantity}
										sản phẩm ) </span>
								</div>



							</div>

							<!-- Product Description -->
							<div class="product-description">
								<p>${product.productDescription}</p>
							</div>

							<!-- Product Options -->
							<div class="product-options">
								<!-- Color Options -->
								<div class="option-group">
									<div class="option-header">
										<h6 class="option-title">Màu sắc</h6>
										<span class="selected-option">Đen</span>
									</div>
									<div class="color-options">
										<div class="color-option active" data-color="Black"
											style="background-color: #222;">
											<i class="bi bi-check"></i>
										</div>
										<div class="color-option" data-color="Silver"
											style="background-color: #C0C0C0;">
											<i class="bi bi-check"></i>
										</div>
										<div class="color-option" data-color="Blue"
											style="background-color: #1E3A8A;">
											<i class="bi bi-check"></i>
										</div>
										<div class="color-option" data-color="Rose Gold"
											style="background-color: #B76E79;">
											<i class="bi bi-check"></i>
										</div>
									</div>
								</div>

								<!-- Size Options -->
								<div class="option-group">
									<div class="option-header">
										<h6 class="option-title">Kích cỡ</h6>
										<span class="selected-option">M</span>
									</div>
									<div class="size-options">
										<div class="size-option" data-size="S">S</div>
										<div class="size-option active" data-size="M">M</div>
										<div class="size-option" data-size="L">L</div>
									</div>
								</div>

								<!-- Quantity Selector -->
								<div class="option-group">
									<h6 class="option-title">Số lượng</h6>
									<div class="quantity-selector">
										<button class="quantity-btn decrease">
											<i class="bi bi-dash"></i>
										</button>
										<input type="number" class="quantity-input" value="1" min="1"
											max="24">
										<button class="quantity-btn increase">
											<i class="bi bi-plus"></i>
										</button>
									</div>
								</div>
							</div>

							<!-- Action Buttons -->
							<div class="product-actions">
								<button class="btn btn-primary add-to-cart-btn">
									<i class="bi bi-cart-plus"></i> Thêm vào giỏ
								</button>
								<form action="${pageContext.request.contextPath}/thanhToan"
									method="get">
									<input type="hidden" name="productid"
										value="${product.productId}" /> <input type="hidden"
										name="quantity" class="quantity-hidden-input" value="1" />
									<button type="submit"
										class="btn btn-outline-primary buy-now-btn">
										<i class="bi bi-lightning-fill"></i> Mua ngay
									</button>
								</form>

								<button class="btn btn-outline-secondary wishlist-btn"
									aria-label="Add to wishlist">
									<i class="bi bi-heart"></i>
								</button>
							</div>

							<!-- Delivery Options -->
							<div class="delivery-options">
								<div class="delivery-option">
									<i class="bi bi-truck"></i>
									<div>
										<h6>Miễn phí vận chuyển</h6>
										<p>Đơn từ 99k</p>
									</div>
								</div>
								<div class="delivery-option">
									<i class="bi bi-arrow-repeat"></i>
									<div>
										<h6>30-Ngày Hoàn Trả</h6>
										<p>Miễn phí hoàn trả</p>
									</div>
								</div>
								<div class="delivery-option">
									<i class="bi bi-shield-check"></i>
									<div>
										<h6>2-Năm Bảo Hành</h6>
										<p>Bảo hành toàn diện</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Sticky Add to Cart Bar (appears on scroll) -->
				<div class="sticky-add-to-cart">
					<div class="container">
						<div class="sticky-content">
							<div class="product-preview">
								<img src="assets/img/product/product-details-1.webp"
									alt="Product" class="product-thumbnail">
								<div class="product-info">
									<h1 class="product-title">${product.productName}</h1>
									<div class="product-price">${product.productCost}</div>
								</div>
							</div>
							<div class="sticky-actions" style="color: black !important;">
								<div class="quantity-selector">
									<button class="quantity-btn decrease black-icon">
										<i class="bi bi-plus"></i>
									</button>
									<input type="number" class="quantity-input" value="1" min="1"
										max="24">
									<button class="quantity-btn increase black-icon">
										<i class="bi bi-plus" style="color: black !important;"></i>
									</button>
								</div>
								<button class="btn btn-primary add-to-cart-btn">
									<i class="bi bi-cart-plus"></i> Thêm vào giỏ
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Product Details Accordion -->
				<div class="row mt-5" data-aos="fade-up">
					<div class="col-12">
						<div class="product-details-accordion">
							<!-- Description Accordion -->
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#description"
										aria-expanded="true" aria-controls="description">Mô
										tả sản phẩm</button>
								</h2>
								<div id="description" class="accordion-collapse collapse show">
									<div class="accordion-body">
										<div class="product-description">
											<h4>Tổng quan sản phẩm</h4>
											<p>Áo thun basic cổ tròn với chất liệu cotton 100% mềm
												mại, thoáng mát, phù hợp cho mọi hoạt động hàng ngày. Thiết
												kế tối giản dễ phối đồ, mang đến vẻ ngoài trẻ trung, năng
												động nhưng vẫn giữ được nét nữ tính nhẹ nhàng. Sản phẩm phù
												hợp với nhiều dáng người và phong cách khác nhau.</p>

											<div class="row mt-4">
												<div class="col-md-6">
													<h4>Tính năng chính</h4>
													<ul class="feature-list">
														<li><i class="bi bi-check-circle"></i> Chất liệu
															cotton 100% co giãn nhẹ, thấm hút tốt</li>
														<li><i class="bi bi-check-circle"></i> Thiết kế cổ
															tròn basic, tay ngắn hiện đại</li>
														<li><i class="bi bi-check-circle"></i> Dễ phối với
															quần jean, chân váy, áo khoác</li>
														<li><i class="bi bi-check-circle"></i> Đa dạng màu
															sắc trẻ trung, dễ thương</li>
														<li><i class="bi bi-check-circle"></i> Phù hợp mặc đi
															học, đi chơi, đi làm</li>
													</ul>
												</div>
												<div class="col-md-6">
													<h4>Có gì trong hộp</h4>
													<ul class="feature-list">
														<li><i class="bi bi-box"></i> 1 x Áo thun nữ basic</li>
														<li><i class="bi bi-box"></i> 1 x Túi zip bảo vệ sản
															phẩm</li>
														<li><i class="bi bi-box"></i> 1 x Thẻ bảo hành đổi
															trả 7 ngày</li>
														<li><i class="bi bi-box"></i> 1 x Hướng dẫn giặt và
															bảo quản</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Specifications Accordion -->
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#specifications"
										aria-expanded="false" aria-controls="specifications">
										Thông số kỹ thuật</button>
								</h2>
								<div id="specifications" class="accordion-collapse collapse">
									<div class="accordion-body">
										<div class="product-specifications">
											<div class="row">
												<div class="col-md-6">
													<div class="specs-group">
														<h4>Thông số kỹ thuật</h4>
														<div class="specs-table">
															<div class="specs-row">
																<div class="specs-label">Chất liệu</div>
																<div class="specs-value">Cotton 100% thoáng mát,
																	co giãn nhẹ</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Kiểu dáng</div>
																<div class="specs-value">Áo thun cổ tròn, tay ngắn
																	form rộng</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Màu sắc</div>
																<div class="specs-value">Trắng / Đen / Be / Hồng
																	pastel</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Kích cỡ</div>
																<div class="specs-value">S, M, L, XL</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Phong cách</div>
																<div class="specs-value">Năng động, đơn giản, dễ
																	phối đồ</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Xuất xứ</div>
																<div class="specs-value">Việt Nam</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Hướng dẫn bảo quản</div>
																<div class="specs-value">Giặt máy ở chế độ nhẹ,
																	tránh thuốc tẩy, ủi ở nhiệt độ thấp</div>
															</div>
														</div>

													</div>
												</div>

												<div class="col-md-6">
													<div class="specs-group">
														<h4>Features</h4>
														<div class="specs-table">
															<div class="specs-row">
																<div class="specs-label">Noise Cancellation</div>
																<div class="specs-value">Active Noise Cancellation
																	(ANC)</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Controls</div>
																<div class="specs-value">Touch controls, Voice
																	assistant</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Microphone</div>
																<div class="specs-value">Dual beamforming
																	microphones</div>
															</div>
															<div class="specs-row">
																<div class="specs-label">Water Resistance</div>
																<div class="specs-value">IPX4 (splash resistant)</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Reviews Accordion -->
							<div class="accordion-item" id="reviews">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#reviewsContent"
										aria-expanded="false" aria-controls="reviewsContent">
										Đánh giá khách hàng (42)</button>
								</h2>
								<div id="reviewsContent" class="accordion-collapse collapse">
									<div class="accordion-body">
										<div class="product-reviews">
											<div class="reviews-summary">
												<div class="row">
													<div class="col-lg-4">
														<div class="overall-rating">
															<div class="rating-number">4.5</div>
															<div class="rating-stars">
																<i class="bi bi-star-fill"></i> <i
																	class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
																<i class="bi bi-star-fill"></i> <i
																	class="bi bi-star-half"></i>
															</div>
															<div class="rating-count">Based on 42 reviews</div>
														</div>
													</div>

													<div class="col-lg-8">
														<div class="rating-breakdown">
															<div class="rating-bar">
																<div class="rating-label">5 stars</div>
																<div class="progress">
																	<div class="progress-bar" role="progressbar"
																		style="width: 65%;" aria-valuenow="65"
																		aria-valuemin="0" aria-valuemax="100"></div>
																</div>
																<div class="rating-count">27</div>
															</div>
															<div class="rating-bar">
																<div class="rating-label">4 stars</div>
																<div class="progress">
																	<div class="progress-bar" role="progressbar"
																		style="width: 25%;" aria-valuenow="25"
																		aria-valuemin="0" aria-valuemax="100"></div>
																</div>
																<div class="rating-count">10</div>
															</div>
															<div class="rating-bar">
																<div class="rating-label">3 stars</div>
																<div class="progress">
																	<div class="progress-bar" role="progressbar"
																		style="width: 8%;" aria-valuenow="8" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
																<div class="rating-count">3</div>
															</div>
															<div class="rating-bar">
																<div class="rating-label">2 stars</div>
																<div class="progress">
																	<div class="progress-bar" role="progressbar"
																		style="width: 2%;" aria-valuenow="2" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
																<div class="rating-count">1</div>
															</div>
															<div class="rating-bar">
																<div class="rating-label">1 star</div>
																<div class="progress">
																	<div class="progress-bar" role="progressbar"
																		style="width: 2%;" aria-valuenow="2" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
																<div class="rating-count">1</div>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="reviews-list">
												<!-- Review Item -->
												<div class="review-item">
													<div class="review-header">
														<div class="reviewer-info">
															<img src="assets/img/person/person-m-1.webp"
																alt="Reviewer" class="reviewer-avatar">
															<div>
																<h5 class="reviewer-name">John Doe</h5>
																<div class="review-date">03/15/2024</div>
															</div>
														</div>
														<div class="review-rating">
															<i class="bi bi-star-fill"></i> <i
																class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
																class="bi bi-star-fill"></i>
														</div>
													</div>
													<h5 class="review-title">Exceptional sound quality and
														comfort</h5>
													<div class="review-content">
														<p>Lorem ipsum dolor sit amet, consectetur adipiscing
															elit. Vestibulum at lacus congue, suscipit elit nec,
															tincidunt orci. Phasellus egestas nisi vitae lectus
															imperdiet venenatis. Suspendisse vulputate quam diam, et
															consectetur augue condimentum in.</p>
													</div>
												</div>
												<!-- End Review Item -->

												<!-- Review Item -->
												<div class="review-item">
													<div class="review-header">
														<div class="reviewer-info">
															<img src="assets/img/person/person-f-2.webp"
																alt="Reviewer" class="reviewer-avatar">
															<div>
																<h5 class="reviewer-name">Jane Smith</h5>
																<div class="review-date">02/28/2024</div>
															</div>
														</div>
														<div class="review-rating">
															<i class="bi bi-star-fill"></i> <i
																class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i class="bi bi-star"></i>
														</div>
													</div>
													<h5 class="review-title">Great headphones, battery
														could be better</h5>
													<div class="review-content">
														<p>Lorem ipsum dolor sit amet, consectetur adipiscing
															elit. Vestibulum at lacus congue, suscipit elit nec,
															tincidunt orci. Phasellus egestas nisi vitae lectus
															imperdiet venenatis.</p>
													</div>
												</div>
												<!-- End Review Item -->

												<!-- Review Item -->
												<div class="review-item">
													<div class="review-header">
														<div class="reviewer-info">
															<img src="assets/img/person/person-m-3.webp"
																alt="Reviewer" class="reviewer-avatar">
															<div>
																<h5 class="reviewer-name">Michael Johnson</h5>
																<div class="review-date">02/15/2024</div>
															</div>
														</div>
														<div class="review-rating">
															<i class="bi bi-star-fill"></i> <i
																class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
																class="bi bi-star-half"></i>
														</div>
													</div>
													<h5 class="review-title">Impressive noise cancellation</h5>
													<div class="review-content">
														<p>Lorem ipsum dolor sit amet, consectetur adipiscing
															elit. Vestibulum at lacus congue, suscipit elit nec,
															tincidunt orci. Phasellus egestas nisi vitae lectus
															imperdiet venenatis. Suspendisse vulputate quam diam.</p>
													</div>
												</div>
												<!-- End Review Item -->
											</div>

											<div class="review-form-container mt-5">
												<h4>Write a Review</h4>
												<form class="review-form">
													<div class="rating-select mb-4">
														<label class="form-label">Your Rating</label>
														<div class="star-rating">
															<input type="radio" id="star5" name="rating" value="5"><label
																for="star5" title="5 stars"><i
																class="bi bi-star-fill"></i></label> <input type="radio"
																id="star4" name="rating" value="4"><label
																for="star4" title="4 stars"><i
																class="bi bi-star-fill"></i></label> <input type="radio"
																id="star3" name="rating" value="3"><label
																for="star3" title="3 stars"><i
																class="bi bi-star-fill"></i></label> <input type="radio"
																id="star2" name="rating" value="2"><label
																for="star2" title="2 stars"><i
																class="bi bi-star-fill"></i></label> <input type="radio"
																id="star1" name="rating" value="1"><label
																for="star1" title="1 star"><i
																class="bi bi-star-fill"></i></label>
														</div>
													</div>

													<div class="row g-3 mb-3">
														<div class="col-md-6">
															<label for="review-name" class="form-label">Your
																Name</label> <input type="text" class="form-control"
																id="review-name" required="">
														</div>
														<div class="col-md-6">
															<label for="review-email" class="form-label">Your
																Email</label> <input type="email" class="form-control"
																id="review-email" required="">
														</div>
													</div>

													<div class="mb-3">
														<label for="review-title" class="form-label">Review
															Title</label> <input type="text" class="form-control"
															id="review-title" required="">
													</div>

													<div class="mb-4">
														<label for="review-content" class="form-label">Your
															Review</label>
														<textarea class="form-control" id="review-content"
															rows="4" required=""></textarea>
														<div class="form-text">Tell others what you think
															about this product. Be honest and helpful!</div>
													</div>

													<div class="loading">Loading</div>
													<div class="error-message"></div>
													<div class="sent-message">Your review has been
														submitted. Thank you!</div>

													<div class="text-end">
														<button type="submit" class="btn btn-primary">Submit
															Review</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /Product Details Section -->

	</main>
	<jsp:include page="parts/footer.jsp" />

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="${pageContext.request.contextPath}/assets/hpjs/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/animated.headline.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="${pageContext.request.contextPath}/assets/hpjs/contact.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/mail-script.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/hpjs/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="${pageContext.request.contextPath}/assets/hpjs/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/assets/hpjs/main.js"></script>


	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const decreaseBtn = document
									.querySelector(".quantity-btn.decrease");
							const increaseBtn = document
									.querySelector(".quantity-btn.increase");
							const quantityInput = document
									.querySelector(".quantity-input");

							if (decreaseBtn && increaseBtn && quantityInput) {
								decreaseBtn
										.addEventListener(
												"click",
												function() {
													let currentValue = parseInt(quantityInput.value);
													if (currentValue > parseInt(quantityInput.min)) {
														quantityInput.value = currentValue - 1;
													}
												});

								increaseBtn
										.addEventListener(
												"click",
												function() {
													let currentValue = parseInt(quantityInput.value);
													if (currentValue < parseInt(quantityInput.max)) {
														quantityInput.value = currentValue + 1;
													}
												});
							}
							// Đồng bộ input ẩn với input hiển thị
							quantityInput
									.addEventListener(
											"change",
											function() {
												document
														.querySelector(".quantity-hidden-input").value = quantityInput.value;
											});
							increaseBtn
									.addEventListener(
											"click",
											function() {
												document
														.querySelector(".quantity-hidden-input").value = quantityInput.value;
											});
							decreaseBtn
									.addEventListener(
											"click",
											function() {
												document
														.querySelector(".quantity-hidden-input").value = quantityInput.value;
											});
						});
	</script>

	<script>
    function toggleShareDropdown() {
        const dropdown = document.querySelector('.share-dropdown');
        dropdown.style.display = dropdown.style.display === 'none' ? 'block' : 'none';
    }

    function copyLink() {
        const url = window.location.href;
        navigator.clipboard.writeText(url)
            .then(() => alert("Đã sao chép liên kết sản phẩm!"))
            .catch(() => alert("Không thể sao chép liên kết."));
    }

    // Tắt dropdown khi click bên ngoài
    document.addEventListener('click', function (event) {
        const shareBtn = document.querySelector('.share-btn');
        const dropdown = document.querySelector('.share-dropdown');
        if (!shareBtn.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });
</script>

</body>
</html>