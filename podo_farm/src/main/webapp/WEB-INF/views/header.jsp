<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css" />
<title>Insert title here</title>
</head>
<body>
<!-- Header-->
<header>
    <div class="header-bar">
        <a href="#" class="logo">
            <img src="./assets/jh/logo-text.png" alt="로고" class="logo-img">
        </a>


        <button class="profile">
            <div class="profile-img">
                <img src="./assets/jh/logo.png" alt="profile-img"/>
            </div>
            <span>${a.a_nick}님,<br>환영합니다</span>
        </button>


        <button class="alaram">
            <img src="alarm.png" alt="alaram">
        </button>

    </div>

    <div class="menu-bar">
        <a href="#" class="edit-profile">프로필수정</a>
        <a href="#" class="edit-studygroup">스터디관리</a>
    </div>
</header>
</body>
</html>