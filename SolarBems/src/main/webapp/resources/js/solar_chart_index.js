
$(document).ready(function() {
  getDayDeviceConsume('chart1'); // 조회일 디바이스별 전력소비량 차트
  getMonthlyTotalProdCons('chart4'); // 월별 총 전력 생산,소비 비교 차트


});

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
        subtext: '조회 23-12(kW)',
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
  // 월별 총 전력생산량 차트
  const getMonthlyTotalProd = chartId => {
    let myChart = echarts.init(document.getElementById(chartId));
    let option;

    option = {
      title: {
        text: '월별 총 전력 생산량',
        subtext: '조회 23-12(kW)',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      color : [
        '#1be11b'
      ],
      xAxis: {
        type: 'category',
        data: months
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: monthProdList,
          type: 'line'
        }
      ]
    };

    option && myChart.setOption(option);
  }

  // 월별 총 전력소비량 차트
  const getMonthlyTotalConsume = chartId => {
    let myChart = echarts.init(document.getElementById(chartId));
    let option;

    option = {
      title: {
        text: '월별 총 전력 소비량',
        subtext: '조회 23-12(kW)',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      color : [
        '#ff0000'
      ],
      xAxis: {
        type: 'category',
        data: months
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: monthConsList,
          type: 'line'
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
