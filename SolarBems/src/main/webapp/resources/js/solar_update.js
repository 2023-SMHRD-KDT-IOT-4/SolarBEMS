let idCheck = 0;
let pwcheck = false;

// 비밀번호 체크
$('#userPw1, #userPw2').keyup( () => {
    const userPw1 = $('#userPw1');
    const userPw2 = $('#userPw2');
    const minLen = 4;
    
    if(userPw1.val().length >= minLen) {
        $('#userPwDiv1').addClass("is-valid");
    } else {
        $('#userPwDiv1').removeClass("is-valid");
    }
    if(userPw2.val().length > 0 && userPw1.val() != userPw2.val()) {
        $('#userPwDiv2').addClass("is-invalid");
        pwcheck = false;
    } 

    // 비밀번호 모두 일치
    if(userPw1.val() === userPw2.val() ) {
        $('#userPwDiv1').addClass("is-valid");
        $('#userPwDiv2').addClass("is-valid");
        $('#userPwDiv1').removeClass("is-invalid");
        $('#userPwDiv2').removeClass("is-invalid");
        pwcheck = true;
    } else {
      pwcheck = false;
    }
    
});



const checkInput = () => {  // 회원가입 형식 체크하고 전송
    const userId = $('#userId');
    const userPw1 = $('#userPw1');
    const userPw2 = $('#userPw2');
    const minLen = 4;
    const userNick = $('#userNick');
    const buildingName = $('#buildingName');
    const arduId = $('#arduId');

    if(userId.val() == ''){
        userId.focus();
        return false;
    }
    if(userPw1.val() == '' || userPw1.val().length < minLen){
      userPw1.focus();
      return false;
    }
    if(userPw2.val() == '' || userPw2.val().length < minLen){
      userPw2.focus();
      return false;
    }
    if(userNick.val() == ''){
      userNick.focus();
        return false;
    }
    if(buildingName.val() == ''){
      buildingName.focus();
        return false;
    }
    if(arduId.val() == ''){
      arduId.focus();
        return false;
    }
    
    if(pwcheck) {
    	$('#updateForm').submit();
  	}

}

