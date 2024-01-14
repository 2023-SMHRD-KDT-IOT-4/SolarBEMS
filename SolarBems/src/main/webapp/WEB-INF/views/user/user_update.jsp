<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
    Solar BEMS 회원정보
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
                  <a class="nav-link me-2 font-weight-bolder" href="${contextPath}/">
                    <i class="fa fa-light fa-sun text-dark me-1"></i>
                    Solar BEMS
                  </a>
                </li>

                <c:if test="${!empty sessionScope.user }">
                <li class="nav-item">
                  <a class="nav-link me-2" href="${contextPath}/">
                    <i class="fa fa-sign-in text-dark text-dark me-1" aria-hidden="true"></i>
                    로그아웃
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
  
  <main class="main-content mt-5">
    <div class="page-header align-items-start min-vh-100">
      <span class="mask bg-gray-100 opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-1 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-info shadow-primary border-radius-lg py-1 pe-1">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">
                    회원정보
                  </h4>
                </div>
              </div>
              <!-- 회원수정 입력폼. div .is-valid .is-invalid -->
              <div class="card-body pb-0 pt-3">
               <form id="updateForm" action="updateData" role="form"  class="text-start" method="POST">

                  <div class="input-group input-group-static mb-3">
                    <label >아이디</label>
                    <input type="text" id="userId" name="userId" class="form-control" readonly="readonly" value="${sessionScope.user.userId}">
                  </div>
                  <div class="input-group input-group-outline mb-1" id="userPwDiv1">
                    <label class="form-label">비밀번호 (최소 4자리 최대 16자리 입력)</label>
                    <input type="password" class="form-control" id="userPw1" name="userPw1" placeholder=""  maxlength="16" onkeyup="checkPw()">
                  </div>
                  <div class="input-group input-group-outline mb-1" id="userPwDiv2">
                    <label class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPw2" name="userPw2" maxlength="16" onkeyup="checkPw()">
                  </div>
                  <div class="input-group input-group-static mb-1">
                    <label>닉네임</label>
                    <input type="text" class="form-control" id="userNick" name="userNick" value="${sessionScope.user.userNick}">
                  </div>
                  <div class="input-group input-group-static mb-1">
                    <label>빌딩 이름</label>
                    <input type="text" class="form-control" id="buildingName" name="buildingName" value="${sessionScope.user.buildingName}">
                  </div>
                  <div class="input-group input-group-static mb-1">
                    <label>아두이노 아이디</label>
                    <input type="text" class="form-control" id="arduId" name="arduId" value="${sessionScope.user.arduId}" readonly="readonly">
                  </div>
                  <div class="text-center">
                    <input type="button" class="btn bg-gradient-primary w-100 my-2 mb-3" value="회원정보 수정" onclick="checkInput()">
                  </div>
                  
                </form>
              </div>
            </div>
          </div>
        </div>
          <!-- <footer id="footer"></footer> -->
      </div><!-- End <div class="container my-auto"> -->
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
  <script src="${contextPath}/resources/js/solar_update.js"></script>
  
  </body>
</html>