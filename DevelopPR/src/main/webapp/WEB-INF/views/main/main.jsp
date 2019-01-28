<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevelopPR</title>
<%@ include file="../../views/include/tag_header.jsp" %>

</head>
<body>
<div class="container">
	
<header class="main_header">
		DevelopPR
</header>
	<nav id="min"class="top_nav">
		<img id="navimg" src="<c:url value='/resources/main/image/nav.png'/>" alt="nav" />
		<span id="navspan">MENU</span>
	</nav>
	<c:choose>
	<c:when test="${sessionScope.userEmail == null}">
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
		<ul class="fullmenu">
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="${path}/main">HOME</a></li>
			<li class="fullmenulist"><a href='${path}/resume/list'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='${path}/community/list'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='${path}/meeting'>CHAT / FOLLOW</a></li>
			<li class="fullmenulist"><a href='${path}/resume/regist'>이력서 등록</a></li>
			<li id="fulljoin"class="fullbtn"><a href="${path}/user/policy">MODIFICATION</a></li>
			<li id="fulllogin"class="fullbtn"><a href="${path}/user/logout">LOGOUT</a></li>
		</ul>
	</nav>
	</c:otherwise>
	</c:choose>
    <div class="test"></div>
	<section class="main_section">
		<div class="main1">	
		<c:forEach var="list" items="${list}" varStatus="status" begin="0" end="2">	
				<div class="PR${status.count}">
					<div class="filter${status.count}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" />
							<div class="content">
								<p>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									자격증 : ${list.acq_name}<br/>
									tech-stack : ${list.tech_name}<br/>
									comment : ${list.motto}<br/><br/>
									100_♥   10_follow
									<input type="button" class="pp" value="포트폴리오"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
						<a href="${path}/resume/detail?email=${list.email}"></a>
					</figure>
				</div>
		</c:forEach>
		</div>
		<div class="main2">	
		<c:forEach var="list" items="${list}" varStatus="status" begin="3" end="5">	
				<div class="PR${status.count+3}">
					<div class="filter${status.count+3}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" />
							<div class="content">
								<p>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									자격증 : ${list.acq_name}<br/>
									tech-stack : ${list.tech_name}<br/>
									comment : ${list.motto}<br/><br/>
									100_♥   10_follow
									<input type="button" class="pp" value="포트폴리오"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
						<a href="${path}/resume/detail?email=${list.email}"></a>
					</figure>
				</div>
		</c:forEach>
    	</div>
    	
    	<div class="main3">	
		<c:forEach var="list" items="${list}" varStatus="status" begin="6" end="7">	
				<div class="PR${status.count+6}">
					<div class="filter${status.count+6}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" />
							<div class="content">
								<p>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									자격증 : ${list.acq_name}<br/>
									tech-stack : ${list.tech_name}<br/>
									comment : ${list.motto}<br/><br/>
									100_♥   10_follow
									<input type="button" class="pp" value="포트폴리오"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
						<a href="${path}/resume/detail?email=${list.email}"></a>
					</figure>
				</div>
		</c:forEach>
			<div class="PR9">
				<div class="filter9"></div>
					<figure class="prpic">	
						<img src="<c:url value='/resources/main/image/pl.jpg'/>" alt="pr1" />
						<c:choose>
						<c:when test="${sessionScope.userEmail == null}">
						<a href='${path}/user/login'></a>
						</c:when>
						<c:otherwise>
						<a href="${path}/resume/regist"></a>
						</c:otherwise>
						</c:choose>
					</figure>		
			</div>
		</div>

		
		<div class="animation">
			<img id="animation_img" src="<c:url value='/resources/main/image/배경.png'/>"/>
				<c:forEach var="list" items="${list}" varStatus="status" begin="0" end="0">
				<div id="element111"></div><img id="element1" src="/DevelopPR/resources/photo/${list.profile_photo}">
				</c:forEach>
				<c:forEach var="list" items="${list}" varStatus="status" begin="1" end="15">
					<div id="element${status.count+1}${status.count+1}"></div><img id="element${status.count+1}" src="/DevelopPR/resources/photo/${list.profile_photo}">
				</c:forEach>
		</div>
		<div class="detail">
		</div>
	</section>
	<footer>
		푸터영역
	</footer>
</div>
</body>
</html>