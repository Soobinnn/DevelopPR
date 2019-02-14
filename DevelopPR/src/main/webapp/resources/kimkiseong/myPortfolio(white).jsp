<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/> <%-- 상대경로 path 로드 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> <%--제이쿼리 플러그인 로드 --%>
<title>Main</title>
<style>
.kks .container{
display:flex;
flex-direction:row;
border: 1px solid;
align-items: stetch;
}
</style>
<script>

</script>
</head>
<body>
<div class="kks">
  <div class="container">
    <div id="my_photo">
      
     </div><%--end of my_photo --%>
    <div id="menu">
        <div id="about_me"></div>
        <div id="portfolio"></div>
        <div id="contact"></div>
        </div><%--end of menu --%>
    <div id="contents">
      <%--이곳에 메뉴의 내용들을 Ajax로 불러온다. --%>
    </div><%--end of contents --%>  
   </div><%--end of container --%>
</div><%--end of kks div --%>
</body>
</html>