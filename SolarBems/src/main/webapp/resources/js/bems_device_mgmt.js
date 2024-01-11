$(document).ready(function() {
	const controlDiv = $('#controlDiv');
  let hostIndex = location.href.indexOf( location.host ) + location.host.length;
  let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
  		
  // 관리화면 >  연동해제 아이콘 클릭 시 모달창 출력
  $('#linkOffModal').on('show.bs.modal', e => {
    
    const dataset = e.relatedTarget.dataset;
    $('#linkOffLinkId').val(dataset.bsId); // 연동해제할 연동아이디
    $('#linkOffNo').val(dataset.bsNo); // 연동해제할 테이블 row 
    let dvclName = dataset.bsParam; // 연동해제할 디바이스 이름
    $('#linkOffModalBody').html('정말 ' + dvclName +' 연동해제 하시겠습니까?');
    
	});
  
  // 모달창 > 연동해제버튼 클릭 시 => 디바이스 연동해제
  $("#linkOffBtn").on("click", () => {

      let linkId = $('#linkOffLinkId').val();
      let linkOffNo = $('#linkOffNo').val();

      $.ajax({
		    type : 'GET',
		    url : './device_delete/' + linkId,
		    success : data => {

					if(data === 'fail') {
						alert('연동해제 실패');
						return;
					}
					// 연동해제한 디바이스 테이블 row 지우기
					$('#deviceTr'+linkOffNo).html('');
					// 모달 닫기
					$('#linkOffModal').modal('hide');
		
		    },
		    error : () => {
		      alert('연동해제 실패');
		    }
			});      
			
  });
  
  // 디바이스 제어 > 닫기 버튼 클릭
  $("#closeControlBtn").on("click", () => {
		controlDiv.hide();
  });
  
  // 디바이스 제어 > 제어전송 버튼 클릭 ==> Flask API 
  $('#controlExecuteBtn').on("click", () => {
  
		const userId = $('#userId').val();
		const arduId = $('#arduId').val();
		const pinId = $('#sendPinId').val(); 
		const dvcId = $('#clickDvcId').val(); 
		
		const powerStatus = $('#powerStatus').is(':checked') ? 1 : 0;
		let powerVal = $('#poewrValNum').val();
		
		if(dvcId === 'dvc003') { // aircon
			powerVal = $("#poewrValSelec option:selected").val();
			powerVal = isNaN(powerVal) ? 0 : powerVal;
		}
	
		const controlObj = {
      "pinId": pinId,
      "powerStatus": powerStatus,
      "powerVal": powerVal
	  }
	  console.log(controlObj);
	  // =====================================================
    let result = sendDeviceControl(userId, arduId, controlObj);
    console.log(result);
		if(!result) {
			alert('디바이스 제어 실패');
		}
    console.log(result);  

  }); // $('#controlExecuteBtn')

	// 관리화면 > 테이블 row의 디바이스 제어 아이콘 클릭
	$('.controlDevice').on('click', (e) => {
		let children = e.target.children;
		if(children[0].value == '' || children[0].value === undefined) {
			alert('해당 디바이스의 pinId가 존재하지 않습니다');
			return;
		}
		let pinId = children[0].value;
		let dvclName = children[1].value;
		let dvcPowerName = children[2].value;
		let dvcId = children[3].value;
		
		const regex = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
		let findId = children[0].id.replace(regex, "");
		
		let powerStatusVal = $('#powerStatusSpan'+findId).text();
		let powerVal = $('#powerValSpan'+findId).text();
		$('#clickPowerStatus').val(powerStatusVal);
		$('#clickPowerVal').val(powerVal);
		$('#clickDvcId').val(dvcId);
		
		controlDevice(pinId, dvclName, dvcPowerName, dvcId, contextPath);
});

	
}); // document

// ====================================================================


