<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Regist Form</title>
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/project/pr_registForm.css'/>"/>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  
<style>
.pr_regist .techstacklist{
              display : flex;      /* ... */
              flex-wrap :wrap;
			  width: 360px;
		 	  margin-left: 148px;
                            }
.pr_regist .techstacklist > li{
              width : 100px;
              height : 50px;
              text-align: center;
                                   }


</style>
<script>
          $(document).ready(function()
            {
        	  document.getElementById("techstack_hidden_show").style.display = "none";
        	          	  
        	  <%--프로젝트명 추가부분, 프로젝트 등급 버튼 --%>
        	  var ul = document.querySelector('.techstacklist'); 
 		     $('.gradebtn').click(function(){
                       var text =  $(this).val();
                       $('#project_grade').val(text);
                   });
   
            
              <%--값 전송 버튼 시작 --%>  
 		      $("#btnSave").click(function(){
                    var project_name = $("#project_name").val();
                    var project_content = $("#project_content").val();
                    var project_term1 = $("#project_term1").val();
                    var project_term2 = $("#project_term2").val();
                    
                    console.log(project_name);
                    console.log(project_content);
                    console.log(project_term1);
                    console.log(project_term2);
                    
                    if(project_name === ""){
                        alert("프로젝트 제목을 입력하세요");
                        document.form1.project_name.focus();
                        return;
                    }
                    if(project_content === ""){
                        alert("프로젝트 내용을 입력하세요");
                        document.form1.project_content.focus();
                        return;
                    }
                  
                    if(project_term1 === ""){
                    	alert("프로젝트 시작 날짜를 입력하세요");
                    	document.form1.project_term1.focus();
                    	return;
                    }
                    
                    if(project_term2 === ""){
                    	alert("프로젝트 종료 날짜를 입력하세요");
                    	document.form1.project_term2.focus();
                        return;
                    }
                      

                    
                    
                    document.form1.submit();
                });  
                     <%--값 전송 및 유효성 검증 종료 --%>            
            
            	
                  <%--테크스택 체크박스 로직 시작 --%>   
                  $('input:checkbox[name="techstack"]').on('click', function(){      //테크스택 체크박스를 클릭하면 아래의 매개변수를 생성하는데, 그 안에는 각각 작업하는 데 쓰일 태그가 담긴다.
                    var stacklist = document.createElement('li');                   
                    var stackText = document.createElement('span');
                    var stackbtn =  document.createElement('button');

                      if(this.checked)
                      {//checked 처리된 항목의 값
                          stacklist.appendChild(stackText);   //   <li><span></span></li>
                          stackText.textContent = this.value; //<li><span>입력된 값</span></li>
                          stacklist.appendChild(stackbtn);   // <li><span>입력된 값<button></button>X</span></li>
                          stackbtn.textContent = 'X';
                          stacklist.id = this.id +'li';

                          ul.appendChild(stacklist);
                          
                          stackbtn.onclick = function(e)    //X자 버튼을 누르면 ul에 담긴 요소들을 삭제한다.
                         {
                              ul.removeChild(stacklist);
                              var _subs = stacklist.id;
                              var subs = _subs.substring(0, _subs.length-2);
                              $('input:checkbox[id="'+ subs +'"]').prop('checked',false);
                              // $('input:checkbox[id="'+subs+'"]').checked =false;                   
                         } //end of stackbtn.onclick
                      }
                      else if(this.checked===false)
                      {  
                          $('#'+this.id+'li').remove();
                      }       

                  }); // end of input checkbox     
           


            
            
            
           
      /* ajax 검색 로직 추가 */           
    $(function() {   // <input>요소에 문자가 입력될 때마다 호출됨.
        $(".project_tech_name").keyup(function() {
				
        	
        	console.log('키이벤트작동하는가?');
        	
		        var tech_name_input = $('.project_tech_name').val();
        	    var param = "tech_name_input=" + tech_name_input;    //컨트롤러로 값을 넘기기 위해서 이름을 담은 매개변수 선언
         	console.log('값이 담기는가 :' +tech_name_input);
        	
         	$.ajax({ // Ajax 요청을 작성
         	    url: "${path}/project/autocomplete",
         	    data: param,
         	    method: "POST",
         	    success: function (result) {
         	        if (tech_name_input == "" || tech_name_input == null) {       // techstack 입력란이 비워져 있을 경우
         	        	document.getElementById("techstack_hidden_show").style.display = "hidden";  	        	                                                                 	 //start of if
         	            $('ul').empty();            
                      } else {                                                  //end of if and start of else
         	            var output = document.createElement('span');            //div에서 span으로 변경
         	            for (var i in result)                                   // result에서 받아온 값의 개수만큼 for문을 돌린다
         	            {
         	                var techName = result[i].tech_name_input;
         	                
         	                var listBtn = document.createElement('button');
         	               
         	               document.getElementById("techstack_hidden_show").style.display = "block";

         	               listBtn.textContent = techName;
         	                listBtn.type = 'button'; //버튼의 type을 button으로 지정해주어 눌렀을때 페이지전환을 막는다.
         	                listBtn.value = techName;
         	                listBtn.style.marginTop = '6px';
         	                listBtn.style.marginRight = '6px';
         	                listBtn.setAttribute('class', "techbuttons");  //각 버튼의 value를 지정한다.
         	                output.appendChild(listBtn);

         	                $(".techstacklist").html(output);

         	                $(".techbuttons").click(function () {                         //클래스가 techbuttons인 것을 누르면 이 함수가 동작한다
         	                   var chkbox_obj = document.getElementsByName('techstack');  //chkbox_obj 변수를 설정하는데 이 페이지안에서 name값이 techstack인 것을 찾아온다
         	                   var chkbox_obj_cnt = chkbox_obj.length;                    //chkbox_obj_cnt에는 위에 담긴 값의 수가 들어간다.
         	                   for (var k = 0; k < chkbox_obj_cnt; k++) {                 //위에 담긴 수만큼 for문을 돌린다
         	                	   if (chkbox_obj[k].value == $(this).val()) {            //chkbox_obj안의 value가 techbuttons을 name으로 가진 value와 같을때
         	                		  if (!chkbox_obj[k].checked) {                       //chkbox_obj로 가져온 값이 체킹되어있지 않다면
         	                		  	 chkbox_obj[k].checked = true;                    //체크하고
         	                		  }
         	                		  else {
         	                			 chkbox_obj[k].checked = false;                  //아니면 체크값을 해제한다.
         	                		  }
         	                	   }
         	                   }
         	                }); //end of button-check

         	            } //end of for

         	        } //end of else

         	    } // end of success


         	}); //end of ajax

    }); // end of keyup function
        	
    });
            
              	  
}); //end of document.ready          
          </script>

