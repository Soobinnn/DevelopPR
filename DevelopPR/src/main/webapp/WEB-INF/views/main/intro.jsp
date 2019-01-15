<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevelopPR_INTRO</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<script>
	$(document).ready(function()
	{
		$("#moveMain").click(function()
	    {
	        // 메인페이지 주소로 이동
	            location.href = "${path}/main";
	        });
	    });
</script>
</head>
<body>
	<h5>안녕하세요 DeVelopPR 입니다.</h5>
	<button id="moveMain">이동</button>
</body>
</html>