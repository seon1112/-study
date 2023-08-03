<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/side.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
level();
function myAccFunc() {
	//같은 스터디 멤버 찾기
	 $.ajax({
		  url:"mate",
		  success:function(data){
			  $("#mateList").empty();
			for(var i=0;i<data.length;i++){
				var a=$("<a></a>").attr("href","myProPage?mate_no="+data[i].a_no).addClass("w3-bar-item w3-button").html(data[i].a_name);
				$("#mateList").append(a);
			}		  
		  }
	  });
	//스터디 리스트 드롭다운
	  var x = document.getElementById("mateList");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-theme-l1";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-theme-l1", "");
	  }
	}
	
	function level(){
		console.log("동작함")
		$.ajax({
			url:"level",
			success:function(data){
				console.log(data);
				for(var i=0;i<=5;i++){
					$("#L"+i).html("Level  "+i+"                      :                                             "+data[i]+"문제");
				}
			}
		});
	}
	
</script>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar  w3-bar-block" style="width:36.1rem">
	<div class="sidbar-LMX">
		<div class="sidemenu-ggH">
			  <a href="myProPage" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;" >
			  My Programmars
			  </a>
			  <a href="myStudyPage" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  My Study
			  </a>
			      <button class="w3-button w3-block w3-left-align " onclick="myAccFunc()" style="padding-top:15px; padding-bottom:15px;">
				  Team Mate <i class="fa fa-caret-down"></i>
				  </button>
				  <div id="mateList" class="w3-hide w3-white w3-card" >
				  </div>
			  <a href="questionBoard" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  Board
			  </a>
			  <a href="studySearching" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  Study
			  </a>
	  	</div>
	  	<div class="sidelevel-wbX">
	  		<h3 class="w3-bar-item">정복 레벨</h3>
	  		<ul class="w3-ul">
			  <li id="L0">LEVEL 0</li>
			  <li id="L1">LEVEL 1</li>
			  <li id="L2">LEVEL 2</li>
			  <li id="L3">LEVEL 3</li>
			  <li id="L4">LEVEL 4</li>
			  <li id="L5">LEVEL 5</li>
			</ul>
	  	</div>
	  </div>
	</div>
</body>
</html>