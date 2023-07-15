<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<!-- Header-->
<header>
    <div class = "header-bar">
        <a href ="#" class = "logo">
            <img src="./assets/logo-text.png" alt="로고" class = "logo-img">
        </a>

        <div >
            <button class = "light-dark-mode">라이트 다크모드</button>
        </div>

        <div class = "profile">
            <div>이미지사진</div>
            <button>프로필</button>
        </div>
        <div class="alaram">
            <button></button>
        </div>
    </div>

    <div class="menu-bar">
        <a href = "#" class = "edit-profile">프로필수정</a>
        <a href = "#" class = "edit-studygroup">스터디관리</a>
    </div>
</header>

<main>
    <div class="edit-image">
        <div class = "title-image">
            내 정보 수정
        </div>
        <div class = "edit-box">
            <div class = "image-box">
                <img src = "logo.png">
            </div>
            <div class = "image-edit-box">
                <button class = "image-edit-button">이미지 수정</button>
                <button class = "image-edit-button">이미지 제거</button>
            </div>
        </div>
        <div class="edit-nickname">
            <div class = "nick-name">
                닉네임
                <input type = "text" class="input" placeholder="PODO FARM 에서 이용되는 닉네임입니다">
            </div>
            <div class = "save-box">
                <a href ="#" class = "complete">
                    완료
                </a>
                <a href="#" class = "delete-account">
                    회원탈퇴
                </a>
            </div>
        </div>
    </div>



</main>

<footer>
</footer>
</body>
</html>