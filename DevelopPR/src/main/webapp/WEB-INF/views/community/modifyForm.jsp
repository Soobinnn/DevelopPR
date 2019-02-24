<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<%@ include file="../include/tag_header.jsp" %>
<style>

.co_modify{
height:820px;

}


.co_modify *:focus{
outline : none;
}


.co_modify #co_title{
font-size:2rem;
margin-top : 50px;
margin-bottom : 50px;
items-align : center;
align-items : stretch;
justify-content: center;
text-align : center;
}




.co_modify .container{   /*전체 틀 */
  margin : 0 auto;
   height:730px;
   
   }


.co_modify #form1{
	
	width:850px;
	height:650px; /*이 값이 테두리선 높이를 정한다.*/
    flex-shrink : 0;
	margin : 0 auto; /*제목과 내용 div들 가운데 정렬*/
	
}
.co_modify #input{
    border:solid 3px #b9b9b9;
    width:900px;
    border-radius:20px;
    padding-top:3px;
    display:flex;
    flex-direction:column;
    margin-bottom:10px;
    min-height:650px;
    margin : 0 auto;
   
    
}
.co_modify #pageName {  /*테두리안의 맨 위에 있는 '게시글 작성'부분*/
    line-height : 90px;
  
    text-align : center;
    font-size:1.9rem;
    vertical-align : middle;
    font-weight:900;
    
}

.co_modify .regist_body{ /*테두리 안에서 가운데 정렬을 하기 위해 내용 div들을 감싸는 div를 또 만듦 */
	
    margin : 0 auto;

}

.co_modify .title_input{
    display : flex;
    flex-direction : row;
    line-height : 35px;
    align-items:center;
   
    }

.co_modify #title {
    min-width : 100px;
    height:50px;
    font-size:1.2rem;
    text-align : center;
    background-color : #f6f6f6;
    margin-bottom:5px;
    padding-top:10px;
    margin-right:5px;
}

.co_modify #titleInput{
     width : 120px; 
}
.co_modify #_title{
    border:solid 2px #585858;
}

.co_modify .content_input{
   display : flex;
   flex-direction : row;
   height : 430px;  
   
}

.co_modify #contents {
    display:flex;   
    width : 100px;
    font-size:1.2rem;
    height : 410px;
    /* padding-left:40px; */
    align-items:center; /*글자 위아래 가운데 정렬*/
    text-align : center;
    background-color : #f6f6f6;
    margin-right:5px;
    
    
}
.co_modify #contentInput{   /*textarea를 담는 div*/
    width : 740px;
    /* padding : 7px; */
}


/*---------button-------------*/
.co_modify .upload{
    position:relative;
    bottom:30px;
    left:265px;
}
.co_modify .upload #f_label{
    border:solid 1px #585858;
    padding:8px;
    padding-left:10px;
    padding-right:10px;
    background-color:white;
    position:relative;
    right:314px;
    border-radius:15px;
}
.co_modify .upload #f_label:hover{
    background-color:#f6f6f6;
}
.co_modify .upload #up_label:hover{
    background-color:#f6f6f6;
}
.co_modify .upload #upload{
    position:relative;
    left:120px;
}
.co_modify .upload #file{
    font-size:1rem;
}
.co_modify #up_label{
    border:solid 1px #585858;
    padding:8px;
    padding-left:15px;
    padding-right:15px;
    background-color:white;
    position:relative;
    left:40px;
    border-radius:15px;
}
/*---------button-------------*/

.co_modify .modify_footer
{
    display : flex;
    flex-shrink:0;
    flex-direction : column;
    height: 100px;
    width : 700px;
  
}
.co_modify #list_write
{
    border-top :4px double silver;
    margin-top : 20px;
    position : relative;
    left : 200px;
}


/*-----------돌아가기, 취소, 등록 버튼--------*/

.co_modify .btn{
    border:solid 2px #585858;
    padding:8px;
    padding-left:15px;
    padding-right:15px;
    background-color:white;
    border-radius:15px;

}
.co_modify .btn:hover{  
    background-color:#f6f6f6;
}

.co_modify #btnBack{
	position : relative;
	left : 5px;
}

.co_modify #btnCancel{
   position : relative;
   left : 10px;

}

.co_modify #btnSave{
	position : relative;
	left : 632px;
}

</style>
<script>
    $(document).ready(function(){
    	 $(document).scrollTop(635);
    	   $('#pageName').focus();

    	
    	
    	
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
                const title = $("#_title").val();
                const content = $("#content").val();
                console.log(title);
                console.log(content);
                
                if (title.replace(/ |　/gi, '') == ''){ 
                    alert("제목을 입력해주세요.");
                    document.form1.title.focus();
                    return; 
                                                     }
                if(content == ""){
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
<div class="co_modify"> 
 
 <div class="container">
     <div id="co_title">Community</div>  
       <div id="input">
      <form name="form1" id="form1" method="post" action="${path}/community/modify">
      <input type="hidden" name="bno" id="bno" value="${dto.bno}">
      <input type="hidden" name="userName" value="${dto.userName}">
      <input type="hidden" name="writer" value="${dto.writer}">
      <div id ="pageName">게시글 수정</div>
      <div id="modify_body">
      <div class="title_input">
          <div id="title">제목</div>
          <div id="titleInput"><input name="title" id="_title" style="height:45px; width:730px; text-align:left; padding-left:5px; border-radius:15px;" size="60" value="${dto.title}"></div>
        </div> <%--제목과 입력란 종료--%>
     
     <div class="content_input">
        <div id="contents">&nbsp;&nbsp;&nbsp;&nbsp;내용</div>
        <div id="contentInput"><textarea name="content" style="min-width:98%; width:100%; height:350px; text-align : left; padding-left : 8px;" id="content">${dto.content}</textarea></div>
    </div>  <%--내용과 입력란 종료--%> 
    <div class="modify_footer">
     <div class="list_write">
     <button type="button" class="btn" id="btnBack">돌아가기</button>
     <button type="reset" class="btn" id="btnCancel">취소</button>
     <button type="button" class="btn" id="btnSave">수정</button>      
 </div> 
 </div>  <%--modify_footer 종료 --%>
    </div> 
</form>
</div> <%-- div id="input" 종료 --%>
</div> <%--전체 틀 종료 --%>

</div> <%-- co_modify 종료 --%>

</body>
</html>