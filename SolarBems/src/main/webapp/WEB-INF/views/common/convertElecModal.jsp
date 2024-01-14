<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- 전력제어 전환 Modal -->
    <div class="modal fade" id="converModal" tabindex="-1" role="dialog" aria-labelledby="converModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="converModalLabel">전력제어 전환</h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span class="fas fa-times text-md d-flex justify-content-center" aria-hidden="true"></span>
            </button>
          </div>
          <div class="modal-body" id="convertElecModalBody"></div>
          <div class="modal-footer">
            <button type="button" id="converBtn" class="btn bg-gradient-primary">전환하기</button>
            <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Modal -->