<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
  
  <!-- 회원정보 Modal - 비밀번호 체크 Button trigger modal -->
  <!-- <button type="button" class="btn bg-gradient-info btn-block" data-bs-toggle="modal" data-bs-target="#userPwCheckModal">
    회원정보 Pw Check Modal
  </button> -->

  <!-- Start Modal -->
  <div class="modal fade" id="userPwCheckModal" tabindex="-1" role="dialog" aria-labelledby="userPwCheckModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">

        <div class="modal-header">
          <h6 class="modal-title font-weight-weight" id="modal-title-default">회원정보</h6>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body p-0">
          <div class="card card-plain">

            <div class="card-header pb-0 text-left">
                <p class="mb-0 text-dark">가입 시 비밀번호를 입력해주세요</p>
            </div>

            <div class="card-body py-1">
              <form role="form text-left">
                <div class="input-group input-group-dynamic my-3">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn bg-gradient-primary">입력완료</button>
              <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">취소</button>
            </div>
            <!-- <div class="card-footer text-center pt-0 px-sm-4 px-1">
              <p class="mb-4 mx-auto">
                Already have an account?
                <a href="javascrpt:;" class="text-primary text-gradient font-weight-bold">Sign in</a>
              </p>
            </div> -->

          </div>
        </div>
      </div><!-- End modal-content -->
    </div><!-- End modal-dialog -->
  </div><!-- End Modal -->

  <!-- sidenav header -->
  <div class="sidenav-header">
    <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
    <a class="navbar-brand m-0" href="${contextPath}/">
      <!-- <img src="./assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo"> -->
      <i class="fa fa-light fa-sun text-white" aria-hidden="true"></i>
      <span class="ms-1 font-weight-bold text-white">Solar BEMS</span>
    </a>
  </div>
  <hr class="horizontal light mt-0 mb-2">
  
  <!-- sidenav menu list -->
  <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
    <ul class="navbar-nav">
      <li class="nav-item mt-3">
        <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
          BEMS
        </h6>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white " href="${contextPath}/bems/elect_dashboard">
          <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
            <i class="material-icons opacity-10"> laptop_chromebook</i>
          </div>
          <span class="nav-link-text ms-1">전력 Dashboard</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link text-white " href="${contextPath}/bems/elect_prod_mgmt">
          <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
            <i class="material-icons opacity-10">battery_charging_full</i>
          </div>
          <span class="nav-link-text ms-1">전력 생산량 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link text-white " href="${contextPath}/bems/device_mgmt">
          <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
            <i class="material-icons opacity-10">settings_remote</i>
          </div>
          <span class="nav-link-text ms-1">디바이스 제어 및 관리</span>
        </a>
      </li>

      <!-- user관련 -->
      <hr class="horizontal light mt-0 mb-2">
      <li class="nav-item mt-3">
        <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
          회원 메뉴
        </h6>
      </li>
      
      <c:if test="${empty sessionScope.user }">
	      <li class="nav-item">
	        <a class="nav-link text-white " href="${contextPath}/user/login">
	          
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">login</i>
	            </div>
	          
	          <span class="nav-link-text ms-1">로그인</span>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white " href="${contextPath}/user/join">
	          
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">assignment</i>
	            </div>
	          
	          <span class="nav-link-text ms-1">회원가입</span>
	        </a>
	      </li>  
      </c:if>
      
      <c:if test="${!empty sessionScope.user }">
 	      <li class="nav-item">
	        <a class="nav-link text-white " href="${contextPath}/user/logout">
	          
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">logout</i>
	            </div>
	          
	          <span class="nav-link-text ms-1">로그아웃</span>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white " href="${contextPath}/user/user_update">
	          
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">person</i>
	            </div>
	          
	          <span class="nav-link-text ms-1">회원정보</span>
	        </a>
	      </li>
    	</c:if>
    	
    </ul>
  </div>