
$(document).ready(function() {
  console.log('solar chart');
  
});

 // 조회기준 디바이스별 전력소비량 차트
  const getRealTimeDeviceConsume = (chartId, datas, dbDatas) => {

    if(dbDatas == [] || dbDatas.length == 0 ) {
      console.log('no db data');
    }
  //  Flask 받은 데이터 빈값 체크
    if(Object.keys(datas).length == 0 || datas === undefined) {
      console.log('no api linked data');
    }
    let apiDatas = datas['device'];

    let dvclNames = [];
    let dvcElecVals= [];
    dbDatas.forEach((dvcDb, idx) => {
      // 소비 디바이스
      if(dvcDb['dvcElecCode'] == 'u')  {
        dvclNames.push(dvcDb['dvclName']);
        // 일치하는 핀 필터
        let curDvc = apiDatas.filter(dvc => dvc['pinId']== dvcDb['pinId']);
        curDvc = curDvc.length != 0 ? curDvc[0] : { 'dvcElecVal' : 20};

        let curElecVal = curDvc['dvcElecVal'];
        dvcElecVals.push(curElecVal);
      }
  });

    // 차트 그리기
    let chartDiv = document.getElementById(chartId);
    let myChart = echarts.init(chartDiv, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    // let app = {};
    let option = {
      title: {
        text: '디바이스 별 전력 소비량',
        // subtext: '(W)',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
        legend: {
          orient: 'vertical',
          left: 'right'
        },
      grid: {
        left: '4%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      // x축 ==> 디바이스 설정 이름
      xAxis: [
        {
          type: 'category',
          data: dvclNames,
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
    	// color : [
      //  '#1be11b', '#ff0000'
      // ],
      /// 전력 소비량
      series: [
        {
          name: '소비량(W)',
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