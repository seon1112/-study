<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

<script type="text/javascript">
  
    
</script>
</head>
<body>
	 <div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
   	
   	
    <div class="code-Ek1" id="content" >
      <div class="maincol-Adf">
        <div class="maincode-5Vj">
          <div class="article-B2y">
          <!-- 문제이름  [Gold V] 적록색약 - 10026-->
            <div class="heading-1-iYh">[Level ${test.p_level}] ${test.p_title }</div>
            <div class="auto-group-sehf-VSy">
              <div class="heading-2-EfT">
              <!-- 성능요약 -->
                <div class="performance-ngy">성능 요약</div>
                <!-- 메모리  메모리: 20848 KB, 시간: 308 ms-->
                <div class="performancetext-Wss">메모리: ${test.p_memory }, 시간: ${test.p_time }</div>
              </div>
              <div class="heading-3-4Pb">
               <!-- 걸린 시간 -->
                <div class="class-2LR">걸린 시간</div>
                <div class="classtext-xjs">${test.p_timer }</div>
              </div>
            </div>
            <div class="heading-4-6bB">
             <!-- 문제설명 -->
              <div class="question-esb">문제 설명</div>
              <div class="questiontext-amF">
              ${test.p_content }
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
        <!-- 목록버튼 -->
        <a class="listbtn-95b" href="myProPage">목록</div>
      </div>
    </div>
 

</body>
</html>