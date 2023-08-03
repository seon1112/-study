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
  <title>StudyMaking</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400%2C700"/>
  <link rel="stylesheet" href="./styles/studymaking.css"/>
  <!-- 드롭다운  -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript">
  $(function($) {
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
	    this.updateStatus();
	  };
	  
	  CheckboxDropdown.prototype.updateStatus = function() {
	    var checked = this.$el.find(':checked');
	    
	    this.areAllChecked = false;
	    this.$checkAll.html('Check All');
	    
	    if(checked.length <= 0) {
	      this.$label.html('언어를 선택하세요');
	    }
	    else if(checked.length === 1) {
	      this.$label.html(checked.parent('label').text());
	    }
	    else if(checked.length === this.$inputs.length) {
	      this.$label.html('All Selected');
	      this.areAllChecked = true;
	      this.$checkAll.html('Uncheck All');
	    }
	    else {
	    	var selectedText = checked.map(function() {
	    	    return $(this).parent('label').text().trim();
	    	  }).get().join(', ');
	    	  this.$label.html(selectedText);
	    }
	    //선택한 언어 language에 hidden값으로 넣기
		   var lang= this.$label.html();
		    console.log(lang);
		    $('#language').val(lang);
	   
	  };
	  
	  CheckboxDropdown.prototype.onCheckAll = function(checkAll) {
	    if(!this.areAllChecked || checkAll) {
	      this.areAllChecked = true;
	      this.$checkAll.html('Uncheck All');
	      this.$inputs.prop('checked', true);
	    }
	    else {
	      this.areAllChecked = false;
	      this.$checkAll.html('Check All');
	      this.$inputs.prop('checked', false);
	    }
	    
	    this.updateStatus();
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
	  
	  //오늘 날짜 받아와서 yyyy-MM-dd로 형식 지정하는 곳
	  var currentDate = new Date();
	  var year = currentDate.getFullYear();
	  var month = String(currentDate.getMonth() + 1).padStart(2, '0');
	  var day = String(currentDate.getDate()).padStart(2, '0');
	  var formattedDate = year + '-' + month + '-' + day;

	  console.log(formattedDate);
	  $('#date').val(' '+formattedDate);
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
   	</div>
   	<!-- 메인본문 -->
<form action="insertStudy" method="post">
<div class="studymaking-Gzd">
  <div class="main-login-H93">
    <div class="auto-group-tnam-bRs">
      <div class="page-gWV">
        <div class="page-QSV">
          <div class="section-LL9">
            <div class="divpostregisterpostcontentwrapper3bxz6-Se5">
              <div class="spanpostregistersequencenc1px-Uam">1</div>
              <div class="heading-2--6MF">스터디 기본 정보를 입력해주세요.</div>
            </div>
            <div class="list-9qK">
              <div class="item-VPP">
                <div class="label--S3j">스터디명</div>
                <input type="text" name="s_name" class="divselectvalue-container-ST3" placeholder=" 스터디명을 입력하세요" />
              </div>
              <div class="item-t49">
                <div class="label--e3K">모집 인원</div>
                <input type="number" name="s_member" class="divselectvalue-container-5eR" placeholder=" 2~20" min="1" max="20"/>
              </div>
            </div>
            <div class="list-LKT">
              <div class="item-Gyo">
                <div class="label--QKK">스터디 시작일</div>
                <div class="divselectcontrol-iqo">
                <input type="text" id="date" name="s_o_date" class="divselectvalue-container-rh7" readonly="readonly"/>          
                  </div>
                </div>
              
              <div class="item-UTb">
                <div class="label--3Fo">스터디 종료일</div>
                <div class="divselectcontrol-Nos">
                <input type="date" name="s_e_date" class="divselectvalue-container-u37" data-placeholder=" 스터디 종료일을 입력하세요"/>
                </div>
              </div>
            </div>
            <div class="list-ZG5">
              <div class="item-XCu">
                <div class="label--Feh">스터디 언어</div>
  
			<div class="dropdown" data-control="checkbox-dropdown" >
			  <label class="dropdown-label">언어를 선택하세요</label>
			  <input type="hidden" name="language" id="language">
			  
			  <div class="dropdown-list">
			    <a href="#" data-toggle="check-all" class="dropdown-option">
			      Check All  
			    </a>
			    
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
              <div class="item-frq">
                <div class="label--1vh">스터디 목표</div>
                    <input type="text" name="s_goal" class="divselectsingle-value-ym3" placeholder=" 목표를 입력하세요 ex) 하루에 한시간">
              </div>
            </div>
          </div>
          <div class="section-Ews">
            <div class="divpostregisterpostcontentwrapper3bxz6-yuT">
              <div class="spanpostregistersequencenc1px-fXP">2</div>
              <div class="heading-2--Uzd">스터디에 대해 소개해주세요.</div>
            </div>
            <div class="section-mD3">
              <div class="label--WgR">제목</div>
              <div class="input-RoP">
                <input type="text" name="s_title" class="pseudo-Yt1" placeholder=" 제목을 입력하세요">
              </div>
              <div class="divql-container-Ekq">
                
                <textarea name="s_content" id=""  class="item--JVo" placeholder=" 프로젝트에 대해 소개해주세요!"></textarea>
              </div>
            </div>
            <div class="section-Ju7">
              <input type="submit" class="button-KpD" value="스터디 등록"/>
              <a href="studySearching" class="button-3rh">취소</a>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</form>
</body>