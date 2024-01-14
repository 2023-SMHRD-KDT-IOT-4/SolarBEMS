$(document).ready(function() {
	
	const toastTrigger = $('.controlExecuteBtn'); // 제어 전송버튼
	const toastLive = $('#successToastCtr');
	if (toastTrigger) {
  	const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLive)
  	toastTrigger.on('click', (e) => {
	  	setTimeout(function () {
        const clickBtn = e.target;
        let clickId = clickBtn.id;
        const regex = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
        let findId = clickId.replace(regex, "");


			  toastBootstrap.show();
				// 제어전송 버튼 spinner 해제
				applySpinnerBtn('controlExecuteBtn'+findId, '제어전송', false);
			}, 1500);
	  });
	}  
			
  
  // 디바이스 제어 > 제어전송 버튼 클릭 ==> Flask API 
  $('.controlExecuteBtn').on("click", (e) => {

  	const clickBtn = e.target;
    let clickId = clickBtn.id;
    let clickDvcId = clickBtn.getAttribute('data');
  	const regex = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
    let findId = clickId.replace(regex, "");
    const pinId = findId; 

  	// 제어전송 버튼 spinner 처리
  	applySpinnerBtn('controlExecuteBtn'+pinId, '제어전송', true);
		const userId = $('#userId').val();
		const arduId = $('#arduId').val();
		const dvcId = clickDvcId; 
		const powerStatus = $('#powerStatus'+pinId).is(':checked') ? 1 : 0;
		let powerVal = $('#poewrValNum'+pinId).val();
		$('#clickPowerStatus').val(powerStatus);
		$('#clickPowerVal').val(powerVal);

		if(dvcId === 'dvc003') { // motor
      let selecId = '#poewrValSelec'+pinId;
			powerVal = $(selecId+ " option:selected").val();
			powerVal = isNaN(powerVal) ? 0 : powerVal;
		}
	
		const controlObj = {
      "pinId": pinId,
      "powerStatus": powerStatus,
      "powerVal": powerVal
	  }

    let result = sendDeviceControl(userId, arduId, controlObj);

    // 테이블 리스트 내 운전상태, 운전값 변경
    let tdPowerStatus = viewPowerStatus(pinId, powerStatus);
    $('#powerStatusSpan'+pinId).html(tdPowerStatus);


    
    let tdPowerVal = powerVal;
    if(dvcId === 'dvc003') { // motor
			tdPowerVal = getMotorPowerValName(powerVal);
		}
    $('#powerValSpan'+pinId).html('운전값:'+ tdPowerVal);
    $('#realValSpan'+pinId).val(powerVal);

    if(!result) {
      alert('디바이스 제어 실패');
    } 
		 

  }); // $('#controlExecuteBtn')

	
}); // End document
// ====================================================================



