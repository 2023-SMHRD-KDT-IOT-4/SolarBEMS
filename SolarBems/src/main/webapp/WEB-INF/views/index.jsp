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
    Solar BEMS
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
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
  <!-- ??? Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <!-- <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script> -->

</head>

<body class="g-sidenav-show bg-gray-100">

  <aside id="sidenav-main" class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark">
	<jsp:include page="common/sidenav.jsp" />
  </aside>

  <main class="main-content border-radius-lg ">

    <nav id="topnav" class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" data-scroll="true">
      <jsp:include page="common/topnav.jsp" />
    </nav>

    <div class="container-fluid py-2">

      <div class="row">
        <div class="col-md-10 mb-3">
          <div class="card">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 ">
              <div class="bg-gradient-primary shadow-primary border-radius-lg py-1">
                <h4 class="text-white text-capitalize ps-3">Solar BEMS</h4>
                <span class="text-white text-capitalize ps-3">지능형 IoT를 이용한 빌딩 에너지관리 시스템입니다.</span>
              </div>
              <ul class="list-group">
                <li class="list-group-item border-0 d-flex p-4 mb-2  border-radius-lg">
                  <div class="d-flex flex-column">
                    <h5 class="mb-1 text-md">BEMS 서비스</h5>
                    <span class="text-dark font-weight-bold ms-sm-2">1. 전력 Dashboard</span>
                    <span class="text-dark font-weight-bold ms-sm-2">2. 전력 생산량 관리</span>
                    <span class="text-dark font-weight-bold ms-sm-2">3. 전력 디바이스 제어 및 관리</span>
                  </div>
                </li>
              </ul>
              <div class="card-body px-4 py-0">
                <h5 class="mb-1 text-md">전력 Dashboard</h5>
                <!--  Start Chart -->
                <div class="row mb-3">
                  <div class="col-lg-6">
                    <div class="card">
                      <div class="card-header pb-2 px-3 ">
                        <div id="chart1" class="w-100" style="height: 250px;"></div>
                      </div><!-- End card-header -->
                    </div><!-- <div class="card"> -->
                  </div> <!-- End  -->

                  <div class="col-lg-6">
                    <div class="card">
                      <div class="card-header pb-2 px-3 ">
                        <div id="chart4" class="w-100" style="height: 250px;"></div>
                      </div><!-- End card-header -->
                    </div><!-- <div class="card"> -->
                  </div> <!-- End  -->
                </div><!-- End row  -->

                <!--  -->
                <h5 class="mb-1 text-md">디바이스 관리</h5>
                <div class="table-responsive mt-2 px-1 pb-4">
                  <table class="table table-hover align-items-center mb-0">
                    <thead>
                      <tr
                        style="border-width:1px; border-color: rgb(128, 128, 128); background-color: rgb(66, 139, 202);">
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">No</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">디바이스 이름</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">타입</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">운전상태</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">설치위치</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">제어</th>
                      </tr>
                    </thead>
                    <tbody>

                      <tr class="">
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">1</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">디바이스 별칭1</span>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <span class="text-dark text-md font-weight-normal">LED</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">ON</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">사무실_출입</span>
                        </td>
                        <td class="align-middle text-center">

                          <a class="btn btn-link text-info text-gradient px-1 mb-0" href="javascript:;">
                            <i class="material-icons">settings_remote</i>
                            디바이스 제어
                          </a>
                          <a class="btn btn-link text-danger text-gradient px-1 mb-0" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" data-bs-param="1">
                            <i class="material-icons">link_off</i>
                            연동해제
                          </a>
                          <a class="btn btn-link text-dark px-1 mb-0" href="javascript:;">
                            <i class="material-icons">edit</i>
                            수정
                          </a>

                        </td>
                      </tr>
                      
                      <tr class="">
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">2</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">디바이스 별칭2</span>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <span class="text-dark text-md font-weight-normal">LED</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">ON</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">사무실_창가</span>
                        </td>
                        <td class="align-middle text-center">

                          <a class="btn btn-link text-info text-gradient px-1 mb-0" href="javascript:;">
                            <i class="material-icons">settings_remote</i>
                            디바이스 제어
                          </a>
                          <a class="btn btn-link text-danger text-gradient px-1 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-param="1">
                            <i class="material-icons">link_off</i>
                            연동해제
                          </a>
                          <a class="btn btn-link text-dark px-1 mb-0" href="javascript:;">
                            <i class="material-icons">edit</i>
                            수정
                          </a>

                        </td>
                      </tr>

                    </tbody>
                  </table>
                </div>

              </div><!-- card-body -->


            </div>
          </div>
        </div>
      </div>

    </div><!-- container-fluid py-2 -->
    
		<!-- include footer -->
    <jsp:include page="common/footer.jsp" />
  </main>

  <!--   Core JS Files   -->
  <script src="${contextPath}/resources/js/core/popper.min.js"></script>
  <script src="${contextPath}/resources/js/core/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${contextPath}/resources/js/plugins/smooth-scrollbar.min.js"></script>

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
  <script type="text/javascript" src="${contextPath}/resources/js/solar_chart_index.js"></script>
</body>

</html>