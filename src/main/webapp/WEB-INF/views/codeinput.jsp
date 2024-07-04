<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 헤더 라인 -->
<head>
  <!-- 타이틀 -->
  <title>Source highlight test</title>
  <!-- 하이라이트 rainbow 스타일 라이브러리 -->
  <link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/vs.min.css">
  <!-- 메시지 알람 라이브러리 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
  <!-- 아이콘 라이브러리 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- 하이라이트 줄 넘버 스타일-->
  <style>
    /* 숫자 스타일 */
    .hljs-ln-numbers {
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -khtml-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      /* 가운데 정렬 */
      text-align: center;
      /* 글자 색 설정 */
      color: #ccc;
      /* 오른쪽 선 설정 */
      border-right: 1px solid #CCC;
      /* 세로 정렬 */
      vertical-align: top;
      /* 오른쪽 여백 */
      padding-right: 10px !important;
      /* 글자 사이즈 */
      font-size: 20pt;
      /* 라인 높이 */
      line-height: 40px;
    }
    /* 코드 스타일 */
    .hljs-ln-code {
      /* 왼쪽 여백 */
      padding-left: 20px !important;
      /* 글자 사이즈 */
      font-size: 20pt;
      /* 공백 설정 */
      white-space: pre-wrap;
      /* 라인 높이 */
      line-height: 40px;
    }
  </style>
  <style>
    /* pre 태그 스타일*/
    pre {
      /* 화면*/
      display: block;
      /* 글자 크기 */
      font-size: 20px;
      /* 라인*/
      line-height: 1.42857143;
      /* 글자 크기 */
      color: #333;
      /* 글자가 테이블을 넘어서면 자르기 */
      word-break: break-all;
      word-wrap: break-word;
      /* 테두리 색깔 설정 */
     /* background-color: #f5f5f5;*/
      /* 테두리 색깔 설정 */
    /*  border: 1px solid #ccc;*/
      /* 선 모서리 스타일 */
      border-radius: 4px;
      /* 여백 */
    /*  margin: 10px 0px;*/
      /* 여백 */
      padding: 0px;
      /* 메테리얼 스타일 (그림자 설정) */
     /* box-shadow: 1px 2px 4px;*/
    }
    /* 타이틀 스타일 */
    .code-title {
      /* 배경색 설정 */
      background-color: #e9e9e9;
      /* 왼쪽 오른쪽 여백*/
      padding-left: 10px;
      padding-top: 5px;
      /* 글자 색 */
      color:black;
      /* 글자 두께*/
      font-weight: 900;
    }
    /* copy 버튼 스타일*/
    .code-copy {
   	 /* 글자 사이즈 */
      font-size: 20pt;
      /* 오른쪽 정렬 */
      float: right;
      /* 상대적 위치 설정 */
      position: relative;
      /* 오른쪾에서의 위치 */
      right: 10px;
      /* 위쪽 여백 설정 */
      padding-top: 2px;
      /* 글자 색깔 */
      color: #337ab7;
      /* 텍스트 밑줄 없애기 */
      text-decoration: none;
      /* 배경 색깔*/
      background-color: transparent;
    }
  </style>
</head>
<!-- 바디 라인 -->
<body>
  <!-- 소스 표시 영역 -->
  <!-- code 태그에 class에 표시할 언어를 설정한다. -->
  <!-- code 태그 안에 소스 코드를 입력합니다만, 스페이스와 탭 영역을 주의해서 입력한다. -->
  <!-- data-type은 타이틀 제목이다. -->
  <pre>
  	<!-- 언어 변경하기 -->
  	<code class="${param.p_lang }" data-type="test">
  	<!-- 코드 적는곳 -->
  	<input type="text">
	</code>
  </pre>
  <!-- Jquery 추가 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <!-- 메시지 라이브러리 추가 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <!-- 하이라이트 라이브러리 -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
  <!-- 줄(라인) 넘버 라이브러리 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlightjs-line-numbers.js/2.8.0/highlightjs-line-numbers.min.js"></script>
  <!-- 하이라이트 라이브러리 실행 -->
  <script>hljs.initHighlightingOnLoad();</script>
  <!-- 줄(라인) 넘버 라이브러리 실행 -->
  <script>hljs.initLineNumbersOnLoad();</script>
  <script>
    /* 실행 함수 */
    (function (obj) {
      /* 페이지 로드 완료되면 실행*/
      $(obj.onLoad);
    })({
      onLoad: function () {
        /* 하이라이트 코드 스타일 설정 */
        $("pre code.hljs").each(function () {
          /* copy 버튼 만들기 */
          $(this).before($("<a href='java:void(0);' class='code-copy'><i class='fa fa-copy'></i>Copy!</a>"));
          /* 타이틀 만들기 */
          $(this).before($("<div class='code-title'></div>")
               .append($("<i class='fa fa-minus-square code-collapse' style='margin-right:10px;'></i>"))
               .append(" [코드 보기] " + $(this).data("type")));
          /* 클래스 추가 */
          $(this).parent().addClass("code-view");
        });
        
        /* copy 버튼을 클릭했을 경우 */
        $(document).on("click",'.code-copy', function(){
          /* escape 문자 치환하기 */
          function escapeHTML(str) {
            return str.replace(/&/g, "&").replace(/</g, "<").replace(/>/g, ">").replace(/"/g, "\"").replace(/'/g, "'");
          }
          /* code-view 클래스를 찾는다. */
          $parent = $(this).closest(".code-view");
          /* collapse로 코드 화면이 닫겨져 있을 때*/
          if($parent.hasClass("code-view-disabled")){
            /* 펼친다. */
            $i = $parent.find("i.code-collapse");
            /* -에서 + 버튼으로 교체*/
            $i.removeClass("fa-plus-square");
            $i.addClass("fa-minus-square");
            /* 화면 표시*/
            $parent.removeClass("code-view-disabled");
          }
          /* 메시지 표시*/
          toastr.success(null,"소스가 복사되었습니다.", {timeOut: 700});
          /* code 태그를 찾는다. */
          var code_element = $(this).closest("pre").find("code")[0];
          /* 연속 개행일 경우 수정한다. */
          var value = code_element.innerText.replace(/\n\n/ig, '\n').replace(/\n\n\n/ig, '').replace('  \n','').replace(/\t/ig, '');
          /* 셀렉션 취득 */
          var selection = window.getSelection();
          /* body 태그 찾는다. */
          var body_element = document.getElementsByTagName('body')[0];
          /* div 태그 생성*/
          var newdiv = document.createElement('div');
          /* 절대 위치로 브라우져에 보이지 않는 곳에 생성*/
          newdiv.style.position = 'absolute';
          newdiv.style.left = '-10000px';
          newdiv.style.top = '-10000px';
          /* body 태그에 div 태그 추가 */
          body_element.appendChild(newdiv);
          /* 복사해 온 값을 표시한다. */
          newdiv.innerHTML = "<pre>" + escapeHTML(value) + "</pre>";
          /* 선택한다.*/
          selection.selectAllChildren(newdiv);
          /* 10초 후에 div 태그 삭제한다.*/
          setTimeout(function(){
            newdiv.remove();
          },10000);
          /* 복사한다.*/
          document.execCommand('copy');
        });
      }
    });
  </script>
</body>
</html>