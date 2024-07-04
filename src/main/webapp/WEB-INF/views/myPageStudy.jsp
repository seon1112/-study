<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023-07-21
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/styles/mypage.css?after">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            console.log("이것도안찍히나/");
            console.log("${lf.a_nick}");
            $('.delete-account').click(function() {
                if (confirm("회원탈퇴 하시겠습니까?")) {
                    // 확인시 윈도우 이동하기
                    window.location.href = '/deletePage';
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
<header>
    <div class="header-bar">
        <a href="myProPage" class="logo">
            <img src="./assets/logo-text.png" alt="로고" class="logo-img">
        </a>

        <button class="profile">
            <div class = "profile-img">
                <img src="./images/${a.a_img}" alt="profile-img"/>
            </div>
            <span>${n}님,<br>환영합니다</span>
        </button>


    </div>

    <div class="menu-bar">
        <a href="/myPage" class="edit-profile">프로필수정</a>
        <a href="/myPageStudy" class="edit-studygroup">스터디관리</a>
    </div>
</header>

<main>
    <div class="study-main">
        <div class="title-image">
            내 스터디 현황
        </div>
        <div class="study-box">
            <div class= "study-title-box">
                <h2>스터디명</h2>
            </div>
            <div class = "leader-box">
                <table class = "memeber-table">
                    <colgroup span="7" class="table-column"></colgroup>
                    <tr>
                        <th>구 분</th>
                        <th>이 름</th>
                        <th>푼 문제수</th>
                        <th>프로그래머스 점수</th>
                        <th>정복레벨</th>
                        <th>깃허브주소</th>
                        <th>가입날짜</th>
                        <th>기능</th>
                    </tr>

                    <tr class = "table-leader">
                        <td>방 장</td>
                        <td>${lf.a_nick}</td>
                        <td>${lf.ct}</td>
                        <td>${lf.a_programmers}</td>
                        <td>${lf.a_level}</td>
                        <td>${a_git}</td>
                        <td>${lf.s_a_regdate}</td>
                        <td></td>
                    </tr>
                    <!--
                    <-- 방장이 아닐 때 -->
                    <c:forEach var="lu" items="${lu}">
                        <tr class = "table-memeber">
                            <td></td>
                            <td>${lu.a_nick}</td>
                            <td>${lu.ct}</td>
                            <td>${lu.a_programmers}</td>
                            <td>${lu.a_level}</td>
                            <td>${lu.a_git}</td>
                            <!--     <td>${lu.s_a_regdate}</td>-->
                            <td></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

        </div>
        <div class="study-allowed">
            <div class="nick-name">
                스터디 가입승인
            </div>
            <div class = "allowed-box">
                <table class = "permission-table">
                    <colgroup span="7" class="table-column"></colgroup>
                    <tr>
                        <th>닉네임</th>
                        <th>프로그래머스 점수</th>
                        <th>정복레벨</th>
                        <th>깃허브주소</th>
                        <th>승인</th>
                        <th>거절</th>

                    </tr>

                    <c:forEach var="pl" items="${pl}">
                        <tr class = "permission-user-list">
                            <td>${pl.a_nick}</td>
                            <td>${pl.a_programmers}</td>
                            <td>${pl.a_level}</td>
                            <td>${pl.a_git}</td>
                            <td>
                                <button class ="approve" data-a_no = "${pl.a_no}">수락</button>
                            </td>
                            <td>
                                <button class = "reject" data-a_no = "${pl.a_no}">거절</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="save-box">

            <button class="complete" type="submit">
                스터디 나가기
            </button>
            <button class="delete-account">
                회원탈퇴
            </button>
        </div>
    </div>
</main>

<footer>
</footer>
</body>
</html>