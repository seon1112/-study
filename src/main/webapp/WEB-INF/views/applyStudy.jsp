<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>Apply</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400%2C700"/>
  <link rel="stylesheet" href="./styles/apply.css"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
 
		  $(document).ready(function(){
			  $('.button-hSy').click(function () {
				  event.preventDefault(); // 폼 전송 방지
				  console.log("버튼눌림!!!!!");
		           var f=$("#f").serializeArray();
		           $.ajax({
		        	   url:"applyStudy",
		               data:f,
		               success:function(data){
		                  console.log("바뀜");
		                //  window.opener.closeWindow(msg);
		                  window.close();
		                  
		                     
		               }
		           });
			});
			  
		  });
		 
</script>

</head>
<body>
<div class="apply-ykd">
<form id="f">
  <div class="page-tsb">
    <div class="section-Q5F">
      <div class="divpostregisterpostcontentwrapper3bxz6-KT7">${s_name } 스터디</div>
      <div class="auto-group-ifjr-Ld7">
        <div class="item-rrM">
          <div class="label--bZ3">깃 허브 주소</div>
          <input type="text" class="divselectcontrol-5z1" name="a_git" placeholder="깃허브 주소를 입력하세요">      
        </div>
        <div class="item-qbo">
          <div class="label--Ae5">정복 레벨</div>
          
            
            <input type="text" class="divselectcontrol-t4H" name="a_level" placeholder="목표 레벨을 입력하세요"> 
            <!--
            <img class="divselectindicators-GKj" src="./assets/divselectindicators-nHw.png"/>
              -->
          
        </div>
        <div class="item-xyF">
          <div class="label--vfB">프로그래머스 점수</div>
          <input type="text" class="divselectcontrol-SNd" name="a_programmers" placeholder="프로그래머스 점수를 입력하세요">
            
        </div>
      </div>
    </div>
    <div class="section-AC9">
    	<input type="hidden" name="a_no" id="a_no" value="${a_no }">
            <input type="hidden" name="s_no" id="s_no" value="${s_no }" >
      <input type="button" class="button-hSy" value="신청하기">
      <input type="button" class="button-Bd3" onclick="window.close()" value="취소">
    </div>
  </div>
  </form>
</div>
</body>
</html>