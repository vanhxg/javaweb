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

	<main class="main">
		<h3 class="text-primary mt-4">🔒 Đang xử lý thanh toán qua
			Momo...</h3>
		<img src="${pageContext.request.contextPath}/images/momo-qr-demo.png"
			width="200" class="my-3">
		<p class="text-muted">Vui lòng mở ứng dụng Momo và quét mã để hoàn
			tất thanh toán.</p>

		<div class="my-3">
			<p id="countdown" class="fw-bold">
				⏳ Thời gian còn lại: <span id="timer">180</span>s
			</p>
		</div>

		<!-- Trạng thái động -->
		<div id="status" style="margin-top: 20px;">
			<p>🛠️ Đang kiểm tra thanh toán...</p>
		</div>
		
<form action="${pageContext.request.contextPath}/momo-callback" method="post" class="mt-4">
			<input type="hidden" name="orderId" value="${orderId}"> <input
				type="hidden" name="productId" value="${product.id}"> <input
				type="hidden" name="quantity" value="1"> <input
				type="hidden" name="price" value="${product.price}">
			<button class="btn btn-success" type="submit">Tôi đã thanh
				toán</button>
		</form>

	</main>

	<script>
    let timeLeft = 180;
    const timer = setInterval(() => {
        timeLeft--;
        document.getElementById("timer").innerText = timeLeft;
        if (timeLeft <= 0) {
            clearInterval(timer);
            alert("⛔ Hết thời gian thanh toán!");
            window.location.href = "checkout-failed.jsp";
        }
    }, 1000);

    const orderId = new URLSearchParams(window.location.search).get("orderId");
    const amount = new URLSearchParams(window.location.search).get("amount");

    setTimeout(() => {
        fetch("${pageContext.request.contextPath}/momo/payment?orderId=" + orderId + "&amount=" + amount)
            .then(res => res.json())
            .then(data => {
                if (data.result === "success") {
                    clearInterval(timer);
                    document.getElementById("status").innerHTML = `<p class="text-success fw-bold">🎉 Thanh toán thành công đơn hàng <b>${orderId}</b> với số tiền <b>${amount}đ</b>!</p>`;
                    document.querySelector("button[type='submit']").disabled = true;
                } else {
                    document.getElementById("status").innerHTML = `<p class="text-danger fw-bold">❌ Thanh toán thất bại. Vui lòng thử lại.</p>`;
                }
            })
            .catch(err => {
                console.error("Lỗi khi gọi API Momo:", err);
                document.getElementById("status").innerHTML = `<p class="text-warning">⚠️ Không thể kết nối đến Momo. Vui lòng thử lại sau.</p>`;
            });
    }, 3000);
</script>


</body>
</html>