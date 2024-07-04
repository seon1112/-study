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
 <title>codePage</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C600"/>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans%3A400%2C600"/>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A400"/>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/codepage.css" />
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function questionDelete(ct_no) {
    var re = confirm('정말로 삭제할까요?');
    if (re == true) {
      location.href = "/deleteCode?ct_no=" + ct_no;
    }
  }


</script>
</head>
<body>
	<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
   <!--  -->
	<!-- 사이드바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div> 
   	<!-- 메인 --> <!-- 변경된 db에 맞게 수정 -->
    <div class="code-Ek1" id="content" >
      <div class="maincol-Adf">
        <div class="maincode-5Vj">
          <div class="article-B2y">
          <!-- 문제이름  [Gold V] 적록색약 - 10026-->
            <div class="heading-1-iYh">[Level ${test.q_level}] ${test.q_title }</div>
            <div class="auto-group-sehf-VSy">
              <div class="heading-2-EfT">
              <!-- 문제 푼 날짜 -->
                <div class="performance-ngy">푼 날짜</div>
                <div class="performancetext-Wss">${test.p_date }</div>
              </div>
              <div class="heading-3-4Pb">
               <!-- 걸린 시간 -->
                <div class="class-2LR">걸린 시간</div>
                <div class="classtext-xjs">${test.p_timer }</div>
              </div>
            </div>
            <div class="heading-4-6bB">
             <!-- 링크 -->
              <div class="question-esb">문제링크</div>
              <div class="questiontext-amF" style="font-size:1.6rem;">
              <a href="${test.p_link }">${test.p_link }</a>     
              </div>
            </div>
          </div>
          <!-- 코드 -->
          <div class="code-pp1">
         	<jsp:include page="code.jsp">
			    <jsp:param name="p_lang" value="${test.p_lang}" />
			    <jsp:param name="p_code" value="${test.p_code}" />
			</jsp:include>
          </div>
        </div>
        <!-- 목록버튼 --><!-- 유리 -->
        <div class="btnCollection" >
       	<c:if test="${test.a_no==a }">
	        <a class="listbtn-95bB" href="/updateCode?ct_no=${ct_no }">수정</a>
	        <button class="listbtn-95bC">
	        	<a href="#" onclick="questionDelete(${ct_no})">삭제</a>
	        </button>
       	</c:if>
	        <a class="listbtn-95bA" href="myProPage">목록</a>
        </div>
      </div>
    </div>
 

</body>
</html>