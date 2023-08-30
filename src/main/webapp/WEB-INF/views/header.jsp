<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // profile 버튼 클릭 시 setting box 토글
            $('.profile').click(function(e) {
                e.stopPropagation(); // 이벤트 버블링 방지
                $('#settingDiv').toggle();
            });

            // setting box 외의 영역을 클릭 시 setting box 닫기
            $(document).click(function(e) {
                if (!$(e.target).closest('#settingDiv').length && !$(e.target).closest('.profile').length) {
                    $('#settingDiv').hide();
                }
            });

            // alarm 버튼 클릭 시 alarm notice 토글
            $('.notice').click(function(e) {
                e.stopPropagation(); // 이벤트 버블링 방지
                $('#noticeDiv').toggle();
            });

            // alarm notice 외의 영역을 클릭 시 alarm notice 닫기
            $(document).click(function(e) {
                if (!$(e.target).closest('#noticeDiv').length && !$(e.target).closest('.alarm').length) {
                    $('#noticeDiv').hide();
                }
            });
        });

        $(document).on("click", ".approve", function() {
            var a_no = $(this).data("a_no"); // data-a_no 값을 가져옴
            var button = $(this); // 클릭된 버튼을 $button 변수에 저장
            console.log(a_no);
            $.ajax({
                url: "/acceptRequest",
                method: "POST",
                data: { a_no: a_no },
                success: function(response) {
                    console.log("response");
                    button.closest("tr").remove(); // 클릭된 버튼이 있는 <tr> 삭제
                },
                error: function(error) {
                    console.log("오류가 발생했습니다:", error);
                }
            });
            $(document).on("click", ".reject", function(){
                var a_no = $(this).data("a_no"); // data-a_no 값을 가져옴
                var button = $(this); // 클릭된 버튼을 $button 변수에 저장
                console.log(a_no);
                $.ajax({
                    url: "/rejectRequest",
                    method: "POST",
                    data: { a_no: a_no },
                    success: function(response) {
                        console.log("response");
                        button.closest("tr").remove(); // 클릭된 버튼이 있는 <tr> 삭제
                    },
                    error: function(error) {
                        console.log("오류가 발생했습니다:", error);
                    }
                })
            })
        });
    </script>
</head>
<body>
<!-- Header-->
<header>
    <div class="header-bar">
        <a href="myProPage.jsp" class="logo">
            <img src="./assets/logo-text.png" alt="로고" class="logo-img">
        </a>
		<!--  
        <div class = "notice">
            <div class="alarm-img">
                <img src ="./assets/alarm.png" alt="alaram-img">
            </div>
        </div>


        <div class ="notice-list" id="noticeDiv">
            <ul>
                <li>생성됐나 확인 </li>
                <c:forEach var="pl" items="${pl}">
                <li>{pl.a_nick}님이 스터디 가입을 희망합니다
                    <button class ="approve" data-a_no = "${pl.a_no}">수락</button>
                    <button class = "reject" data-a_no = "${pl.a_no}">거절</button>
                </li>
                </c:forEach>
            </ul>
        </div>
        -->
        <div class="profile">
            <div class="profile-img">
                <img src="./assets/logo.png" alt="profile-img"/>
            </div>
            
            <span>${n} 님,<br>환영합니다</span>
		
            <div class="setting-list" id="settingDiv">
                <ul>
                    <li><a href="/myPage" class="setting-link">설정하기</a></li>
                    <li><a href="/main" class="setting-link">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
</body>
</html>