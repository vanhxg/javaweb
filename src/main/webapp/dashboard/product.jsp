<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Product - NHOM 9</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/assets/adimgs/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/assets/adimgs/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/adcss/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/adcss/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/assets/adcss/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="parts/header.jsp" />

	<!-- ======= Sidebar ======= -->
	<jsp:include page="parts/sidebar.jsp" />

	<!-- ======= Nội dung chính của trang ======= -->
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Quản lý sản phẩm</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item">Tables</li>
					<li class="breadcrumb-item active">Quản lý sản phẩm</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Danh sách sản phẩm</h5>
							<div class="text-end mb-3">
								<button type="button" class="btn btn-success"
									data-bs-toggle="modal" data-bs-target="#addProductModal">
									<i class="ri-add-circle-fill"> Thêm mới</i>
								</button>
							</div>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th><b>Mã sản phẩm</b></th>
										<th>Tên sản phẩm</th>
										<th>Ảnh</th>
										<th>Số lượng</th>
										<th>Giá bán</th>
										<th>Tên danh mục</th>
										<th>Tên nhà cung cấp</th>
										<th>Mô tả</th>
										<th>Thực hiện</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${listProduct}">
										<tr>
											<td>${product.productId}</td>
											<td>${product.productName}</td>
											<td><img src="${product.productImage}"
												alt="${product.productName}"
												style="width: 80px; height: auto;" /></td>
											<td>${product.productQuantity}</td>
											<td>${product.productCost}</td>
											<td>${product.category.categoryName}</td>
											<td>${product.brand.brandName}</td>
											<td
												style="max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
												title="${product.productDescription}">${product.productDescription}</td>
											<td>
												<!-- Nút xem chi tiết sản phẩm -->
												<button type="button" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#viewProductModal"
													data-id="${product.productId}"
													data-name="${product.productName}"
													data-image="${product.productImage}"
													data-quantity="${product.productQuantity}"
													data-cost="${product.productCost}"
													data-category-name="${product.category.categoryName}"
													data-brand-name="${product.brand.brandName}"
													data-description="${product.productDescription}">
													<i class="ri-eye-fill"></i>
												</button> <!-- Nút chỉnh sửa sản phẩm -->
												<button type="button" class="btn btn-warning"
													data-bs-toggle="modal" data-bs-target="#editProductModal"
													data-id="${product.productId}"
													data-name="${product.productName}"
													data-image="${product.productImage}"
													data-quantity="${product.productQuantity}"
													data-cost="${product.productCost}"
													data-category="${product.category.categoryId}"
													data-brand="${product.brand.brandId}"
													data-description="${product.productDescription}">
													<i class="ri-pencil-fill"></i>
												</button> <!-- Nút xóa sản phẩm -->
												<button type="button"
													class="btn btn-danger deleteProductBtn"
													data-bs-toggle="modal" data-bs-target="#deleteProductModal"
													data-product-id="${product.productId}">
													<i class="ri-delete-bin-5-fill"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows --


							<!-- Form Thêm Mới Sản Phẩm -->
							<div class="modal fade" id="addProductModal" tabindex="-1"
								aria-labelledby="addProductModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">

										<form action="addProduct" method="post">
											<div class="modal-header bg-primary text-white rounded-top-4">
												<h5 class="modal-title" id="addProductModalLabel">
													<i class="ri-add-box-line me-2"></i>Thêm sản phẩm mới
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
												<input type="hidden" name="action" value="add">
											</div>

											<div class="modal-body px-4 pt-4">
												<div class="row g-3">

													<!-- Tên sản phẩm -->
													<div class="col-md-12">
														<label for="productName" class="form-label">Tên
															sản phẩm</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-shopping-bag-line"></i></span> <input type="text"
																class="form-control" id="productName" name="productName"
																placeholder="Nhập tên sản phẩm">
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Ảnh sản phẩm (URL) -->
													<div class="col-md-12">
														<label for="productImage" class="form-label">Link
															ảnh sản phẩm</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-image-line"></i></span> <input type="text"
																class="form-control" id="productImage"
																name="productImage" placeholder="Nhập đường dẫn ảnh">
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Số lượng -->
													<div class="col-md-6">
														<label for="productQuantity" class="form-label">Số
															lượng</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-stack-line"></i></span> <input type="number"
																class="form-control" id="productQuantity"
																name="productQuantity" placeholder="Nhập số lượng">
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Giá -->
													<div class="col-md-6">
														<label for="productCost" class="form-label">Giá
															bán</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-money-dollar-box-line"></i></span> <input
																type="number" class="form-control" id="productCost"
																name="productCost" placeholder="Nhập giá bán">
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Mã danh mục -->
													<div class="col-md-6">
														<label for="categoryId" class="form-label">Danh
															mục</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-list-check"></i></span> <select class="form-select"
																id="categoryId" name="categoryId">
																<option value="">-- Chọn danh mục --</option>
																<c:forEach var="cate" items="${listCategory}">
																	<option value="${cate.categoryId}">${cate.categoryName}</option>
																</c:forEach>
															</select>
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Mã nhà cung cấp -->
													<div class="col-md-6">
														<label for="brandId" class="form-label">Nhà cung
															cấp</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-building-line"></i></span> <select
																class="form-select" id="brandId" name="brandId">
																<option value="">-- Chọn nhà cung cấp --</option>
																<c:forEach var="brand" items="${listBrand}">
																	<option value="${brand.brandId}">${brand.brandName}</option>
																</c:forEach>
															</select>
															<div class="invalid-feedback"></div>
														</div>
													</div>

													<!-- Mô tả -->
													<div class="col-md-12">
														<label for="productDescription" class="form-label">Mô
															tả</label>
														<textarea class="form-control" id="productDescription"
															name="productDescription" rows="3"
															placeholder="Nhập mô tả sản phẩm"></textarea>
														<div class="invalid-feedback"></div>
													</div>
												</div>
											</div>

											<div class="modal-footer px-4 pb-4">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">
													<i class="ri-close-line"></i> Hủy
												</button>
												<button type="submit" class="btn btn-success">
													<i class="ri-check-line"></i> Lưu
												</button>
											</div>
										</form>

									</div>
								</div>
							</div>
							<!-- End Form Thêm Mới Sản Phẩm -->

							<!-- Modal Xem Chi Tiết Sản Phẩm -->
							<div class="modal fade" id="viewProductModal" tabindex="-1"
								aria-labelledby="viewProductModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<div class="modal-header bg-info text-white rounded-top-4">
											<h5 class="modal-title" id="viewProductModalLabel">
												<i class="ri-eye-line me-2"></i>Chi tiết sản phẩm
											</h5>
											<button type="button" class="btn-close btn-close-white"
												data-bs-dismiss="modal" aria-label="Đóng"></button>
										</div>
										<div class="modal-body px-4 pt-4">
											<div class="row g-3">
												<div class="col-md-6">
													<label class="form-label">Mã sản phẩm</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-barcode-box-line"></i></span> <input type="text"
															class="form-control" id="viewProductId" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Tên sản phẩm</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-shopping-bag-line"></i></span> <input type="text"
															class="form-control" id="viewProductName" readonly>
													</div>
												</div>

												<div class="col-md-6">
													<label class="form-label">Giá bán</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-money-dollar-box-line"></i></span> <input type="text"
															class="form-control" id="viewProductCost" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Số lượng</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-stack-line"></i></span> <input type="text"
															class="form-control" id="viewProductQuantity" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Danh mục</label> <input
														type="text" class="form-control" id="viewCategoryName"
														readonly>
												</div>
												<div class="col-md-6">
													<label class="form-label">Nhà cung cấp</label> <input
														type="text" class="form-control" id="viewBrandName"
														readonly>
												</div>
												<div class="col-md-12">
													<label class="form-label">Mô tả</label>
													<textarea class="form-control" id="viewProductDescription"
														rows="2" readonly></textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer px-4 pb-4">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">
												<i class="ri-close-line"></i> Đóng
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- End Form Xem chi tiet Sản Phẩm -->


							<!-- Modal Sửa Sản Phẩm -->
							<div class="modal fade" id="editProductModal" tabindex="-1"
								aria-labelledby="editProductModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<form action="editProduct" method="post">
											<div class="modal-header bg-warning text-white rounded-top-4">
												<h5 class="modal-title" id="editProductModalLabel">
													<i class="ri-edit-line me-2"></i>Chỉnh sửa sản phẩm
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
											</div>
											<div class="modal-body px-4 pt-4">
												<input type="hidden" name="action" value="edit" /> <input
													type="hidden" id="editProductId" name="productId" />
												<div class="row g-3">
													<div class="col-md-12">
														<label for="editProductName" class="form-label">Tên
															sản phẩm</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-shopping-bag-line"></i></span> <input type="text"
																class="form-control" id="editProductName"
																name="productName" placeholder="Nhập tên sản phẩm">
															<div class="invalid-feedback"></div>
														</div>
													</div>
													<div class="col-md-12">
														<label for="editProductImage" class="form-label">Liên
															kết ảnh</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-image-line"></i></span> <input type="text"
																class="form-control" id="editProductImage"
																name="productImage" placeholder="Nhập URL ảnh sản phẩm">
															<div class="invalid-feedback"></div>
														</div>

													</div>


													<div class="col-md-6">
														<label for="editProductCost" class="form-label">Giá
															bán</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-money-dollar-box-line"></i></span> <input
																type="number" class="form-control" id="editProductCost"
																name="productCost">
															<div class="invalid-feedback"></div>
														</div>
													</div>
													<div class="col-md-6">
														<label for="editProductQuantity" class="form-label">Số
															lượng</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-stack-line"></i></span> <input type="number"
																class="form-control" id="editProductQuantity"
																name="productQuantity">
															<div class="invalid-feedback"></div>
														</div>
													</div>
													<div class="col-md-6">
														<label for="editCategoryId" class="form-label">Danh
															mục</label> <select class="form-select" id="editCategoryId"
															name="categoryId">
															<c:forEach var="cate" items="${listCategory}">
																<option value="${cate.categoryId}">${cate.categoryName}</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-md-6">
														<label for="editBrandId" class="form-label">Nhà
															cung cấp</label> <select class="form-select" id="editBrandId"
															name="brandId">
															<c:forEach var="brand" items="${listBrand}">
																<option value="${brand.brandId}">${brand.brandName}</option>
															</c:forEach>
														</select>
													</div>

													<div class="col-md-12">
														<label for="editProductDescription" class="form-label">Mô
															tả</label>
														<textarea class="form-control" id="editProductDescription"
															name="productDescription" rows="2"></textarea>
													</div>
												</div>
											</div>
											<div class="modal-footer px-4 pb-4">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">
													<i class="ri-close-line"></i> Hủy
												</button>
												<button type="submit" class="btn btn-warning">
													<i class="ri-save-line"></i> Cập nhật
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>


							<!-- Modal Xóa Sản Phẩm -->
							<div class="modal fade" id="deleteProductModal" tabindex="-1"
								aria-labelledby="deleteProductModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-md">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<form action="deleteProduct" method="post"
											id="deleteProductForm">
											<div class="modal-header bg-danger text-white rounded-top-4">
												<h5 class="modal-title" id="deleteProductModalLabel">
													<i class="ri-delete-bin-line me-2"></i>Xác nhận xóa sản
													phẩm
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
												<input type="hidden" name="action" value="delete">
											</div>
											<div class="modal-body px-4 pt-4">
												<p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
												<input type="hidden" name="productId" id="deleteProductId"
													value="">
											</div>
											<div class="modal-footer px-4 pb-4">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">
													<i class="ri-close-line"></i> Hủy
												</button>
												<button type="submit" class="btn btn-danger">
													<i class="ri-delete-bin-6-line"></i> Xóa
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- End Molal Delete sản phẩm -->

							<c:if test="${not empty sessionScope.message}">
								<div class="modal fade" id="messageModal" tabindex="-1"
									aria-labelledby="messageModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div
												class="modal-header bg-${sessionScope.messageType} text-white">
												<h5 class="modal-title" id="messageModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
											</div>
											<div class="modal-body">
												<p id="modalMessage">${sessionScope.message}</p>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn btn-${sessionScope.messageType}"
													data-bs-dismiss="modal">Đóng</button>
											</div>
										</div>
									</div>
								</div>

								<!-- Xóa message và messageType khỏi session sau khi hiển thị -->
								<c:remove var="message" scope="session" />
								<c:remove var="messageType" scope="session" />
							</c:if>



						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/assets/adjs/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/adjs/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/adjs/chart.umd.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/adjs/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/quill/quill.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/adjs/main.js"></script>


	<!-- JS cho chức năng thêm sản phẩm -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
  			const form = document.querySelector("#addProductModal form");

  			form.addEventListener("submit", function (e) {
    			let isValid = true;

    			// Lấy các input
    		const productName = form.productName;
    		const productImage = form.productImage;
    		const productQuantity = form.productQuantity;
    		const productCost = form.productCost;
    		const categoryId = form.categoryId;
    		const brandId = form.brandId;
    		const productDescription = form.productDescription;

    		function isValidURL(str) {
    		  	return /^(https?:\/\/.+\.(jpg|jpeg|png|gif|webp)|\/.+\.(jpg|jpeg|png|gif|webp)|\.\/.+\.(jpg|jpeg|png|gif|webp)|\.\.\/.+\.(jpg|jpeg|png|gif|webp)|[^\/]+\.(jpg|jpeg|png|gif|webp))$/i.test(str.trim());
    		}

    		// Reset các lỗi cũ
    		[productName, productImage, productQuantity, productCost, categoryId, brandId, productDescription].forEach(input => {
      			input.classList.remove("is-invalid");
      			const feedback = input.closest(".input-group, .form-select, .form-control").querySelector(".invalid-feedback");
      			if (feedback) feedback.textContent = "";
    		});

    		// Kiểm tra tên sản phẩm
    		if (productName.value.trim() === "") {
      			isValid = false;
      			productName.classList.add("is-invalid");
      			productName.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng nhập tên sản phẩm.";
    		}

    		// Kiểm tra link ảnh (bắt buộc và hợp lệ)
    		if (productImage.value.trim() === "") {
      			isValid = false;
      			productImage.classList.add("is-invalid");
      			productImage.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng nhập link ảnh sản phẩm.";
    		} else if (!isValidURL(productImage.value.trim())) {
      			isValid = false;
      			productImage.classList.add("is-invalid");
      			productImage.closest(".input-group").querySelector(".invalid-feedback").textContent = "Link ảnh không hợp lệ.";
    		}

    		// Kiểm tra số lượng (phải >= 0)
    		if (productQuantity.value.trim() === "" || isNaN(productQuantity.value) || Number(productQuantity.value) < 0) {
      			isValid = false;
      			productQuantity.classList.add("is-invalid");
      			productQuantity.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng nhập số lượng hợp lệ (không âm).";
    		}

    		// Kiểm tra giá bán (phải > 0)
    		if (productCost.value.trim() === "" || isNaN(productCost.value) || Number(productCost.value) <= 0) {
      			isValid = false;
      			productCost.classList.add("is-invalid");
      			productCost.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng nhập giá bán hợp lệ (lớn hơn 0).";
    		}

    		// Kiểm tra danh mục (bắt buộc chọn)
    		if (!categoryId.value) {
      			isValid = false;
      			categoryId.classList.add("is-invalid");
      			categoryId.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng chọn danh mục sản phẩm.";
    		}

    		// Kiểm tra nhà cung cấp (bắt buộc chọn)
    		if (!brandId.value) {
    			console.log(brandId.value)
      			isValid = false;
      			brandId.classList.add("is-invalid");
      			brandId.closest(".input-group").querySelector(".invalid-feedback").textContent = "Vui lòng chọn nhà cung cấp.";
    		}
    	
    		// Mô tả không bắt buộc, nên không check lỗi
    		if (!isValid) {
      			e.preventDefault();
    		}
  		});

  		// Khi modal đóng, reset form và xóa lỗi
  		const modalElement = document.getElementById("addProductModal");
  		modalElement.addEventListener("hidden.bs.modal", function () {
    		form.reset();
    		[form.productName, form.productImage, form.productQuantity, form.productCost, form.categoryId, form.brandId, form.productDescription].forEach(input => {
      			input.classList.remove("is-invalid");
      			const feedback = input.closest(".input-group, .form-select, .form-control").querySelector(".invalid-feedback");
      			if (feedback) feedback.textContent = "";
    		});
  		});
	});
	</script>
	<!-- JS cho chức năng xem -->
	<script>
		const viewProductModal = document.getElementById('viewProductModal');
		viewProductModal.addEventListener('show.bs.modal', function(event) {
			const button = event.relatedTarget;

			document.getElementById('viewProductId').value = button
					.getAttribute('data-id');
			document.getElementById('viewProductName').value = button
					.getAttribute('data-name');
			document.getElementById('viewProductCost').value = button
					.getAttribute('data-cost');
			document.getElementById('viewProductQuantity').value = button
					.getAttribute('data-quantity');
			document.getElementById('viewCategoryName').value = button
					.getAttribute('data-category-name');
			document.getElementById('viewBrandName').value = button
					.getAttribute('data-brand-name');
			document.getElementById('viewProductDescription').value = button
					.getAttribute('data-description');
		});
	</script>

	<!-- JS cho chức năng sửa -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
  			const editModal = document.getElementById("editProductModal");
  			const editForm = editModal.querySelector("form");

  				// Khi modal được mở, đẩy dữ liệu từ nút vào input
  			editModal.addEventListener("show.bs.modal", function (event) {
    			const button = event.relatedTarget;

    			// Lấy dữ liệu từ thuộc tính data-*
    			document.getElementById("editProductId").value = button.getAttribute("data-id");
    			document.getElementById("editProductName").value = button.getAttribute("data-name");
    			document.getElementById("editProductImage").value = button.getAttribute("data-image");
    			document.getElementById("editProductQuantity").value = button.getAttribute("data-quantity");
    			document.getElementById("editProductCost").value = button.getAttribute("data-cost");
    			document.getElementById("editCategoryId").value = button.getAttribute("data-category");
    			document.getElementById("editBrandId").value = button.getAttribute("data-brand");
    			document.getElementById("editProductDescription").value = button.getAttribute("data-description");
  		});

 	 	// Validate form khi submit
  		editForm.addEventListener("submit", function (e) {
    		let isValid = true;

    		// Các input
    		const productName = editForm.productName;
    		const productImage = editForm.productImage;
    		const productQuantity = editForm.productQuantity;
    		const productCost = editForm.productCost;
    		const categoryId = editForm.categoryId;
    		const brandId = editForm.brandId;
    		const productDescription = editForm.productDescription;

    		// Hàm kiểm tra URL
    		function isValidURL(str) {
  				return /^(https?:\/\/.+\.(jpg|jpeg|png|gif|webp)|\/.+\.(jpg|jpeg|png|gif|webp)|\.\/.+\.(jpg|jpeg|png|gif|webp)|\.\.\/.+\.(jpg|jpeg|png|gif|webp)|[^\/]+\.(jpg|jpeg|png|gif|webp))$/i.test(str.trim());
			}


    		// Reset lỗi cũ
    		[productName, productImage, productQuantity, productCost, categoryId, brandId, productDescription].forEach(input => {
      			input.classList.remove("is-invalid");
      			const feedback = input.parentElement.querySelector(".invalid-feedback");
      			if (feedback) feedback.textContent = "";
    		});

    		// Kiểm tra tên sản phẩm
    		if (productName.value.trim() === "") {
     			isValid = false;
      			productName.classList.add("is-invalid");
      			productName.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng nhập tên sản phẩm.";
   			}		

    		// Kiểm tra link ảnh
    		if (productImage.value.trim() === "") {
      			isValid = false;
      			productImage.classList.add("is-invalid");
      			productImage.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng nhập link ảnh sản phẩm.";
    		} else if (!isValidURL(productImage.value.trim())) {
      			isValid = false;
      			productImage.classList.add("is-invalid");
      			productImage.parentElement.querySelector(".invalid-feedback").textContent = "Link ảnh không hợp lệ.";
    		}

    		// Kiểm tra số lượng (>=0)
    		if (productQuantity.value.trim() === "" || isNaN(productQuantity.value) || Number(productQuantity.value) < 0) {
     			isValid = false;
      			productQuantity.classList.add("is-invalid");
      			productQuantity.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng nhập số lượng hợp lệ (không âm).";
    		}

    		// Kiểm tra giá bán (>0)
    		if (productCost.value.trim() === "" || isNaN(productCost.value) || Number(productCost.value) <= 0) {
      			isValid = false;
      			productCost.classList.add("is-invalid");
      			productCost.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng nhập giá bán hợp lệ (lớn hơn 0).";
   			}

    		// Kiểm tra danh mục
    		if (categoryId.value.trim() === "") {
      			isValid = false;
      			categoryId.classList.add("is-invalid");
      			categoryId.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng chọn danh mục sản phẩm.";
   		 	}

    		// Kiểm tra nhà cung cấp
    		if (brandId.value.trim() === "") {
      			isValid = false;
      			brandId.classList.add("is-invalid");
      		brandId.parentElement.querySelector(".invalid-feedback").textContent = "Vui lòng chọn nhà cung cấp.";
    		}

    		// Không submit nếu có lỗi
    		if (!isValid) {
      			e.preventDefault();
    		}
  		});

  		// Reset form khi đóng modal
  		editModal.addEventListener("hidden.bs.modal", function () {
    		editForm.reset();
    		[editForm.productName, editForm.productImage, editForm.productQuantity, editForm.productCost, editForm.categoryId, editForm.brandId, editForm.productDescription].forEach(input => {
      			input.classList.remove("is-invalid");
      			const feedback = input.parentElement.querySelector(".invalid-feedback");
      			if (feedback) feedback.textContent = "";
    		});
  		});
	});
	</script>

	<!-- JS cho chức năng xóa chi tiết -->
	<script>
		const deleteProductModal = document.getElementById('deleteProductModal');
		deleteProductModal.addEventListener('show.bs.modal', function(event) {
			const button = event.relatedTarget;
			document.getElementById('deleteProductId').value = button.getAttribute('data-product-id');
		});
	</script>

	<!-- JS cho thông báo -->
	<script>
  		document.addEventListener("DOMContentLoaded", function () {
    		const messageModalElem = document.getElementById("messageModal");
    		if (messageModalElem) {
      			var messageModal = new bootstrap.Modal(messageModalElem);
     			 messageModal.show();
    	}
  		});
	</script>



	<!-- Simple-DataTables JS -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>


</body>
</html>