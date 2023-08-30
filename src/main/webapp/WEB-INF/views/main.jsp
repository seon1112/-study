<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 클라이언트 ID 설정 -->
<head>
    <title>Title</title>
</head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/styles/main.css">

<!-- 구글 계정 로드 스크립트 추가 -->
<script src="https://accounts.google.com/gsi/client" async defer></script>

<script>
    // 윈도우 로드 시 호출될 함수
    $(window).on('load', function() {
        google.accounts.id.initialize({
            client_id: '293359796739-nqi4o7fggg8tk269i7ci2i8ppsf8uoao.apps.googleusercontent.com',
            callback: handleResponse,
            auto_select: true
        });
        google.accounts.id.prompt();
    });
    // 구글 로그인 콜백 함수

    function decodeJwtResponse(token) {
        let base64Url = token.split('.')[1]
        let base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        let jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload)
    }


    window.handleResponse = function(response) {
        // decodeJwtResponse() is a custom function defined by you
        // to decode the credential response.

        console.log(response);  // response 객체 확인

        responsePayload = decodeJwtResponse(response.credential);
        console.log("ID: " + responsePayload.sub);
        console.log('Full Name: ' + responsePayload.name);
        console.log('Given Name: ' + responsePayload.given_name);
        console.log('Family Name: ' + responsePayload.family_name);
        console.log("Email: " + responsePayload.email);

        //데이터 넘기기
        var data = {
            email: responsePayload.email,
            name: responsePayload.name
        }

        fetch('/loginPODOFAM', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => response.text()) // response.json() 대신 response.text()를 사용합니다.
            .then(data => {
                // 서버 응답 처리
                console.log(data);
            })
            .catch(error => console.error('Error:', error));
    }

</script>

<body>
<!-- Header-->
<header>
</header>
<main>
    <div class = "container">
        <img src = "./assets/logo-text.png" alt="로고" class = "container-logo">
        <div class = "container-text">
            <h1>알고리즘 스터디 공간</h1>
            <h2>프로그래머스 스터디를 구하는 가장 쉬운 방법!! </h2>
        </div>
        <a href ="/myProPage" class= "logout-button">포도팜 화면으로 바로가기</a>

        <div id="g_id_onload"
             data-client_id="293359796739-nqi4o7fggg8tk269i7ci2i8ppsf8uoao.apps.googleusercontent.com"
             data-context="signup"
             data-ux_mode="popup"
             data-callback="handleResponse"
             data-auto_prompt="false">
        </div>

        <div class="g_id_signin"
             data-type="standard"
             data-shape="rectangular"
             data-theme="outline"
             data-text="signin_with"
             data-size="large"
             data-logo_alignment="left">
        </div>
    </div>
</main>
</body>
</html>