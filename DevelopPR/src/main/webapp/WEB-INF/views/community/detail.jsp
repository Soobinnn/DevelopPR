<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="community_detail.css?ver=1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<%@ include file="../include/tag_header.jsp" %>

<style>

.co_detail{
margin : 0 auto;
}

.co_detail .container{
  min-height:500px;
  display:flex;
  flex-direction:column;
  width:800px;
  min-width : 350px;
  margin : 0 auto;
 
 
  }


.co_detail #form1{
margin : 0 auto;
display:flex;
flex-direction:column;
height:750px;

}


.co_detail ul,li
{
  list-style : none;
}
.co_detail #name, #viewcnt, #title_reg, #name_cnt, #content{
  display : flex;
  flex-basis : 50px;
}

.co_detail #title_reg
{
 background-color:#f6f6f6;
 display : flex;
 flex-direction : row;
 flex-shrink : 0;
 border-bottom : 1px solid silver;
 border-radius : 10px;
 /* vertical-align:baseline; */
 
}
.co_detail #title{
  padding-top : 10px;
  padding-left : 10px;
  flex-basis : 570px;
     vertical-align:baseline;
     }
.co_detail #regdate{
  flex-basis : 220px;
  padding-top : 10px;
        }
.co_detail #name
{
 padding-top : 10px;
 padding-left : 10px;
 display : flex;
 flex-basis : 100px;
margin-right : 464px; 
}
.co_detail #viewcnt
{
  padding-top : 10px;
  flex-basis : 120px;
}
.co_detail #content
{
  display : flex;
  padding-top : 40px;
  padding-bottom : 20px;
  padding-left : 20px;
  flex-basis : 420px; 
  flex-shrink:0;
  border-bottom : 1px solid silver;
  overflow: scroll;
}

.co_detail #modifyReply {
        width: 600px;
        height: 130px;
        background-color: gray;
        padding: 10px;
        z-index: 10;
        visibility: hidden;
    }

.co_detail #listReply
{
margin : 0 auto;
height:100px;
}

.co_detail .btn {   /* 검색 버튼의 속성  */
			background-color: #f6f6f6;
			padding: 5px 10px;
			margin: 2px;
			border: 1px solid silver;
			color: black;
			text-align: center;
			text-decoration: none;
			font-size: 1rem;
			display: inline-block;
			cursor: pointer;
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
		    border-radius : 30px;
		}

.co_detail .btn:hover{ /*검색 버튼 호버 시 투명 효과*/
 background-color:rgba( 255, 255, 255, 0.1 );
			color: black;
}

.co_detail .btns{


display:flex;
height:50px;
width:800px;
margin-top:10px;
margin : 0 auto;               
               }

.co_detail #btnlist{
position:relative;
left:400px;
}

.co_detail #btnReply{
			background-color: #f6f6f6;
			padding: 5px 10px;
			margin: 2px;
			border: 1px solid silver;
			color: black;
			text-align: center;
			text-decoration: none;
			font-size: 1rem;
			display: inline-block;
			cursor: pointer;
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
		    border-radius : 30px;
}
.co_detail #btnReply:hover{ /*검색 버튼 호버 시 투명 효과*/
 background-color:rgba( 255, 255, 255, 0.1 );
			color: black;
}
.co_detail #de_reply{
margin : 0 auto;
display : flex;
flex-direction:row;
flex-basis:60px;
flex-shrink:0;

}

.co_detail #btnUpdete {
position : relative;
left : 5px;
}

.co_detail #btnDelete{
position : relative;
left : 12px;
}
.co_detail #btnList{
position : relative;
left : 620px;
}



</style>
<script>

$(document).ready(function(){
    /* 게시글 관련 */
    // 1. 게시글 수정
    $("#btnUpdete").click(function(){
        
        var title = $("#title").val();
        var content = $("#content").val();
       
        document.form1.action="${path}/community/modifyForm"
        // 폼에 입력한 데이터를 서버로 전송
        document.form1.submit();
    });
    
    // 2. 게시글 삭제
    $("#btnDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            document.form1.action = "${path}/community/remove";
            document.form1.submit();
        }
    });
    
    // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
    $("#btnList").click(function(){
        location.href="${path}/community/list?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
    });
    
    /* 댓글 관련 */
    // 1. 댓글 입력
    $("#btnReply").click(function(){
        //reply(); // 폼데이터 형식으로 입력
        replyJson(); // json 형식으로 입력
    });
    
    // 2. 댓글 목록
    //listReply("1"); // 댓글 목록 불러오기
    //listReply2(); // json 리턴방식
    listReplyRest("1"); // rest방식
    
});

