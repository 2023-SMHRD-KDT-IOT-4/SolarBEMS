<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${contextPath}/resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${contextPath}/resources/img/favicon.png">
  <title>
    Solar BEMS 전력 Dashboard
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="${contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${contextPath}/resources/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="${contextPath}/resources/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <!-- <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script> -->
</head>

<body class="g-sidenav-show bg-gray-100">

  <aside id="sidenav-main" class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark">
  	<jsp:include page="../common/sidenav.jsp" />
  </aside>

  <main class="main-content border-radius-lg ">

    <nav id="topnav" class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" data-scroll="true">
    	<jsp:include page="../common/topnav.jsp" />
    </nav>

    <!-- Start container -->
    <div class="container-fluid py-2">
      <div class="row">
        <div class="col-lg-7 position-relative z-index-2">
          <div class="card card-plain mb-1">
            <div class="card-body p-0">
              <h3 class="font-weight-bolder mb-0">전력 Dashboard</h3>
            </div>
          </div> <!-- End card  -->
        </div>
      </div><!-- End row -->

      <!--  Start -->
      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart1" class="w-100" style="height: 300px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->

        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart2" class="w-100" style="height: 300px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->
       
      </div><!-- End row  -->

    </div> <!-- End container-fluid py-2 -->

    <!-- Start container -->
    <div class="container-fluid py-2">

      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart3" class="w-100" style="height: 300px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->

        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart4" class="w-100" style="height: 300px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->
       
      </div><!-- End row  -->
    </div> <!-- End container container-fluid py-2 -->

		<!-- include footer -->
		<jsp:include page="../common/footer.jsp" />
  </main>

<!--   Core JS Files   -->
<script src="${contextPath}/resources/js/core/popper.min.js" ></script>
<script src="${contextPath}/resources/js/core/bootstrap.min.js" ></script>
<script src="${contextPath}/resources/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="${contextPath}/resources/js/plugins/smooth-scrollbar.min.js" ></script>

<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>

  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${contextPath}/resources/js/material-dashboard.min.js?v=3.1.0"></script>
  
  <!-- Solar Files  -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
   <!-- solar chart func -->
  <script src="${contextPath}/resources/js/solar_chart.js"></script>
  
  </body>
</html>