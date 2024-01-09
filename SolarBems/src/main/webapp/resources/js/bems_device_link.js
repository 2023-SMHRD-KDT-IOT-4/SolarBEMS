$(document).ready(function() {
  console.log('device link');
  
  const userId = $('#userId').val();
	const arduId = $('#arduId').val();
  
  // 페이지 로딩시 연동된 디바이스 json list From Flask API
  let result = getLinkedDeviceList(userId, arduId);
  processLinkedAPI(result); // 응답받은 연동 디바이스 리스트 처리

  // 연동버튼 클릭
  $("#linkBtn").on("click", e => {
    let chkList = $("input[name=chkLink]:checked");
    linkDevice(chkList);
  });
  
  // 재연동버튼 클릭
  $("#retryLinkBtn").on("click", () => {
    getLinkedDeviceList();
  });

  // 체크박스(전체선택) 클릭
  $("#chkLinkAll").on("click", () => {
    let chkList = $("input[name=chkLink]");
    if($(this).is(":checked")){
      chkList.prop("checked", true);
    }else
      chkList.prop("checked", false);
  });

});

 // 선택한 디바이스 연동 post
 const linkDevice = chkList => {
    
  let formData = [];
  
  chkList.each(function (index) {
    if($(this).is(":checked") == true){
        // 선택 체크박스의 td들
        let tds = $(this).parents('tr').children('td');

        const pinId = tds.children('span[name=pinId]').text();
        const dvcTypeName = tds.children('span[name=dvcTypeName]').text();
        const dvcId = tds.children('input[name=dvcId]').val();
        const arduId = $('#arduId').val();
        const dvcTypeCode = tds.children('input[name=dvcTypeCode]').val();
        let dvcData = {
        	"dvcId" : dvcId,
        	"dvcTypeCode" : dvcTypeCode,
        	"dvcTypeName" : dvcTypeName,
        	"arduId" : arduId,
          "pinId" : pinId
        }
        formData.push(dvcData);
    }
  });

  console.log({ 'devices' : formData});

  $.ajax({
    type : 'POST',
    url : './device_link',
    data: JSON.stringify(formData),
    contentType: "application/json",
    success : data => {

			location.href = './device_mgmt';
    },
    error : () => {
      alert('연동 실패');
    }
	});
    
 } // linkDevice

// 응답받은 연동 디바이스 리스트 처리
const processLinkedAPI = result => {

  // 에러 또는 연동된 디바이스가 한개도 없을 경우
	if(result === false || Object.keys(result).length == 0) {
	  emptyLinkedDevice();
    return;
  }

	// 연동된 디바이스 json list 
  let devices = result.device; 
  $('#deviceLenDiv').html('');
  $('#deviceLenDiv').append('<h6>트래킹 디바이스(총'+devices.length+'개)</h6>');
  makeTable(devices); // table 데이터 처리

}

const makeTable = devices => {

  $('#linkDviceBody').html('');
  let tableTag = '';
  
  $.each(devices, (key,value) => {	
    tableTag += '<tr class="bg-gray">';
    // 체크박스
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<input type="hidden" name="dvcId" value="'+value.dvcId+ '" />'
    // checked disabled
    tableTag += '<input type="checkbox" name="chkLink" checked>'
    tableTag += '</td>';
    // No
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal">'+(key+1)+'</span>';
    tableTag += '</td>';
    // 디바이스 타입이름
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<input type="hidden" name="dvcTypeCode" value="'+value.dvcTypeCode+ '" />'
    tableTag += '<span class="text-dark text-md font-weight-normal" name="dvcTypeName">'+value.dvcTypeName+'</span>';
    tableTag += '</td>';
    // 디바이스 핀 번호
    tableTag += '<td class="align-middle text-center">';
    tableTag += '<span class="text-dark text-md font-weight-normal" name="pinId">'+value.pinId+'</span>';
    tableTag += '</td>';
    tableTag += '</tr>';
  });

  tableTag += '</table>';
  $('#linkDviceBody').append(tableTag);
} // makeTable

// 연동된 디바이스가 한개도 없을 경우
const emptyLinkedDevice = () => {
  $('#linkDeviceDiv').html('<h4 class="text-center">트래킹 된 디바이스가 없습니다.</h4>');
}