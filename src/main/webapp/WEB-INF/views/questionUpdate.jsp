<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
 #header, #footer{
      width: 100%;
      height: 20%;
      background-color: #e5e0f2;
   }
   
   #content{
      width:100%;
      height: 60%;
   }
</style>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>Question</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400%2C700"/>
  <link rel="stylesheet" href="./styles/questionMaking.css"/>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.5.0/highlight.min.js"></script> 
<!-- 하이라이트 rainbow 스타일 라이브러리 -->
  <link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/vs.min.css">
  <!-- 메시지 알람 라이브러리 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
  <!-- 아이콘 라이브러리 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- 하이라이트 줄 넘버 스타일-->
<script>hljs.initHighlightingOnLoad();</script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  $(function() {
	  var CheckboxDropdown = function(el) {
	    var _this = this;
	    this.isOpen = false;
	    this.areAllChecked = false;
	    this.$el = $(el);
	    this.$label = this.$el.find('.dropdown-label');
	    this.$checkAll = this.$el.find('[data-toggle="check-all"]').first();
	    this.$inputs = this.$el.find('[type="checkbox"]');
	    
	    this.onCheckBox();
	    
	    this.$label.on('click', function(e) {
	      e.preventDefault();
	      _this.toggleOpen();
	    });
	    
	    this.$checkAll.on('click', function(e) {
	      e.preventDefault();
	      _this.onCheckAll();
	    });
	    
	    this.$inputs.on('change', function(e) {
	      _this.onCheckBox();
	    });
	  };
	  
	  CheckboxDropdown.prototype.onCheckBox = function() {
	    this.limitCheckboxes();
	    this.updateStatus();
	  };
	  CheckboxDropdown.prototype.limitCheckboxes = function() {
		  var checked = this.$el.find(':checked');
		  if (checked.length > 1) {
		    checked.not(':first').prop('checked', false);
		  }
		};
	  
	  CheckboxDropdown.prototype.updateStatus = function() {
	    var checked = this.$el.find(':checked');
	    
	    this.areAllChecked = false;
	    this.$checkAll.html('Check All');
	    
	    if(checked.length <= 0) {
	      this.$label.html($('#lang').val());
	    }
	    else if(checked.length === 1) {
	      this.$label.html(checked.parent('label').text());
	    }
	    
	    //선택한 언어 language에 hidden값으로 넣기
		   var b_p_lang= this.$label.html();
		    console.log(b_p_lang);
		    $('#b_p_lang').val(b_p_lang);
		    //console.log(('#b_p_lang').val());
	   
	  };
	  
	  
	  
	  CheckboxDropdown.prototype.toggleOpen = function(forceOpen) {
	    var _this = this;
	    
	    if(!this.isOpen || forceOpen) {
	       this.isOpen = true;
	       this.$el.addClass('on');
	      $(document).on('click', function(e) {
	        if(!$(e.target).closest('[data-control]').length) {
	         _this.toggleOpen();
	        }
	      });
	    }
	    else {
	      this.isOpen = false;
	      this.$el.removeClass('on');
	      $(document).off('click');
	    }
	  };
	  
	  var checkboxesDropdowns = document.querySelectorAll('[data-control="checkbox-dropdown"]');
	  for(var i = 0, length = checkboxesDropdowns.length; i < length; i++) {
	    new CheckboxDropdown(checkboxesDropdowns[i]);
	  }
	  
	  $('#codeIn').on('input', function() {
		  var code = $('#codeIn').val();
		  var highlightedCode = hljs.highlightAuto(code).value;
		  $('#codeIn').html(highlightedCode);
		});
  });


  </script>
</head>
<body>
<!-- header -->
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>
   <!-- -->
   <div id="content">
	<!-- 사이드 바 -->
	<div id="side">
      <jsp:include page="side.jsp"/>
   	</div>
   	<!-- 메인본문 -->
<div class="question-uJh">
  <div class="main-login-F7f">
    <div class="auto-group-kymb-BjP">
      <form action="updateQuestion" method="post">
      <input type="hidden" name="b_no" value="${b.b_no }">
      <div class="page-EsK">
        <div class="page-msF">
          <div class="auto-group-mhgv-uCm">
            <div class="section-r81">
              <div class="divpostregisterpostcontentwrapper3bxz6-BAH">질문하기</div>
              <div class="list-Dsf">
                <div class="item-muB">
                  <div class="label--8Dw">질문 제목</div>
                  <input type="text" class="divselectcontrol-r9w" name="b_title" value="${b.b_title }">
                    
                  
                </div>
                <div class="item-EwB">
                  <div class="label--nC1">문제 제목</div>
                  <input type="text" name="b_p_title"  class="divselectcontrol-hZs"  value="${b.b_p_title }">
                    
                  
                </div>
              </div>
            </div>
            <div class="section-Cf3">
              <div class="label--6kR">질문 내용</div>
              <textarea name="b_content" class="divql-container-pwK">${b.b_content }</textarea>
              </div>
              
              <!-- 언어!!!! -->
              <div class="auto-group-7rgd-NbT">
                <div class="item-7J9">
                  <div class="label--eos">언어</div>
                  <div class="dropdown" data-control="checkbox-dropdown" >
			  <label class="dropdown-label">언어를 선택하세요</label>
			  <input type="hidden" name="lang" id="lang" value="${b.b_p_lang }">
			  <input type="hidden" name="b_p_lang" id="b_p_lang">
			  
			  <div class="dropdown-list">
			   
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 1" />
			      Java
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 2" />
			      JavaScript
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 3" />
			      C
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 4" />
			      C++
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 5" />
			      C#
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 6" />
			      Python
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 7" />
			      Go
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 8" />
			      Kotlin
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 9" />
			      Swift
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 10" />
			      Ruby
			    </label>
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 11" />
			      MySQL
			    </label>      
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 12" />
			      Oracle
			    </label>   
			    
			    <label class="dropdown-option">
			      <input type="checkbox" name="dropdown-group" value="Selection 13" />
			      Scala
			    </label>   
			  </div>
			</div>

              </div>
                  
                </div>
            
              <div class="divql-container-RLm">
                <div class="label--5nh">코드</div>
                
                <textarea name="b_code" id="codeIn" class="divql-editor-aUZ" placeholder="코드를 입력하세요">${b.b_code }</textarea>
				
				
              </div>
          <div class="section-BDT">
            <div class="button-hhb"><a href="question?b_no=${b.b_no }" style="text-decoration: none; color: inherit">취소</a></div>
            <input type="submit" class="button-C8Z" value="글 수정">
          </div>
            </div>
          </div>
        </div>
          </form>
      </div>
	</div>
	</div>

</body>