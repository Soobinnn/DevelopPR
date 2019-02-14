<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/developpr.css'/>"/>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script type="text/javascript" src="http://beneposto.pl/jqueryrotate/js/jQueryRotateCompressed.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

	<script>
	var socket = null;
	var success = null;
	success = '${msg}';
	var nick = '${login.userNick}';
	
	function connect() 
	{
		socket = new WebSocket("ws://localhost:8080/DevelopPR/chat-ws");
		socket.onmessage = onMessage;
		socket.onopen = function() 
		{
		    console.log('open');
		    // 로그아웃 -> 로그인 할 때, 페이지 넘어 갈때마다 메시지 확인
		    if(!(nick == null || nick ==""))
		    {
		    	var msg = "userNick="+nick;
				$.ajax({                                                                                                                          
					 async : true,
			         type :'POST',
			         data : msg,
			         url : "${path}/alarm",
			         success : function(data)
			         {
			        	alarmMsg(data);
			         }
				})
		    }
		};
	}
	//서버로 부터 받은 메세지 보내주기
	function onMessage(evt) 
	{
		var msg = "userNick="+nick;
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : msg,
	         url : "${path}/alarm",
	         success : function(data)
	         {
	        	alarmMsg(data);
	         }
		})
	}
	
	function alarmMsg(data)
	{
		if(data > 0)
		{
			$('#alarm').empty();
			$('#alarm').css({"display" : "block"});
			$('#alarm').append(data);
			$('#chatmenu').empty();
			$('#chatmenu').css({"display" : "block"});
			$('#chatmenu').append(data);
		}
		else
		{
			$('#alarm').empty();
			$('#alarm').css({"display" : "none"});
		}
	}
	$(document).ready(function()
	{
		console.log("msg의 상태가??" +success);
		console.log("세션의 상태가..?" +nick);
		if(!(success==""&&nick==""))
		{
			connect();	
		}
		
		$(".top_nav").click(function()
		{
			$('.navx').fadeOut(100,function(){$('.navx').fadeTo(500,1,function(){$('.navx').css({'animation-iteration-count':'1'})})});
			$('#full').animate({width: "toggle", height: "toggle"},400,'easeOutQuad');
			// $('.navx').rotate({animateTo:-360 , duration:1000});
			$('.fullmenu').fadeOut(200,function(){$('.fullmenu').fadeTo(500,1);});
		})
	})
	</script>

</head>
<body>
  <nav id="min"class="top_nav">
  		<div id="alarm"></div>
		<img id="navimg" src="<c:url value='/resources/main/image/nav.png'/>" alt="nav" />
		<span id="navspan">MENU</span>
	</nav>
	<c:choose>
	<c:when test="${sessionScope.login.userEmail == null}">
	<nav id="full" class="top_nav">
		<img id="navclose" class="navx" src="<c:url value='/resources/main/image/x.png'/>" alt="x"/>
		<ul class="fullmenu">
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="${path}/main">HOME</a></li>
			<li class="fullmenulist"><a href='${path}/user/login'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='${path}/community/list'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='${path}/user/login'>CHAT / FOLLOW</a></li>
			<li class="fullmenulist"></li>
			<li id="fulljoin"class="fullbtn"><a href="${path}/user/policy">JOIN US</a></li>
			<li id="fulllogin"class="fullbtn"><a href="${path}/user/login">LOGIN</a></li>
		</ul>
	</nav>
	</c:when>
	<c:otherwise>
	<nav id="full" class="top_nav">
		<img id="navclose" class="navx" src="<c:url value='/resources/main/image/x.png'/>" alt="x"/>
		<ul class="fullmenu"><!-- 회원 탈퇴 삭제 : 준형 -->
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="${path}/main">HOME</a></li>
			<li class="fullmenulist"><a href='${path}/resume/list'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='${path}/community/list'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='${path}/meeting'>CHAT / FOLLOW</a><div id="chatmenu"></div></li>
			<li class="fullmenulist"><a href='${path}/resume/regist'>이력서 등록</a></li>
			<li id="fulljoin"class="fullbtn"><a href="${path}/user/modifyInfoform">MODIFICATION</a></li>
			<li id="fulllogin"class="fullbtn"><a href="${path}/user/logout">LOGOUT</a></li>
		</ul>
	</nav>
	</c:otherwise>
	</c:choose>
  <tiles:insertAttribute name="header" />
  <tiles:insertAttribute name="body" />
  <tiles:insertAttribute name="footer" />
  
</body>
</html>