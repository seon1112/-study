<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>StudySearching</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C600%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500%2C600%2C700"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/studysearching.css" />
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  	var languagesImg;
  	var languagesImgArr;
  $(document).ready(function() {
	    var selectedBtns = [];
	    
	    $('.btn_language').click(function() {
	      
	      var lang = $(this).find('input').val();
	      
	      var selectedIndex = selectedBtns.indexOf(lang);
	      
	      if (selectedIndex > -1) {
	        $('.item-hQD').css('border', '0.1rem solid #d0d0d0');
	        selectedBtns.splice(selectedIndex, 1);
	      } else {
	        $('.item-hQD').css('border', '0.1rem solid #8A77A3');
	        selectedBtns.push(lang);
	      }
	      console.log(lang);
	      console.log(selectedBtns);
	      /*
	      $.ajax({
	    	  type:'post',
	    	  url:'/studySearching',
	    	  data: {selectedBtns:selectedBtns},
	    	  success:function(response){
	    		  
	    		  console.log(response)
	    	  }
	      });
	      */
	      
	    });
	    
	    languagesImg = $('#imgInput').val();
	    languagesImgArr = languagesImg.split(',');

	  });
	
  
  
  </script>
</head>
<body>
<div id="content">
<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
<!-- 사이드바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div> 
 <!-- 메인본문 -->
