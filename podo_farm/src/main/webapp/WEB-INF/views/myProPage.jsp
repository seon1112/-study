<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>myProPage</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/myProPage.css" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
//캘린더-------------------------------------------------
 google.charts.load("current", {packages:["calendar"]});
 google.charts.setOnLoadCallback(drawChart);

   function drawChart() {
	   $.ajax({
		  url:"grape",
		  success:function(data){
			  console.log(data);
		        var dataTable = new google.visualization.DataTable();
		        dataTable.addColumn('date', 'Date');
		        dataTable.addColumn('number', 'Count');

		        for (var i = 0; i < data.length; i++) {
		            var date = new Date(data[i].date);
		            var ct = data[i].ct;
		            dataTable.addRows([[new Date(date.getFullYear(), date.getMonth(), date.getDate()), ct]]);
		        }
		       var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));

		       var options = {	
		    		   height: 495,
		    		   noDataPattern: {
		    	           backgroundColor: '#CCCCCC'
		    	         },
		    		   calendar: { 
		    			   cellSize: 34,
		    			   monthLabel: {
		    			        fontName: 'Times-Roman',
		    			        fontSize: 20,
		    			        color: '#6F13E4',
		    			        bold: true,
		    		
		    			        },
		    			 yearLabel: {
		    			       fontSize: 1
		    			    }
		    			   }
		       };
		       chart.draw(dataTable, options);
		  }
	   });
	   
	   
      
      
   }

//검색어 검색 기능--------------------------------------------
function myFunction() {
  var input, filter, table, tr, td1, td2, td3, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  for (i = 0; i < tr.length; i++) {
    td1 = tr[i].getElementsByTagName("td")[0];
    td2 = tr[i].getElementsByTagName("td")[1];
    td3 = tr[i].getElementsByTagName("td")[2];
    
    if (td1 || td2 || td3) {
      var txtValue1 = td1 ? td1.textContent || td1.innerText : "";
      var txtValue2 = td2 ? td2.textContent || td2.innerText : "";
      var txtValue3 = td3 ? td3.textContent || td3.innerText : "";
      var matchFound = false;

      if (txtValue1.toUpperCase().indexOf(filter) > -1) {
        matchFound = true;
      }
      
      if (txtValue2.toUpperCase().indexOf(filter) > -1) {
        matchFound = true;
      }
      
      if (txtValue3.toUpperCase().indexOf(filter) > -1) {
        matchFound = true;
      }
      
      if (matchFound) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
//연도 선택 기능---------------------------------------------
function selectYear(year){
	console.log(year);
	$.ajax({
		url:"myProPage",
		data:{year:year},
		success:function(data){
			
		}
	})
}
</script>
</head>
<body>
	<!-- 사이드 바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
   	<!-- 메인본문 -->
    <div class="mypro-fxm">
      <div class="maincol-DDb">
        <div class="auto-group-gd4m-XEH">
          <div class="mainmemberstate-Dso">
            <div class="auto-group-gvzm-B3w">
              <div class="memberstatetitle-Xdb">
                <span class="memberstatetitle-Xdb-sub-0">${name }님</span>
                <span class="memberstatetitle-Xdb-sub-1">의  성장 여정이에요.</span>
              </div>
              
              <!-- 연도선택 드롭다운 -->
			 <div class="w3-white w3-border w3-dropdown-hover selectyear-nhw ">
			     <button class="w3-button" style="width:12.8rem; height:4rem; font-size:large;font-weight:600;">연도선택</button>
		     	 <div class="w3-dropdown-content w3-bar-block w3-card-4" style="width:12.8rem; height:4.3rem;font-weight:300;">
		     	 	<c:forEach var="y" items="${regdate }">
		     	 		<a href="#" class="w3-bar-item w3-button" onclick="selectYear(${y})">${y }</a>
		     	 	</c:forEach>
			     </div>
		     </div>
				 
              
            </div>
            <div class="memberstate-X9j">
              <div class="solved-od3">
                <img class="light-jmb" src="./assets/light.png"/>
                <div class="solvedtext-TxV">
                  <div class="solvedtitle-cqP">해결한 코딩테스트</div>
                  <div class="solvedinput-hM3">
                    <span class="solvedinput-hM3-sub-0"> </span>
                    <span class="solvedinput-hM3-sub-1">${total }</span>
                    <span class="solvedinput-hM3-sub-2"> </span>
                    <span class="solvedinput-hM3-sub-3">문제</span>
                  </div>
                </div>
              </div>
              <div class="studyrank-HiZ">
                <div class="ranking-1Pf">
                  <img class="vector-8z5" src="./assets/vector-oCu.png"/>
                  <div class="auto-group-gg6m-58d">
                    <img class="vector-DVj" src="./assets/vector.png"/>
                    <img class="vector-AA5" src="./assets/vector-vRP.png"/>
                  </div>
                  <img class="vector-6Jd" src="./assets/vector-3HB.png"/>
                </div>
                <div class="ranktext-3Ds">
                  <div class="studyranktitile-PoX">스터디 랭킹</div>
                  <div class="studyrankinput-3NH">
                    <span class="studyrankinput-3NH-sub-0">${rank}</span>
                    <span class="studyrankinput-3NH-sub-1">/ ${totalIn } 위</span>
                  </div>
                </div>
              </div>
              <div class="missed-3Fo">
                <img class="sleep-mxV" src="./assets/sleep.png"/>
                <div class="memberstatetext-6js">
                  <div class="missedtitle-rU9">이번 달 빠진 횟수</div>
                  <div class="missedinput-z4Z">
                    <span class="missedinput-z4Z-sub-0">${day }</span>
                    <span class="missedinput-z4Z-sub-1"> 일</span>
                  </div>
                </div>
              </div>
              <div class="startstudy-617">
                <img class="fire-cEM" src="./assets/fire.png"/>
                <div class="startstudytext-9VB">
                  <div class="startstudytitle-bMB">스터디를 시작한지</div>
                  <div class="startstudyinput-7qK">
                    <span class="startstudyinput-7qK-sub-0">${start }</span>
                    <span class="startstudyinput-7qK-sub-1"> 일</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
         <!-- 캘린더 -->
         <div class="mainchart-QC9 ">
         <!-- 구글 캘린더 -->
          <div id="calendar_basic" style="width: 1965px; height:495px;"></div>
         </div>
        </div>
        
        <!-- 내가 푼 문제들-->
        <div class="mainsolved-vwB">
          <div class="solvedtitle-3ku">${name }’s solved</div>
          <!--  
          <div class="selectcol-b1j">
            <div class="search-Lk1">
            </div>
            <div class="searchbtn-sV3">검색</div>
          </div> -->
          <input class="w3-input w3-border w3-padding search-Lk1" type="text" placeholder="검색어를 입력해주세요" style="height:5rem;" id="myInput" onkeyup="myFunction()">
          <div class="solvedtable-Aj3">
          	<!-- 문제 테이블 -->
          	<table class="w3-table w3-xlarge w3-bordered w3-hoverable" id="myTable">
			    <tr class="w3-gray w3-centered"  >
			      <th style="width:30%;">날짜</th>
			      <th style="width:20%;">번호</th>
			      <th style="width:50%;">제목</th>
			    </tr>
			    <c:forEach var="c" items="${list }">
			    <tr >
			      <td>${c.p_date }</td>
			      <td>${c.rownum }</td>
			      <td>${c.p_title }</td>
			    </tr> 
			    </c:forEach>
			  </table>
          </div>
        </div>
      </div>
    </div>
 
</body>
</html>