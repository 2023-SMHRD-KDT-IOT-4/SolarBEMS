$(document).ready(function() {
	console.log('bems_generate_mgmt');
	
	// 페이지 로딩시 전력 생산량 및 제어상태 정보(json data) From Flask API
	getElecGenerate();
	
  // 모달창 > 전환버튼 클릭 시 => 전력전환
  $("#converBtn").on("click", () => {
		let elecStatus = $('#elecStatusCheckbox').is(":checked") ? 1 : 0;
		sendToFlask(elecStatus);
  });


});


// 전력 생산량 및 제어상태 정보(json data)t From Flask API
const getElecGenerate = () => {
  const apiIp = 'http://172.30.1.89:5000';

  $.ajax({
    type : 'POST',
    url : apiIp + '/api/device/linked',
    dataType : 'json',
    success : data => {
      if(Object.keys(data.device).length === 0) {
      	alert('연동정보가 없습니다');
      	return;
      }
      const dvcList = data.device;
      const deviceLen = dvcList != null ? Object.keys(dvcList).length : 0;

      // 필터 태양광패널만
      const solarList = dvcList.filter( dvc => dvc.dvcId == 'dvc001');
			const solarObj = Object.assign({}, solarList)[0];
			$('#sendPinId').val(solarObj.pinId);
			console.log(solarObj);
			

			// 전력제어 상태 : 체크박스 처리
			let elecStatusStr = '';
			if(solarObj.powerStatus == 1) { // 일반전기
				elecStatusStr = '일반전기';
				$('#elecStatusCheckbox').prop("checked", true);
			} else { // 배터리전기
				$('#elecStatusCheckbox').prop("checked", false);
				elecStatusStr = '배터리전기';
			}

			let remainBattery = solarObj.powerVal != null ? solarObj.powerVal : 0; // 배터리잔량 %
			remainBattery = remainBattery > 100 ? 100 : remainBattery < 0 ? 0 : remainBattery;
			
    	$('#elecStatusH4').append(elecStatusStr); // 전력제어상태
    	// 배터리 잔량
    	$('#remainBatteryAmount').append(remainBattery+'%'); 
			$('#remainBatteryBar').css('width', remainBattery+'%');
			// 배터리잔량바 색깔처리 녹색: 100~70% , 주황색: 69~30% , 적색: 29~0%
			let batteryColorClass = 'bg-gradient-success';
			if(remainBattery < 70 && remainBattery >= 30) {
				batteryColorClass = 'bg-gradient-warning';
			} else if(remainBattery < 30 && remainBattery >= 0) {
				batteryColorClass = 'bg-gradient-danger';
			}
			$('#remainBatteryBar').addClass(batteryColorClass);
			
    },
    error : () => {
       alert('연동정보가 없습니다');
    }
    
  });
  
}


	// 전환하기 버튼 클릭. 디바이스 제어값  ==> Flask API
	const sendToFlask = elecStatus => {
	
		// 디바이스 제어 json Data ==> To Flask API 
  	const apiIp = 'http://172.30.1.89:5000';
		const userId = $('#userId').val();
		const pinId = $('#sendPinId').val(); 
		
		let sendData = {
	    "clientType": "web",
	    "clientId": userId,
			"control": {
				"pinId": pinId,
				"powerStatus": elecStatus,
				"powerVal": ""
			}
		}
		console.log(JSON.stringify(sendData));

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
    
  	}); //ajax
	
}// sendToFlask