<div class="studysearching-16H">
  <div class="auto-group-xd9j-DjP">
    <div class="page-Ehf">
      <div class="maincol-Zzq">
        <div class="serch-gJm">
          <div class="item-mr1">
            <div class="studysearching-KsX">StudySearching</div>
            <div class="pseudo-4KK">
            </div>
          </div>
          <!-- 검색기능 -->
            <form action="studySearching" method="post">
          <div class="auto-group-oypz-oGu">
            <input type="search" name="keyword" class="rectangle-28-qUV"  placeholder="스터디명을 입력하세요">
            <input type="submit"  class="searchpng-jgM" value="">
            
          </div>
          </form>
        </div>
        <!-- 언어 버튼 -->
        
        <div class="list-KPf">
        <form action="studySearching" method="post">
          <div class="auto-group-eojf-q77">
            <div class="auto-group-5rbj-xSd">
            <div class="item-hQD">
              <img class="img_language" src="./assets/nodejssvg.png"/>
                <input type="submit" class="btn_language" value="Java" name="btn_lang" >
            </div>
              <div class="item-hQD">
                <img class="img_language" src="./assets/typescriptsvg-2Lh.png"/>
                <input type="submit" class="btn_language" value="JavaScript" name="btn_lang">
              </div>
              <div class="item-hQD">
                <img class="img_language" src="./assets/typescriptsvg-utd.png"/>
                <input type="submit" class="btn_language" value="C" name="btn_lang">
              </div>
              <div class="item-hQD">
                <img class="img_language" src="./assets/reactsvg.png"/>
                <input type="submit" class="btn_language" value="C++" name="btn_lang">
              </div>
              <div class="item-hQD">
                <img class="img_language" src="./assets/vuesvg.png"/>
                <input type="submit" class="btn_language" value="C#" name="btn_lang">
              </div>
              <div class="item-hQD">
              <img class="img_language" src="./assets/nextjssvg.png"/>
                <input type="submit" class="btn_language" value="Ruby" name="btn_lang">
            </div>
            <div class="item-hQD">
                <img class="img_language" src="./assets/nodejssvg-NKb.png"/>
                <input type="submit" class="btn_language" value="Swift" name="btn_lang">
              </div>
            <div class="item-hQD">
              <img class="img_language" src="./assets/nodejssvg-Ru3.png"/>
                <input type="submit" class="btn_language" value="Kotlin" name="btn_lang">
            </div>
            </div>
            <!-- 버튼 두번째줄 -->
            <div class="auto-group-8uqu-o1K">
              <div class="item-hQD">
                <img class="img_language" src="./assets/nestjssvg-5oX.png"/>
                <input type="submit" class="btn_language" value="Go" name="btn_lang">
              </div>
              <div class="item-hQD">
                <img class="img_language" src="./assets/nestjssvg.png"/>
                <input type="submit" class="btn_language" value="Oracle" name="btn_lang">
              </div>
               <div class="item-hQD">
                <img class="img_language" src="./assets/sveltesvg.png"/>
                <input type="submit" class="btn_language" value="Scala" name="btn_lang">
              </div>
              <div class="item-hQD">
              <img class="img_language" src="./assets/nestjssvg-vLZ.png"/>
                <input type="submit" class="btn_language" value="MySQL" name="btn_lang">
            </div>
            <div class="item-hQD">
                <img class="img_language" src="./assets/nestjssvg-Xdj.png"/>
                <input type="submit" class="btn_language" value="Python" name="btn_lang">
              </div>
            </div>
            </div>
          </form>
          </div>
          
        <div class="main-GGq">
          	<!-- 스터디 등록 버튼 -->
          	<!-- 스터디가 없으면(멤버가 아니면 보이게) -->
          	<c:if test="${r_ok<1}">
          <div class="divstudyorprojectcategoryitem36zgw-PMT">
	            <img class="svg-5EH" src="./assets/svg.png"/>
	            <div class="item--yaZ"><a href="studyMaking" style="text-decoration: none; color: #868e96">스터디 등록</a></div>
            
          </div>
          </c:if>
          <!--  스터디 리스트 시작 -->
          <div class="list-tSd">
            <div class="auto-group-653f-RSZ">
            <c:forEach var="s" items="${list }" varStatus="loop">
              <div class="link-Mb7">
                <div class="item-6Ho">
                  <div class="auto-group-kaed-3D3">
                    <div class="auto-group-cuwo-xL1">
                      <div class="c--RzH"><a href="studyDetail?s_no=${s.s_no } " style="text-decoration: none; color: #333333">${s.s_name }</a></div>
                      <div class="heading-1-41f"><a href="studyDetail?s_no=${s.s_no } " style="text-decoration: none; color: #333333">${s.s_title }</a></div>
                    </div>
                    <img class="emoji-grapes-Hv1" src="./assets/emoji-grapes-tyf.png"/>
                  </div>
                  <div class="divstudyitemschedule3oana-Py3">
                    <img class="icon-hourglass-start-2FK" src="./assets/icon-hourglass-start-dfF.png"/>
                    <div class="item--LG1">|</div>
                    <div class="item-20230701-T5j">${s.s_o_date }</div>
                  </div>
                  <div class="divstudyitemschedule3oana-xoB">
                    <img class="icon-hourglass-end-gjB" src="./assets/icon-hourglass-end-HXo.png"/>
                    <div class="item--Dz1">|</div>
                    <div class="item-20230731-NM7">${s.s_e_date }</div>
                  </div>
                  <div class="divstudyitemschedule3oana-UQ9">
                    <img class="icon-check-circle-yrh" src="./assets/icon-check-circle-roK.png"/>
                    <div class="item--6RX">|</div>
                    <div class="item--zmo">${s.s_goal }</div>
                  </div>
                  <div class="divstudyitemschedule3oana-UQ92">
                    <img class="icon-check-circle-yrh" src="./assets/alarm.png"/>
                    <div class="item--6RX">|</div>
                    <div class="item--zmo">${s.languages }</div>
                  </div>
                  <!--  
                  <div class="list-s4u">
                  <input type="hidden" value="${s.languagesImg }" id="imgInput">
                  
                	  <img class="typescriptsvg-YRw" src="./assets/typescriptsvg-uDb.png"/>
                
                  	
                    
                    <div class="javasvg-1aR">
                      <img class="vector-8Q9" src="./assets/vector-s8u.png"/>
                      <img class="mask-group-zSM" src="./assets/mask-group-c3j.png"/>
                    </div>
                  </div>
                  -->
                  <div class="section-h5s">
                    <div class="divstudyitemuserinfo1kkga-Led">
                      <img class="icon-profile-circle-fwo" src="./images/${s.a_img }"/>
                      <div class="item--Cwj">${s.a_nick }</div>
                    </div>
                    <img class="divstudyitemviewsandcomment1bxpj-JUy" src="./assets/divstudyitemviewsandcomment1bxpj-iem.png"/>
                    <!-- 인원수 추가.. -->
                    <div class="studyMember">${s.accessPeopleCnt }/${s.s_member }</div>
                  </div>
                </div>
              </div>
              <c:if test="${loop.index % 4 == 3 }">
              <div style="flex-basis: 100%; height:6rem;"></div>
              </c:if>
              </c:forEach>
              
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
</body>