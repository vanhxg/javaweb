<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Thanh toán</title>
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

<body class="checkout-page">
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
						<li>Chi tiết sản phẩm</a></li>
						<li class="current">Thanh toán</li>
					</ol>
				</nav>
				<h1>Thanh toán</h1>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Checkout Section -->
		<section id="checkout" class="checkout section">

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row">
					<div class="col-lg-8">
						<!-- Checkout Steps -->
						<div class="checkout-steps mb-4" data-aos="fade-up">
							<div class="step active" data-step="1">
								<div class="step-number">1</div>
								<div class="step-title">Thông tin</div>
							</div>
							<div class="step-connector"></div>
							<div class="step" data-step="2">
								<div class="step-number">2</div>
								<div class="step-title">Giao hàng</div>
							</div>
							<div class="step-connector"></div>
							<div class="step" data-step="3">
								<div class="step-number">3</div>
								<div class="step-title">Thanh toán</div>
							</div>
							<div class="step-connector"></div>
							<div class="step" data-step="4">
								<div class="step-number">4</div>
								<div class="step-title">Xác nhận</div>
							</div>
						</div>


						<!-- Checkout Forms Container -->
						<div class="checkout-forms" data-aos="fade-up"
							data-aos-delay="150">
							<form class="checkout-form-element" id="checkout-form" action="${pageContext.request.contextPath}/momo-callback" method="post">
									<input type="hidden" name="quantity" value="${quantity}">
    								<input type="hidden" name="price" value="${amount}">
    
								<!-- Step 1: Customer Information -->
								<div class="checkout-form active" data-form="1">
									<div class="form-header">
										<h3>Thông tin khách hàng</h3>
										<p>Vui lòng nhập thông tin liên lạc của bạn</p>
									</div>
									<div class="checkout-form-element">
										<div class="row">
											<div class="form-group">
												<label for="first-name">Tên</label> <input type="text"
													name="first-name" class="form-control" id="first-name"
													placeholder="Nhập tên" required=""
													value="${customer.customerName}">
											</div>
										</div>

										<div class="form-group mt-3">
											<label for="email">Địa chỉ Email</label> <input type="email"
												class="form-control" name="email" id="email"
												placeholder="Nhập Email" required=""
												value="${customer.customerEmail}">
										</div>

										<div class="form-group mt-3">
											<label for="phone">Số điện thoại</label> <input type="tel"
												class="form-control" name="phone" id="phone"
												placeholder="Nhập số điện thoại" required=""
												value="${customer.customerMobiphone}">
										</div>

										<div class="text-end mt-4">
											<button type="button" class="btn btn-primary next-step"
												data-next="2">Tiếp tục đến giao hàng</button>
										</div>
									</div>
								</div>

								<!-- Step 2: Shipping Address -->
								<div class="checkout-form d-none" data-form="2">
									<div class="form-header">
										<h3>Địa chỉ giao hàng</h3>
										<p>Chúng tôi sẽ giao đơn hàng của bạn đến đâu?</p>
									</div>
									<div class="checkout-form-element">
										<div class="form-group">
											<label for="address">Địa chỉ đầy đủ</label> <input
												type="text" class="form-control" name="address" id="address"
												placeholder="VD: 123 Lê Duẩn, Phường Tân Chính, Quận Thanh Khê, Đà Nẵng"
												required="">
										</div>

										<div class="form-check mt-3">
											<input class="form-check-input" type="checkbox"
												id="save-address" name="save-address"> <label
												class="form-check-label" for="save-address">Lưu địa
												chỉ này cho đơn hàng sau</label>
										</div>
										<div class="d-flex justify-content-between mt-4">
											<button type="button"
												class="btn btn-outline-secondary prev-step" data-prev="1">
												Quay lại Thông tin</button>
											<button type="button" class="btn btn-primary next-step"
												data-next="3">Tiếp tục đến Thanh toán</button>
										</div>
									</div>
								</div>


								<!-- Step 3: Payment Method -->
								<div class="checkout-form d-none" data-form="3">
									<div class="form-header">
										<h3>Phương thức thanh toán</h3>
										<p>Chọn cách bạn muốn thanh toán</p>
									</div>

									<div class="checkout-form-element">
										<div class="payment-methods">

											<!-- COD -->
											<div class="payment-method active">
												<div class="payment-method-header">
													<div class="form-check">
														<input class="form-check-input" type="radio"
															name="paymentmethod" id="cod" value="COD" checked>
														<label class="form-check-label" for="cod">Thanh
															toán khi nhận hàng (COD)</label>
													</div>
												</div>
												<div class="payment-method-body">
													<p>Quý khách sẽ thanh toán tiền mặt khi nhận hàng.</p>
												</div>
											</div>

											<!-- MOMO -->
											<div class="payment-method mt-3">
												<div class="payment-method-header">
													<div class="form-check">
														<input class="form-check-input payment-radio" type="radio"
															name="paymentmethod" id="momo" value="Momo"
															data-method="momo"> <label
															class="form-check-label" for="momo">Ví điện tử
															Momo</label>
													</div>
												</div>
												<div class="payment-method-body momo-body d-none">
													<p>Chuyển đến trang Momo để thanh toán.</p>

													<%-- Dữ liệu đơn hàng cần truyền đi --%>
													<%
