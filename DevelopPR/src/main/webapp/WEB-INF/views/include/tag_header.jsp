<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/developpr.css'/>"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="http://beneposto.pl/jqueryrotate/js/jQueryRotateCompressed.js"></script>
<script>
	$(document).ready(function()
	{
		$(".top_nav").click(function()
		{
			
			$('.navx').fadeOut(100,function(){$('.navx').fadeTo(500,1,function(){$('.navx').css({'animation-iteration-count':'1'})})});
			$('#full').animate({width: "toggle", height: "toggle"},400,'easeOutQuad');
			// $('.navx').rotate({animateTo:-360 , duration:1000});
			$('.fullmenu').fadeOut(200,function(){$('.fullmenu').fadeTo(500,1);});
		})
	})
</script>