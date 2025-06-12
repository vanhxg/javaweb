<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>USER - NHOM 9</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/assets/adimgs/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/adimgs/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
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

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/adcss/style.css"
	rel="stylesheet">

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
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		  const modalMessageElem = document.getElementById('modalMessage');
		  const message = modalMessageElem ? modalMessageElem.textContent.trim() : "";
		  if(message) {
		    var messageModal = new bootstrap.Modal(document.getElementById('messageModal'));
		    messageModal.show();
		  }
		});
		
	</script>

	<!-- ======= Nội dung chính của trang ======= -->
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Quản lý người dùng</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Quản lý người dùng</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Danh sách tài khoản</h5>

							<div class="text-end mb-3">
								<button type="button" class="btn btn-success"
									data-bs-toggle="modal" data-bs-target="#addCustomerModal">
									<i class="ri-add-circle-fill"> Thêm mới</i>
								</button>
								<a href="${pageContext.request.contextPath}/trash" class="btn btn-danger ms-2">
        <i class="ri-delete-bin-line"></i> Thùng rác
    </a>
							</div>

							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr >
										<th class="text-center">Mã người dùng</th>
										<th class="text-center">Tên đăng nhập</th>
										<th class="text-center">Tên khách hàng</th>
										<th class="text-center">Giới tính</th>
										<th class="text-center">Địa chỉ</th>
										<th class="text-center">Quyền</th>
										<th class="text-center">
											<!-- Cột nút action -->
										</th>
										<!-- <th data-type="date" data-format="YYYY/DD/MM">Start Date</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach var="customer" items="${listCustomer}">
										<tr class="text-center">
											<td >${customer.customerId}</td>
											<td>${customer.username}</td>
											<%-- <td>${customer.password}</td> --%>
											<td>${customer.customerName}</td>
											<td>${customer.customerGender}</td>
											<%-- <td>${customer.customerDate}</td> --%>
											<td>${customer.customerAddress}</td>
											<%-- 	<td>${customer.customerMobiphone}</td>
											<td>${customer.customerEmail}</td> --%>
											<td>${customer.isAdmin}</td>
											<td>
												<!-- Nút xem chi tiết 1 tài khoản -->
												<button type="button" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#viewCustomerModal"
													data-id="${customer.customerId}"
													data-username="${customer.username}"
													data-password="${customer.password}"
													data-name="${customer.customerName}"
													data-gender="${customer.customerGender}"
													data-date="${customer.customerDate}"
													data-address="${customer.customerAddress}"
													data-phone="${customer.customerMobiphone}"
													data-email="${customer.customerEmail}"
													data-isadmin="${customer.isAdmin}">

													<i class="ri-eye-fill"></i>
												</button> <!-- Nút sửa 1 tài khoản -->
												<button type="button" class="btn btn-warning"
													data-bs-toggle="modal" data-bs-target="#editCustomerModal"
													data-id="${customer.customerId}"
													data-username="${customer.username}"
													data-password="${customer.password}"
													data-name="${customer.customerName}"
													data-gender="${customer.customerGender}"
													data-date="${customer.customerDate}"
													data-address="${customer.customerAddress}"
													data-phone="${customer.customerMobiphone}"
													data-email="${customer.customerEmail}"
													data-isadmin="${customer.isAdmin}">
													<i class="ri-pencil-fill"></i>
												</button> <!-- Nút xóa 1 tài khoản -->
												<button type="button"
													class="btn btn-danger deleteCustomerBtn"
													data-bs-toggle="modal"
													data-bs-target="#deleteCustomerModal"
													data-customer-id="${customer.customerId}">
													<i class="ri-delete-bin-5-fill"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>


							<!-- Modal Thêm tài khoản -->
							<div class="modal fade" id="addCustomerModal" tabindex="-1"
								aria-labelledby="addCustomerModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">

										<form id="addCustomerForm" action="addCustomer" method="post"
											novalidate>
											<div class="modal-header bg-primary text-white rounded-top-4">
												<h5 class="modal-title" id="addCustomerModalLabel">
													<i class="ri-user-line me-2"></i> Thêm khách hàng mới
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
												<input type="hidden" name="action" value="add">
											</div>

											<div class="modal-body small px-4 py-4">
												<div class="row mb-4">



													<!-- username -->
													<div class="col-md-6">
														<label for="username" class="form-label">Tên đăng
															nhập</label> <input type="text" class="form-control"
															id="username" name="username"
															placeholder="Nhập tên đăng nhập">
														<div class="invalid-feedback"></div>
													</div>

													<!-- password -->
													<div class="col-md-6">
														<label for="password" class="form-label">Mật khẩu</label>
														<input type="password" class="form-control" id="password"
															name="password"
															placeholder="Nhập mật khẩu (ít nhất 6 ký tự)">
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerName -->
													<div class="col-md-6">
														<label for="customerName" class="form-label">Tên
															khách hàng</label> <input type="text" class="form-control"
															id="customerName" name="customerName"
															placeholder="Nhập tên khách hàng">
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerGender -->
													<div class="col-md-6">
														<label for="customerGender" class="form-label">Giới
															tính</label> <select class="form-select" id="customerGender"
															name="customerGender">
															<option value="">Chọn giới tính</option>
															<option value="Nam">Nam</option>
															<option value="Nữ">Nữ</option>
															<option value="Khác">Khác</option>
														</select>
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerDate -->
													<div class="col-md-6">
														<label for="customerDate" class="form-label">Ngày
															sinh</label> <input type="date" class="form-control"
															id="customerDate" name="customerDate">
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerAddress -->
													<div class="col-md-6">
														<label for="customerAddress" class="form-label">Địa
															chỉ</label> <input type="text" class="form-control"
															id="customerAddress" name="customerAddress"
															placeholder="Nhập địa chỉ">
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerMobiphone -->
													<div class="col-md-6">
														<label for="customerMobiphone" class="form-label">Số
															điện thoại</label> <input type="text" class="form-control"
															id="customerMobiphone" name="customerMobiphone"
															placeholder="Nhập số điện thoại">
														<div class="invalid-feedback"></div>
													</div>

													<!-- customerEmail -->
													<div class="col-md-6">
														<label for="customerEmail" class="form-label">Email</label>
														<input type="email" class="form-control"
															id="customerEmail" name="customerEmail"
															placeholder="Nhập email">
														<div class="invalid-feedback"></div>
													</div>
													<div class="col-md-6">
														<label for="customerAdmin" class="form-label">Phân
															quyền </label> <select class="form-select" id="customerAdmin"
															name="customerAdmin">
															<option value="">Chọn quyền</option>
															<option value="Admin">Admin</option>
															<option value="User">User</option>
														</select>
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
							<!-- Modal Xem Chi tài khoản -->
							<div class="modal fade" id="viewCustomerModal" tabindex="-1"
								aria-labelledby="viewCustomerModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<div class="modal-header bg-info text-white rounded-top-4">
											<h5 class="modal-title" id="viewCustomerModalLabel">
												<i class="ri-eye-line me-2"></i>Chi tiết tài khoản
											</h5>
											<button type="button" class="btn-close btn-close-white"
												data-bs-dismiss="modal" aria-label="Đóng"></button>
										</div>

										<div class="modal-body px-4 pt-4">
											<div class="row g-3">
												<div class="col-md-6">
													<label class="form-label">Mã tài khoản</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-hashtag"></i></span> <input type="text"
															class="form-control" id="viewCustomerId" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Tên đăng nhập</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-user-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerUsername" readonly>
													</div>
												</div>
												<!-- <div class="col-md-6">
													<label class="form-label">Mật khẩu</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-lock-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerPassword" readonly>
													</div>
												</div> -->
												<div class="col-md-6">
													<label class="form-label">Họ và tên</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-user-smile-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerName" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Giới tính</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-user-heart-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerGender" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Ngày sinh</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-calendar-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerDate" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Địa chỉ</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-map-pin-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerAddress" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Số điện thoại</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-phone-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerPhone" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Email</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-mail-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerEmail" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<label class="form-label">Quyền</label>
													<div class="input-group">
														<span class="input-group-text"><i
															class="ri-shield-user-line"></i></span> <input type="text"
															class="form-control" id="viewCustomerAdmin" readonly>
													</div>
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
							<!-- Modal Sửa Thông Tin người dùng -->
							<div class="modal fade" id="editCustomerModal" tabindex="-1"
								aria-labelledby="editCustomerModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<form action="quanly-tk" method="post">
											<div class="modal-header bg-warning text-white rounded-top-4">
												<h5 class="modal-title" id="editCustomerModalLabel">
													<i class="ri-edit-line me-2"></i>Chỉnh sửa thông tin tài
													khoản
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>
											</div>

											<div class="modal-body px-4 pt-4">
												<div class="row g-3">
													<input type="hidden" name="action" value="edit" /> <input
														type="hidden" id="editCustomerId" name="customerId" />

													<div class="col-md-6">
														<label for="editUsername" class="form-label">Tên
															đăng nhập</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-user-line"></i></span> <input type="text"
																class="form-control" id="editUsername" name="username"
																placeholder="Nhập tên đăng nhập">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editPassword" class="form-label">Mật
															khẩu</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-lock-line"></i></span> <input type="password"
																class="form-control" id="editPassword" name="password"
																placeholder="Nhập mật khẩu">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editCustomerName" class="form-label">Họ
															tên</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-user-3-line"></i></span> <input type="text"
																class="form-control" id="editCustomerName"
																name="customerName" placeholder="Nhập họ tên">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editCustomerGender" class="form-label">Giới
															tính</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-gender-line"></i></span> <select class="form-select"
																id="editCustomerGender" name="customerGender">
																<option value="Nam">Nam</option>
																<option value="Nữ">Nữ</option>
																<option value="Khác">Khác</option>
															</select>
														</div>

													</div>

													<div class="col-md-6">
														<label for="editCustomerDate" class="form-label">Ngày
															sinh</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-calendar-line"></i></span> <input type="date"
																class="form-control" id="editCustomerDate"
																name="customerDate">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editCustomerAddress" class="form-label">Địa
															chỉ</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-map-pin-line"></i></span> <input type="text"
																class="form-control" id="editCustomerAddress"
																name="customerAddress" placeholder="Nhập địa chỉ">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editCustomerMobiphone" class="form-label">Số
															điện thoại</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-phone-line"></i></span> <input type="text"
																class="form-control" id="editCustomerMobiphone"
																name="customerMobiphone"
																placeholder="Nhập số điện thoại">
														</div>
														<span class="error-message text-danger small"></span>
													</div>

													<div class="col-md-6">
														<label for="editCustomerEmail" class="form-label">Email</label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-mail-line"></i></span> <input type="email"
																class="form-control" id="editCustomerEmail"
																name="customerEmail" placeholder="Nhập email">
														</div>
														<span class="error-message text-danger small"></span>
													</div>
													<div class="col-md-6">
														<label for="editCustomerAdmin" class="form-label">Phân
															quyền </label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="ri-shield-user-line"></i></span> <select
																class="form-select" id="editCustomerAdmin"
																name="customerAdmin">
																<option value="Admin">Admin</option>
																<option value="User">User</option>
															</select>
														</div>
														<span class="error-message text-danger"></span>
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
							<!-- Modal Xóa Thông Tin tài khoản  -->
							<div class="modal fade" id="deleteCustomerModal" tabindex="-1"
								aria-labelledby="deleteCustomerModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-md">
									<div class="modal-content border-0 shadow-lg rounded-4">
										<form action="deleteCustomer" method="post" id="deleteCustomerForm">
											
											<div class="modal-header bg-danger text-white rounded-top-4">
												<h5 class="modal-title" id="deleteCustomerModalLabel">
													<i class="ri-delete-bin-line me-2"></i>Xác nhận xóa tài
													khoản
												</h5>
												<button type="button" class="btn-close btn-close-white"
													data-bs-dismiss="modal" aria-label="Đóng"></button>

												<!-- Hidden cho chức năng xóa -->
												<input type="hidden" name="action" value="delete">
											</div>

											<div class="modal-body px-4 pt-4">
												<p>Bạn có chắc chắn muốn xóa tài khoản không?</p>
												<!-- Input ẩn để gửi customerId cần xóa -->
												<input type="hidden" name="customerId" id="deleteCustomerId"
													value="">
											</div>

											<div class="modal-footer px-4 pb-4">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">
													<i class="ri-close-line"></i> Hủy
												</button>
												<button type="submit" class="btn btn-danger">
													<i class="ri-delete-bin-6-line"></i>Đồng ý
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- Modal thông báo thành công thêm, sửa, xóa -->
							<!-- Modal Thông báo -->
							<div class="modal fade" id="messageModal" tabindex="-1"
								aria-labelledby="messageModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header bg-success text-white">
											<h5 class="modal-title" id="messageModalLabel">Thông báo</h5>
											<button type="button" class="btn-close btn-close-white"
												data-bs-dismiss="modal" aria-label="Đóng"></button>
										</div>
										<div class="modal-body">
											<p id="modalMessage">${message}</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success"
												data-bs-dismiss="modal">Đóng</button>
										</div>
									</div>
								</div>
							</div>

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
	<!-- js thêm tài khoản -->
	<script>
	document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("addCustomerForm");

    form.addEventListener("submit", function (e) {
        let isValid = true;

        // Helper
        const setError = (input, message) => {
            const feedback = input.nextElementSibling;
            input.classList.add("is-invalid");
            if (feedback) feedback.innerText = message;
            isValid = false;
        };

        const clearError = (input) => {
            input.classList.remove("is-invalid");
            const feedback = input.nextElementSibling;
            if (feedback) feedback.innerText = "";
        };

        // Lấy các trường
        const username = form.username;
        const password = form.password;
        const customerName = form.customerName;
        const customerGender = form.customerGender;
        const customerDate = form.customerDate;
        const customerAddress = form.customerAddress;
        const customerMobiphone = form.customerMobiphone;
        const customerEmail = form.customerEmail;
        const customerAdmin = form.customerAdmin;

        // Clear tất cả lỗi trước
        [username, password, customerName, customerGender, customerDate, customerAddress, customerMobiphone, customerEmail, customerAdmin].forEach(clearError);

        // Kiểm tra trống
        if (!username.value.trim()) setError(username, "Tên đăng nhập không được để trống.");
        if (!password.value.trim()) setError(password, "Mật khẩu không được để trống.");
        else if (password.value.length < 6) setError(password, "Mật khẩu phải từ 6 ký tự trở lên.");

        if (!customerName.value.trim()) setError(customerName, "Tên khách hàng không được để trống.");
        if (!customerGender.value) setError(customerGender, "Vui lòng chọn giới tính.");
        if (!customerDate.value) setError(customerDate, "Vui lòng chọn ngày sinh.");
        if (!customerAddress.value.trim()) setError(customerAddress, "Địa chỉ không được để trống.");
        

        // Số điện thoại
        const phonePattern = /^[0-9]{9,11}$/;
        if (!customerMobiphone.value.trim()) setError(customerMobiphone, "Số điện thoại không được để trống.");
        else if (!phonePattern.test(customerMobiphone.value)) setError(customerMobiphone, "Số điện thoại không hợp lệ.");

        // Email
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!customerEmail.value.trim()) setError(customerEmail, "Email không được để trống.");
        else if (!emailPattern.test(customerEmail.value)) setError(customerEmail, "Email không đúng định dạng.");
        
        if (!customerAdmin.value) setError(customerAdmin, "Vui lòng chọn phân quyền.");
        if (!isValid) {
            e.preventDefault(); // Ngăn submit nếu không hợp lệ
        }
    });
});
</script>
	<!-- js xem thông tin -->
	<script>
	 const viewCustomerModal = document.getElementById('viewCustomerModal');
	    viewCustomerModal.addEventListener('show.bs.modal', function (event) {
	        const button = event.relatedTarget;
	        
	        document.getElementById('viewCustomerId').value = button.getAttribute('data-id');
	        document.getElementById('viewCustomerUsername').value = button.getAttribute('data-username');
	        /* document.getElementById('viewCustomerPassword').value = button.getAttribute('data-password'); */
	        document.getElementById('viewCustomerName').value = button.getAttribute('data-name');
	        document.getElementById('viewCustomerGender').value = button.getAttribute('data-gender');
	        document.getElementById('viewCustomerDate').value = button.getAttribute('data-date');
	        document.getElementById('viewCustomerAddress').value = button.getAttribute('data-address');
	        document.getElementById('viewCustomerPhone').value = button.getAttribute('data-phone');
	        document.getElementById('viewCustomerEmail').value = button.getAttribute('data-email');
	        document.getElementById('viewCustomerAdmin').value = button.getAttribute('data-isadmin');
	    });
