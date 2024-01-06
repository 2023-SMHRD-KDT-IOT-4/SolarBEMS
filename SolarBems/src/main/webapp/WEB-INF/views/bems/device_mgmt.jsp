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

    <!-- 연동해제 Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="exampleModalLabel">디바이스 연동해제</h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            정말 디바이스 별칭1을 연동해제 하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn bg-gradient-primary">연동해제</button>
            <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Modal -->  

    <!-- Start Content -->
    <div class="container-fluid py-2">
      <div class="row">
        <div class="col-lg-7 position-relative z-index-2">
          <div class="card card-plain mb-1">
            <div class="card-body p-0">
              <h3 class="font-weight-bolder">디바이스 관리</h3>
            </div>
          </div> <!-- End card  -->
        </div>
      </div><!-- End row -->

      <!--  디바이스 리스트 , 디바이스제어 -->
      <div class="row" >
        <!-- 디바이스 리스트 -->
        <div class="col-md-9">
          <div class="card ">

            <div class="card-header pb-2 px-3 bg-gray-200">
              <div class="row">
                <!--  -->
                <div class="col-md-7">
                  <h6 class="pt-2">연동 디바이스(3개)</h6>
                </div>
                <!--  -->
                <div class="col-md-5 d-flex justify-content-start justify-content-md-end align-items-center">
                  <a href="${contextPath}/bems/device_link">
                    <button type="button" class="btn btn-primary">디바이스 연동</button>
                  </a>
                </div>
              </div>
            </div><!-- End card-header -->
            
            <div class="card-body p-4 ">
              <div class="card">
                <div class="table-responsive">
                  <table class="table table-hover align-items-center mb-0 text-danger">
                    <thead >
                      <tr style="border-width:1px; border-color: rgb(128, 128, 128); background-color: rgb(66, 139, 202);">
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">No</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">디바이스 이름</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">타입</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">운전상태</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">설치위치</th>
                        <th class="text-center text-uppercase text-white text-md font-weight-bolder">디바이스 제어</th>
                      </tr>
                    </thead>
                    <tbody>

                      <tr class="bg-gray">
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
                          <a class="btn btn-link text-danger text-gradient px-1 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-param="1">
                            <i class="material-icons">link_off</i>
                            연동해제
                          </a>
                          <a class="btn btn-link text-dark px-1 mb-0" href="${contextPath}/bems/device_update">
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
                          <a class="btn btn-link text-dark px-1 mb-0" href="${contextPath}/bems/device_update">
                            <i class="material-icons">edit</i>
                            수정
                          </a>

                        </td>
                      </tr>

                      <tr class="">
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">3</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">디바이스 별칭3</span>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <span class="text-dark text-md font-weight-normal">냉난방기</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">ON</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-dark text-md font-weight-normal">회의실</span>
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
                          <a class="btn btn-link text-dark px-1 mb-0" href="${contextPath}/bems/device_update">
                            <i class="material-icons">edit</i>
                            수정
                          </a>

                        </td>
                      </tr>

              
                    </tbody>
                  </table>
                </div>
              </div><!-- card -->
            </div><!-- card-body -->

          </div><!-- cardDiv -->
        </div><!-- End col8 디바이스 리스트 -->

        <!-- 선택한 디바이스 제어 -->
        <div class="col-md-3 ">
          <div class="card mb-4">

            <div class="card-header pb-0 px-3 bg-gray-200">
              <div class="row">
                <div class="col-md-8">
                  <h6>디바이스 제어</h6>
                </div>
                <div class="col-md-4 d-flex justify-content-start justify-content-md-end align-items-center">
                  <button type="button" class="btn bg-gradient-dark btn-sm">닫기</button>
                </div>
                </div>
              </div>

            <!-- 제어 바디 -->
            <div class="card-body p-3 ">
              <h6 class="text-uppercase text-body text-md font-weight-bolder mb-3">디바이스 별칭1</h6>
              
              <form>
                <div class="row">

                  <div class="col-md-5 d-flex justify-content-center align-items-center mt-3">
                    <!-- 운전상태 토글 -->
                   <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" checked="">
                     <label class="form-check-label" for="flexSwitchCheckDefault">운전OFF/ON</label>
                   </div>
                  </div>
                  <!-- 설정값 -->
                  <div class="col-md-7 d-flex justify-content-center ">
                    <div class="input-group input-group-static w-50">
                      <label >설정값</label>
                      <input type="number" class="form-control" value="20"><!-- disabled -->
                    </div>
                  </div>
                </div>

              <div class="row">
                <div class="col d-flex justify-content-center mt-4">
                  <button type="button" class="btn bg-gradient-info w-70">제어 전송</button>
                </div>
              </div>
            </form>
            
            <!-- 디바이스 제어 성공유무 알림창 -->

            <div class="alert alert-success alert-dismissible text-white fade show m-3" role="alert">
              <span class="alert-text"><strong>성공</strong><br>디바이스 제어에 성공했습니다.</span>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="alert alert-danger alert-dismissible text-white fade show m-3" role="alert">
                <span class="alert-text"><strong>실패</strong><br>디바이스 제어에 실패했습니다.</span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            </div><!-- 제어 바디 -->
          </div>
        </div> <!-- End col4선택한 디바이스 제어 -->


      </div><!-- End row 디바이스 리스트8 , 디바이스 제어4 -->

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
