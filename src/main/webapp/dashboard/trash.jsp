<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h3 class="mb-4 text-center" >Danh sách tài khoản đã xóa</h3>

<table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-secondary">
        <tr>
            <th>Mã người dùng</th>
            <th>Tên đăng nhập</th>
            <th>Tên khách hàng</th>
            <th>Giới tính</th>
            <th>Địa chỉ</th>
            <th>Thao tác</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${deletedCustomers}">
            <tr>
                <td>${customer.customerId}</td>
                <td>${customer.username}</td>
                <td>${customer.customerName}</td>
                <td>${customer.customerGender}</td>
                <td>${customer.customerAddress}</td>
                <td>
                    <form action="quanly-tk" method="post" style="display: inline;">
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                        <input type="hidden" name="action" value="restore">
                        <button type="submit" class="btn btn-success btn-sm px-3">Restore</button>
                    </form>
                    <form action="quanly-tk" method="post" style="display: inline;">
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                        <input type="hidden" name="action" value="hardDelete">
                        <button type="submit" class="btn btn-danger btn-sm px-3"
                                onclick="return confirm('Bạn chắc chắn muốn xóa vĩnh viễn?');">Xóa vĩnh viễn</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="text-center my-4">
    <form action="quanly-tk" method="get" style="display: inline;">
        <input type="hidden" name="action" value="view" />
        <button type="submit" class="btn btn-primary btn-lg">
            <i class="bi bi-arrow-left"></i>  Quay lại danh sách tài khoản
        </button>
    </form>
</div>


</body>

</body>

</html>