</script>
	<!-- js đẩy dữ liệu lên form sửa -->
	<script>
	
const editCustomerModal = document.getElementById('editCustomerModal');
editCustomerModal.addEventListener('show.bs.modal', function (event) {
  const button = event.relatedTarget; // Nút bấm gọi modal

  // Lấy dữ liệu từ data-attributes của nút
  const customerId = button.getAttribute('data-id');
  const username = button.getAttribute('data-username');
  const password = button.getAttribute('data-password');
  const customerName = button.getAttribute('data-name');
  const customerGender = button.getAttribute('data-gender');
  const customerDate = button.getAttribute('data-date');
  const customerAddress = button.getAttribute('data-address');
  const customerMobiphone = button.getAttribute('data-phone');
  const customerEmail = button.getAttribute('data-email');
  const customerAdmin = button.getAttribute('data-isadmin');
 
  // Gán dữ liệu vào các input trong modal
  document.getElementById('editCustomerId').value = customerId || '';
  document.getElementById('editUsername').value = username || '';
  document.getElementById('editPassword').value = password || '';
  document.getElementById('editCustomerName').value = customerName || '';
  document.getElementById('editCustomerGender').value = customerGender || 'Nam';
  document.getElementById('editCustomerDate').value = customerDate || '';
  document.getElementById('editCustomerAddress').value = customerAddress || '';
  document.getElementById('editCustomerMobiphone').value = customerMobiphone || '';
  document.getElementById('editCustomerEmail').value = customerEmail || '';
  document.getElementById('editCustomerAdmin').value = customerAdmin || 'Admin';
 
});</script>
	<!-- js chức năng xóa -->
	<script>
	document.querySelectorAll('.deleteCustomerBtn').forEach(button => {
		  button.addEventListener('click', function () {
		    const customerId = this.getAttribute('data-customer-id');
		    document.getElementById('deleteCustomerId').value = customerId;
		  });
		});
