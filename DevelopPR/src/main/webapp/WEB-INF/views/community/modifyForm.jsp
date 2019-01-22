<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<%@ include file="../include/tag_header.jsp" %>
<style>
  .container{   /*전체 틀 */
  display : flex;
   width : 700px;
   height : 550px;
    flex-direction : column;
 }

#pageName {
    line-height : 30px;
    text-align : center;
    vertical-align : middle;
   border-bottom : 2px solid;
}
.title_input{
    display : flex;
    flex-direction : row;
    line-height : 40px;
    border-bottom : 1px solid silver;
}

 #title {
    
    width : 82px;
    text-align : center;
    background-color : #EFEFFB;
    
    }

 #titleInput{
     width : 620px; 
     padding-left : 11px;
 }

.content_input{
   display : flex;
   flex-direction : row;
   height : 400px;
}

#content {
    height : 380px;
    width : 83px;
    text-align : center;
    padding-top : 20px;
    background-color : #EFEFFB;
}
#contentInput{
    width : 620px;
    padding : 10px;
}

.list_write
{
    border-top :4px double silver;
    padding-top : 10px;
}

</style>
<script>
    $(document).ready(function(){
        
    	$("#btnBack").click(function(){
        location.href="${path}/community/list";		
          return;    
                  });
        $("#btnSave").click(function(){
                //var title = document.form1.title.value; ==> name속성으로 처리할 경우
                //var content = document.form1.content.value;
                //var writer = document.form1.writer.value;
                var title = $("#_title").val();
                var content = $("#_content").val();
                console.log(title);
                console.log(content);
                //var writer = $("#writer").val();
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
                /* if(writer == ""){
                    alert("이름을 입력하세요");
                    document.form1.writer.focus();
                    return;
                } */
                // 폼에 입력한 데이터를 서버로 전송
                document.form1.submit();
            });
        });
</script>
</head>
<body>
 <div class="container">
     <%-- <form name="form1" method="post" action="${path}/board/update.do"> --%>
      
      <form name="form1" method="post" action="${path}/community/modify">
      <input type="hidden" name="bno" id="bno" value="${dto.bno}">
      <input type="hidden" name="userName" value="${dto.userName}">
      <input type="hidden" name="writer" value="${dto.writer}">
      <div id ="pageName">게시글 작성</div>
        
      <div class="title_input">
          <div id="title">제목</div>
          <div id="titleInput"><input name="title" id="_title" style="height:25px; width:550px; text-align:left; padding-left:5px;" size="60" value="${dto.title}"></div>
        </div> <!--제목과 입력란 종료-->
     
     <div class="content_input">
        <div id="content">내용</div>
        <div id="contentInput"><textarea name="content" style="width:550px; height:350px; text-align : left; padding-left : 8px;" id="_content">${dto.content}</textarea></div>
    </div>  <!--내용과 입력란 종료--> 

     <div class="list_write"><button type="button" id="btnBack">돌아가기</button>
       
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <button type="reset">취소</button>
  &nbsp;&nbsp;&nbsp;
        <button type="button" id="btnSave">수정</button>      
 </div>
     
</form>
</div> <%--전체 틀 종료 --%>
</body>
</html>