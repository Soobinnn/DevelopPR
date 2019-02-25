<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<%@ include file="../include/tag_header.jsp" %>
<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
<%--  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/co_detail.css'/>"/> --%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/community/co_detail.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/community/co_detail_reply.css'/>"/>


<meta charset="utf-8">

<style>
 


</style>
<script>

$(document).ready(function(){
	 $(document).scrollTop(230);
	
	
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
            /* console.log(result); */ /* f12를 눌렀을 때 확인가능하다. */
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
<div id="co_title">Community</div>
 <form id="form1" name="form1" method="post" action="${path}/upload/uploadForm" enctype="multipart/form-data">    
   <div class="container">
   
  <div class="header"> 
   
   <div class="title_reg">
   <div id="titleInput">${dto.title}</div>
   <div id="regdate"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm"/></div> <%-- 초 단위 삭제 --%>
  </div>
      <div class="nick_cnt">
        <div id="nick">${dto.writer}</div> 
        <div id="viewcnt"><span id="view_cnt">조회수 : ${dto.viewcnt}</span></div>
      </div>
  
  </div>  <%-- end of header --%>
      <div id="header_bottom_line"></div> <%--제목 구분용 헤더 라인 --%>
       
     <div id="content"><span id="content_text"><pre>${dto.content}</pre></span></div>  
  <div id="btns">
  <%-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 --%>
    <c:if test="${sessionScope.login.userNick == dto.writer}"> 
         <button type="button" class="btn"  id="btnUpdete">수정</button>
         <button type="button" class="btn"  id="btnDelete">삭제</button>
    </c:if>  
        <%-- 상세보기 화면에서 게시글 목록화면으로 이동 --%>
      <button type="button" class="btn" id="btnList">목록</button>
 </div>
   
   
     <div class="reply_container">
   
    
     <div id="de_reply">
        <br>
        <%-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 --%>
        <c:if test="${sessionScope.login.userNick != null}">    
        <div id="reply_write"><textarea rows="3" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea></div>
            <br>   <%-- end of reply_write --%>
           
        <div id="reply_btn">   
           <button type="button" id="btnReply">댓글 작성</button>
        </div> <%--end of reply_btn --%>
        </c:if>
        
      </div> <%-- end of de_reply --%>
 
   <%-- 댓글 목록 출력할 위치 --%>
    <div id="listReply"></div>
  
  
  </div> <%-- end of reply_container --%>
  
  
  <%-- 게시물번호를 hidden으로 처리 --%>
     <input type="hidden" id="bno" name="bno" value="${dto.bno}">
     <input type="hidden" name="title" value="${dto.title}">
     <input type="hidden" name="userName" value="${dto.userName}"> 
     <input type="hidden" name="writer" value="${dto.writer}">
  
    </div> <%-- end of container --%>

</form>

 </div> <%-- co_detail  종료 --%>   
   
</body>
</html>