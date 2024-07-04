<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
 #header, #footer{
      width: 100%;
      height: 20%;
      background-color: #e5e0f2;
   }
   
   #content{
      width:100%;
      height: 60%;
   }
</style>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>StudyDetail</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700%2C800"/>
  <link rel="stylesheet" href="./styles/studydetail.css"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$('#f').submit(function(){
  			window.open('', 'apply', 'width=750,height=500');
  	        this.action = 'applyStudy';
  	        this.method = 'POST';
  	        this.target = 'apply';
  		});
  	});
  
  	function closeWindow(msg) {
  		alert(msg);
  	}
  /*
  function openPop(){
	    var popup = window.open('http://www.naver.com', 'apply', 'width=700px,height=800px,scrollbars=yes');
	    popup.document.getElementById("a_no").value = "전달하고자 하는 값";
	    popup.focus();
	  }
  */
  </script>
</head>
<body>
<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
   <!-- -->
<!-- 사이드 바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
<!-- 메인 -->
<div class="studydetail-SLH">
  <div class="main-login-mNZ">
    <div class="auto-group-rm4m-SKb">
      <div class="page-aLZ">
        <div class="page-ts3">
          <div class="divstudycontentwrappervvynh-SNm">
            <div class="section-P37">
              <div class="item-5--8mP">${s.s_title }</div>
              <div class="divstudycontentuseranddate1iydv-RVb">
                <div class="divstudycontentuser1xymh-vBT">
                  <img src="./images/${a.a_img }" class="defaultpng-42m">
                  
                  <div class="divstudycontentusername1gbr8-wMT">${a.a_nick }</div>
                </div>
                <div class="item-20230706-avD">${s.s_o_date }</div>
              </div>
              <div class="list-Tz1">
                <div class="auto-group-bkfo-oY5">
                  <div class="item-YkZ">
                    <div class="item--GwT">모집 인원</div>
                    <div class="item-4-yqs">${s.s_member }명</div>
                  </div>
                  <div class="item-ujX">
                    <div class="item--Tm3">사용 언어</div>
                    <c:forEach var="l" items="${l }">
                    <div class="c-yDb">${l.l_lang }</div>
                    </c:forEach>
                  </div>
                </div>
                <div class="auto-group-y24r-EfK">
                  <div class="item-P2R">
                    <div class="item--XPX">스터디 시작일</div>
                    <div class="item-20230701-SFb">${s.s_o_date }</div>
                  </div>
                  <div class="item-kn5">
                    <div class="item--gQq">스터디 종료일</div>
                    <div class="item-20231231-zgR">${s.s_e_date }</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="divstudycontentpostcontentwrapper187zh-icR">
              <div class="heading-2-Ta1">
                <div class="item--aPj">
                  <span class="item--aPj-sub-0">스터디명</span>
                  <span class="item--aPj-sub-1"> </span>
                </div>
                <div class="item--Hqs">${s.s_name }</div>
              </div>
              <div class="divstudycontentpostcontent2c-fo-yCu">
                <div class="heading-2-iAV">
                  <div class="item--ScH">목표</div>
                  <div class="item--MUM">${s.s_goal }</div>
                </div>
                <textarea class="item--SVo" name="s_content" readonly="readonly">${s.s_content }</textarea>
               
              </div>
            </div>
            <!-- 신청, 취소 버튼 -->
            <form id="f" style="display: flex">
            <input type="hidden" name="a_no" value="${ano}">
            <input type="hidden" name="s_no" value="${s.s_no }">
            <input type="hidden" name="s_name" value="${s.s_name }">
            <!-- 스터디 멤버이몀 안보이게 -->
            <c:if test="${r_ok<1 }">
            <input type="submit" value="스터디 신청" class="button-4hX">  
            </c:if>
            <a href="/studySearching" class="button-4h" >취소</a>
           
            </form>
          </div> 
        </div>
      </div>
    </div>
  </div>
</div>
</body>