// 1_1. 댓글 입력 함수(폼 데이터 방식)
function reply(){
    var replytext=$("#replytext").val();
    var bno="${dto.bno}"
    // 비밀댓글 체크여부
    var secretReply = "n";
    // 태그.is(":속성") 체크여부 true/false
    if( $("#secretReply").is(":checked") ){
        secretReply = "y";
    }
    // 비밀댓글 파라미터 추가
    var param="replytext="+replytext+"&bno="+bno+"&secretReply="+secretReply;
    $.ajax({                
        type: "post",
        url: "${path}/reply/insert",  /*ajax가 실행될 때 서버에 요청할 주소 */
        data: param,
        success: function(){ /*에이작스의 요청이 성공적으로 수행됐을 때 실행될 부분 */
            alert("댓글이 등록되었습니다.");
            //listReply2();
            listReply("1");
        }
    });
}

// 1_2. 댓글 입력 함수(json방식)
function replyJson(){
    var replytext=$("#replytext").val();
    var bno="${dto.bno}"
    // 비밀댓글 체크여부
    var secretReply = "n";
    // 태그.is(":속성") 체크여부 true/false
    if( $("#secretReply").is(":checked") ){
        secretReply = "y";
    }
    $.ajax({                
        type: "post",
        url: "${path}/reply/insertRest",
        headers: {
            "Content-Type" : "application/json"
        },
        dateType: "text",
        // param형식보다 간편
        data: JSON.stringify({
            bno : bno,
            replytext : replytext,
            secretReply : secretReply
        }),
        success: function(){
            alert("댓글이 등록되었습니다.");
           
            $('#replytext').val(''); // 댓글입력란 초기화
            listReplyRest("1"); // Rest 방식
        }
    });
}
// 2_1. 댓글 목록 - 전통적인 Controller방식
function listReply(num){
    $.ajax({
        type: "get",
        url: "${path}/reply/list?bno=${dto.bno}&curPage="+num,
        success: function(result){
        // responseText가 result에 저장됨.
            $("#listReply").html(result);
        }
    });
}
// 2_2. 댓글 목록 - RestController를 이용 json형식으로 리턴
function listReply2(){
    $.ajax({
        type: "get",
        //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
        url: "${path}/reply/listJson?bno=${dto.bno}",
        success: function(result)
        {
            console.log(result); /* f12를 눌렀을 때 확인가능하다. */
            var output = "<table>";
            for(var i in result){
                output += "<tr>";
                output += "<td>"+result[i].userName;
                output += "("+changeDate(result[i].regdate)+")<br>";
                output += result[i].replytext+"</td>";
                output += "<tr>";
            }
            output += "</table>";
            $("#listReply").html(output);
        }
    });
}
// 2_2. 댓글 목록 - 날짜 형식 변환 함수 작성
function changeDate(date){
    date = new Date(parseInt(date));
    year = date.getFullYear();
    month = date.getMonth();
    day = date.getDate();
    hour = date.getHours();
    minute = date.getMinutes();
    second = date.getSeconds();
    strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
    return strDate;
}

// 2_3. 댓글 목록 - Rest방식
function listReplyRest(num){
    $.ajax({
        type: "get",
        url: "${path}/reply/list/${dto.bno}/"+num,
        success: function(result){
        // responseText가 result에 저장됨.
            $("#listReply").html(result);
        }
    });
}    

// **댓글 수정화면 생성 함수
function showReplyModify(rno){
    $.ajax({
        type: "get",
        url: "${path}/reply/detail/"+rno,
        success: function(result){
            $("#modifyReply").html(result);
            // 태그.css("속성", "값")
            $("#modifyReply").css("visibility", "visible");
        }
    })
}

</script>

</head>
<body>
<div class="co_detail">
<form name="form1" id="form1" method="post" action="${path}/upload/uploadForm" enctype="multipart/form-data">
    
    <div class="container">
   <div id="title_reg">
   <div id="title">${dto.title}</div>
   <div id="regdate"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></div>
  </div>
      <div id="name_cnt">
        <div id="name">${dto.writer}</div> 
        <div id="viewcnt">조회수 : ${dto.viewcnt}</div>
      </div>
     <div id="content"><pre>${dto.content}</pre></div>  
  </div>
  
  
  <!-- 게시물번호를 hidden으로 처리 -->
     <input type="hidden" id="bno" name="bno" value="${dto.bno}">
     <input type="hidden" name="title" value="${dto.title}">
     <input type="hidden" name="userName" value="${dto.userName}"> 
     <input type="hidden" name="writer" value="${dto.writer}">
  
  
  <div class="btns">
  <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
    <c:if test="${sessionScope.userNick == dto.writer}"> 
         <button type="button" class="btn"  id="btnUpdete">수정</button>
         <button type="button" class="btn"  id="btnDelete">삭제</button>
    </c:if>  
        <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
      <button type="button" class="btn" id="btnList">목록</button>
 </div>
 <!-- 댓글 목록 출력할 위치 -->
    <div id="listReply"></div>
     <div id="de_reply">
        <br>
        <!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userNick != null}">    
            <textarea rows="3" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
            <br>
           <button type="button" id="btnReply">댓글 작성</button>
        </c:if>
      </div>
   
   </form>        
   




 </div> <%-- co_detail  종료 --%>   
   
   
   
     
    
    
    
   
</body>
</html>