String amount = request.getAttribute("amount") != null ? request.getAttribute("amount").toString() : "0";
String productId = request.getAttribute("productId") != null ? request.getAttribute("productId").toString() : "SP001";
%>

<a href="<%=request.getContextPath()%>/homepage/momoPayment.jsp?productId=<%=productId%>&amount=<%=amount%>" class="btn btn-danger mt-2">
  Thanh toán qua Momo
</a>

												</div>
											</div>



											<!-- ZaloPay -->
											<div class="payment-method mt-3">
												<div class="payment-method-header">
													<div class="form-check">
														<input class="form-check-input" type="radio"
															name="paymentmethod" id="zalopay" value="ZaloPay">
														<label class="form-check-label" for="zalopay">ZaloPay</label>
													</div>
												</div>
												<div class="payment-method-body d-none">
													<p>Quét mã QR hoặc thanh toán qua ứng dụng ZaloPay.</p>
													<img src="/images/qr-zalopay-demo.png" alt="QR ZaloPay"
														style="max-width: 200px;">
												</div>
											</div>

											<!-- BANK TRANSFER -->
											<div class="payment-method mt-3">
												<div class="payment-method-header">
													<div class="form-check">
														<input class="form-check-input" type="radio"
															name="paymentmethod" id="bank" value="Chuyển khoản">
														<label class="form-check-label" for="bank">Chuyển
															khoản ngân hàng</label>
													</div>
												</div>
												<div class="payment-method-body d-none">
													<p>Thông tin chuyển khoản:</p>
													<ul>
														<li><strong>Ngân hàng:</strong> Vietcombank</li>
														<li><strong>Số tài khoản:</strong> 0123456789</li>
														<li><strong>Chủ tài khoản:</strong> Công ty TNHH Mộc
															Store</li>
														<li><strong>Nội dung:</strong> Thanh toán đơn hàng
															#123</li>
													</ul>
												</div>
											</div>

										</div>

										<div class="d-flex justify-content-between mt-4">
											<button type="button"
												class="btn btn-outline-secondary prev-step" data-prev="2">Quay
												lại Giao hàng</button>
											<button type="button" class="btn btn-primary next-step" data-next="4">Xem
												lại đơn hàng</button>
										</div>
									</div>
								</div>
								
								<!-- Step 4: Order Review -->
								<div class="checkout-form d-none" data-form="4">
									<div class="form-header">
										<h3>Kiểm tra lại đơn hàng</h3>
										<p>Vui lòng kiểm tra kỹ thông tin trước khi đặt hàng</p>
									</div>
									<div class="checkout-form-element">
										<div class="review-sections">
											<div class="review-section">
												<div class="review-section-header">
													<h4>Thông tin liên hệ</h4>
													
												</div>
												<div class="review-section-content">
													<p class="review-name"  id="review-name"></p>
													<p class="review-email" id="review-email"></p>
													<p class="review-phone" id="review-phone"></p>
												</div>
											</div>

											<div class="review-section mt-3">
												<div class="review-section-header">
													<h4>Địa chỉ giao hàng</h4>
													
												</div>
												<div class="review-section-content">
													<p id="review-address"></p>
												</div>
											</div>

											<div class="review-section mt-3">
												<div class="review-section-header">
													<h4>Phương thức thanh toán</h4>
													
												</div>
												<div class="review-section-content">
													<p id="review-payment"></p>
												</div>
											</div>
										</div>

										<div class="form-check mt-4">
											<input class="form-check-input" type="checkbox" id="terms"
												name="terms" required=""> <label
												class="form-check-label" for="terms"> Tôi đồng ý với
												Điều khoản và Chính sách bảo mật</a>
											</label>
										</div>

										<div class="success-message d-none">Đơn hàng của bạn đã
											được đặt thành công! Cảm ơn bạn đã mua hàng.</div>

										<div class="d-flex justify-content-between mt-4">
											<button type="button"
												class="btn btn-outline-secondary prev-step" data-prev="3">Quay
												lại thanh toán</button>
											<button type="submit" class="btn btn-success place-order-btn">Đặt
												hàng</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-lg-4">

						<!-- Tóm tắt đơn hàng -->
						<div class="order-summary" data-aos="fade-left"
							data-aos-delay="200">
							<div class="order-summary-header">
								<h3>Đơn hàng</h3>
								<button type="button" class="btn-toggle-summary d-lg-none">
									<i class="bi bi-chevron-down"></i>
								</button>
							</div>

							<div class="order-summary-content">
								<!-- Order Item -->
								<div class="order-item d-flex">
									<img src="${product.productImage}" alt="Product"
										class="product-image"
										style="width: 80px; height: auto; display: block; margin: 10px; object-fit: contain;" />
									<div class="order-item-details">
										<h6 class="product-title">${product.productName}</h6>
										<p class="product-meta">Danh mục:
											${product.category.categoryName} | Thương hiệu:
											${product.brand.brandName}</p>

										<!-- Hiển thị số lượng × đơn giá -->
										<div class="order-item-price">
											<span class="quantity">${quantity} ×</span> <span
												class="price">$${product.productCost}</span>
										</div>
									</div>
								</div>

								<!-- Tính toán giá -->
								<c:set var="subtotal" value="${product.productCost * quantity}" />
								<c:set var="shipping" value="5" />
								<c:set var="total" value="${subtotal + shipping}" />

								<!-- Hiển thị giá -->
								<div class="order-totals">
									<div class="order-subtotal d-flex justify-content-between">
										<span>Tạm tính</span> <span>$<c:out value="${subtotal}" /></span>
									</div>
									<div class="order-shipping d-flex justify-content-between">
										<span>Phí vận chuyển</span> <span>$<c:out
												value="${shipping}" /></span>
									</div>
									<div class="order-tax d-flex justify-content-between">
										<span>Thuế</span> <span>$0.00</span>
									</div>
									<div class="order-total d-flex justify-content-between">
										<span>Tổng cộng</span> <span>$<c:out value="${total}" /></span>
									</div>
								</div>

								<!-- Mã giảm giá -->
								<div class="promo-code mt-3">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Mã giảm giá" aria-label="Promo Code">
										<button class="btn btn-outline-primary" type="button">Áp
											dụng</button>
									</div>
								</div>

								<div class="secure-checkout mt-4">
									<div class="secure-checkout-header">
										<i class="bi bi-shield-lock"></i> <span>Thanh toán an
											toàn</span>
									</div>
									<div class="payment-icons mt-2">
										<i class="bi bi-credit-card-2-front"></i> <i
											class="bi bi-credit-card"></i> <i class="bi bi-paypal"></i> <i
											class="bi bi-apple"></i>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</section>
		<!-- /Checkout Section -->

	</main>

	<jsp:include page="parts/footer.jsp" />

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
		
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        console.log("Checkout JS đã được load ✅");

        const steps = document.querySelectorAll(".checkout-form"); // form từng bước
        const nextButtons = document.querySelectorAll(".next-step");
        const prevButtons = document.querySelectorAll(".prev-step");
        const stepIndicators = document.querySelectorAll(".checkout-steps .step"); // thanh tiến trình

        let currentStep = 0;

        function showStep(index) {
            steps.forEach((step, i) => {
                step.classList.toggle("d-none", i !== index);
                step.classList.toggle("active", i === index);
            });

            //Cập nhật màu bước trên thanh tiến trình
            stepIndicators.forEach((step, i) => {
                step.classList.toggle("active", i === index);
            });
        }

        nextButtons.forEach((btn) => {
            btn.addEventListener("click", function () {
                if (currentStep < steps.length - 1) {
                    currentStep++;
                    showStep(currentStep);
                }
            });
        });

        prevButtons.forEach((btn) => {
            btn.addEventListener("click", function () {
                if (currentStep > 0) {
                    currentStep--;
                    showStep(currentStep);
                }
            });
        });

        showStep(currentStep); // show first step on load
    });
