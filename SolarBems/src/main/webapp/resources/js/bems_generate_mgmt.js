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

	const userId = $('#userId').val();
	const arduId = $('#arduId').val();
	console.log('getLinkDeviceList ardu' + arduId);
  let reqData = {
		"clientType": clientType,
		"clientId": userId,
 		"arduId" : arduId
  }
  console.log(reqData);

  $.ajax({
    type : 'POST',
    url : flaskIp + '/api/device/linked',
    data: JSON.stringify(reqData),
    dataType : 'json',
    contentType : 'application/json; charset:UTF-8',
    success : data => {
    
    	// 연동된 디바이스가 한개도 없을 경우
      if(Object.keys(data).length === 0) {
      	alert('연동정보가 없습니다');
      	return;
      }
      console.log(data);
      
      let devices = data.device; // 연동된 디바이스 json list
      
      // 필터 태양광패널만('dvc001')
      const solarList = devices.filter( dvc => dvc.dvcId == 'dvc001');
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
		const userId = $('#userId').val();
		const arduId = $('#arduId').val();
		const pinId = $('#sendPinId').val(); 
		
		let sendData = {
	    "clientType": "web",
	    "clientId": userId,
	    "arduId" : arduId,
			"control": {
				"pinId": pinId,
				"powerStatus": elecStatus,
				"powerVal": ""
			}
		}
		console.log(JSON.stringify(sendData));

	  $.ajax({
	    type : 'POST',
	    url : flaskIp + '/api/device/control',
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



