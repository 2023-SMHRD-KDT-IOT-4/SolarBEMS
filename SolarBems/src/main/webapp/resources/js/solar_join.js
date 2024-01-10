let idCheck = 0;
let pwcheck = false;

// 비밀번호 체크
$('#userPw1, #userPw2').keyup( () => {
    const userPw1 = $('#userPw1');
    const userPw2 = $('#userPw2');
    const minLen = 4;
    console.log(userPw1.val().length);

    if(userPw1.val().length >= minLen) {
        $('#userPwDiv1').addClass("is-valid");
    } else {
        $('#userPwDiv1').removeClass("is-valid");
    }
    if(userPw2.val().length > 0 && userPw1.val() != userPw2.val()) {
        $('#userPwDiv2').addClass("is-invalid");
    } 

    // 비밀번호 모두 일치
    if(userPw1.val() === userPw2.val()) {
        $('#userPwDiv1').addClass("is-valid");
        $('#userPwDiv2').addClass("is-valid");
        $('#userPwDiv1').removeClass("is-invalid");
        $('#userPwDiv2').removeClass("is-invalid");
        pwcheck = true;
    }
    // $(this).addClass("class_name");$(this).removeClass("class_name");
});

// pw1, pw2 체크하는 부분
// const checkPw = () => {
//     const userPw1 = $('#userPw1');
//     const userPw2 = $('#userPw2');

//     console.log(userPw1.val());
//     console.log(userPw2.val());
// }


const sendIt = () => {  // 회원가입 형식 체크하고 전송
    const userId = $('#userId');
    console.log(userId.val());
    // const userPw = document.joinForm.userPw;
    // const userPwCheck = document.joinForm.userpwcheck;
    // const userNick = document.joinForm.userNick;
    // const userBuild = document.joinForm.userBuild;
    // const userRoom = document.joinForm.userRoom;

    if(userId.val() == ''){
        alert("ID를 입력해 주십시오");
        userId.focus();
        return false;
    }

		

    // if(userNick.value == ''){
    //     alert("닉네임을 입력해 주십시오");
    //     userName.focus();
    //     return false;
    // }

    // if(userBuild.value == ''){
    //     alert("빌딩 이름을 입력해 주십시오");
    //     userName.focus();
    //     return false;
    // }

    // if(userRoom.value == ''){
    //     alert("방 갯수를 입력해 주십시오");
    //     userName.focus();
    //     return false;
    // }
    
    
    

}

const checkId = () => { // 사용자 아이디 중복 체크
    const userId = document.joinForm.userId;
    const result = document.querySelector('#result');

    if(userId.value == ''){
        alert("Please enter your ID!!!");
        userId.focus();
        return false;
    }
        
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () =>{
        if(xhr.readyState == XMLHttpRequest.DONE){
            if(xhr.status == 200){
                let txt = xhr.responseText.trim();
                if(txt == "O") {
	            idCheck = 1;
                    result.style.display = "block";
                    result.style.color = "green";
                    result.innerHTML ="&nbsp;&nbsp;&nbsp;The ID can be used!!";
                } else {
                    result.style.display = "block";
                    result.style.color = "red";
                    result.innerHTML = "&nbsp;&nbsp;&nbsp;This is a duplicate ID!!";
                    userId.focus();
                    userId.addEventListener("keydown", function(){
                        result.style.display = "none";
                    });
                }
            }
        }
    }
    xhr.open("GET", "checkid_ok.php?userId="+userId.value, true);
    xhr.send();

    $('.id_input').on("propertychange change keyup paste input", function(){

        console.log("keyup 테스트");	
    
    });
}

