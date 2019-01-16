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
	<nav id="full" class="top_nav">
		<img id="navclose" class="navx" src="<c:url value='/resources/main/image/x.png'/>" alt="x"/>
		<ul class="fullmenu">
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="<c:url value='${path}/main'/>">HOME</a></li>
			<li class="fullmenulist"><a href='#3'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='#4'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='#5'>CHAT / FOLLOW</a></li>
			<li class="fullmenulist"></li>
			<li id="fulljoin"class="fullbtn">JOIN US</li>
			<li id="fulllogin"class="fullbtn">LOGIN</li>
		</ul>
	</nav>
    <div class="test"></div>
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
					<a href="#"></a>
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
						<a href="#"></a>
					</figure>		
			</div>
		</div>
		<div class="animation">
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