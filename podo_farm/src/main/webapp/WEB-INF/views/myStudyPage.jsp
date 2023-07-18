<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>myStudyPage</title>
  <link rel="icon" href="/favicon.ico" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-win8.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A700"/>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/myStudyPage.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
var month;
var year;
var lastDay; //선택한 달의 마지막 날
//이달의 포도농사 그래프
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
/*이 형식의 데이터가 들어가야함
 * ['day', 'seon', 'jin','cha'],
   ['1일',  1,3,6],
 */
function drawChart() {
	var year2=year;
	var month2=month
	var lastDay2;
	if(lastDay==null){
		lastDay2=$("#last").val();
	}else{
	   lastDay2=lastDay;
	}
	//멤버별 문제푼날짜, 푼 문제 수 가져오기
	$.ajax({
		url:"graph",
		data:{year:year2,month,month2},
		success:function(d){
			 //스터디 멤버 가져오기
			 $.ajax({
				 url:"member",
				 success:function(m){
					 var result = [['day']];
				        for (var i = 0; i < m.length; i++) {
				            result[0].push(m[i].a_name); // 첫 번째 행에 mate 이름 추가
				        }
				        var data = new google.visualization.DataTable(); // 데이터 테이블 초기화
				        data.addColumn('string', 'day'); // day 열 추가
				        for (var i = 1; i < result[0].length; i++) {
				            data.addColumn('number', result[0][i]); // mate 열 추가
				        }
				//-------------------------------------------------------------------------
				        var drow = []; //값이 들어간 배열
				        for (var i = 1; i <=lastDay2; i++) {
				            var dayData = d.find(function(item) {
				                return item.day === i.toString(); // day가 현재 날짜와 일치하는 데이터 찾기
				            });

				            var rowData = [i.toString()+"일"]; // day 값을 문자열로 변환하여 배열에 추가

				            if (dayData) {
				                for (var j = 1; j < result[0].length; j++) {
				                    var mateName = result[0][j]; // mate 이름 가져오기
				                    var mateData = dayData.a_name === mateName ? dayData.c : 0; // a_name이 현재 mate 이름과 일치하면 c 값을 가져오고, 일치하지 않으면 0
				                    rowData.push(mateData); // 해당하는 mate의 데이터 값(c) 추가
				                }
				            } else {
				                for (var j = 1; j < result[0].length; j++) {
				                    rowData.push(0); // 데이터가 없을 경우 0으로 추가
				                }
				            }
				            drow.push(rowData);   //데이터 추가
				        }
			
				        data.addRows(drow); // 데이터 행 추가
				        var options = {
							    curveType: 'none',   //커브타입 안함
							    legend: { position: 'bottom' },  //column 그래프 밑
							    hAxis: {						//column text style
							        textStyle: {
							          fontSize: 22
							        }
							      },
							      vAxis: {
							        textStyle: {
							          fontSize: 30
							        },
							        ticks: [0, 1,2,3,4, 5, 6,7, 8, 9,10] // 원하는 레이블 값 설정
							      }
							  };

							  var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));
							//차트 그리기
							  chart.draw(data, options);
						
				 }
			
			 })
			 
			
		}
	});
 

 
}
//이달의 랭킹 달 변동
function getMonth(month){
var m=month;
	$.ajax({
		url:"month",
		data:{month:m},
		success:function(data){
			$("#monthBest").empty();      //title행 비우기
			$("#monthBest").html(data+"월 BEST 농부");   //선택한 월로 이름 변경하기
		}
	});
}
//날짜 선택시
 	function selectMonth(select){
 		 var selectedValue = select.value;
         var values = selectedValue.split("/");
         var year2 = values[0];
         var month2 = values[1];
         var lastDay2 = values[2]; // 추가적인 값
		month=month2;   //선택한 월
		year=year2;		//선택한 년도
		lastDay=lastDay2;
		$.ajax({
			url:"selectMY",
			data:{month:month, year:year},
			success:function(data){
				getMonth(month);         //" "월 BEST 농부
				$("#mr").empty();         //테이블 비우기
				for(var i=0;i<data.length;i++){
					var tr=$("<tr></tr>");
					var td1=$("<td></td>").html(data[i].rownum+"등");
					var td2=$("<td></td>").html(data[i].a_name);
					var td3=$("<td></td>").html(data[i].c+"문제");
					tr.append(td1).append(td2).append(td3);   
					$("#mr").append(tr);				//테이블 행 추가하기
					
				}
				drawChart();			//그래프 그리기
			}
		})
	
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
          <!-- 스터디 이름 -->
            <div class="studyname-xf3">${studyName } </div>
            	<!--
	       			<div class="w3-white w3-border w3-dropdown-hover selectyear-nhw selectmonth-fZT">
				      <button class="w3-button selectM w3-hover-deep-purple"  >월선택</button>
				      <div class="w3-dropdown-content w3-bar-block w3-card-4 selectMonthCol" >
				        <c:forEach var="m" items="${month }">
				       	  <button class="w3-bar-item w3-button w3-hover-deep-purple"  onclick="selectMonth(${m[0] },${m[1] },${m[2] })">${m[0] }/${m[1] }</button>
				        </c:forEach>
				       <input type="hidden" value="${month[0][2] }" id="last">
				      </div>
				    </div> 
				    -->
				<select class="selectyear-nhw selectmonth-fZT" onchange="selectMonth(this)">
				    <option disabled="disabled">월 선택</option>
				    <c:forEach var="m" items="${month}">
				        <option value="${m[0]}/${m[1]}/${m[2]}">${m[0]}/${m[1]}</option>
				    </c:forEach>
				    <input type="hidden" value="${month[0][2]}" id="last">
				</select>
								    
          </div>
          
          <!-- 순위 div -->
          <div class="ranktable-QG9">
          	<!-- 전체순위 -->
            <div class="totalrank-xHf">
            	<table class="w3-table w3-xlarge w3-bordered  w3-centered" id="totalRank">
			    <tr style="height: 5rem;" >
			      <th colspan="3"  class="total" style=" padding-top:1.2rem;">종합 Best 농부</th>
			    </tr>
			    <tbody>
			    <c:forEach var="r" items="${totalRank }">
			    <tr style="height: 3.8rem;" >
			      <td>${r.rownum }등</td>  
			      <td>${r.a_name }</td>
			      <td>${r.c }문제</td>
			    </tr> 
			    </c:forEach>
			    </tbody>
			  </table>
            </div>
            <!-- 이달의 순위 -->
            <div class="monthrank-tx1">
            	<table class="w3-table w3-xlarge w3-bordered  w3-centered" id="monthRank" >
			    <tr style="height: 5rem;"  >
			      <th colspan="3"  id="monthBest">${m }월 Best 농부</th>
			    </tr>
			    <tbody id="mr">
			    	 <c:forEach var="m" items="${monthRank }">
				    <tr style="height: 3.8rem;" >
				        <td>${m.rownum }등</td>  
				      	<td>${m.a_name }</td>
				      	<td>${m.c }문제</td>
				    </tr> 
				    </c:forEach>
			    </tbody>
			    </table>
            </div>
          </div>
        </div>
        <!-- 경계선 div -->
		 <div style="position:absolute; top:47rem; width:100%; z-index:1; background:#d3d3d3; height:0.3rem;"></div>
		 <!-- 그래프 -->
        <div id="curve_chart" style="width: 2800px; height: 1400px">
        </div>
         
      </div>
    </div>
 
</body>
</html>