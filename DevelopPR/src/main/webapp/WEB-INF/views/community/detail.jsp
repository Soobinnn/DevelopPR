<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/include/css/board_view.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<%@ include file="../include/header.jsp" %>
<style>
.container{
  height:450px;
  display:flex;
  flex-direction:column;
  width:700px;
  min-width : 350px;
  }
ul,li
{
  list-style : none;
}
#name, #viewcnt, #title_reg, #name_cnt, #content{
  display : flex;
  flex-basis : 50px;
}

#title_reg
{
 background-color:#81F7F3;
 display : flex;
 flex-direction : row;
 border-bottom : 1px solid silver;
 border-radius : 10px;
}
#title{
  padding-top : 10px;
  padding-left : 10px;
  flex-basis : 570px;
     }
#regdate{
  flex-basis : 220px;
  padding-top : 10px;
        }

#name
{
 padding-top : 10px;
 padding-left : 10px;
 display : flex;
 flex-basis : 100px;
margin-right : 464px; 
}
#viewcnt
{
  padding-top : 10px;
  flex-basis : 120px;
}
#content
{
  display : flex;
  padding-top : 20px;
  padding-bottom : 20px;
  padding-left : 20px;
  flex-basis : 300px; 
  border-bottom : 1px solid silver;
}
</style>


<script>
    $(document).ready(function(){
        
        //listReply(); // **댓글 목록 불러오기
        listReply2(); // ** json 리턴방식
        
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        $("#btnReply").click(function(){
            var replytext=$("#replytext").val();
            var bno="${dto.bno}"
            var param="replytext="+replytext+"&bno="+bno;
            $.ajax({                
                type: "post",
                url: "${path}/reply/insert.do",
                data: param,
                success: function(){
                    alert("댓글이 등록되었습니다.");
                    listReply2();
                }
            });
        });
        
        // 게시글 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/community/list?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
        
        // 게시글 삭제 버튼 클릭이벤트
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/community/remove";
                document.form1.submit();
            }
        });
        
     // 답글 버튼 클릭이벤트
        $("#btnRe").click(function(){
            
        	location.href = "${path}/reply/{bno}";
            
        });
        
        
        
        // 게시글 수정 버튼 클릭이벤트
        $("#btnUpdete").click(function(){
            var title = $("#title").val();
            var content = $("#content").val(); 
            //var writer = $("#writer").val();
            /* if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            } */
            /* if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            } */
            
           document.form1.action="${path}/community/modifyForm"
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
            
        });
    });
    
    // Controller방식
    // **댓글 목록1
    function listReply(){
        $.ajax({
            type: "get",
            url: "${path}/reply/list?bno=${dto.bno}",
            success: function(result){
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }
    // RestController방식 (Json)
    // **댓글 목록2 (json)
    function listReply2(){
        $.ajax({
            type: "get",
            //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
            url: "${path}/reply/listJson.do?bno=${dto.bno}",
            success: function(result){
                console.log(result);
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
    // **날짜 변환 함수 작성
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
    
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시글 보기</h2>
<form name="form1" method="post" action="${path}/upload/uploadForm" enctype="multipart/form-data">
    <div class="container">
   <div id="title_reg">
   <div id="title">${dto.title}</div>
   <div id="regdate"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></div>
  </div>
      <div id="name_cnt">
        <div id="name">${dto.userName}</div>
        <div id="viewcnt">조회수 : ${dto.viewcnt}</div>
      </div>
     <div id="content">${dto.content}</div>
  </div>
  
  
  <!-- 게시물번호를 hidden으로 처리 -->
     <input type="hidden" id="bno" name="bno" value="${dto.bno}">
     <input type="hidden" name="title" value="${dto.title}">
     <input type="hidden" name="content" value="${dto.content}">  
     <input type="hidden" name="userName" value="${dto.userName}"> 
     <input type="hidden" name="writer" value="${dto.writer}">
  
  <button type="button"style="margin: 0 auto;" id="btnRe">답글쓰기</button>
  <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
    <c:if test="${sessionScope.userId == dto.writer}"> 
         <button type="button" style="margin: 0 auto;" id="btnUpdete">수정</button>
        <button type="button" style="margin: 0 auto;" id="btnDelete">삭제</button>
    </c:if>  
        <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
        <button type="button" id="btnList">목록</button>
        <input type="file" name="file">
        <input type="submit" value="업로드">
        
   
   
   </form>
      <!-- **댓글 목록 출력할 위치 -->
    <div style="margin-top : 20px;" id="listReply"></div>
    
    <div style="width:650px; text-align: center;">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userId != null}">    
        <textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" id="btnReply">댓글 작성</button>
        </c:if>
    </div>
    
</body>
</html>
