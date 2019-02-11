<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="../include/tag_header.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<style type="text/css">

.co_list body{
        display : flex;
        line-height:2em;        /*line-height는 줄 높이 속성이다. 원래 값 2em */
        font-family: 'Noto Sans KR', sans-serif; /*폰트 변경*/
        
}
.co_list ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}

.co_list #mainWrapper{   
       width:850px;
       height:500px;
       margin:0 auto; /*틀 안에서 가운데 정렬*/
       line-height: 2.2em;
       margin-top : 5px;
     
    }

.co_list #mainWrapper > ul > li:first-child { /*페이지 제목이 위치한다.*/
        text-align: center;
        font-size:1rem;    /*폰트 사이즈 원래 값 14pt*/
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

.co_list #ulTable > li:first-child > ul > li { /*게시판 메뉴바*/
        /*메뉴바 색상 없앤다.*/
        /*background-color:#81F7F3; //원래 색상 백업   */
        /* background-color:#c9c9c9; */
        font-weight:bold;
        text-align:center;
}

.co_list #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:30px;
}
.co_list #ulTable > li > ul > li { 
        margin-top : 5px;
        float:left;
        font-size:0.8rem;
        /* border-bottom:1px solid silver; */  /*게시글 간 경계선 아예 지운다.*/
        vertical-align:baseline;
        border-radius : 8px;
}    

.co_list #content{
margin-top : 5px;
margin-bottom : 5px;
line-height:30px;
}



.co_list #content:nth-child(2n+1)   /*게시글 라인에 한 칸씩 건너뛰면서 색샹을 입힌다. */
{
background-color : #f6f6f6;
border-radius : 8px;
}


.co_list #ulTable > li > ul > li:first-child                {width:13%; font-size:0.8rem;} /*No 열 크기*/
.co_list #ulTable > li > ul > li:first-child +li            {width:40%; font-size:0.9rem;} /*제목 열 크기*/
.co_list #ulTable > li > ul > li:first-child +li+li         {width:20%; font-size:0.8rem;} /*작성일 열 크기*/
.co_list #ulTable > li > ul > li:first-child +li+li+li      {width:14%; font-size:0.8rem;} /*작성자 열 크기*/
.co_list #ulTable > li > ul > li:first-child +li+li+li+li   {width:10%; font-size:0.8rem;} /*조회수 열 크기*/

.co_list #divPaging {
        border: 1px solid;
        clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

.co_list #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

.co_list #liSearchOption {clear:both;}
.co_list #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px; 

}

.co_list .left {
        text-align : left;
        
}




.co_list .footer /*페이지 넘버링과 검색, 조회, 글쓰기 버튼이 들어있는 div*/
{
height:100px;
padding-top : 40px;
margin : 0 auto;

}

.co_list .lookup {   /* 검색 버튼의 속성  */
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
.co_list .lookup:hover{ /*검색 버튼 호버 시 투명 효과*/
 background-color:rgba( 255, 255, 255, 0.1 );
			color: black;
}

.co_list .btn_write {   /* 글쓰기 버튼 속성  */
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
		    margin-top : 10px;
		}
.co_list .btn_write:hover{ /* 글쓰기 버튼 호버 시 투명 효과*/
 background-color:rgba( 255, 255, 255, 0.1 );
			color: black;
}

.co_list #searchbox{
width:auto;
height:35px;
font-size:1rem;
text-align:center;
border-radius : 30px;
}

.co_list #svalue{
font-size:15px;
}

.co_list #keyword{   /*검색창*/
height:20px;
font-size : 1rem;
border-radius : 5px;
margin-top : 5px;
}


.co_list a:link { color: black; text-decoration: none;}
.co_list a:visited { color: black; text-decoration: none;}
.co_list a:hover { color: black; text-decoration: underline;}





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
<div class="co_list"> <%--전체를 감싸는 div --%>
    
    
    <!-- 레코드의 갯수를 출력 -->
   <%--  ${map.count}개의 게시물이 있습니다. --%>
    
   <div id="mainWrapper">

      <ul>
            <!-- 게시판 제목 -->
            <!-- <li>커뮤니티 </li> -->

            <!-- 게시판 목록  -->
            
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        <%--<li>추천수</li> //추천수 삭제(나중에 시간이 남으면 추가)   --%>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    
                    <c:forEach var="row" items="${map.list}">
                    
                    
                    <li id="content">
                        <ul>
                            <li>${row.bno}</li>
                            <li class="left"> <a href="${path}/community/detail?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} 
                    <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${row.recnt > 0}">
                    <span style="color: red;">(${row.recnt})
                    </span>
                    </c:if>
                </a></li>
                            <li> <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></li>   <%--pattern="yyyy-MM-dd HH:mm:ss" --%>
                            <li>${row.writer}</li>
                            <li>${row.viewcnt}</li>
                        </ul>
                    </li> <%-- end of li id="content" --%>

                   </c:forEach>
           

            <!-- 게시판 페이징 영역 -->
           
   
   <div class="footer">
                <!-- <td colspan="5"> -->
                <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                <a href="javascript:list('1')"> << </a>
                </c:if>
                
                <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                  <a href="javascript:list('${map.boardPager.prevPage}')"> < </a>
                </c:if>
                
                <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
               <c:forEach  var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- 현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red; font-size:1.2rem;">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a style="font-size:1rem;" href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">></a>
                </c:if>
                
                <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                  <a style="font-size:1rem;" href="javascript:list('${map.boardPager.totPage}')">>></a>
                </c:if>
            
        

<form name="form1" method="post" action="${path}/community/list">

         <select id="searchbox" name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option id="svalue" value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>All</option>
            <option id="svalue" value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >Nick</option>
            <option id="svalue" value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option id="svalue" value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>  
      
      </li>
        <input id="keyword" name="keyword" value="${map.keyword}">
        <input class="lookup" type="submit" value="조회">
    <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
    <%-- <c:if test="${sessionScope.userId != null}"> --%>
    
    <c:if test="${sessionScope.userName != null}">
        <button class="btn_write" type="button" id="btnWrite">글쓰기</button>
    </c:if>

</ul>
     </div>           
           
        </ul>
    </div>


    </form>



<!-- end of co_list -->
</body>
</html>



<!-- 수정 전 검색 로직 -->
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