</script>
	<!-- js điều kiện của sửa -->
	<script>
document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector('#editCustomerModal form');

  form.addEventListener('submit', function (event) {
    let isValid = true;

    // Xóa thông báo lỗi cũ
    document.querySelectorAll('#editCustomerModal .error-message').forEach(span => {
      span.textContent = '';
    });

    // Lấy giá trị các ô nhập
    const username = document.getElementById('editUsername');
    const password = document.getElementById('editPassword');
    const name = document.getElementById('editCustomerName');
    const date = document.getElementById('editCustomerDate');
    const address = document.getElementById('editCustomerAddress');
    const phone = document.getElementById('editCustomerMobiphone');
    const email = document.getElementById('editCustomerEmail');
    const admin = document.getElementById('editCustomerAdmin');
  

    // Kiểm tra không để trống
    if (username.value.trim() === '') {
      username.parentElement.parentElement.querySelector('.error-message').textContent = 'Tên đăng nhập không được để trống';
      isValid = false;
    }

    if (password.value.trim().length < 6) {
      password.parentElement.parentElement.querySelector('.error-message').textContent = 'Mật khẩu phải có ít nhất 6 ký tự';
      isValid = false;
    }

    if (name.value.trim() === '') {
      name.parentElement.parentElement.querySelector('.error-message').textContent = 'Họ tên không được để trống';
      isValid = false;
    }

    if (date.value.trim() === '') {
      date.parentElement.parentElement.querySelector('.error-message').textContent = 'Ngày sinh không được để trống';
      isValid = false;
    }

    if (address.value.trim() === '') {
      address.parentElement.parentElement.querySelector('.error-message').textContent = 'Địa chỉ không được để trống';
      isValid = false;
    }

    if (!/^\d{9,11}$/.test(phone.value.trim())) {
      phone.parentElement.parentElement.querySelector('.error-message').textContent = 'Số điện thoại không hợp lệ (chỉ chứa số và từ 9-11 chữ số)';
      isValid = false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email.value.trim())) {
      email.parentElement.parentElement.querySelector('.error-message').textContent = 'Email không hợp lệ';
      isValid = false;
    }

   

    // Nếu có lỗi -> không cho submit
    if (!isValid) {
      event.preventDefault();
    }
  });
});
</script>

</body>

</html>