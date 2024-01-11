
$(document).ready(function() {
  console.log('dash');
	
  const userId = $('#userId').val();
	const arduId = $('#arduId').val();
  
  // 페이지 로딩시 연동된 디바이스 json list From Flask API
  let result = getLinkedDeviceList(userId, arduId);
	getRealTimeDeviceConsume('chart1', result); // 조회기준 디바이스별 전력소비량 차트
	
});

	// 조회기준 디바이스별 전력소비량 차트
	const getRealTimeDeviceConsume = (chartId, apiDatas) => {
	
		let dvcs = apiDatas['device'];
	  if(JSON.stringify(apiDatas) == '{}') {
	    console.log('no data');
	    dvcs = [];
	  }
	   
	  // Flask 받은 데이터 빈값 체크
	  console.log(dvcs);
	  let dvcPins = dvcs.map(dvc => dvc['pinId']+'핀');
	  let dvcElecVals= dvcs.map(dvc => dvc['dvcElecVal'] );
	
	  // 차트 그리기
	  let chartDiv = document.getElementById(chartId);
	  let myChart = echarts.init(chartDiv, null, {
	    renderer: 'canvas',
	    useDirtyRect: false
	  });
	  // let app = {};
	  let option = {
	    tooltip: {
	      trigger: 'axis',
	      axisPointer: {
	        type: 'shadow'
	      }
	    },
	    grid: {
	      left: '4%',
	      right: '4%',
	      bottom: '3%',
	      containLabel: true
	    },
	    xAxis: [
	      {
	        type: 'category',
	        data: dvcPins,
	        axisTick: {
	          alignWithLabel: true
	        }
	      }
	    ],
	    yAxis: [
	      {
	        type: 'value'
	      }
	    ],
	    series: [
	      {
	        name: 'Direct',
	        type: 'bar',
	        barWidth: '60%',
	        data: dvcElecVals
	      }
	    ]
	  };
	
	  if (option && typeof option === 'object') {
	    myChart.setOption(option);
	  }
	} // End getRealTimeDeviceConsume