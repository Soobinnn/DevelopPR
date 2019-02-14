<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="../include/tag_header.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/community/community.css'/>"/>

<script>
    $(document).ready(function(){
        
    	$("#btnBack").click(function(){
        location.href="${path}/community/list";		
          return;    
                  });
             
     
        <%--스마트 에디터 스킨 추가 --%>
         $(function(){
            //전역변수선언
            var editor_object = [];
             
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: editor_object,
                elPlaceHolder: "content",
                sSkinURI: "/DevelopPR/resources/editor/SmartEditor2Skin.html",
                htParams : {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar : true,            
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer : true,    
                    
                    bSkipXssFilter : true,
                    
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true,
                }
            });
             
            //전송버튼 클릭이벤트
            $("#btnSave").click(function(){
                //id가 smarteditor인 textarea에 에디터에서 대입
                editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
                 
                // 이부분에 에디터 validation 검증
                var title = $("#_title").val();
                var content = $("#content").val();
                console.log(title);
                console.log(content);
                
                if(title === ""){
                    alert("제목을 입력하세요");
                    document.form1.title.focus();
                    return;
                }
                if(content === ""){
                    alert("내용을 입력하세요");
                    document.form1.content.focus();
                    return;
                } 
                              
                //폼 submit
                $("#form1").submit();
            })
        });
 
         
         
         <%--파일 업로드 로직 추가 --%>         
         $(".fileDrop").on("dragenter dragover", function(e){
             e.preventDefault(); // 기본효과 제한
         });
         // 드래그해서 드롭한 파일들 ajax 업로드 요청
         $(".fileDrop").on("drop", function(e){
             e.preventDefault(); // 기본효과 제한
             var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
             var file = files[0]; // 첫번째 첨부파일
             var formData = new FormData(); // 폼데이터 객체
             formData.append("file", file); // 첨부파일 추가
             $.ajax({
                 url: "${path}/upload/uploadAjax",   /* 업로드 컨트롤러 url 로 들어간다. */
                 type: "post",
                 data: formData,
                 dataType: "text",
                 processData: false, 
                 processType: false, // header가 아닌 body로 전달
                 contentType: false,
                 // ajax 업로드 요청이 성공적으로 처리되면
                 success: function(data){
                     console.log(data);
                     // 첨부 파일의 정보
                     var fileInfo = getFileInfo(data);
                     // 하이퍼링크
                     var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
                     // hidden 태그 추가
                     html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
                     // div에 추가
                     $("#uploadedList").append(html);
             }
         });
     });

 
    
    }); // end of document ready function




  
    </script>
</head>
<body>
    <div class="co_registForm">
        <div class="container">
             <div id="input">
            <form name="form1" id="form1" method="post" action="${path}/community/regist" enctype="multipart/form-data">
            <div id ="pageName">게시글 작성</div>
                   <div class="regist_body">
                    <div class="title_input">
                    <div id="title">제목</div>
                    <div id="titleInput"><input name="title" id="_title" style="height:40px; width:745px; text-align:left; padding-left:5px;" size="60" placeholder="제목을 입력해주세요"></div>
                  </div> <%--제목과 입력란 종료--%>
               
               <div class="content_input">
                  <div id="contents">내용</div>
                  <div id="contentInput"><textarea name="content" style="min-width:700px; width:100%; height:350px; text-align : left; padding-left : 8px;" id="content" placeholder="내용을 입력해주세요"></textarea></div>
              </div>  <%--내용과 입력란 종료--%> 
          
              <div class="footer">
              
               <div class="list_write">
                   <button type="button" class="btn" id="btnBack">돌아가기</button>      
                   <button type="button" class="btn" id="btnSave">등록</button>      
              </div> <%-- end of regist_body --%>
               </div>
              </div> <%-- end of footer --%>
               </form>
              </div>
     
      </div> <%--전체 틀 종료 --%>
      
      </div><%--co_registForm 종료 --%>
      </body>
      
      </html>