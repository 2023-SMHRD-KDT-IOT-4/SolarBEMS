var flaskIp = 'http://172.30.1.89:5000';
var clientType = 'web';


// 연동된 디바이스 json list From Flask API
const getLinkedDeviceList = (userId, arduId) => {

	console.log('getLinkDeviceList ardu' + arduId);	
  let reqData = {
		"clientType": clientType,
		"clientId": userId,
 		"arduId" : arduId,
	}
  console.log(reqData);
  let result = false;
  
  $.ajax({
    type : 'POST',
    url : flaskIp + '/api/device/linked',
    async: false,
    data: JSON.stringify(reqData),
    dataType : 'json',
    contentType : 'application/json; charset:UTF-8',
    success : data => {
			console.log(data);
			result = data;
    },
    error : () => {
      alert('디바이스 트래킹 실패 error');
    }
  });  
    
	return result; 
    
  
} // getLinkedDeviceList