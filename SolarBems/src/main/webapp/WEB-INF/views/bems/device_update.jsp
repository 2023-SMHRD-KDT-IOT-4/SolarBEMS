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
    Solar BEMS 디바이스 관리
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

  <aside id="sidenav-main" class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark">
  	<jsp:include page="../common/sidenav.jsp" />
  </aside>

  <main class="main-content border-radius-lg ">

    <nav id="topnav" class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" data-scroll="true">
    	<jsp:include page="../common/topnav.jsp" />
    </nav>

    <!-- 디바이스 연동 -->
    <div class="container-fluid py-2 mt-4">

      <div class="align-items-start ">
        <span class="mask bg-gray-50 opacity-6"></span>
        <div class="container my-auto">
          <div class="row">
            <div class="col-lg-4 col-md-8 col-12 mx-auto">
              <div class="card z-index-0 fadeIn3 fadeInBottom">
                <div class="card-header p-1 position-relative mt-n4 mx-3 z-index-2">
                  <div class="bg-gradient-info shadow-primary border-radius-lg py-1 pe-1">
                    <h4 class="text-white font-weight-bolder text-center mt-1 mb-1">
                      디바이스 정보수정
                    </h4>
                  </div>
                </div>
                <!-- 디바이스 연동 폼 -->
                <div class="card-body pb-0 pt-3">
                
                  <form role="form" class="text-start" action="${contextPath}/bems/device_update" method="post">
                  	<input type="hidden" name="linkId" value="${dto.linkId}" />
                    <div class="input-group input-group-static mb-4">
                      <label >디바이스 타입</label>
                      <input type="text" class="form-control" value="${dto.dvcTypeName}" disabled>
                    </div>

                    <div class="input-group input-group-static mb-2">
                      <label >디바이스 이름</label>
                      <input type="text" class="form-control" name="dvclName"  value="${dto.dvclName}">
                    </div>
                    <div class="input-group input-group-static mb-2">
                      <label >디바이스 설치위치</label>
                      <input type="text" class="form-control" name="dvclLoc" value="${dto.dvclLoc}">
                    </div>
                    <div class="text-center">
                      <input type="submit" class="btn bg-gradient-primary w-100 mt-3" value="수정하기" />
                    </div>
                    <div class="card-footer text-center px-1 py-0">
                      <input type="reset" class="btn bg-gradient-warning" value="리셋">
                      <a href="${contextPath}/bems/device_mgmt">
                        <button type="button" class="btn bg-gradient-dark">
                          관리화면
                        </button>
                      </a>
                    </div>
                  </form>
                  
                </div>
              </div>
            </div>
          </div>
        </div><!-- End <div class="container my-auto"> -->
      </div>
      
		<!-- include footer -->
		<jsp:include page="../common/footer.jsp" />
    </div> <!-- End Content -->
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
  
  </body>
</html>
