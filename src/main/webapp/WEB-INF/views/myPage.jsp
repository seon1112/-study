<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/styles/mypage.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    $(document).ready(function() {
      $('.image-edit-button').click(function() {
        // 파일 찾아보기 창 열기
        $('#uploadFile').click();
      });


      // 닉네임 완료 버튼 클릭 이벤트
      $('.complete-nickname').click(function(e) {
        e.preventDefault(); // 기본 동작(페이지 이동)을 막음
        var newNickname = $('.input').val(); // 입력한 닉네임 가져오기
        var aNo = ${a.a_no}; // a_no 값 가져오기

        // AJAX 요청으로 닉네임 업데이트
        $.ajax({
          url: '/updateNickname',
          type: 'POST',
          data: {
            a_no: aNo,
            nickname: newNickname
          },
          success: function(response) {
            if (response === 'success') {
              alert('닉네임이 성공적으로 업데이트되었습니다.');
              // 닉네임이 성공적으로 업데이트되면 페이지를 새로고침하여 변경된 닉네임을 보여줍니다.
              location.reload();
            } else {
              alert('닉네임 업데이트에 실패하였습니다.');
            }
          },
          error: function(xhr, status, error) {
            alert('서버 오류로 인해 닉네임 업데이트에 실패하였습니다.');
          }
        });
      });

      $('#uploadFile').change(function(event) {
        var uploadFile = event.target.files[0];
        var formData = new FormData();
        formData.append('uploadFile', uploadFile);

        // a_no 값을 가져와서 formData에 추가
        var aNo = ${a.a_no}; // 적절한 a_no 값을 설정
        formData.append('a_no', aNo);

        $.ajax({
          url: '/uploadFile', // 이미지 업로드를 처리하는 컨트롤러의 URL
          type: 'POST',
          data: formData,
          processData: false,
          contentType: false,
          success: function(response) {
            console.log('이미지 업로드 완료!');
            // 업로드한 이미지를 화면에 표시하거나 기타 동작을 수행합니다.
          },
          error: function(xhr, status, error) {
            console.error('이미지 업로드 오류:', error);
          }
        });
      });

      // 완료 버튼 클릭 이벤트
      $('.complete').click(function(e) {
        e.preventDefault(); // 기본 동작(페이지 이동)을 막음
        $('#uploadFile').trigger('change');
        // 파일 선택 이벤트를 트리거
      });

      $(document).ready(function() {
        // profile 버튼 클릭 시 setting box 토글
        $('.profile').click(function() {
          $('.setting-div').toggle();
        });
      });
    });
  </script>
</head>
<body>
<!-- Header-->
<header>
  <div class = "header-bar">
    <a href ="#" class = "logo">
      <img src="./assets/logo-text.png" alt="로고" class = "logo-img">
    </a>


    <button class = "profile">
      <div class = "profile-img">
        <img src="./assets/logo.png" alt="profile-img"/>
      </div>

      <span>${n}님,<br>환영합니다</span>
   
    </button>

  </div>

  <div class="menu-bar">
    <a href = "#" class = "edit-profile">프로필수정</a>
    <a href = "/myPageStudy" class = "edit-studygroup">스터디관리</a>
    <div class = "setting-div">
      <div class = "setting-box">
        <a href = "/myPage">설정하기</a>
      </div>
      <div class = "setting-box">
        <a href = "/main">로그아웃</a>
      </div>
    </div>
  </div>

</header>

<main>
    <div class="edit-image">
      <div class = "title-image">
        내 정보 수정
      </div>
      <div class = "edit-box">
        <div class = "image-box">
          <img src = "./images/${a.a_img}"> <!-- 등록된 이미지 불러오기-->
        </div>
        <div class = "image-edit-box">
          <button class = "image-edit-button">이미지 수정</button>
          <input type="file" name="uploadFile" id="uploadFile" style="display: none">
          <button class = "image-edit-button">이미지 제거</button>
        </div>
      </div>
      <div class="edit-nickname">
        <div class="nick-name">
          닉네임
          <input type="text" class="input" placeholder="PODO FARM에서 이용되는 닉네임입니다">
        </div>
        <div class="save-box">
          <a href="#" class="complete-nickname">
            닉네임 완료
          </a>
          <!-- 이미지 업로드 완료 버튼 -->
          <a href="/uploadFile" class="complete">
            이미지 완료
          </a>
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