<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>myStudyPage</title>
  <link rel="icon" href="/favicon.ico" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A700"/>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/myStudyPage.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

//이달의 포도농사 그래프
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['day', 'seon', 'jin','cha'],
    ['1일',  1,3,6],
    ['2',  2,4,9],
    ['3',  1,3,5],
    ['4', 5 ,6,4],
    ['5', 0 ,0,0],
    ['6', 0 ,0,0],
    ['7', 0 ,0,0],
    ['8', 0 ,0,0],
    ['9', 0 ,0,0],
    ['10', 0 ,0,0],
    ['11', 0 ,0,0],
    ['12', 0 ,0,0],
    ['13', 0 ,0,0],
    ['14', 0 ,0,0],
    ['15', 0 ,0,0],
    ['16', 0 ,0,0],
    ['17', 0 ,0,0],
    ['18', 0 ,0,0],
    ['19', 0 ,0,0],
    ['20', 0 ,0,0],
    ['21', 0 ,0,0],
    ['23', 0 ,0,0],
    ['24', 0 ,0,0],
    ['25', 0 ,0,0],
    ['26', 0 ,0,0],
    ['27', 0 ,0,0],
    ['28', 0 ,0,0],
    ['29', 0 ,0,0],
    ['30', 0 ,0,0],
    ['31', 0 ,0,0]
    
  ]);

  var options = {
    curveType: 'none',
    legend: { position: 'bottom' },
    hAxis: {
        textStyle: {
          fontSize: 30
        }
      },
      vAxis: {
        textStyle: {
          fontSize: 30
        },
        ticks: [0, 1,2,3,4, 5, 6,7, 8, 9,10] // 원하는 레이블 값 설정
      }
  };

  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

  chart.draw(data, options);
}
</script>
</head>
<body>
	 <div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
   	
    <div class="mystudy-3uT">
      <div class="maincol-CGZ">
        <div class="mainstudy-Wo3">
          <div class="auto-group-c6cy-r6D">
            <div class="studyname-xf3">“스터디이름” </div>
            
           			<div class="w3-white w3-border w3-dropdown-hover selectyear-nhw selectmonth-fZT">
				      <button class="w3-button" style="width:12.8rem; height:4rem;">연도선택</button>
				      <div class="w3-dropdown-content w3-bar-block w3-card-4" style="width:12.8rem; height:4.3rem;">
				        <a href="#" class="w3-bar-item w3-button">2023년</a>
				        <a href="#" class="w3-bar-item w3-button">2022년</a>
				      </div>
				    </div>
 
          </div>
          
          <!-- 순위 div -->
          <div class="ranktable-QG9">
          	<!-- 전체순위 -->
            <div class="totalrank-xHf">
            	<table class="w3-table w3-xlarge w3-bordered  w3-centered" id="totalRank">
			    <tr style="height: 5rem;" >
			      <th colspan="3" style="padding-top:1.2rem">종합 Best 농부</th>
			    </tr>
			    <tr style="height: 3.8rem;" >
			      <td>1등</td>
			      <td>자두야</td>
			      <td>134문제</td>
			    </tr> 
			    <tr style="height: 3.8rem;"  >
			      <td>2등</td>
			      <td>호두야</td>
			      <td>110문제</td>
			    </tr> 
			    <tr style="height: 3.8rem;" >
			      <td>3등</td>
			      <td>호두야</td>
			      <td>110문제</td>
			    </tr>  
			  </table>
            </div>
            <!-- 이달의 순위 -->
            <div class="monthrank-tx1">
            	<table class="w3-table w3-xlarge w3-bordered  w3-centered" id="monthRank" >
			    <tr style="height: 5rem;" >
			      <th colspan="3" style="padding-top:1.2rem">7월 Best 농부</th>
			    </tr>
			    </table>
            </div>
          </div>
        </div>
		 <div style="position:absolute; top:47rem; width:100%; z-index:1; background:#d3d3d3; height:0.3rem;"></div>
		 <!-- 그래프 -->
        <div id="curve_chart" style="width: 2800px; height: 1400px">
        	
        </div>
         
      </div>
    </div>
 
</body>
</html>