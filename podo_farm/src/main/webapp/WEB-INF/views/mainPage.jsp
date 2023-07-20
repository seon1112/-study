<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023-07-17
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 클라이언트 ID 설정 -->

<head>
    <title>Title</title>
</head>
<meta name="google-sign-client_id" content="293359796739-nqi4o7fggg8tk269i7ci2i8ppsf8uoao.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/styles/mainpage.css">

<!-- 구글 계정 로드 스크립트 추가 -->
<script src="https://accounts.google.com/gsi/client" async defer></script>

<script>
    $(document).ready(function() {
        // 클릭 이벤트 핸들러 추가
        $('.login-button').click(function(){
            google.accounts.id.initialize({
                client_id: '293359796739-nqi4o7fggg8tk269i7ci2i8ppsf8uoao.apps.googleusercontent.com', // 클라이언트 ID 설정
                callback: handleCredentialResponse
            });
            google.accounts.id.prompt();
        });
    })

    // 구글 로그인 콜백 함수
    function handleCredentialResponse(response) {
        if (response.credential) {
            var credential = response.credential;
            console.log(credential);

            // 구글 사용자 고유 식별 정보 (ID 토큰)
            var id_token = credential.id_token;
             console.log(id_token);

             // 사용자 이메일 주소
             var email = credential.email;
             console.log(email);

            // 사용자 이름
            var displayName = credential.displayName;
             console.log(displayName);

             // 사용자 프로필 이미지 URL
               var profileImageUrl = credential.profilePicture;
             console.log(profileImageUrl);

        } else {
             // 로그인 실패 또는 사용자가 취소한 경우
            console.log('로그인 실패 또는 사용자가 취소함');
         }


     };
</script>

<body>
<!-- Header-->
<header>
</header>
<main>
    <div class = "container">
        <img src = "./assets/mainPagelogo.png" alt="로고" class = "container-logo">
          <div class = "container-text">
             <t1>알고리즘 스터디 공간</t1>
              <t2>프로그래머스 자동 커밋과 스터디를 구하는 가장 쉬운 방법 </t2>
        </div>
        <button class = "extension-button">포도팜 익스텐션 다운로드</button>
        <button class = "login-button">구글 로그인 하기</button>
    </div>
</main>
</body>
</html>