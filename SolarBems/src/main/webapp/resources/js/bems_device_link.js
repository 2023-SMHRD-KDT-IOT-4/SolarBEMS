$(document).ready(function() {
  console.log('device link');
  // 페이지 로딩시 연동된 디바이스 json list From Flask API
  getLinkDeviceList();

  // 연동버튼 클릭
  $("#linkBtn").on("click", e => {
    let chkList = $("input[name=chkLink]:checked");
    linkDevice(chkList);
  });
  
  // 재연동버튼 클릭
  $("#retryLinkBtn").on("click", () => {
    getLinkDeviceList();
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

        let pinId = tds.children('span[name=pinId]').text();
        let dvcTypeName = tds.children('span[name=dvcTypeName]').text();
        let dvcId = tds.children('input[name=dvcId]').val();
        let arduId = $('#arduId').val();
        let dvcTypeCode = tds.children('input[name=dvcTypeCode]').val();
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
    
 }
    


// 연동된 디바이스 json list From Flask API
const getLinkDeviceList = () => {
  const apiIp = 'http://172.30.1.89:5000';
	console.log('getLinkDeviceList');
  $.ajax({
    type : 'POST',
    url : apiIp + '/api/device/linked',
    dataType : 'json',
    success : data => {
			
			console.log(data);
      // 연동된 디바이스가 한개도 없을 경우
      const deviceLen = Object.keys(data.device).length;
      if(deviceLen == 0) {
        emptyLinkedDevice();
      }

			$('#arduId').val(data.clientId);
      let devices = data.device; // 연동된 디바이스 json list
      $('#deviceLenDiv').html('');
      $('#deviceLenDiv').append('<h6>트래킹 디바이스(총'+devices.length+'개)</h6>');
      makeTable(devices);

    },
    error : () => {
      alert('getLinkDeviceList error');
      emptyLinkedDevice();
    }
  });
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
}

// 연동된 디바이스가 한개도 없을 경우
const emptyLinkedDevice = () => {
  $('#linkDeviceDiv').html('<h4 class="text-center">트래킹 된 디바이스가 없습니다.</h4>');
}