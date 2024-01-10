$(document).ready(function() {
	const controlDiv = $('#controlDiv');
		
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
		const powerStatus = $('#powerStatus').is(':checked') ? 1 : 0;
		const powerVal = $('#poewrVal').val();
		const controlObj = {
      "pinId": pinId,
      "powerStatus": powerStatus,
      "powerVal": powerVal
	  }
    let result = sendDeviceControl(userId, arduId, controlObj);
    console.log(result);
		if(!result) {
			alert('디바이스 제어 실패');
		}
    console.log(result);    

  }); // $('#controlExecuteBtn')

}); // document

// ====================================================================


// 테이블 내 연동된 디바이스 운전상태, 운전상태값
const makeTableBody = (dbList, datas) => {
  console.log('makeTableBody dbList');
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
    tableTag += '<a class="btn btn-link text-info text-gradient px-1 mb-0"';
    tableTag += 'onclick="javascript:controlDevice('+ '"${value.pinId}", ' + '"${value.dvclName}", "${value.dvcPowerName}")"'+'>';
    tableTag += '<i class="material-icons">settings_remote</i>디바이스 제어</a>';
    tableTag += '<a class="btn btn-link text-danger text-gradient px-1 mb-0 modalBtn"';
    tableTag += ' data-bs-toggle="modal" data-bs-target="#linkOffModal"';
    tableTag += ' data-bs-id="' + '${value.linkId}' + '" data-bs-param="${value.dvclName}"';
    tableTag += ' data-bs-no="${status.count}"> <i class="material-icons">link_off</i>';
    tableTag += ' 연동해제</a>';
    tableTag += '<a class="btn btn-link text-dark px-1 mb-0" href="${contextPath}/bems/device_update/${value.linkId}">';
    tableTag += '<i class="material-icons">edit</i>수정</a>';
    tableTag += '</td>';
    tableTag += '</tr>';

  });
  $('#linkedDviceBody').html(tableTag);


  const devices = datas['device'];
  $.each(devices, (key,value) => {	
    let powerStatus = value['powerStatus'] == 1 ? 'ON' : 'OFF';
    let powerVal = value['powerVal'];

    $('#powerStatusSpan'+(key+1)).html(powerStatus);
    $('#powerValSpan'+(key+1)).html(powerVal);
  });

}// makeTableData


// 관리화면 > 테이블 row의 디바이스 제어 아이콘 클릭
const controlDevice = (pinId, dvclName, dvcPowerName) => {

	$('#controlDiv').show(); // 디바이스 제어 div출력
	
	// 클릭한 디바이스 별 출력 세팅
	$('#deviceName').html(dvclName); // 디바이스 이름
	$('#powerType').html('(' + dvcPowerName +')'); // 파워설정값
	//$('#powerStatus') // 운전상태값
	
	$('#sendPinId').val(pinId);
}
  
