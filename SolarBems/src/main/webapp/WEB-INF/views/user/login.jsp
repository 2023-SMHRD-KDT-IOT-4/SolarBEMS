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
    Solar BEMS 로그인
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

<body>

  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md blur border-radius-xl top-0 z-index-3 shadow position-absolute my-4 py-3 start-1 end-0 mx-4"
          >
          <div class="container-fluid ps-2 pe-0">
            <!-- <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="../index.html">
              Solar BEMS
            </a> -->
            <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon mt-2">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </span>
            </button>
            <div class="collapse navbar-collapse" id="navigation">
              <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                  <a class="nav-link me-2 font-weight-bolder" href="${contextPath}">
                    <i class="fa fa-light fa-sun text-dark me-1"></i>
                    Solar BEMS
                  </a>
                </li>
                
               	<c:if test="${empty sessionScope.user }">
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="${contextPath}/user/login">
	                    <i class="fa fa-sign-in text-dark text-dark me-1" aria-hidden="true"></i>
	                    	로그인
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="${contextPath}/user/join">
	                    <i class="fa fa-user-plus text-dark me-1"></i>
	                    	회원가입
	                  </a>
	                </li>
                </c:if>
               	<c:if test="${!empty sessionScope.user }">
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="${contextPath}/user/login">
	                    <i class="fa fa-sign-in text-dark text-dark me-1" aria-hidden="true"></i>
	                    	로그아웃
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="${contextPath}/user/user_update">
	                    <i class="fa fa-user-plus text-dark me-1"></i>
	                    	회원정보
	                  </a>
	                </li>
                </c:if>
                
              </ul>
            </div>
          </div>
        </nav>
        <!-- End Navbar -->
      </div>
    </div>
  </div>
  
  <main class="main-content mt-0 pt-0">
    <div class="page-header align-items-start min-vh-100">
      <span class="mask bg-gray-100 opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-info shadow-primary border-radius-lg py-2 pe-1">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">
                    Solar BEMS
                  </h4>
                </div>
              </div>
              <!-- 로그인 입력폼 id, pw -->
              <div class="card-body">
                <form role="form" id="loginForm" class="text-start" action="${contextPath}/user/login" method="post">

                  <div class="input-group input-group-lg input-group-outline my-3">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userId" name="userId">
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="userPw" name="userPw">
                  </div>

                  <!-- 아이디 기억 체크박스
                  <div class="form-check form-switch d-flex align-items-center mb-3">
                    <input class="form-check-input" type="checkbox" id="rememberMe" checked>
                    <label class="form-check-label mb-0 ms-3" for="rememberMe">Remember me</label>
                  </div> -->
                  <div class="text-center">
                    <button type="button" class="btn bg-gradient-primary w-100 my-2 mb-2" id="loginBtn">
                      로그인
                    </button>
                  </div>
                  <p class="mt-4 text-sm text-center">
                    계정이 없으십니까?
                    <a href="${contextPath}/user/join" class="text-primary text-gradient font-weight-bold">
                      회원가입
                    </a>
                  </p>
                </form>
              </div>
            </div>
          </div>
        </div>
          <footer id="footer"></footer>
      </div><!-- <div class="container my-auto"> -->
    </div>
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
  <script type="text/javascript" src="${contextPath}/resources/js/user.js"></script>
  
  </body>
</html>