// linkedDvcList Div 내 연동된 디바이스 컴포넌트 
const makeLinkedDvcObj = (dbList, datas) => {
  
  $('#linkedDvcList').html('');
  let tableTag = '';

  // db데이터
  $.each(dbList, (key,value) => {
    const pinId = value.pinId;
    let dvcIcon = '';
    let dvcPowerName = '';

    if(value.dvcId == 'dvc002'){
      dvcIcon = 'lightbulb';
      dvcPowerName = '(밝기)';
    }else if(value.dvcId == 'dvc003'){
      dvcIcon = 'wind_power';
      dvcPowerName = '(세기)';
    }
    const dvclName = value.dvclName;
    const powerStatus = value.powerStatus;
   
    // linkedDvcObj id
    tableTag += '<div class="col-md-6 mt-2" id="linkedDvcObj'+pinId +'">';
    tableTag += '<div class="d-flex flex-column"><div class="card mb-1">'
    // card-header 디바이스 아이콘, 이름, 운전값
    tableTag += '<div class="card-header p-2 bg-gray-200 ">';
    tableTag += '<div class="row"><div class="" class="align-items-center justify-content-center">';
    // icon
    tableTag += '<span class="material-icons md-36" id="dvcIcon'+pinId+'">'+dvcIcon+'</span>';
    // dvc name
    tableTag += '<span class="mb-1 text-md text-dark font-weight-bold" id="dvcName">';
    tableTag += dvclName + '</span><br>';
    // powerStatus
    tableTag += '<input type="hidden" id="clickPowerStatus'+pinId +'" value="'+value.pinId +'" >';
    tableTag += '<input type="hidden" id="powerStatusSpan'+pinId +'" value="0" >';
    tableTag += '<input type="hidden" id="clickPowerVal'+pinId +'" value="'+value.pinId +'" >';
    tableTag += '<input type="hidden" id="realValSpan'+pinId +'" value="'+value.pinId +'" >';
    tableTag += '<span class="text-dark font-weight-bold ms-sm-2" id="powerValSpan'+pinId+'"></span>';
    tableTag += '</div></div></div>';

    // 제어바디
    tableTag += '<form><div class="card-body py-0 mt-0 px-3" id="dvcCtrDiv'+pinId+'">';
    tableTag += '<div class="row"><div class="col-md-5 d-flex justify-content-center align-items-center mt-3">';
    //<!-- 운전상태 토글 -->
    tableTag += '<div class="form-check form-switch">';
    tableTag += '<input class="form-check-input" type="checkbox" id="powerStatus'+pinId+'">';
    tableTag += '<label class="form-check-label" for="powerStatus">운전OFF/ON</label>';
    tableTag += '</div></div>';
    // <!-- 설정값 -->
    tableTag += '<div class="col-md-7 d-flex justify-content-center align-items-center">';
    tableTag += '<div class="input-group input-group-static w-60">';
    tableTag += '<label id="powerType" class="ms-0" >운전설정값'+dvcPowerName+'</label>';

    // <!-- 운전설정 수치 -->
    if(value.dvcId == 'dvc002'){ // led
      tableTag += '<input type="number" class="form-control" id="poewrValNum'+pinId+'" name="pwerVal" value="">';
    }else if(value.dvcId == 'dvc003'){ // motor
     tableTag += '<select id="poewrValSelec'+pinId+'" class="poewrValSelec" name="pwerVal" class="form-control" >';
     tableTag += '<option value="50">강</option><option value="130">중</option><option value="180">약</option>';
     tableTag += '</select>';
     tableTag += '';
    }

    tableTag += '</div></div></div>'; // body row
    tableTag += '<div class="row">';
    tableTag += '<div class="col d-flex justify-content-center mt-1">';
    tableTag += '<button type="button" id="controlExecuteBtn'+pinId+'" class="controlExecuteBtn btn bg-gradient-info w-70" data='+value.dvcId+'>제어 전송</button>';
    
    tableTag += '</div></div></div></form>';
    // <!-- End <div class="col-md-6 mt-2" id="linkedDvcObj"> -->
    tableTag += '</div></div></div>';/* card  form linkedDvcObj*/

  });
  $('#linkedDvcList').html(tableTag);

  	
// 실시간 최종데이터 매핑 - 운전상태 , 운전값
    const devices = datas['device'];

    $.each(devices, (key,value) => {	
      const apiPinId = value.pinId;
  
      const powerStatus = value['powerStatus'];
      viewPowerStatus(apiPinId, value['powerStatus']);
      $('#powerStatusSpan'+apiPinId).val(value['powerStatus']);

      if(powerStatus == 1) {
        $('#powerStatus'+apiPinId).prop('checked', true);
      } else {
        $('#powerStatus'+apiPinId).prop('checked', false);
      }	


      let powerVal = value['powerVal'];
      $('#powerValSpan'+apiPinId).html('운전값:'+ powerVal);
      $('#realValSpan'+apiPinId).val(powerVal);
      $('#poewrValNum'+apiPinId).val(powerVal);
      
        if(powerVal >=0 && powerVal < 130) { // 강
				$("#poewrValSelec"+apiPinId).val("50").prop("selected", true);
      } else if(powerVal >=130 && powerVal < 180) { // 중
				$("#poewrValSelec"+apiPinId).val("130").prop("selected", true);
      } else if(powerVal >= 180) { // 약
				$("#poewrValSelec"+apiPinId).val("180").prop("selected", true);
      }
      
      let motorPowerVal = getMotorPowerValName(powerVal);
      if(value['dvcId'] === 'dvc003') {
        $('#powerValSpan'+apiPinId).html('운전값:'+motorPowerVal);
      }

      
      
    });// $.each

 
 
}// makeTableData

const viewPowerStatus = (pinId, powerStatus) => {
  const $dvcIcon = $('#dvcIcon'+pinId);
  if(powerStatus == 1) {
    $dvcIcon.removeClass('md-off').addClass('md-on');
  } else {
    $dvcIcon.removeClass('md-on').addClass('md-off');
  }
}


const getMotorPowerValName = powerVal =>  {
  let motorPowerValName = "";
  if(powerVal >=0 && powerVal < 130) { // 강 50
    motorPowerValName = "강";
  } else if(powerVal >=130 && powerVal < 180) { // 중130
    motorPowerValName = "중";
  } else if(powerVal >= 180) { // 약:180
    motorPowerValName = "약";
  }
  return motorPowerValName;
}

  
