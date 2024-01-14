<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid py-1 px-3">
  <!-- 페이지명 출력부
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
      <li class="breadcrumb-item text-sm text-dark active" aria-current="page">index</li>
    </ol>
    <h6 class="font-weight-bolder mb-0">index</h6>
  </nav>
  -->
  <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
    <div class="ms-md-auto pe-md-3 d-flex align-items-center">
    <!-- 
          검색      
        <div class="input-group input-group-outline">
          <label class="form-label">Type here...</label>
          <input type="text" class="form-control">
        </div>
        -->
    </div>
    <ul class="navbar-nav  justify-content-end">
      
      <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
        <a href="javascript:;" class="nav-link text-body p-2" id="iconNavbarSidenav">
          <div class="sidenav-toggler-inner">
            <i class="sidenav-toggler-line"></i>
            <i class="sidenav-toggler-line"></i>
            <i class="sidenav-toggler-line"></i>
          </div>
        </a>
      </li>
      <!-- 톱니바퀴 설정부분 -->
      <!-- <li class="nav-item px-3 d-flex align-items-center">
        <a href="javascript:;" class="nav-link text-body p-0">
          <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
        </a>
      </li> -->

		<c:if test="${empty sessionScope.user }">
      <li class="nav-item d-flex align-items-center mx-2">
        <a href="${contextPath}/user/login" class="nav-link text-body font-weight-bold px-0">
          <i class="fa fa-sign-in text-dark" aria-hidden="true"></i>
          <span class="d-sm-inline d-none">로그인</span>
        </a>
      </li>
      <li class="nav-item d-flex align-items-center mx-2">
        <a href="${contextPath}/user/join" class="nav-link text-body font-weight-bold px-0">
          <i class="fa fa-user-plus text-dark"></i>
          <span class="d-sm-inline d-none">회원가입</span>
        </a>
      </li>
		</c:if>
		
		<c:if test="${not empty sessionScope.user }">
      <li class="nav-item d-flex align-items-center mx-2 text-dark">
          <span class="d-sm-inline d-none">${sessionScope.user.userNick} 님</span>
      </li>
      <li class="nav-item d-flex align-items-center mx-2">
        <a href="${contextPath}/user/logout" class="nav-link text-body font-weight-bold px-0">
          <i class="fa fa-sign-in text-dark" aria-hidden="true"></i>
          <span class="d-sm-inline d-none">로그아웃</span>
        </a>
      </li>
      <li class="nav-item d-flex align-items-center mx-2">
        <a href="${contextPath}/user/user_update" class="nav-link text-body font-weight-bold px-0">
          <i class="fa fa-user-plus text-dark"></i>
          <span class="d-sm-inline d-none">회원정보</span>
        </a>
      </li>
		</c:if>
		
    </ul>
  </div>
</div>