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
  <title>Board</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A400%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans%3A400%2C700"/>
  <link rel="stylesheet" href="./styles/board.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
	//---문제 선택시 codepage로 이동
	
	  function selectQuestion(b_no){
	     var b_no = b_no;
	     console.log("클릭됨");
	     window.location.href = "question?b_no=" + b_no;
	     console.log("클릭됨");
	  }
	
  </script>
</head>
<body>
<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
   <!-- -->
   <div id="content">
	<!-- 사이드 바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
   	<!-- 메인본문 -->
<div class="board-moX">
  <div class="main-login-GVP">
    <div class="auto-group-zwn9-BLm">
      <div class="page-xGH">
        <div class="maincol-su3">
          <div class="list-nFK">
            <div class="item-HSy">
              <div class="board-RJH">Board</div>
              <div class="pseudo-Yth">
              </div>
            </div>
            <!-- 검색 기능 -->
            <form class="auto-group-azdx-hWh" action="questionBoard" method="post">
              
              <input  type="search" name="keyword" class="rectangle-28-igh" placeholder="문제제목을 입력하세요">
              <input  type="submit" class="searchpng-EFj" value="">
              
            </form>
          </div>
          <div class="divrow-CLy">
          <div style="width: 100%; display: flex; justify-content: flex-end; flex-direction: row;">
            <div class="item--WcZ"><a href="questionMaking" style="text-decoration: none; color: inherit">글쓰기  | </a></div>
            <div class="item--WcZ"><a href="questionBoard?a_no=${a_no }" style="text-decoration: none; color: inherit">내 질문만 보기</a></div>
            </div>
            <div class="container mt-3" style="max-width:100%;">
            
  <table class="table table-hover">
    <thead class="theadCss">
      <tr>
        <th>제목</th>
        <th>문제 제목</th>
        <th>언어</th>
        <th>작성자</th>
        <th>댓글</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody class="tbodyCss">
    <c:forEach var="b" items="${list }">
      <tr onclick="selectQuestion(${b.b_no})" >
        <td>${b.b_title }</td>
        <td>${b.b_p_title }</td>
        <td>${b.b_p_lang }</td>
        <td>${b.a_nick }</td>
        <td>${b.commentCnt }</td>
        <td>${b.b_date }</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
            <div class="nav-pagination-navigation-list-SZo">
            <c:forEach var="i" begin="1" end="${totalPage }">
		<a href="questionBoard?pageNUM=${i }" class="item-button-go-to-page-2-2-Jtq" id="paging">${i }</a>&nbsp;
	</c:forEach>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>