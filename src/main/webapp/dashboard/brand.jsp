<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Brand - NHOM 9</title>
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

	<!-- JS - Hiện thị thông báo thêm/sửa/xóa thành công -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		  const modalMessageElem = document.getElementById('modalMessage');
		  const message = modalMessageElem ? modalMessageElem.textContent.trim() : "";
		  if(message) {
		    var messageModal = new bootstrap.Modal(document.getElementById('messageModal'));
		    messageModal.show();
	
		    // Bạn có thể dùng Ajax để gửi yêu cầu xóa message khỏi session ở server nếu muốn.
		    // Hoặc bạn có thể xóa message trong lần gọi servlet tiếp theo (thường là sau khi reload trang).
		  }
		});
		
	</script>
		

	<!-- ======= Nội dung chính của trang ======= -->
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Quản lý nhà cung cấp</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
          <li class="breadcrumb-item active">Quản lý nhà cung cấp</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Danh sách nhà cung cấp</h5>
              
              <div class="text-end mb-3">
              		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addBrandModal">
              			<i class="ri-add-circle-fill"> Thêm mới</i>
              		</button>
              </div>
              
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th> Mã nhà cung cấp</th>
                    <th>Tên NCC</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Thực hiện</th>
                    <!-- <th data-type="date" data-format="YYYY/DD/MM">Start Date</th> -->
                  </tr>
                </thead>
                <tbody>
			        <c:forEach var="brand" items="${listBrand}">
				        <tr>
				            <td>${brand.brandId}</td>
				            <td>${brand.brandName}</td>
				            <td>${brand.brandAddress}</td>
				            <td>${brand.brandMobiphone}</td>
				            <td>
				            	<!-- Nút xem chi tiết 1 NCC -->
				            	<button type="button" class="btn btn-primary" 
				            		data-bs-toggle="modal" data-bs-target="#viewBrandModal"
				            		data-id="${brand.brandId}" data-name="${brand.brandName}"
				            		data-address="${brand.brandAddress}"
				            		data-phone="${brand.brandMobiphone}">
				            	<i class=" ri-eye-fill"></i>
				            	</button>
				            	
				            	<!-- Nút chỉnh sửa 1 NCC -->
					        	<button type="button" class="btn btn-warning"
								    data-bs-toggle="modal" data-bs-target="#editBrandModal"
								    data-id="${brand.brandId}" data-name="${brand.brandName}"
								    data-address="${brand.brandAddress}" data-phone="${brand.brandMobiphone}">
								    <i class="ri-pencil-fill"></i>
								</button>
								
					        	<!-- Nút xóa 1 NCC -->
								<button type="button" 
								        class="btn btn-danger deleteBrandBtn" 
								        data-bs-toggle="modal" 
								        data-bs-target="#deleteBrandModal"
								        data-brand-id="${brand.brandId}">
								    <i class="ri-delete-bin-5-fill"></i>
								</button>

					        </td>
				        </tr>
				    </c:forEach>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->
				
				<!-- Form Thêm Mới Nhà Cung Cấp  -->
				
				<div class="modal fade" id="addBrandModal" tabindex="-1"
					aria-labelledby="addBrandModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<!-- modal-lg cho khung rộng hơn -->
						<div class="modal-content border-0 shadow-lg rounded-4">
						
							<!-- Form thêm mới -->
							<form action="addBrand" method="post">
								<div class="modal-header bg-primary text-white rounded-top-4">
									<h5 class="modal-title" id="addBrandModalLabel">
										<i class="ri-building-4-line me-2"></i>Thêm nhà cung cấp mới
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal" aria-label="Đóng">
									</button>
									
									<!-- Hidden cho chức năng thêm -->
									<input type="hidden" name="action" value="add">
								</div>
								<div class="modal-body px-4 pt-4">
									<div class="row g-3">
										<!-- Nhập tên NCC -->
										<div class="col-md-12">
											<label for="brandName" class="form-label">Tên nhà cung cấp</label>
											<div class="input-group">
												<span class="input-group-text">
													<i class="ri-user-line"></i></span> 
													<input type="text" class="form-control" 
													id="brandName" name="brandName" placeholder="Nhập tên nhà cung cấp" >
													
													<!-- Hiện lỗi sai JS -->
													<div class="invalid-feedback"></div>
											</div>
										</div>
										
										<!-- Nhập địa chỉ NCC -->
										<div class="col-md-12">
											<label for="brandAddress" class="form-label">Địa chỉ</label>
											<div class="input-group">
												<span class="input-group-text">
													<i class="ri-map-pin-line"></i>
												</span> 
												<input type="text" class="form-control" id="brandAddress"
												name="brandAddress" placeholder="Nhập địa chỉ" >
												
												<!-- Hiện lỗi sai JS -->
												<div class="invalid-feedback"></div>
											</div>
										</div>
										
										<!-- Nhập SDT NCC -->
										<div class="col-md-12">
											<label for="brandMobiphone" class="form-label">Số điện thoại</label>
											<div class="input-group">
												<span class="input-group-text">
													<i class="ri-phone-line"></i></span> 
													<input type="text" class="form-control" 
													id="brandMobiphone" name="brandMobiphone" 
													placeholder="Nhập số điện thoại" >
													
													<!-- Hiện lỗi sai JS -->
													<div class="invalid-feedback"></div>
											</div>
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
			<!-- End Form Thêm mới  -->
			
			
			<!-- Modal Xem Chi Tiết Nhà Cung Cấp -->
			<div class="modal fade" id="viewBrandModal" tabindex="-1"
			     aria-labelledby="viewBrandModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered modal-lg">
			        <div class="modal-content border-0 shadow-lg rounded-4">
			            <div class="modal-header bg-info text-white rounded-top-4">
			                <h5 class="modal-title" id="viewBrandModalLabel">
			                    <i class="ri-eye-line me-2"></i>Chi tiết nhà cung cấp
			                </h5>
			                <button type="button" class="btn-close btn-close-white"
			                        data-bs-dismiss="modal" aria-label="Đóng"></button>
			            </div>
			            
			            <div class="modal-body px-4 pt-4">
			                <div class="row g-3">
			                    <div class="col-md-12">
			                        <label class="form-label">Mã nhà cung cấp</label>
			                        <div class="input-group">
			                        	<span class="input-group-text"><i class="ri-building-4-line"></i></span> 
			                        	<input type="text" class="form-control" id="viewBrandId" readonly>
			                        </div>
			                    </div>
			                    
			                    <div class="col-md-12">
			                        <label class="form-label">Tên nhà cung cấp</label>
			                        <div class="input-group">
			                        	<span class="input-group-text"><i class="ri-user-line"></i></span> 
			                       		<input type="text" class="form-control" id="viewBrandName" readonly>
			                       	</div>	
			                    </div>
			                    
			                    <div class="col-md-12">
			                        <label class="form-label">Địa chỉ</label>
			                        <div class="input-group">
			                        	<span class="input-group-text"><i class="ri-map-pin-line"></i></span> 
			                        	<input type="text" class="form-control" id="viewBrandAddress" readonly>
			                        </div>
			                    </div>
			                    
			                    <div class="col-md-12">
			                        <label class="form-label">Số điện thoại</label>
			                        <div class="input-group">
			                        	<span class="input-group-text"><i class="ri-phone-line"></i></span>
			                        	<input type="text" class="form-control" id="viewBrandPhone" readonly>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="modal-footer px-4 pb-4">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
			                    <i class="ri-close-line"></i> Đóng
			                </button>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Form Xem chi tiết  -->
			
			
			<!-- Modal Sửa Thông Tin Nhà Cung Cấp -->
			<div class="modal fade" id="editBrandModal" tabindex="-1" aria-labelledby="editBrandModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-lg">
			    <div class="modal-content border-0 shadow-lg rounded-4">
			      <form action="quanly-ncc" method="post">
			        <div class="modal-header bg-warning text-white rounded-top-4">
			          <h5 class="modal-title" id="editBrandModalLabel">
			            <i class="ri-edit-line me-2"></i>Chỉnh sửa nhà cung cấp
			          </h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
			        </div>
			        <div class="modal-body px-4 pt-4">
			          <div class="row g-3">
			          
			          	<!-- Hidden cho chức năng sửa -->
			          	<input type="hidden" name="action" value="edit"/>
			          	
			            <!-- Hidden input mã nhà cung cấp -->
			            <input type="hidden" id="editBrandId" name="brandId" />
			            
			             <!-- Tên nhà cung cấp -->
			            <div class="col-md-12">
							<label for="editBrandName" class="form-label">Tên nhà cung cấp</label>
			              	<div class="input-group">
			                	<span class="input-group-text"><i class="ri-user-line"></i></span>
			                	<input type="text" class="form-control" 
			                	id="editBrandName" name="brandName" placeholder="Nhập tên nhà cung cấp">
			              	</div>
			              
			             	<!-- Hiện thị thông báo lỗi JS -->
			              	<span class="error-message text-danger small"></span>
			            </div>
			
			            <!-- Địa chỉ -->
			            <div class="col-md-12">
			              	<label for="editBrandAddress" class="form-label">Địa chỉ</label>
			              	<div class="input-group">
			                	<span class="input-group-text"><i class="ri-map-pin-line"></i></span>
			                	<input type="text" class="form-control" 
			                	id="editBrandAddress" name="brandAddress" placeholder="Nhập địa chỉ">
			              	</div>
			              	<!-- Hiện thị thông báo lỗi JS -->
			             	<span class="error-message text-danger small"></span>
			            </div>
			
			            <div class="col-md-12">
			              	<label for="editBrandMobiphone" class="form-label">Số điện thoại</label>
			              	<div class="input-group">
			                	<span class="input-group-text"><i class="ri-phone-line"></i></span>
			                	<input type="text" class="form-control" 
			                	id="editBrandMobiphone" name="brandMobiphone" placeholder="Nhập số điện thoại">
			                </div>
			                <!-- Hiện thị thông báo lỗi JS -->
			                <span class="error-message text-danger small"></span>
			            </div>
			          </div>
			        </div>
			        <div class="modal-footer px-4 pb-4">
			          	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
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
			<!-- End Form Sửa NCC  -->
			
			
			<!-- Modal Xóa Thông Tin Nhà Cung Cấp -->
			<div class="modal fade" id="deleteBrandModal" tabindex="-1" aria-labelledby="deleteBrandModalLabel" aria-hidden="true">
			  	<div class="modal-dialog modal-dialog-centered modal-md">
			    	<div class="modal-content border-0 shadow-lg rounded-4">
			      		<form action="deleteBrand" method="post" id="deleteBrandForm">
			        		<div class="modal-header bg-danger text-white rounded-top-4">
				          		<h5 class="modal-title" id="deleteBrandModalLabel">
				            		<i class="ri-delete-bin-line me-2"></i>Xác nhận xóa nhà cung cấp
				          		</h5>
				          		<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
				          
				          		<!-- Hidden cho chức năng xóa -->
				          		<input type="hidden" name="action" value="delete">
			        		</div>
			        		<div class="modal-body px-4 pt-4">
			          			<p>Bạn có chắc chắn muốn xóa nhà cung cấp này không?</p>
			          			
			          			<!-- Ẩn input để gửi id brand cần xóa -->
			          			<input type="hidden" name="brandId" id="deleteBrandId" value="">
			        		</div>
			        		<div class="modal-footer px-4 pb-4">
			          			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
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
			
			
			<!-- Modal thông báo thành công thêm, sửa, xóa -->
			<!-- Modal Thông báo -->
			<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
			  	<div class="modal-dialog modal-dialog-centered">
			    	<div class="modal-content">
			      		<div class="modal-header bg-success text-white">
			        		<h5 class="modal-title" id="messageModalLabel">Thông báo</h5>
			        		<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
			      		</div>
			      		<div class="modal-body">
			        		<p id="modalMessage">${message}</p>
			      		</div>
			      		<div class="modal-footer">
			        		<button type="button" class="btn btn-success" data-bs-dismiss="modal">Đóng</button>
			      		</div>
			    	</div>
			  	</div>
			</div>
			
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/assets/adjs/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/adjs/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/adjs/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath}/assets/adjs/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/quill/quill.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/adjs/main.js"></script>
  
	<!-- JS cho chức năng thêm NCC -->
	<script>
	  	document.addEventListener("DOMContentLoaded", function () {
	    const form = document.querySelector("#addBrandModal form");
	
	    form.addEventListener("submit", function (e) {
	      let isValid = true;
	
	      // Các input
	      const nameInput = form.brandName;
	      const addressInput = form.brandAddress;
	      const phoneInput = form.brandMobiphone;
	
	      // Reset lỗi cũ
	      [nameInput, addressInput, phoneInput].forEach(input => {
	        input.classList.remove("is-invalid");
	        const feedback = input.closest(".input-group").querySelector(".invalid-feedback");
	        if (feedback) feedback.textContent = "";
	      });
	
	      // Kiểm tra tên nhà cung cấp
	      if (nameInput.value.trim() === "") {
	        isValid = false;
	        nameInput.classList.add("is-invalid");
	        const feedback = nameInput.closest(".input-group").querySelector(".invalid-feedback");
	        if (feedback) feedback.textContent = "Vui lòng nhập tên nhà cung cấp.";
	      }
	
	      // Kiểm tra địa chỉ
	      if (addressInput.value.trim() === "") {
	        isValid = false;
	        addressInput.classList.add("is-invalid");
	        const feedback = addressInput.closest(".input-group").querySelector(".invalid-feedback");
	        if (feedback) feedback.textContent = "Vui lòng nhập địa chỉ.";
	      }
	
	      // Kiểm tra số điện thoại: chỉ chứa số và đủ 10 chữ số
	      const phone = phoneInput.value.trim();
	      const phoneRegex = /^\d{10}$/;
	      if (!phoneRegex.test(phone)) {
	        isValid = false;
	        phoneInput.classList.add("is-invalid");
	        const feedback = phoneInput.closest(".input-group").querySelector(".invalid-feedback");
	        if (feedback) feedback.textContent = "Số điện thoại phải gồm đúng 10 chữ số.";
	      }
	
	      // Nếu có lỗi => không submit form
	      if (!isValid) {
	        e.preventDefault();
	      }
	    });
	
	    // Reset form khi modal đóng (nút Hủy hoặc dấu X)
	    const modalElement = document.getElementById("addBrandModal");
	    modalElement.addEventListener("hidden.bs.modal", function () {
	      form.reset();
	
	      // Reset class lỗi và text lỗi
	      [form.brandName, form.brandAddress, form.brandMobiphone].forEach(input => {
	        input.classList.remove("is-invalid");
	        const feedback = input.closest(".input-group").querySelector(".invalid-feedback");
	        if (feedback) feedback.textContent = "";
	      });
	    });
	  });
	</script>

	
	<!-- JS cho chức năng xem chi tiết -->
	<script>
	    const viewBrandModal = document.getElementById('viewBrandModal');
	    viewBrandModal.addEventListener('show.bs.modal', function (event) {
	        const button = event.relatedTarget;
	
	        const id = button.getAttribute('data-id');
	        const name = button.getAttribute('data-name');
	        const address = button.getAttribute('data-address');
	        const phone = button.getAttribute('data-phone');
	
	        document.getElementById('viewBrandId').value = id;
	        document.getElementById('viewBrandName').value = name;
	        document.getElementById('viewBrandAddress').value = address;
	        document.getElementById('viewBrandPhone').value = phone;
	    });
	</script>
	
	<!-- JS cho sửa NCC -->
	<!-- <script>
		const editModal = document.getElementById('editBrandModal');
		editModal.addEventListener('show.bs.modal', function (event) {
		  const button = event.relatedTarget;
		
		  // Lấy dữ liệu từ button
		  const brandId = button.getAttribute('data-id');
		  const brandName = button.getAttribute('data-name');
		  const brandAddress = button.getAttribute('data-address');
		  const brandPhone = button.getAttribute('data-phone');
		
		  // Gán vào input
		  document.getElementById('editBrandId').value = brandId;
		  document.getElementById('editBrandName').value = brandName;
		  document.getElementById('editBrandAddress').value = brandAddress;
		  document.getElementById('editBrandMobiphone').value = brandPhone;
		});
	</script> -->
	
	<!-- JS cho sửa NCC -->
	<!-- 1. JS cho sửa NCC - Hiện thị lên input -->
	<script>
		const editBrandModal = document.getElementById('editBrandModal');
		editBrandModal.addEventListener('show.bs.modal', function (event) {
		const button = event.relatedTarget;

		  // Lấy dữ liệu từ data-attributes của nút
		  const brandId = button.getAttribute('data-id');
		  const brandName = button.getAttribute('data-name');
		  const brandAddress = button.getAttribute('data-address');
		  const brandMobiphone = button.getAttribute('data-phone');
		
		  // Gán dữ liệu vào các input trong modal
		  document.getElementById('editBrandId').value = brandId || '';
		  document.getElementById('editBrandName').value = brandName || '';
		  document.getElementById('editBrandAddress').value = brandAddress || '';
		  document.getElementById('editBrandMobiphone').value = brandMobiphone || '';
		});
	</script>
	
	<!-- 2. JS cho sửa NCC - Thông báo các lỗi nhập -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const form = document.querySelector('#editBrandModal form');
			
			form.addEventListener('submit', function (event) {
			let isValid = true;
			
			// Xóa thông báo lỗi cũ
			document.querySelectorAll('#editBrandModal .error-message').forEach(span => {
			  	span.textContent = '';
			});
			
		    // Lấy giá trị các ô nhập
		    const brandName = document.getElementById('editBrandName');
		    const brandAddress = document.getElementById('editBrandAddress');
		    const brandMobiphone = document.getElementById('editBrandMobiphone');
		
		    // Kiểm tra không để trống
		    if (brandName.value.trim() === '') {
		      brandName.parentElement.parentElement.querySelector('.error-message').textContent = 'Tên nhà cung cấp không được để trống';
		      isValid = false;
		    }
		
		    if (brandAddress.value.trim() === '') {
		      brandAddress.parentElement.parentElement.querySelector('.error-message').textContent = 'Địa chỉ không được để trống';
		      isValid = false;
		    }
		
		    if (!/^\d{10}$/.test(brandMobiphone.value.trim())) {
		      brandMobiphone.parentElement.parentElement.querySelector('.error-message').textContent = 'Số điện thoại phải gồm đúng 10 chữ số.';
		      isValid = false;
		    }
		
		    // Nếu có lỗi -> không cho submit
		    if (!isValid) {
		      event.preventDefault();
		    }
		  });
		});
	</script>


	<!-- JS cho xóa NCC  -->
	<script>
		document.querySelectorAll('.deleteBrandBtn').forEach(button => {
		  	button.addEventListener('click', function () {
		    	const brandId = this.getAttribute('data-brand-id');
		    	document.getElementById('deleteBrandId').value = brandId;
		  	});
		});
	</script>

</body>

</html>