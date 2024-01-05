
$(document).ready(function() {
	console.log('user js');
	
	// 로그인하기 버튼 클릭
	$('#loginBtn').click(function () {
		$("#loginForm").submit();
	});
	
	// 로그인 폼 제출
  $("#loginForm").submit(function(event) {
		let userId = $('#userId').val();
	  let userPw = $('#userPw').val();
	  
	  // id 미입력
	  if (userId == "") {
	  	$('#userId').focus();
	  	event.preventDefault();
	    return;
	  }
	  
	  // pw 미입력
	  if (userPw == "") {
	  	$('#userPw').focus();
	  	event.preventDefault();
	    return;
	  }
     
	});


});


