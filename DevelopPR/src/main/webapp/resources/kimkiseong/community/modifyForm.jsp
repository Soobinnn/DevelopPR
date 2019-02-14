<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="co_modify">
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<%@ include file="/WEB-INF/views/include/tag_header.jsp" %>
<style>
.co_modify .container{   /*전체 틀 */
  display : flex;
   width : 700px;
   height : 550px;
    flex-direction : column;
 }

.co_modify #pageName {
    line-height : 30px;
    text-align : center;
    vertical-align : middle;
   border-bottom : 2px solid;
}
.co_modify .title_input{
    display : flex;
    flex-direction : row;
    line-height : 40px;
    border-bottom : 1px solid silver;
}

.co_modify #_title {
    
    width : 82px;
    text-align : center;
    background-color : #EFEFFB;
    
    }

.co_modify #titleInput{
     width : 620px; 
     padding-left : 11px;
 }

.co_modify .content_input{
   display : flex;
   flex-direction : row;
   height : 400px;
}

.co_modify #_content {
    height : 380px;
    width : 83px;
    text-align : center;
    padding-top : 20px;
    background-color : #EFEFFB;
}
.co_modify #contentInput{
    width : 620px;
    padding : 10px;
}

.co_modify .list_write
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
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true,
                }
            });
             
            //전송버튼 클릭이벤트
            $("#btnSave").click(function(){
                //id가 smarteditor인 textarea에 에디터에서 대입
                editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
                 
                // 이부분에 에디터 validation 검증
                const title = $("#title").val();
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
        });
</script>
</head>
<body>
 <div class="container">
     <%-- <form name="form1" method="post" action="${path}/board/update.do"> --%>
      
      <form name="form1" id="form1" method="post" action="${path}/community/modify">
      <input type="hidden" name="bno" id="bno" value="${dto.bno}">
      <input type="hidden" name="userName" value="${dto.userName}">
      <input type="hidden" name="writer" value="${dto.writer}">
      <div id ="pageName">게시글 수정</div>
        
      <div class="title_input">
          <div id="_title">제목</div>
          <div id="titleInput"><input name="title" id="title" style="height:25px; width:550px; text-align:left; padding-left:5px;" size="60" value="${dto.title}"></div>
        </div> <!--제목과 입력란 종료-->
     
     <div class="content_input">
        <div id="_content">내용</div>
        <div id="contentInput"><textarea name="content" style="width:550px; height:350px; text-align : left; padding-left : 8px;" id="content">${dto.content}</textarea></div>
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