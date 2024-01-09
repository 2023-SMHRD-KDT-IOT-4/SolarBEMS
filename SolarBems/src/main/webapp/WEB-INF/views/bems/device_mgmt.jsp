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
    <div class="modal fade" id="linkOffModal" tabindex="-1" role="dialog" aria-labelledby="linkOffModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="linkOffModalLabel">디바이스 연동해제</h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="linkOffModalBody"></div>
          <div class="modal-footer">
            <button type="button" id="linkOffBtn" class="btn bg-gradient-primary">연동해제</button>
            <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Modal -->  

    <!-- Start Content -->
    <div class="container-fluid py-2">

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
                	<input type="hidden" id="userId" value="${sessionScope.user.userId}">
                	<input type="hidden" id="arduId" value="${sessionScope.user.arduId}">
                	<input type="hidden" id="linkOffLinkId" value="">
                	<input type="hidden" id="linkOffNo" value="">
                	
                	<c:choose>
                		<c:when test="${empty linkedList}">
	                    <h4 class="text-dark"> 연동 디바이스 없습니다.</h4>
                		</c:when>
                		
                		<c:otherwise>
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
		                    <tbody id="linkedDviceBody">
		
												<c:forEach items="${linkedList}" var="vo" varStatus="status">
		                      <tr class="bg-gray" id="deviceTr${status.count}">
		                        <td class="align-middle text-center">
		                          <span class="text-dark text-md font-weight-normal">${status.count}</span>
		                        </td>
		                        <td class="align-middle text-center">
		                          <span class="text-dark text-md font-weight-normal">${vo.dvclName}</span>
		                        </td>
		                        <td class="align-middle text-center text-sm">
		                          <span class="text-dark text-md font-weight-normal">LED</span>
		                        </td>
		                        <td class="align-middle text-center">
		                          <span class="text-dark text-md font-weight-normal">ON</span>
		                        </td>
		                        <td class="align-middle text-center">
		                          <span class="text-dark text-md font-weight-normal">${vo.dvclLoc}</span>
		                        </td>
		                        <td>
		                          <a class="btn btn-link text-info text-gradient px-1 mb-0"
		                          	onclick="javascript:controlDevice('${vo.pinId}','${vo.dvclName}', '${vo.dvcPowerName}')">
		                            <i class="material-icons">settings_remote</i>
		                            디바이스 제어
		                          </a>
		                          <a class="btn btn-link text-danger text-gradient px-1 mb-0 modalBtn" 
		                          	data-bs-toggle="modal" data-bs-target="#linkOffModal" 
		                          	data-bs-id="${vo.linkId}" data-bs-param="${vo.dvclName}"
		                          	data-bs-no="${status.count}">
		                            <i class="material-icons">link_off</i>
		                            연동해제
		                          </a>
		                          <a class="btn btn-link text-dark px-1 mb-0" href="${contextPath}/bems/device_update/${vo.linkId}">
		                            <i class="material-icons">edit</i>
		                            수정
		                          </a>
		
		                        </td>
		                      </tr>
												</c:forEach>
		                    </tbody>
		                    
		                  </table>                		
                		</c:otherwise>
                	</c:choose>
                  
                </div><!-- End <div class="table-responsive"> -->
              </div><!-- End card -->
            </div><!-- End card-body -->

          </div><!-- cardDiv -->
        </div><!-- End col9 디바이스 리스트 -->

        <!-- 선택한 디바이스 제어 -->
        <div class="col-md-3" id="controlDiv" style="display: none;">
          <div class="card mb-4">

            <div class="card-header pb-2 px-3 bg-gray-200">
              <div class="row">
                <div class="col-md-8">
                  <h6>디바이스 제어</h6>
                </div>
                <div class="col-md-4 d-flex justify-content-start justify-content-md-end align-items-center">
                  <button type="button" id="closeControlBtn" class="btn bg-gradient-dark btn-sm">닫기</button>
                </div>
                </div>
              </div>

            <!-- 제어 바디 -->
            <div class="card-body p-3 ">
              <h6 id="deviceName" class="text-uppercase text-body text-md font-weight-bolder mb-3">
              </h6>
              <form>
                <div class="row">
                  <div class="col-md-5 d-flex justify-content-center align-items-center mt-3">
                  	<input type="hidden" id="sendPinId" value="" />
                  	<input type="hidden" id="sendPowerStatus" value="" />
                    <!-- 운전상태 토글 -->
                   <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="powerStatus" checked="false">
                     <label class="form-check-label" for="powerStatus">운전OFF/ON</label>
                   </div>
                  </div>
                  <!-- 설정값 -->
                  <div class="col-md-7 d-flex justify-content-center ">
                    <div class="input-group input-group-static w-60">
                      <label >설정값</label>
                      <label id="powerType"></label>
                      <input type="number" class="form-control" id="poewrVal" value="20"><!-- disabled -->
                    </div>
                  </div>
                </div>

              <div class="row">
                <div class="col d-flex justify-content-center mt-4">
                  <button type="button" id="controlExecuteBtn" class="btn bg-gradient-info w-70">제어 전송</button>
                </div>
              </div>
            </form>

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
  <script src="${contextPath}/resources/js/common_api.js"></script>
	<script src="${contextPath}/resources/js/bems_device_mgmt.js"></script>

  </body>
</html>