// 관리화면 > 테이블 row의 디바이스 제어 아이콘 클릭
const controlDevice = (pinId, dvclName, dvcPowerName, dvcId, contextPath) => {
	console.log(dvcId);
	
	if(dvcId == 'dvc001') { // 태양광 패널 => 전력 생산량 페이지 이동
		location.href = contextPath + '/bems/elect_generate_mgmt';
	}
	$('#poewrValNum').hide();
	$('#poewrValSelec').hide();
	
	$('#controlDiv').show(); // 디바이스 제어 div출력
	
	// 클릭한 디바이스 별 출력 세팅
	$('#deviceName').html(dvclName); // 디바이스 이름
	$('#powerType').html('설정값(' + dvcPowerName +')'); // 파워설정값
	// 운전상태값
	let clickPowerStatus = $('#clickPowerStatus').val();
	if(clickPowerStatus == 'ON') {
		$('#powerStatus').prop('checked', true);
	} else {
		$('#powerStatus').prop('checked', false);
	}	
	
	// 운전설정 값
	let powerVal = $('#clickPowerVal').val();
	if(dvcId == 'dvc002') { // led
		$('#poewrValNum').show();
		$('#poewrValNum').val(powerVal); 
	} else if(dvcId == 'dvc003') { // motor
		$('#poewrValSelec').show();
		
		if(powerVal >=0 && powerVal < 125) { // 강
				$("#poewrValSelec").val("50").prop("selected", true);
		} else if(powerVal >=125 && powerVal < 200) { // 중
				$("#poewrValSelec").val("125").prop("selected", true);
		} else if(powerVal > 200) { // 약
				$("#poewrValSelec").val("200").prop("selected", true);
		}
		
	}
	
	$('#sendPinId').val(pinId); // 제어전송 핀번호
}


// 테이블 내 연동된 디바이스 운전상태, 운전상태값
const makeTableBody = (dbList, datas) => {
  console.log(dbList);
  console.log(datas);
  
  
  $('#linkedDviceBody').html('');
  let tableTag = '';

  // db데이터
  $.each(dbList, (key,value) => {
    tableTag += '<tr class="bg-gray" id="deviceTr'+(key+1) +'">';
    
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal">'+(key+1) +'</span>';
    tableTag += '</td>';
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal">'+value.dvclName +'</span>';
    tableTag += '</td>';
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal">'+value.dvcTypeName +'</span>';
    tableTag += '</td>';
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span id="powerStatusSpan'+(key+1)+'"'+ ' class="text-dark text-md font-weight-normal"></span>';
    tableTag += '</td>';
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span id="powerValSpan'+(key+1)+'"'+ ' class="text-dark text-md font-weight-normal"></span>';
    tableTag += '</td>';
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal">'+value.dvclLoc +'</span>';
    tableTag += '</td>';
    // 제어
    tableTag += '<td class="align-middle text-center">';
  	tableTag += '<a class="btn btn-link text-info text-gradient px-1 mb-0 controlDevice">';
   	tableTag += '<input type="hidden" id="pinId'+(key+1) +'" value="'+value.pinId +'" >';
    tableTag += '<input type="hidden" id="dvclName'+(key+1) +'" value="'+value.dvclName +'" >';
    tableTag += '<input type="hidden" id="dvcPowerName'+(key+1) +'" value="'+value.dvcPowerName +'" >';
    tableTag += '<input type="hidden" id="dvcId'+(key+1) +'" value="'+value.dvcId +'" >';
    tableTag += '<i class="material-icons">settings_remote</i>디바이스 제어</a>';
    
    tableTag += '<a class="btn btn-link text-danger text-gradient px-1 mb-0 modalBtn"';
    tableTag += ' data-bs-toggle="modal" data-bs-target="#linkOffModal"';
    tableTag += ' data-bs-id="' + value.linkId + '" data-bs-param="'+value.dvclName+'"';
    tableTag += ' data-bs-no="'+ (key+1) + '"> <i class="material-icons">link_off</i>';
    tableTag += ' 연동해제</a>';
    
    tableTag += '<a class="btn btn-link text-dark px-1 mb-0" href="../bems/device_update/' + value.linkId +'">';
    tableTag += '<i class="material-icons">edit</i>수정</a>';
    tableTag += '</td>';
    tableTag += '</tr>';

  });
  $('#linkedDviceBody').html(tableTag);

	// 실시간 최종데이터 매핑 - 운전상태 , 운전값
  const devices = datas['device'];

  $.each(devices, (key,value) => {	
    let powerStatus = value['powerStatus'] == 1 ? 'ON' : 'OFF';
    let powerVal = value['powerVal'];
    let motorPowerVal = "";
    
		if(powerVal >=0 && powerVal < 125) { // 강
			motorPowerVal = "강";
		} else if(powerVal >=125 && powerVal < 200) { // 중
			motorPowerVal = "중";
		} else if(powerVal > 200) { // 약
			motorPowerVal = "약";
		}
    $('#powerStatusSpan'+(key+1)).html(powerStatus);
    $('#powerValSpan'+(key+1)).html(powerVal);
    if(value['dvcId'] === 'dvc003') {
    	$('#powerValSpan'+(key+1)).html(motorPowerVal);
    }
  });

}// makeTableData


  
