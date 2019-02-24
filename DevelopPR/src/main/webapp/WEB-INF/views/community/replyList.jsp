<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply List</title>
<%@ include file="../include/tag_header.jsp" %>    <%-- 타일즈 에러 난다. --%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/community/re_list.css'/>"/>

<style>
/* .replyL 
{
margin : 0 auto;
height:100px;
}
 */

</style>
</head>
<body>
<div class="replyL">
 <table style="width:700px; margin : 0 auto;">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
      

    <div class="reply_container">
      
         <div class="nick_regdate">
           <div id="nickname">${row.replyer}</div> <div id="regdate">(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm"/>)</div>
         </div> <!--닉네임과 날짜를 담는 div-->
      
        <div id="reply_contents">${row.replytext}</div>
        <div id="btns"><input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')"></div><!--버튼-->
       <div id="bottom_line"></div> <!-- 댓글 간 구분용 div-->
    </div> <!-- end of reply_container-->

        </c:forEach>
        
        <!-- 페이징 -->
        <tr style="text-align: center;">
            <td>
                <!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('1')"> << </a>
                </c:if>
                <!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('${replyPager.prevPage}')"> < </a>
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
                    <a href="javascript:listReply('${replyPager.nextPage}')"> > </a>
                </c:if>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.totPage}')"> >> </a>
                </c:if>
            </td>
        </tr>
    </table>
    
    <!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>

</div> <%-- end of re_list --%>

</body>
</html>