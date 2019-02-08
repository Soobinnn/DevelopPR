<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="co_registForm">
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="../include/tag_header.jsp" %>

<style>
.co_registForm .container{   /*전체 틀 */
  display : flex;
   width :700px;
   height : 650px;
    flex-direction : column;
 }

.co_registForm #pageName {  /* 합쳤을 때 호환성을 위해서 html 클래스를 앞에 붙인다. */
    line-height : 30px;
    text-align : center;
    vertical-align : middle;
   border-bottom : 2px solid;
}
.co_registForm .title_input{
    display : flex;
    flex-direction : row;
    line-height : 40px;
    border-bottom : 1px solid silver;
}

.co_registForm #title {
    width : 82px;
    text-align : center;
    background-color : #EFEFFB;
    }

.co_registForm #titleInput{
     width : 620px; 
     padding-left : 11px;
      }

.co_registForm .content_input{
   display : flex;
   flex-direction : row;
   height : 450px;
}

.co_registForm #contents {
    height : 410px;
    width : 83px;
    text-align : center;
    padding-top : 20px;
    background-color : #EFEFFB;
}
.co_registForm #contentInput{
    width : 620px;
    padding : 7px;
}


.co_registForm .footer
{
    display : flex;
    flex-direction : column;
    height: 100px;
    width : 700px;
  
}
.co_registForm #list_write
{
    border-top :4px double silver;
    margin-top : 20px;
}
</style>
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
                const title = $("#_title").val();
                const content = $("#content").val();
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
                 url: "${path}/upload/uploadAjax",  <%-- 업로드 컨트롤러 url 로 들어간다. --%>
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
 <div class="container">
      <form name="form1" id="form1" method="post" action="${path}/community/regist" enctype="multipart/form-data">
      <div id ="pageName">게시글 작성</div>
        
      <div class="title_input">
          <div id="title">제목</div>
          <div id="titleInput"><input name="title" id="_title" style="height:25px; width:600px; text-align:left; padding-left:5px;" size="60" placeholder="제목을 입력해주세요"></div>
        </div> <%--제목과 입력란 종료--%>
     
     <div class="content_input">
        <div id="contents">내용</div>
        <div id="contentInput"><textarea name="content" style="width:600px; height:350px; text-align : left; padding-left : 8px;" id="content" placeholder="내용을 입력해주세요"></textarea></div>
    </div>  <%--내용과 입력란 종료--%> 

<div class="footer">
      <div id="upload">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file">
        <input type="submit" value="업로드"> 
     </div> <%--end of upload --%>



     <div class="list_write">
     <button type="button" id="btnBack">돌아가기</button>      
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <button type="reset">취소</button>
  &nbsp;
        <button type="button" id="btnSave">등록</button>      
 </div>
     </div> <%-- end of footer --%>
</form>
</div> <%--전체 틀 종료 --%>


</body>

</html>