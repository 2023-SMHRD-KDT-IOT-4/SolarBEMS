$(document).ready(function() {
	console.log('bems_device_mgmt');
	
	const controlDiv = $('#controlDiv');
	controlDiv.hide();

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
      // 
      
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
		sendToFlask();
  });


});


	// 제어전송 버튼 클릭. 디바이스 제어값  ==> Flask API
	const sendToFlask = () => {
	
		const userId = $('#userId').val();
		const pinId = $('#sendPinId').val(); 
		const powerStatus = $('#powerStatus').is(':checked') ? 1 : 0;
		const powerVal = $('#poewrVal').val();
		let sendData = {
	    "clientType": "web",
	    "clientId": userId,
			"control": {
				"pinId": pinId,
				"powerStatus": powerStatus,
				"powerVal": powerVal
			}
	}
	console.log(JSON.stringify(sendData));

	// 디바이스 제어 json Data ==> To Flask API 
  const apiIp = 'http://172.30.1.89:5000';
  $.ajax({
    type : 'POST',
    url : apiIp + '/api/device/control',
    contentType: 'application/json; charset=utf-8',
    data : JSON.stringify(sendData),
    dataType : 'json',
    success : data => {

 			console.log(data);

    },
    error : () => {
      alert('디바이스 제어 실패');
    }
  });
	
}// sendToFlask



	// 관리화면 > 테이블 row의 디바이스 제어 아이콘 클릭
	const controlDevice = (pinId, dvclName, dvcPowerName) => {
	
		$('#controlDiv').show(); // 디바이스 제어 div출력
		
		// 클릭한 디바이스 별 출력 세팅
		$('#deviceName').html(dvclName); // 디바이스 이름
		$('#powerType').html('(' + dvcPowerName +')'); // 파워설정값
		//$('#powerStatus') // 운전상태값
		
		$('#sendPinId').val(pinId);
	}

