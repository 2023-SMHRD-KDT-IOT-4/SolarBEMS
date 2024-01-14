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
  <link rel="stylesheet" href="${contextPath}/resources/css/solar.css">
</head>

<body class="g-sidenav-show bg-gray-100">

  <aside id="sidenav-main" class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark">
  	<jsp:include page="../common/sidenav.jsp" />
  </aside>

  <main class="main-content border-radius-lg ">

    <nav id="topnav" class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" data-scroll="true">
    	<jsp:include page="../common/topnav.jsp" />
    </nav>
		<!-- 전력제어 전환 Modal -->
		<jsp:include page="../common/convertElecModal.jsp" />
    
    <!-- Start container -->
    <div class="container-fluid py-2">
     	<input type="hidden" id="userId" value="${sessionScope.user.userId}">
     	<input type="hidden" id="arduId" value="${sessionScope.user.arduId}">

      <!--  Start row 1,2 -->
      <div class="row">
      	<!-- 조회기준 디바이스별 전력소비량 차트 -->
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart1" class="w-100" style="height: 400px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->


				<!-- Toast -->    
		    <div class="position-fixed start-50 bottom-50 z-index-2">
		      <div class="toast" id="successToastCtr" role="alert" 
		      			aria-live="assertive" aria-atomic="true" 
		      			data-bs-delay="1500">
		        <div class="toast-header">
		        <i class="material-icons text-success me-2">check</i>
		          <strong class="me-auto" id="toast-header">디바이스 제어</strong>
		          <!-- <small>11 mins ago</small> -->
		          <i class="fas fa-times text-md ms-3 cursor-pointer" data-bs-dismiss="toast" aria-label="Close" aria-hidden="true"></i>
		        </div>
		        <div class="toast-body">제어 성공</div>
		      </div><!-- End Toast  -->
		    </div><!--End position Toast -->
		    
        <!-- 연동 디바이스 시작영역 -->
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header py-0 px-3 mt-2">
              <!-- <h6 class="mb-0">연동 디바이스</h6> -->
            </div>
            <div class="card-body px-4 py-0 pb-2">
              <!-- start 디바이스 리스트 영역 -->
              <div class="row" id="linkedDvcList"> <!-- 아이콘, 이름, 운전값 / 운전토글, 값선택, 버튼 -->
              </div><!-- End <div class="row" id="linkedDvcList"> -->

            </div>
          </div>
        </div><!-- End 연동 디바이스 시작영역 -->
       
      </div><!-- End row 1,2 -->

    </div> <!-- End container-fluid py-2 -->

    <!-- Start container -->
    <div class="container-fluid py-2">

      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header pb-2 px-3 ">
              <div id="chart3" class="w-100" style="height: 400px;"></div>
            </div><!-- End card-header -->
          </div><!-- <div class="card"> -->
        </div> <!-- End  -->

				<!-- 전력 생산량 관리 -->
        <div class="col-lg-6">
			 		<!-- Toast -->    
			    <div class="position-fixed bottom-0 end-0 z-index-2">
			      <div class="toast" id="successToast" role="alert" 
			      			aria-live="assertive" aria-atomic="true" 
			      			data-bs-delay="1500">
			      			<!-- data-bs-delay="1500"> -->
			        <div class="toast-header">
			        <i class="material-icons text-success me-2">check</i>
			          <strong class="me-auto" id="toast-header">전력제어 전환</strong>
			          <!-- <small>11 mins ago</small> -->
			          <i class="fas fa-times text-md ms-3 cursor-pointer" data-bs-dismiss="toast" aria-label="Close" aria-hidden="true"></i>
			        </div>
			        <div class="toast-body">제어 성공</div>
			      </div><!-- End Toast  -->
			    </div><!--End position Toast -->
			            
          <div class="card">
          	<jsp:include page="../common/generateMgmtBody.jsp" />
           </div><!-- card -->
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
  <script src="${contextPath}/resources/js/common_api.js"></script>
  <script src="${contextPath}/resources/js/common_bems.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			const userId = $('#userId').val();
			const arduId = $('#arduId').val();
			
			let dbList = '<c:out value="${linkedList}" escapeXml="false"/>';
			dbList = dbList.replaceAll('&#34;', '\"');
			dbList = JSON.parse(dbList);
			if(dbList == [] || dbList == '[]') {
				dbList = [];
			}
			
			// 페이지 로딩시 (db리스트,  연동된 디바이스 json list From Flask API)
		  let result = getLinkedDeviceList(userId, arduId);
		  const usedDbList = dbList.filter( dvc => dvc.dvcElecCode == 'u');
			makeLinkedDvcObj(usedDbList, result); // 소비 디바이스 리스트
			
			getRealTimeDeviceConsume('chart1', result, dbList); // 조회기준 디바이스별 전력소비량 차트
			getMonthlyTotalProdCons('chart3'); // 월별 총 전력 생산,소비 비교 차트
		});
	  
	</script>  
  <script src="${contextPath}/resources/js/solar_chart.js"></script>
  <script src="${contextPath}/resources/js/bems_generate_mgmt.js"></script>
  <script src="${contextPath}/resources/js/bems_elec_dashboard.js"></script>
  
  
  </body>
</html>