</script>

	<script>
  const radios = document.querySelectorAll('input[name="paymentmethod"]');
  radios.forEach(radio => {
    radio.addEventListener('change', () => {
      document.querySelectorAll('.payment-method').forEach(box => {
        box.querySelector('.payment-method-body').classList.add('d-none');
      });

      const selected = radio.closest('.payment-method');
      selected.querySelector('.payment-method-body').classList.remove('d-none');
    });
  });
</script>

<!-- <script>
document.querySelector('.next-step[data-next="4"]').addEventListener('click', function () {
    // Lấy dữ liệu từ step 1
    const name = document.getElementById('first-name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;

    // Lấy địa chỉ từ step 2
    const address = document.getElementById('address').value;

    // Lấy phương thức thanh toán từ step 3
    const paymentMethod = document.querySelector('input[name="paymentmethod"]:checked').value;

    // Gán dữ liệu vào step 4
    document.getElementById('review-name').textContent = name;
    document.getElementById('review-email').textContent = email;
    document.getElementById('review-phone').textContent = phone;
    document.getElementById('review-address').textContent = address;

    let paymentText = "";
    if (paymentMethod === "COD") paymentText = "Thanh toán khi nhận hàng (COD)";
    else if (paymentMethod === "Momo") paymentText = "Ví điện tử Momo";
    else if (paymentMethod === "ZaloPay") paymentText = "ZaloPay";
    else if (paymentMethod === "Chuyển khoản") paymentText = "Chuyển khoản ngân hàng";
    document.getElementById('review-payment').textContent = paymentText;
});
</script> -->

<script>
document.addEventListener("DOMContentLoaded", function () {
    const nextButtons = document.querySelectorAll(".next-step");
    console.log("Gắn sự kiện cho nút next-step ✅"); // Test in log

    nextButtons.forEach(button => {
        button.addEventListener("click", function () {
            const nextStep = this.getAttribute("data-next");
            console.log("Bấm nút chuyển tới bước:", nextStep); // Test thêm

            if (nextStep === "4") {
                console.log("✅ Chuyển sang bước 4");

                const name = document.getElementById("first-name").value;
                const email = document.getElementById("email").value;
                const phone = document.getElementById("phone").value;
                const address = document.getElementById("address").value;

                const checkedRadio = document.querySelector("input[name='paymentmethod']:checked");
                let paymentText = "";
                if (checkedRadio) {
                    const val = checkedRadio.value;
                    if (val === "COD") paymentText = "Thanh toán khi nhận hàng (COD)";
                    else if (val === "Momo") paymentText = "Ví điện tử Momo";
                    else if (val === "ZaloPay") paymentText = "ZaloPay";
                    else if (val === "Chuyển khoản") paymentText = "Chuyển khoản ngân hàng";
                }

                document.getElementById("review-name").textContent = "Tên: " + name;
                document.getElementById("review-email").textContent = "Email: " + email;
                document.getElementById("review-phone").textContent = "SĐT: " + phone;
                document.getElementById("review-address").textContent = "Địa chỉ: " + address;
                document.getElementById("review-payment").textContent = "Thanh toán: " + paymentText;
            }
        });
    });
});
</script>

</body>
</html>