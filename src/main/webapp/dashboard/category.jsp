<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Category - NHOM 9</title>
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
  
  
  	<!-- JS - Hiện thị thông báo thêm/sửa/xóa thành công cho Category -->
	<script>
	  document.addEventListener("DOMContentLoaded", function() {
	    const modalMessageElem = document.getElementById('categoryModalMessage');
	    const message = modalMessageElem ? modalMessageElem.textContent.trim() : "";
	    if(message) {
	      var messageModal = new bootstrap.Modal(document.getElementById('categoryMessageModal'));
	      messageModal.show();
	    }
	  });
	</script>
	
	

  <!-- ======= Nội dung chính của trang ======= -->
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Quản lý danh mục</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
          <li class="breadcrumb-item active">Quản lý danh mục</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Danh sách danh mục</h5>
              <div class="text-end mb-3">
			    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
			        <i class="ri-add-circle-fill"> Thêm mới</i>
			    </button>
			</div>

              <!-- Table with stripped rows -->
				<table class="table datatable">
				    <thead>
				        <tr>
				            <th>Mã danh mục</th>
				            <th>Tên danh mục</th>
				            <th>Thực hiện</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="category" items="${listCategory}">
				            <tr>
				                <td>${category.categoryId}</td>
				                <td> <input type="text" value= "${category.categoryName}"/></td>
				                <td>
				                    			                    
				                    <!-- Nút chỉnh sửa 1 danh mục -->
				                    <button type="button" class="btn btn-warning"
				                        data-bs-toggle="modal" data-bs-target="#editCategoryModal"
				                        data-id="${category.categoryId}" 
				                        data-name="${category.categoryName}">
				                        <i class="ri-pencil-fill"></i>
				                    </button>
				                    
				                    <!-- Nút xóa 1 danh mục -->
				                    <button type="button" 
				                            class="btn btn-danger deleteCategoryBtn" 
				                            data-bs-toggle="modal" 
				                            data-bs-target="#deleteCategoryModal"
				                            data-category-id="${category.categoryId}">
				                        <i class="ri-delete-bin-5-fill"></i>
				                    </button>
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
				<!-- End Table with stripped rows -->

				
				<!-- Form Thêm Mới Danh Mục -->
				<div class="modal fade" id="addCategoryModal" tabindex="-1"
				    aria-labelledby="addCategoryModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content border-0 shadow-lg rounded-4">
				            <!-- Form thêm mới -->
				            <form action="addCategory" method="post">
				                <div class="modal-header bg-primary text-white rounded-top-4">
				                    <h5 class="modal-title" id="addCategoryModalLabel">
				                        <i class="ri-folder-add-line me-2"></i>Thêm danh mục mới
				                    </h5>
				                    <button type="button" class="btn-close btn-close-white"
				                        data-bs-dismiss="modal" aria-label="Đóng">
				                    </button>
				                    <!-- Hidden cho chức năng thêm -->
				                    <input type="hidden" name="action" value="add">
				                </div>
				                <div class="modal-body px-4 pt-4">
				                    <div class="row g-3">
				                        <!-- Nhập tên danh mục -->
				                        <div class="col-md-12">
				                            <label for="categoryName" class="form-label">Tên danh mục</label>
				                            <div class="input-group">
				                                <span class="input-group-text">
				                                    <i class="ri-price-tag-3-line"></i>
				                                </span> 
				                                <input type="text" class="form-control" 
				                                id="categoryName" name="categoryName" placeholder="Nhập tên danh mục" required>
				                                
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
				<!-- End Form Thêm mới -->

				
				<!-- Modal Sửa Thông Tin Danh Mục -->
				<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-lg">
				    <div class="modal-content border-0 shadow-lg rounded-4">
				      <form action="quanly-danhmuc" method="post">
				        <div class="modal-header bg-warning text-white rounded-top-4">
				          <h5 class="modal-title" id="editCategoryModalLabel">
				            <i class="ri-edit-line me-2"></i>Chỉnh sửa danh mục
				          </h5>
				          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
				        </div>
				        <div class="modal-body px-4 pt-4">
				          <div class="row g-3">
				          
				            <!-- Hidden cho chức năng sửa -->
				            <input type="hidden" name="action" value="edit"/>
				            
				            <!-- Hidden input mã danh mục -->
				            <input type="hidden" id="editCategoryId" name="categoryId" />
				            
				             <!-- Tên danh mục -->
				            <div class="col-md-12">
				              <label for="editCategoryName" class="form-label">Tên danh mục</label>
				                <div class="input-group">
				                  <span class="input-group-text"><i class="ri-price-tag-3-line"></i></span>
				                  <input type="text" class="form-control" 
				                  id="editCategoryName" name="categoryName" placeholder="Nhập tên danh mục">
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
				<!-- End Form Sửa Danh Mục  -->
				
				<!-- Modal Xóa Thông Tin Danh Mục -->
				<div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-md">
				    <div class="modal-content border-0 shadow-lg rounded-4">
				      <form action="deleteCategory" method="post" id="deleteCategoryForm">
				        <div class="modal-header bg-danger text-white rounded-top-4">
				          <h5 class="modal-title" id="deleteCategoryModalLabel">
				            <i class="ri-delete-bin-line me-2"></i>Xác nhận xóa danh mục
				          </h5>
				          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
				          
				          <!-- Hidden cho chức năng xóa -->
				          <input type="hidden" name="action" value="delete">
				        </div>
				        <div class="modal-body px-4 pt-4">
				          <p>Bạn có chắc chắn muốn xóa danh mục này không?</p>
				          
				          <!-- Ẩn input để gửi id category cần xóa -->
				          <input type="hidden" name="categoryId" id="deleteCategoryId" value="">
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
				<!-- END Modal Xóa Thông Tin Danh Mục -->
				
				<!-- Modal thông báo thành công thêm, sửa, xóa Category -->
				<div class="modal fade" id="categoryMessageModal" tabindex="-1" aria-labelledby="categoryMessageModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header bg-success text-white">
				        <h5 class="modal-title" id="categoryMessageModalLabel">Thông báo</h5>
				        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
				      </div>
				      <div class="modal-body">
				        <p id="categoryModalMessage">${categoryMessage}</p>
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


	<!-- JS cho chức năng thêm danh mục -->
	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const form = document.querySelector("#addCategoryModal form");
	
	        form.addEventListener("submit", function (e) {
	            let isValid = true;
	
	            // Các input
	            const nameInput = form.categoryName;
	
	            // Reset lỗi cũ
	            nameInput.classList.remove("is-invalid");
	            const feedback = nameInput.closest(".input-group").querySelector(".invalid-feedback");
	            if (feedback) feedback.textContent = "";
	
	            // Kiểm tra tên danh mục
	            if (nameInput.value.trim() === "") {
	                isValid = false;
	                nameInput.classList.add("is-invalid");
	                const feedback = nameInput.closest(".input-group").querySelector(".invalid-feedback");
	                if (feedback) feedback.textContent = "Vui lòng nhập tên danh mục.";
	            }
	
	            // Nếu có lỗi => không submit form
	            if (!isValid) {
	                e.preventDefault();
	            }
	        });
	
	        // Reset form khi modal đóng (nút Hủy hoặc dấu X)
	        const modalElement = document.getElementById("addCategoryModal");
	        modalElement.addEventListener("hidden.bs.modal", function () {
	            form.reset();
	
	            // Reset class lỗi và text lỗi
	            const nameInput = form.categoryName;
	            nameInput.classList.remove("is-invalid");
	            const feedback = nameInput.closest(".input-group").querySelector(".invalid-feedback");
	            if (feedback) feedback.textContent = "";
	        });
	    });
	</script>
	
	
	<!-- JS cho sửa Danh Mục -->
	<!-- 1. JS cho sửa Danh Mục - Hiện thị lên input -->
	<script>
	  const editCategoryModal = document.getElementById('editCategoryModal');
	  editCategoryModal.addEventListener('show.bs.modal', function (event) {
	    const button = event.relatedTarget;
	
	    // Lấy dữ liệu từ data-attributes của nút
	    const categoryId = button.getAttribute('data-id');
	    const categoryName = button.getAttribute('data-name');
	  
	    // Gán dữ liệu vào các input trong modal
	    document.getElementById('editCategoryId').value = categoryId || '';
	    document.getElementById('editCategoryName').value = categoryName || '';
	  });
	</script>
	
	<!-- 2. JS cho sửa Danh Mục - Thông báo các lỗi nhập -->
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const form = document.querySelector('#editCategoryModal form');
	    
	    form.addEventListener('submit', function (event) {
	      let isValid = true;
	      
	      // Xóa thông báo lỗi cũ
	      document.querySelectorAll('#editCategoryModal .error-message').forEach(span => {
	          span.textContent = '';
	      });
	
	      // Lấy giá trị ô nhập tên danh mục
	      const categoryName = document.getElementById('editCategoryName');
	
	      // Kiểm tra không để trống
	      if (categoryName.value.trim() === '') {
	        categoryName.parentElement.parentElement.querySelector('.error-message').textContent = 'Tên danh mục không được để trống';
	        isValid = false;
	      }
	
	      // Nếu có lỗi -> không cho submit
	      if (!isValid) {
	        event.preventDefault();
	      }
	    });
	  });
	</script>
	
	<!-- JS cho xóa Danh Mục -->
	<script>
	  document.querySelectorAll('.deleteCategoryBtn').forEach(button => {
	    button.addEventListener('click', function () {
	      const categoryId = this.getAttribute('data-category-id');
	      document.getElementById('deleteCategoryId').value = categoryId;
	    });
	  });
	</script>
</body>

</html>