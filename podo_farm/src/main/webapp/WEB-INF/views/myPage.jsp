<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/styles/mypage.css?after">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            $('.image-edit-button').click(function() {
                // 파일 찾아보기 창 열기
                $('<input type="file" name="uploadFile">').change(function(event) {
                    var uploadFile = event.target.files[0];
                    console.log(uploadFile);

                    // Ajax 통신으로 이미지 업로드
                    var formData = new FormData();
                    formData.append('imageFile', uploadFile);
                    console.log(formData);
                    $.ajax({
                        url: '/uploadImage', // 이미지 업로드를 처리하는 엔드포인트 URL
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            // 이미지 업로드 성공 시 이미지를 보여주는 요소의 src 업데이트
                            $('.image-box').attr('src', response.url);
                        },
                        error: function() {
                            // 이미지 업로드 실패 시 오류 처리
                            console.log('이미지 업로드 실패');
                            alert('이미지 업로드에 실패했습니다.');
                        }
                    });
                }).click();
            });

            $('.complete').click(function() {
                submitForm();
            });

            function submitForm() {
                // 폼 전송 처리 로직을 추가하세요.
            }
        });
    </script>

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
            <span>${a_nick}님,<br>환영합니다</span>
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

<main>
    <div class="edit-image">
        <div class="title-image">
            내 정보 수정
        </div>
        <div class="edit-box">
            <div class="image-box">
                <img src="images/${a_img}"> <!-- 등록된 이미지 불러오기-->
            </div>
            <div class="image-edit-box">
                <button class="image-edit-button">이미지 수정</button>
                <button class="image-edit-button">이미지 제거</button>
            </div>
        </div>
        <div class="edit-nickname">
            <div class="nick-name">
                닉네임
                <input type="text" class="input" placeholder="PODO FARM 에서 이용되는 닉네임입니다">
            </div>
            <div class="save-box">


                <button class="complete" type="submit">
                    완료
                </button>
                <a href="#" class="delete-account">
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