</head>
<body>

<!--ProjectVO에 있는 변수명과  여기의 name값이 일치해야 한다. -->
<div class="pr_regist">
<div class="container">
<form name="form1" id="form1" method="post" action="${path}/project/regist" enctype="multipart/form-data">  
  <div id="project_make"><span id="main_title">프로젝트 만들기</span><br><span id="subtitle_make">쉽고 빠르게 프로젝트를 등록해보세요.</span></div>
  
    <div id="title_line_top"><hr id="title_top"></div>
  <div class="title_input">
   
   <div id="title">*제목</div>
   <div id="titleWrite"><input type="text" id="textarea_title" name="project_name"/></div>
   <div class="title_warn"><!--자바스크립트로 경고 메시지를 띄운다.--></div>
  </div> <!--end of title_input-->

  <div class="introduce">
   <div id="introMenu">요약</div>
   <div id="introWrite"><textarea id="textarea_introduce" name="project_content" cols="80" rows="4" placeholder="프로젝트를 요약하는 문구를 씁니다." ></textarea></div>    
  </div> <!-- end of introduce-->
  
  <div class="regdate_term">
    <div id="regdate_term_title">날짜 / 기간</div>
    <div id="regdate_calendar">
    <input type="date" id="project_term1" name="project_term1"/>
    &nbsp; ~ &nbsp;
    <input type="date" id="project_term2" name="project_term2"/>
    
    
    <!--시작일~종료일 달력 메뉴 --></div>
  </div> <!-- end of regdate_trem-->

  <div class="TechStack">
   <div id="techstack_q"><span id="techstack_font">어떤 Tech Stack을 사용하셨나요?</span></div>
      <div id="techstack_hidden_show"> <!--버튼을 누르면 테크스택들이 입력되는 곳(입력이 없을 땐 숨긴다.)  -->
        <ul class="techstacklist"></ul>
      </div>
   
   <div id="techstack_input">
   <input type="text" class="project_tech_name" name="project_tech_name" placeholder="...Tech Stack"/> <!-- 입력폼 -->
   <!--테크스택을 직접 입력하는 textarea, placeholder를 쓴다.--></div>
   <div id="techstack_btns">
    <!--테크스택 버튼들을 나열하는 곳.-->
                            <input type="checkbox" id="techstack_javascript" name="techstack" value="JavaScript" class="techstack">
                            <label for="techstack_javascript">Javascript</label>
                            <input type="checkbox" id="techstack_java" name="techstack" value="Java" class="techstack">
                            <label for="techstack_java">Java</label>
                            <input type="checkbox" id="techstack_c3" name="techstack" value="C#" class="techstack">
                            <label for="techstack_c#">c#</label>
                            <input type="checkbox" id="techstack_php"name="techstack" value="php" class="techstack">
                            <label for="techstack_php">php</label>
                            <input type="checkbox" id="techstack_android" name="techstack" value="android" class="techstack">
                            <label for="techstack_android">android</label>
                            <input type="checkbox" id="techstack_jquery"name="techstack" value="jquery" class="techstack">
                            <label for="techstack_jquery">jquery</label>
                            <input type="checkbox" id="techstack_python"name="techstack" value="python" class="techstack">
                            <label for="techstack_python">python</label>
                            <input type="checkbox" id="techstack_html"name="techstack" value="html" class="techstack">
                            <label for="techstack_html">html</label>
                            <input type="checkbox" id="techstack_c2"name="techstack" value="c++" class="techstack">
                            <label for="techstack_c++">c++</label>
                            <input type="checkbox" id="techstack_ios"name="techstack" value="ios" class="techstack">
                            <label for="techstack_ios">ios</label>
                            <input type="checkbox" id="techstack_css"name="techstack" value="css" class="techstack">
                            <label for="techstack_css">css</label>
                            <input type="checkbox" id="techstack_mysql"name="techstack" value="mySql" class="techstack">
                            <label for="techstack_mysql">mysql</label>
                            <input type="checkbox" id="techstack_oracle"name="techstack" value="Oracle" class="techstack">
                            <label for="techstack_oracle">oracle</label>
                            <input type="checkbox" id="techstack_asp.net"name="techstack" value="asp.net" class="techstack">
                            <label for="techstack_asp.net">asp.net</label>
                            <input type="checkbox" id="techstack_ruby-on-rails"name="techstack" value="ruby-on-rails" class="techstack">
                            <label for="techstack_ruby-on-rails">ruby-on-rails</label>
                            <input type="checkbox" id="techstack_objective-c"name="techstack" value="objective-c" class="techstack">
                            <label for="techstack_objective-c">objective-c</label>
                            <input type="checkbox" id="techstack_c"name="techstack" value="c" class="techstack">
                            <label for="techstack_c">c</label>
                          </div> <%-- end of techstack_btns --%>
  </div> <!-- end of tachStack-->

  <div class="projectUpload">
    <div id="upload_title"><span id="upload_font">pdf 또는 ppt파일을 업로드해주세요.</span></div>
         <div id="upload_subtitle">프로젝트를 소개할 ppt, pdf 파일이 있나요?</div>
    <div id="file_upload">
        <input type="file" id="project_upload_file" name="project_upload_file"/>
    
    </div>

  </div> <!-- end of projectUpload-->
 
  <div class="projectLvl">
    <div id="projectLvl_title"><span id="lvl_font">프로젝트 등급</span></div>
    <div id="projectLvl_q">프로젝트의 등급이 어떻게 되나요?</div>
    
    
       <div id="projectLvl_input">
      <input type="text" id="project_grade" name="project_grade"/>
      <div id="projectLvl_txt">수준</div>   
        </div>
      
    

    <div id="projectLvl_btns">
         
             <!--type="button"을 써서 버튼을 누르자마자 전송되는 것을 막는다. -->
                
              <button type="button" value="상용화" class="gradebtn">상용화</button>
              <button type="button" value="베타테스트" class="gradebtn">베타테스트</button>
                <button type="button" value="알파테스트" class="gradebtn">알파테스트</button>
                <button type="button" value="튜토리얼" class="gradebtn">튜토리얼</button>
                <button type="button" value="과제" class="gradebtn">과제</button>
                <button type="button" value="연구" class="gradebtn">연구</button>
                <button type="button" value="개인프로젝트" class="gradebtn">개인프로젝트</button>
                <button type="button" value="팀프로젝트" class="gradebtn">팀프로젝트</button>
    </div>
  
  
  </div> <!-- end of projectLvl-->

   <div class="final_btns">
   <!--이곳에 등록 버튼을 만든다.-->
                   <button type="reset">취소</button>
                   <button type="button" id="btnSave">등록</button>
   </div>


</form> <!-- end of form1 -->


</div>  <!--end of container-->
</div>  <!--css선택자 추가용 div-->

</body>
</html>