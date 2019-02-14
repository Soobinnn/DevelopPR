<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply List</title>
<%@ include file="../include/tag_header.jsp" %>
<style>
.re_list
{
margin : 0 auto;
height:100px;
}

.re_list #btnModify {  
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

.re_list #btnModify:hover{ /* 수정 버튼 호버 시 투명 효과*/
 background-color:rgba( 255, 255, 255, 0.1 );
			color: black;
}


</style>
</head>
<body>
<div class="re_list">
 <table style="width:700px; margin : 0 auto;">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.replyer}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm"/>) <%--입력 시간 초단위 삭제 --%>
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <c:if test="${sessionScope.userNick == row.replyer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach>
        
        <!-- 페이징 -->
        <tr style="text-align: center;">
            <td>
                <!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('1')">[처음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
                </c:if>
                <!-- 페이지 블럭 처음부터 마지막 블럭까지 -->
                <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
                    <c:choose>
                        <c:when test="${num == replyPager.curPage}">
                            ${num}&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:listReply('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
    </table>
    
    <!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>

</div> <%-- end of re_list --%>

</body>
</html>