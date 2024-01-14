<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- 전력 생산량 관리 - 카드_바디 -->
	<div class="card-body px-4 pb-1">
	  <div class="d-flex justify-content-center align-items-center">
	    <h4 class="text-dark" id="elecStatusH4">전력제어 상태 : </h4>
	  </div>
	  <hr class="dark horizontal my-1">
	  <div class="row">
	    <!-- 배터리 잔량 표시 -->
	    <div class="col-md-6 d-flex justify-content-center align-items-center mb-3 ">
	      
	      <!-- prgoress-bar 클래스에 bg-gradient-success => bg-gradient-warning => bg-gradient-danger -->
	      <!--  prgoress-bar 스타일 width 값 조정 -->
	      <div class="progress-wrapper">
	        <div class="progress-info">
	          <div class="progress-percentage">
	            <span class="text-sm font-weight-normal" id="remainBatteryAmount">태양광 배터리 잔량 : </span>
	          </div>
	        </div>
	        <div class="progress" style="height: 20px;">
	          <div class="progress-bar" id="remainBatteryBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 90%; height: 20px;"></div>
	        </div>
	      </div>
	
	    </div><!-- col end -->
	
	    <div class="col-md-6 d-flex justify-content-center align-items-center ps-4">
	      <form>
	      	<input type="hidden" id="sendPinId" value="">
	      	<input type="hidden" id="userId" value="${sessionScope.user.userId}">
	      	<input type="hidden" id="arduId" value="${sessionScope.user.arduId}" />
	        <h6>전력제어 상태 전환</h6>
	        <!-- 전기 사용상태 토글 -->
	        <div class="togglebutton form-check form-switch">
	          <!-- disabled -->
	          <input class="form-check-input" type="checkbox" id="elecStatusCheckbox" checked>
	          <label class="form-check-label" for="elecStatusCheckbox">배터리전기 / 일반전기</label>
	        </div>
	      </form>
	    </div>
	
	  </div><!-- end row -->
	
	  <hr class="dark horizontal my-1">
	
	   <div class="card-footer d-flex justify-content-center align-items-center pb-0 pt-3">
	       <button id="converModal" type="button" class="btn bg-gradient-primary w-50" data-bs-toggle="modal" data-bs-target="#converModal" data-bs-param="1">
	         전력제어 전환
	       </button>
	    </div>
	  </div><!-- card-body -->