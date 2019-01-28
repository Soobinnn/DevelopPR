<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../views/include/tag_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevelopPR</title>
<script>
	var socket = null;
	var success = null;
	success = '${msg}';
	var nick = '${login.userNick}';
	
	function connect() 
	{
		socket = new WebSocket("ws://localhost:8080/DevelopPR/chat-ws");
		
	
	}
	
	$(document).ready(function() 
	{
		console.log("msg의 상태가??" +success);
		console.log("세션의 상태가..?" +nick);
		if(nick==null || success == null)
		{
			disconnect();
			console.log("연결 끊김.");
		}
		else
		{
			connect();
			console.log("연결됨.");
		}
	})
</script>
</head>
<body>
<div class="container">
	<section class="main_section">
		<div class="main1">		
			<div class="PR1">
				<div class="filter1"></div>
				<figure class="prpic">
					<img src="<c:url value='/resources/main/image/1.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>IM SOO BIN</span></h2>
							</div>
						</div>
					<a href="#"></a>
				</figure>
			</div>
			<div class="PR2">
				<div class="filter2"></div>
				<figure class="prpic">
					<img src="<c:url value='/resources/main/image/2.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>Kim Ki seong</span></h2>
							</div>
							</div>
					<a href="#"></a>
				</figure>
			</div>
			<div class="PR3">
				<div class="filter3"></div>
				<figure class="prpic">
						<img src="<c:url value='/resources/main/image/3.jpg'/>" alt="pr1" />
							<div class="content">
								<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
								<div class="heading">
									<h2><span>Ko Seok Min</span></h2>
								</div>
							</div>
						<a href="#"></a>
				</figure>		
			</div>
		</div>
		<div class="main2">
			<div class="PR4">
				<div class="filter4"></div>
				<figure class="prpic">
					<img src="<c:url value='/resources/main/image/4.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>MR C</span></h2>
							</div>
						</div>
					<a href="#"></a>
				</figure>		
			</div>
			<div class="PR5">
				<div class="filter5"></div>
				<figure class="prpic">
					<img src="<c:url value='/resources/main/image/5.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>Lee Jun Hyung</span></h2>
							</div>
						</div>
					<a href="#"></a>
				</figure>		
			</div>
			<div class="PR6">
				<figure id="prfic6"  class="prpic">
					<div class="filter6"></div>
					<img src="<c:url value='/resources/main/image/6.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>Seo Dong kuk</span></h2>
							</div>
						</div>
					<a href="#"></a>
				</figure>		
			</div>
		</div>
		<div class="main3">
			<div class="PR7">
				<div class="filter7"></div>
				<figure class="prpic">
					<img src="<c:url value='/resources/main/image/7.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
								<div class="heading">
								<h2><span>Kim SO JIN</span></h2>
							</div>
						</div>
					<a href="${path}/resume/detail?email=so97so@naver.com&name=${sessionScope.userName}"></a>
				</figure>
			</div>
			<div class="PR8">
				<figure class="prpic">
					<div class="filter8"></div>
					<img src="<c:url value='/resources/main/image/8.jpg'/>" alt="pr1" />
						<div class="content">
							<p>I say, if your knees aren't green by the end of the day, you ought to seriously re-examine your life.</p>
							<div class="heading">
								<h2><span>IM SOO BIN</span></h2>
							</div>
						</div>
					<a href="#"></a>
				</figure>	
			</div>
			<div class="PR9">
				<div class="filter9"></div>
					<figure class="prpic">	
						<img src="<c:url value='/resources/main/image/pl.jpg'/>" alt="pr1" />
						<c:choose>
						<c:when test="${sessionScope.userEmail == null}">
						<a href='${path}/user/login'></a>
						</c:when>
						<%-- <c:when test="${sessionScope.userEmail == null}">
						<a href="#"></a>
						</c:when> --%>
						<c:otherwise>
						<a href="${path}/resume/regist"></a>
						</c:otherwise>
						</c:choose>
					</figure>		
			</div>
		</div>
		<div class="animation">
		</div>
		<div class="detail">
		</div>
	</section>
</div>
</body>
</html>