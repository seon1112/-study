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
<script type="text/javascript">
function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}
</script>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar  w3-bar-block" style="width:36.1rem">
	<div class="sidbar-LMX">
		<div class="sidemenu-ggH">
			  <a href="#" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;" >
			  My Programmars
			  </a>
			  <a href="#" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  My Study
			  </a>
			      <button class="w3-button w3-block w3-left-align " onclick="myAccFunc()" style="padding-top:15px; padding-bottom:15px;">
				  Team Mate <i class="fa fa-caret-down"></i>
				  </button>
				  <div id="demoAcc" class="w3-hide w3-white w3-card" >
				    <a href="#" class="w3-bar-item w3-button">Link</a>
				    <a href="#" class="w3-bar-item w3-button">Link</a>
				  </div>
			  <a href="#" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  Study
			  </a>
			  <a href="#" class="w3-bar-item w3-button" style="padding-top:15px; padding-bottom:15px;">
			  Board
			  </a>
	  	</div>
	  	<div class="sidelevel-wbX">
	  		<h3 class="w3-bar-item">정복 레벨</h3>
	  		<ul class="w3-ul">
			  <li>LEVEL 0</li>
			  <li>LEVEL 1</li>
			  <li>LEVEL 2</li>
			  <li>LEVEL 3</li>
			  <li>LEVEL 4</li>
			  <li>LEVEL 5</li>
			</ul>
	  	</div>
	  </div>
	</div>
</body>
</html>