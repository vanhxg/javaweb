<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - NHOM 9</title>
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

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav class="d-flex justify-content-end">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/chartUser">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-6 col-md-6">
              <div class="card info-card sales-card">


                <div class="card-body">
                  <h5 class="card-title">Sales <span>| This month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${orderCount}</h6>
                      <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Customers Card -->
            <div class="col-xxl-6 col-xl-12">

              <div class="card info-card customers-card">

                

                <div class="card-body">
                  <h5 class="card-title">Customers <span>| This Year</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${userCount}</h6>
                      <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->
            
            <!-- Revenue Card -->
            <div class="col-xxl-6 col-md-6">
              <div class="card info-card revenue-card">


                <div class="card-body">
                  <h5 class="card-title">Revenue <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6><fmt:formatNumber value="${revenue}" type="number" groupingUsed="true"/>₫</h6>
                      <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Doanh thu theo tháng -->
	        <div class="col-12 mb-4">
	          <div class="card">
	            <div class="card-body">
	              <h5 class="card-title">Doanh thu (VND) <span>/2025</span></h5>
	              <div id="areaChart"></div>
	              
					<c:set var="revenueStr" value=""/>
					<c:forEach var="r" items="${monthlyRevenue}">
					  <c:set var="revenueStr" value="${revenueStr}${r}," />
					</c:forEach>
	              
	              <script>
			        document.addEventListener("DOMContentLoaded", () => {
			          const revenueData = [${fn:substring(revenueStr, 0, fn:length(revenueStr) - 1)}];
			          const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			
			          new ApexCharts(document.querySelector("#areaChart"), {
			        	  chart: {
			        	    type: 'area',
			        	    height: 350,
			        	    toolbar: { show: false }
			        	  },
			        	  dataLabels: {
			        	    enabled: false
			        	  },
			        	  stroke: {
			        	    curve: 'smooth',
			        	    width: 2
			        	  },
			        	  series: [{
			        	    name: "Doanh thu",
			        	    data: revenueData
			        	  }],
			        	  xaxis: {
			        	    categories: months
			        	  },
			        	  
			        	  yaxis: {
			        		  labels: {
			        		    formatter: function (val) {
			        		      return val.toLocaleString('vi-VN');
			        		    }
			        		  }
							},
			        	  colors: ['#2eca6a'],
			        	  fill: {
			        	    type: 'gradient',
			        	    gradient: {
			        	      shadeIntensity: 1,
			        	      opacityFrom: 0.4,
			        	      opacityTo: 0.1,
			        	      stops: [0, 90, 100]
			        	    }
			        	  },
			        	  
			        	  tooltip: {
			        	    y: {
			        	      formatter: function (val) {
			        	        return val.toLocaleString('vi-VN') + " VNĐ";
			        	      }
			        	    }
			        	  }
			        	}).render();
			        });
			      </script>
	            </div>
	          </div>
	        </div>
			<!-- END - Doanh thu theo tháng -->
			
            

            <!-- Top 5 sản phẩm bán chạy -->
	        <div class="col-12">
	          <div class="card">
	            <div class="card-body">
	              <h5 class="card-title">Top 5 sản phẩm bán chạy</h5>
	              <div id="barChart"></div>
	              
	              <c:set var="productNames" value=""/>
			      <c:set var="productSales" value=""/>
			      <c:forEach var="item" items="${topProducts}">
			        <c:set var="productNames" value="${productNames}'${item.productName}'," />
			        <c:set var="productSales" value="${productSales}${item.quantitySold}," />
			      </c:forEach>
	              <script>
	                document.addEventListener("DOMContentLoaded", () => {
	                	// Lấy dữ liệu từ biến JSP
	                    const productNames = [${fn:substring(productNames, 0, fn:length(productNames) - 1)}];
	                    const productSales = [${fn:substring(productSales, 0, fn:length(productSales) - 1)}];
	                    
	                    new ApexCharts(document.querySelector("#barChart"), {
	                        chart: {
	                          type: 'bar',
	                          height: 350
	                        },
	                        plotOptions: {
	                          bar: {
	                            horizontal: true,
	                            borderRadius: 5,
	                            distributed: true
	                          }
	                        },
	                        dataLabels: {
	                          enabled: true
	                        },
	                        series: [{
	                          name: "Số lượng bán",
	                          data: productSales
	                        }],
	                        xaxis: {
	                          categories: productNames
	                        },
	                        colors: ['#4154f1', '#2eca6a', '#FEBA17', '#ff771d', '#E55050']
	                      }).render();
	                	});
	              </script>
	            </div>
	          </div>
	        </div>
	        <!-- END - Top 5 sản phẩm bán chạy -->
	        

          </div>
        </div><!-- End Left side columns -->
		
		<!-- Right side columns -->
        <div class="col-lg-4">
        
        	<!-- Gender Ratio -->
			<div class="card">
			  <div class="card-body pb-0">
			    <h5 class="card-title">Giới tính khách hàng <span>| Total</span></h5>
			
			    <div id="genderChart" style="min-height: 400px;" class="echart"></div>
			
			    <script>
				  document.addEventListener("DOMContentLoaded", () => {
				    echarts.init(document.querySelector("#genderChart")).setOption({
				      tooltip: {
				        trigger: 'item',
				        formatter: '{a} <br/>{b}: {c} ({d}%)'
				      },
				      legend: {
				        top: '5%',
				        left: 'center',
				        data: ['Nam', 'Nữ', 'Khác']
				      },
				      series: [{
				        name: 'Gender Ratio',
				        type: 'pie',
				        radius: ['40%', '70%'],
				        avoidLabelOverlap: false,
				        itemStyle: {
				          borderRadius: 0,
				          borderColor: '#fff',
				          borderWidth: 0
				        },
				        label: {
				          show: false,
				          position: 'center'
				        },
				        emphasis: {
				          label: {
				            show: true,
				            fontSize: '18',
				            fontWeight: 'bold',
				            formatter: '{b}\n{d}%'
				          },
				          itemStyle: {
				            shadowBlur: 10,
				            shadowOffsetX: 0,
				            shadowColor: 'rgba(0, 0, 0, 0.5)'
				          }
				        },
				        labelLine: {
				          show: false
				        },
				        data: [
				          {
				            value: ${maleCount},
				            name: 'Nam',
				            itemStyle: { color: '#60B5FF' }
				          },
				          {
				            value: ${femaleCount},
				            name: 'Nữ',
				            itemStyle: { color: '#FF90BB' }
				          },
				          {
				            value: ${otherCount},
				            name: 'Khác',
				            itemStyle: { color: '#FF0B55' }
				          }
				        ]
				      }]
				    });
				  });
				</script>

			
			  </div>
			</div><!-- End Gender Ratio -->
        	
        	
        	
        	
        	
        </div><!-- End Right side columns -->
 
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

</body>

</html>