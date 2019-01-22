<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}

    #mainWrapper{
        width: 800px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#81F7F3;
        /* background-color:#c9c9c9; */
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
        border-radius : 8px;
}    

    #ulTable > li > ul > li:first-child                {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li            {width:40%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li         {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li      {width:12%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li   {width:7%;} /*조회수 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li{width:7%;} /*추천수 열 크기*/
    #divPaging {
          border: 1px solid;
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px; 

}

    .left {
        text-align : left;
}

.footer
{
direction : flex;
margin : 40px;
padding : -10px;
height : 70px;
}
</style>



<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/community/registForm";
        });
    });
    // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/community/list?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }

      </script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
    <h2>커뮤니티</h2>
    
    <!-- 레코드의 갯수를 출력 -->
    ${map.count}개의 게시물이 있습니다.
    
   <div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <li>커뮤니티 </li>

            <!-- 게시판 목록  -->
            
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                            <li>추천수</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    
                    <c:forEach var="row" items="${map.list}">
                    
                    
                    <li>
                        <ul>
                            <li>${row.bno}</li>
                            <li class="left"> <a href="${path}/community/detail?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} 
                    <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${row.recnt > 0}">
                    <span style="color: red;">(${row.recnt})
                    </span>
                    </c:if>
                </a></li>
                            <li> <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
                            <li>${row.userName}</li>
                            <li>${row.viewcnt}</li>
                        </ul>
                    </li>

                   </c:forEach>
           

            <!-- 게시판 페이징 영역 -->
           
   
   <div class="footer">
                <!-- <td colspan="5"> -->
                <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                  <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
               <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- 현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                  <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
            
        

<form name="form1" method="post" action="${path}/community/list">

         <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >All</option>
            <option value="user_name" <c:out value="${map.searchOption == 'user_name'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>  
      
      </li>
        <input name="keyword" value="${map.keyword}">
        <input type="submit" value="조회">
    <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
    <c:if test="${sessionScope.userId != null}">
        <button type="button" id="btnWrite">글쓰기</button>
    </c:if>
    </form>
</ul>
     </div>           
                
                

           
           <!--  <li id='liSearchOption'>
                <div>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </div>
                </li>
 -->
        </ul>
    </div>



</body>
</html>