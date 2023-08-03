<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style type="text/css">
#header, #footer {
	width: 100%;
	height: 20%;
	background-color: #e5e0f2;
}

#content {
	width: 100%;
	height: 60%;
}
</style>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>insertCoding</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C600" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans%3A400%2C600" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR%3A400" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/insertCoding.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#p_timer').keydown(function(e) {
			if (e.ctrlKey || e.metaKey) {
				return true;
			}

			if (e.which >= 37 && e.which <= 40) {
				return true;
			}

			if (e.which !== 8 && e.which !== 0 && e.key.match(/[^:0-9]/)) {
				return false;
			}
		})
				.keyup(
						function(e) {
							var $this = $(this);

							if (e.ctrlKey || e.metaKey || e.which === 8
									|| e.which === 0
									|| (e.which >= 37 && e.which <= 40)) {
								return true;
							}

							var ss = parseInt(this.selectionStart);

							var v = $this.val();
							var t = v.replace(/[^0-9]/g, '');
							var h = Math.max(0, Math.min(23, parseInt(t.substr(
									0, 2))));
							var m = Math.max(0, Math.min(59, parseInt(t
									.substr(2))));

							if (t.length < 3) {
								m = '';
							}

							var r;

							if (v.length === 2) {
								r = String('0' + h)
										.substr(String(h).length - 1)
										+ ':';
								ss++;
							} else if (v.length >= 3 && v.length < 5) {
								r = String('0' + h)
										.substr(String(h).length - 1)
										+ ':' + m;
								ss++;
							} else if (v.length === 5) {
								r = String('0' + h)
										.substr(String(h).length - 1)
										+ ':'
										+ String('0' + m).substr(
												String(m).length - 1);
							}

							if (r && r !== $this.val()) {
								$this.val(r);
								this.selectionStart = this.selectionEnd = ss;
							}
						}).blur(
						function(e) {
							var $this = $(this);

							var v = $this.val();
							var t = v.replace(/[^0-9]/g, '');
							var h = Math.max(0, Math.min(23, parseInt(t.substr(
									0, 2))));
							var m = Math.max(0, Math.min(59, parseInt(t
									.substr(2)))) || 0;
							var r = '';

							if (!isNaN(h)) {
								r = String('0' + h)
										.substr(String(h).length - 1)
										+ ':'
										+ String('0' + m).substr(
												String(m).length - 1);
							}

							$this.val(r);
						});
	});
</script>
</head>
<body>
	<!-- header -->
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<!--  -->
	<!-- 사이드바 -->
	<div id="side">
		<jsp:include page="side.jsp" />
	</div>
	<!-- 메인 -->
	<!-- 변경된 db에 맞게 수정 -->
	<div class="code-Ek1" id="content">
		<form action="/insertCoding" method="post">
			<div class="maincol-Adf">
				<div class="maincode-5Vj">
					<div class="article-B2y">

						<div class="heading-1-iYh">푼 문제 등록</div>
						<div class="auto-group-sehf-VSy">
							<div class="heading-2-EfT">
								<!-- 문제 제목 https://jeremyrecord.tistory.com/18 -->
								<div class="performance-ngy">문제 제목</div>
								<input type="text" list="searchTitle" name="q_title" class="performancetext-Wss" />
								<datalist id="searchTitle">
									<c:forEach var="t" items="${list }">
										<option value="${t } "/>
									</c:forEach>
								</datalist>

							</div>
							<div class="heading-3-4Pb">
								<!-- 걸린 시간 -->
								<div class="class-2LR">문제 푸는데 걸린 시간</div>
								<input type="text" name="p_timer" id="p_timer"
									placeholder="HH:MM" maxlength="5" size="5"
									class="classtext-xjs" />
							</div>

							<div class="heading-3-4Pb">
								<!-- 문제 언어 -->
								<div class="class-2LR">문제 언어</div>
								<select name="p_lang" id="p_lang" class="classtext-xjs">
									<option value="Java">Java</option>
									<option value="JavaScript">JavaScript</option>
									<option value="C">C</option>
									<option value="C++">C++</option>
									<option value="C#">C#</option>
									<option value="Python">Python</option>
									<option value="Go">Go</option>
									<option value="Kotlin">Kotlin</option>
									<option value="Swift">Swift</option>
									<option value="Ruby">Ruby</option>
									<option value="MySQL">MySQL</option>
									<option value="Oracle">Oracle</option>
									<option value="Scala">Scala</option>
								</select>
							</div>
						</div>
						<div class="heading-4-6bB">
							<!-- 링크 -->
							<div class="question-esb">문제링크</div>
							<input type="text" name="p_link" class="questiontext-amF"
								style="font-size: 1.6rem;">
						</div>
						
					</div>
					<!-- 코드 -->
					<div class="code-pp1">
						<textarea rows="30" cols="195" name="p_code"></textarea>
					</div>
				</div>
				<!-- 목록버튼 -->
				<input type="submit" class="listbtn-95b" value="등록">
			</div>
		</form>
	</div>

</body>
</html>