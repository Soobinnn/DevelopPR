<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html class="projectRegist">
 <%-- ${path}를 쓰려면 jstl 코어태그와 함께 컨텍스트 패스를 써야 한다. --%>
 <head>
        <meta charset="utf-8">
        <title>DevelopPR-프로젝트 등록</title>
      <link href="../include/css/developpr.css" rel="stylesheet" type="text/css">
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
       
        <script>
          $(document).ready(function()
            {
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
                    
                    /* console.log(project_name);
                    console.log(project_content);
                    console.log(project_term1);
                    console.log(project_term2);
                     */
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
				
        	
        	/* console.log('키이벤트작동하는가?'); */
        	
		        var tech_name_input = $('.project_tech_name').val();
        	    var param = "tech_name_input=" + tech_name_input;    //컨트롤러로 값을 넘기기 위해서 이름을 담은 매개변수 선언
         	/* console.log('값이 담기는가 :' +tech_name_input); */
        	
         	$.ajax({ // Ajax 요청을 작성
         	    url: "${path}/project/autocomplete",
         	    data: param,
         	    method: "POST",
         	    success: function (result) {
         	        if (tech_name_input === "" || tech_name_input === null) { // techstack 입력란이 비워져 있을 경우
         	            //start of if
         	            $('ul').empty();             //입력값이 있을 경우 td에 출력이 되는데  입력값이 없을 경우 td안의 값을 비운다.
         	        } else {                             //end of if and start of else
         	            var output = document.createElement('div');
         	            for (var i in result)        // result에서 받아온 값의 개수만큼 for문을 돌린다
         	            {
         	                var techName = result[i].tech_name_input;
         	                
         	                var listBtn = document.createElement('button');
        	                
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
   
   <style>
           .projectRegist .techstacklist
            {
                display : flex; /*....*/
                flex-wrap :wrap;
				width: 360px;
				margin-left: 148px;
            }
           .projectRegist .techstacklist > li
            {
                width : 100px;
                height : 50px;
                text-align: center;
            }

         <%--파일 업로드  폼 추가 --%>
        .projectRegist iframe{
        width: 600px;
        height: 100px;
        border: 1px;
        border-style: solid;
        }
        </style>
    </head>

    <body>
        <div class="container">
            <form name="form1" id="form1" method="post" action="${path}/project/regist" enctype="multipart/form-data">
             <header class="second_header">
                
            </header>
            <section class="project_section">
                <div class="projectform">
                    <div id="projectname" class="projectformt">
                        <h3 class="project_h3">프로젝트</h3>
                        <h1 class="project_h1">빠르고 쉽게 프로젝트를 등록하세요.</h1>
                        <label for="project_name" class="project_label">제목</label>
                        <input type="text" id="project_name" name="project_name" autofocus/>
                    </div>
                    <div id="projectcontent" class="projectformt">
                        <label for="project_content" id="project_content_label"class="project_label">내용</label>
                        <textarea id="project_content" name="project_content"></textarea>
                    </div>
                    
                    
                    <%--파일 업로드 폼 --%>
                    <div id="projectupload" class="projectformt"> 
                       <label for="project_upload_file" class="project_label">업로드</label><br>
                        <input type="file" id="project_upload_file" name="project_upload_file"/>
                         
                     </div>
                    
                    
                    
                    <div id="projectterm" class="projectformt">
                            <label for="project_term" class="project_label">날짜/기간</label>
                            <input type="date" id="project_term1" name="project_term1"/>
                            ~
                            <input type="date" id="project_term2" name="project_term2"/>
                    </div>
                    <div id="projecttech" class="projectformt">
                            <label for="project_tech_name" class="project_label">Tech Stack</label>
                            <input type="text" class="project_tech_name" name="project_tech_name" placeholder="...Tech Stack"/> <%-- 입력폼 --%>
                            <ul class="techstacklist"></ul>
                            <br>
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
                    </div>
                    <div id="projectimage" class="projectformt">
                            <label for="project_image" class="project_label">관련 이미지(데베 추가해야함)</label>
                            <input type="file" id="project_image" name="project_image"/>
                    </div>
                    <div id="projectgrade" class="projectformt">
                        <label for="project_grade" class="project_label">프로젝트 등급</label>
                        <input type="text" id="project_grade" name="project_grade"/>
                        <br></br> <%--type="button"을 써서 버튼을 누르자마자 전송되는 것을 막는다. --%>
                        <button type="button" value="상용화" class="gradebtn">상용화</button>
                        <button type="button" value="베타테스트" class="gradebtn">베타테스트</button>
                        <button type="button" value="알파테스트" class="gradebtn">알파테스트</button>
                        <button type="button" value="튜토리얼" class="gradebtn">튜토리얼</button>
                        <button type="button" value="과제" class="gradebtn">과제</button>
                        <button type="button" value="연구" class="gradebtn">연구</button>
                        <button type="button" value="개인프로젝트" class="gradebtn">개인프로젝트</button>
                        <button type="button" value="팀프로젝트" class="gradebtn">팀프로젝트</button>
                    </div>
                    <div id="projectregist" class="projectformt">
                    <button type="reset">취소</button>
                   <button type="button" id="btnSave">등록</button>                
            
                    </div>
                 </div>
            </section>
            
            
            
            
            <footer>
                3
            </footer>
</form>
        </div>
    </body>
</html>