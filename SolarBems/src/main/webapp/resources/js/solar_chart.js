

 // 조회기준 디바이스별 전력소비량 차트
  const getRealTimeDeviceConsume = (chartId, datas, dbDatas) => {

 	 	//  Flask 받은 데이터 빈값 체크
    if(Object.keys(datas).length == 0 || datas === undefined) {
     	datas = {};
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
        // subtext: '(mA)',
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
          name: '소비량(mA)',
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
  
  
	var months = ['23-07', '23-08', '23-09', '23-10', '23-11', '23-12'];
  var monthProdList = [120, 130 , 90, 80 , 65, 60];
  var monthConsList = [160, 180 , 140, 120 , 130, 150];
  var monthConsMList = monthConsList.map(e => e * -1);

  // 월별 총 전력 생산,소비 비교 차트
  const getMonthlyTotalProdCons = chartId => {
    let myChart = echarts.init(document.getElementById(chartId));
    let option;
    
    option = {
      title: {
        text: '월별 총 전력 생산량 및 소비량',
        subtext: '조회 24-01(kW)',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      legend: {
        data: ['Profit', 'Expenses']
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'value'
        }
      ],
      yAxis: [
        {
          type: 'category',
          axisTick: {
            show: false
          },
          data: months
        }
      ],
      color : [
        '#1be11b', '#ff0000'
      ],
      series: [
        {
          name: '생산량',
          type: 'bar',
          label: {
            show: true,
            position: 'inside'
          },
          emphasis: {
            focus: 'series'
          },
          data: monthProdList
        },
        {
          name: '소비량',
          type: 'bar',
          stack: 'Total',
          label: {
            show: true,
            position: 'left'
          },
          emphasis: {
            focus: 'series'
          },
          data: monthConsMList
        }
      ]
    };

    option && myChart.setOption(option);
  }


  // 조회일 디바이스별 전력소비량 차트
  const getDayDeviceConsume = chartId => {
    let myChart = echarts.init(document.getElementById(chartId));
    let option;
      option = {
        title: {
          text: '디바이스별 전력 소비량',
          subtext: '2024-01-02(W)',
          left: 'right'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: '솔라빌딩',
            type: 'pie',
            radius: '50%',
            data: [
              { value: 1200, name: '디바이스 별칭1' },
              { value: 800, name: '디바이스 별칭2' },
              { value: 2500, name: '디바이스 별칭3' },
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      };
        myChart.on('updateAxisPointer', function (event) {
      const xAxisInfo = event.axesInfo[0];
      if (xAxisInfo) {
        const dimension = xAxisInfo.value + 1;
        myChart.setOption({
          series: {
            id: 'pie',
            label: {
              formatter: '{b}: {@[' + dimension + ']} ({d}%)'
            },
            encode: {
              value: dimension,
              tooltip: dimension
            }
          }
        });
      }
    });
      option && myChart.setOption(option);
  }