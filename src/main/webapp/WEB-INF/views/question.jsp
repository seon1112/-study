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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Code+Pro%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="./styles/question.css"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  function questionDelete(b_no) {
	    var re = confirm('정말로 삭제할까요?');
	    if (re == true) {
	      location.href = "questionDelete?b_no=" + b_no;
	    }
	  }

	  function commentDelete(c_no, b_no) {
	    var re = confirm('정말로 삭제할까요?');
	    if (re == true) {
	      location.href = "commentDelete?c_no=" + c_no + "&b_no=" + b_no;
	    }
	  }

	  // 수정 버튼 클릭시 input이 변경되는 함수
	  function commentEdit(c_no, c_content) {
	    console.log("수정 버튼 클릭됐음");
	    console.log(c_no);
	    var updateInput = $("#c_content_" + c_no);
	    console.log(updateInput);
	    updateInput.removeAttr('readonly');
	    //수정 버튼 사라지게 하기
	    $(".editLink[data-comment-id='" + c_no + "']").hide();
	    //수정 완료 버튼 나타나기~
	    $(".editCompleteLink[data-comment-id='" + c_no + "']").show();
	  }
	  
	  function commentEditComplete(c_no) {
		  console.log("수정완료 눌렸다!")
		    var updatedContent = $("#c_content_" + c_no).val();
			console.log(updatedContent);
		    
		    // Ajax 통신으로 c_no와 c_content를 컨트롤러로 보냄
		    $.ajax({
		      url: "/commentUpdate", // 수정 내용을 업데이트하는 서버 엔드포인트 URL
		      data: { c_no: c_no, c_content: updatedContent},
		      success: function (data) {
		        // 서버에서 응답 받은 후 수행할 작업 (예: 업데이트된 내용을 화면에 반영)
		        console.log("댓글 업데이트 성공");
		        console.log(data);

		        // 수정이 완료되면 다시 readonly 속성 추가
		        $("#c_content_" + c_no).attr('readonly', 'readonly');

		        // "수정" 버튼 보이기
		        $(".editLink[data-comment-id='" + c_no + "']").show();

		        // "수정완료" 버튼 숨기기
		        $(".editCompleteLink[data-comment-id='" + c_no + "']").hide();
		      },
		      error: function (error) {
		        // 에러 핸들링
		        console.error("댓글 업데이트 실패");
		        console.error(error);
		      }
		    });
		  }
  </script>
</head>
<body>
<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
   



<div id="content">
	<!-- 사이드 바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div>   
<div class="board-tNM">
  <div class="page-fXX">
    <div class="maincol-kSV">
      <div class="divrow-Dqs">
        <div class="frame-20-j3X">
          <div class="divpage-header-Rh3">
            <div class="divstudyitemuserinfo1kkga-h2H">
              <img class="icon-profile-circle-bdT" src="./images/${b.a_img }"/>
              <div class="item--64R">${b.a_nick }</div>
            </div>
            <div class="link-10951-ab-4-9YV">${b.b_date }</div>
          </div>
          <div class="divpage-header-TJH">
            <div class="right-zp1">
              <div class="heading-3--L7B">${b.b_title }</div>
              <div class="blockquote-pHF">${b.b_p_title }</div>
            </div>
            <!-- a_no가 같으면(질문 작성자이면) 수정, 삭제 보여라! -->
            <c:if test="${b.a_no==a}">
            <div class="left-3Qu">
              <div class="heading-3--Nxy"><a href="questionUpdate?b_no=${b.b_no}" style="text-decoration: none; color: inherit">수정</a></div>
              <div class="heading-3--tRX"><a href="#" onclick="questionDelete(${b.b_no})" style="text-decoration: none; color: inherit">삭제</a></div>
            </div>
            </c:if>	
          </div>
        </div>
        <div class="divpage-header-yxm">
          <div class="item--6nV">언어</div>
          <div class="blockquote-DMK">${b.b_p_lang }</div>
        </div>
        <div class="divpanel-gkh">
          <div class="divpanel-body-zFb">
            <div class="divcontent-kEm">
              <div class="ctrlz--VTF">${b.b_content }</div>
              
            </div>
            <div class="divcodemirror-2Lh">
            <jsp:include page="questionCode.jsp">
                    <jsp:param value="${b.b_code }" name="b_code"/>
                    <jsp:param value="${b.b_p_lang }" name="b_p_lang"/>
                    </jsp:include>
             
            </div>
          </div>
        </div>
      </div>
      
      <!-- 댓글 시작 -->
      <div class="divcontainer-xV7">
      <c:forEach var="c" items="${list }">
        <div class="divanswer-9772-gg1">
          <div class="divpage-header-p1X">
          <div style="display: flex;">
            <div class="divstudyitemuserinfo1kkga-vqF">
              <img class="icon-profile-circle-hzR" src="./assets/icon-profile-circle-GPT.png"/>
              <div class="item--RQd">${c.a_nick }</div>
            </div>
            <div class="link-10951-ab-4-XTf">${c.c_date }</div>
            </div>
            <!-- 작성자가 본인이면 수정, 삭제 뜨기 -->
            <c:if test="${c.a_no==a}">
          <div class="left-FNy">
              <div class="item--z5f">
              <button style="text-decoration: none; color: inherit; border: none; background-color: white; font-size: 1.5rem;
			  font-weight: 500;
			  line-height: 1.1725;
			  letter-spacing: -0.056rem;
			  color: #848484;" onclick="commentEdit(${c.c_no}, '${c.c_content}')" class="editLink" data-comment-id="${c.c_no}">수정</button>
              <button style="text-decoration: none; color: inherit; border: none; background-color: white; font-size: 1.5rem;
			  font-weight: 500;
			  line-height: 1.1725;
			  letter-spacing: -0.056rem;
			  color: #848484; display: none" class="editCompleteLink" data-comment-id="${c.c_no}" onclick="commentEditComplete(${c.c_no})">수정완료</button>
              </div>
              <div class="item--hEy"><a href="#" onclick="commentDelete(${c.c_no},${c.b_no })" style="text-decoration: none; color: inherit">삭제</a></div>
            </div>
            </c:if>
          </div>
          <input id="c_content_${c.c_no}" class="divmarkdown-3B7" value="${c.c_content }" type="text" readonly="readonly" data-comment-id="${c.c_no}">
        </div>
        </c:forEach>
        <!-- 답변 작성하기 -->
        <div class="divanswer-form-fWZ">
        <form action="insertComment" method="post">
        <input type="hidden" value="${b.b_no }" name="b_no">
          <div class="heading-5--nbB">답변 쓰기</div>
          <div class="form-ThK">
            <textarea name="c_content" class="textarea-caD" placeholder="답변을 입력하세요."></textarea>
            <div style="display: flex">
            <a href="questionBoard" class="input-em">목록으로</a>
            <input type="submit" class="input-emo" value="작성하기">
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>   
</body>