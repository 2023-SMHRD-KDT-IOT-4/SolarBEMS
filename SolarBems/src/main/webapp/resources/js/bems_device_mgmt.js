$(document).ready(function() {
	console.log('bems_device_mgmt');
	
	const controlDiv = $('#controlDiv');
	controlDiv.hide();

  // 관리화면 >  연동해제 아이콘 클릭
  $('#linkOffModal').on('show.bs.modal', e => {
    
    const dataset = e.relatedTarget.dataset;
    $('#linkOffLinkId').val(dataset.bsId); // 연동해제할 연동아이디
    $('#linkOffNo').val(dataset.bsNo); // 연동해제할 테이블 row 
    let dvclName = dataset.bsParam; // 연동해제할 디바이스 이름
    $('#linkOffModalBody').html('정말 ' + dvclName +' 연동해제 하시겠습니까?');
    
	});
  
  // 모달창 > 연동해제버튼 클릭 시 
  $("#linkOffBtn").on("click", () => {

      let linkId = $('#linkOffLinkId').val();
      let linkOffNo = $('#linkOffNo').val();
      console.log('linkId'+ linkId);
      console.log('linkOffNo'+ linkOffNo);
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
  
});

	// 디바이스 제어 클릭
	const controlDevice = (pinId, dvclName, dvcPowerName) => {
		$('#controlDiv').show();
		console.log(pinId);
		console.log(dvclName);
		$('#deviceName').html(dvclName);
		// 운전상태값
		//$('#powerStatus')
		// 설정값
		$('#powerType').html('(' + dvcPowerName +')');
	}

