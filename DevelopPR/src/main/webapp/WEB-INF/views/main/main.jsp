<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../views/include/tag_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevelopPR</title>
</head>
<body>
<div class="container">
	<section class="main_section">
		<div class="main0">
			<p id="p1">이력서 작성하는 데 어려움을 느끼시나요?</p>
			<p id="p2">개발자들의 이력서, 포트폴리오를 보다 간편하게 작성하여 자신을 알리는 웹포트폴리오 플랫폼입니다.</p>
			<p id="p3">이력서, 포트폴리오의 정보를 공유하며 다른 개발자들과 채팅 할 수 있습니다.</p>
			<p id="p4">당신의 날개를 펼치세요. Spread Your Wings.</p>
		</div>
		<div class="main1">	
		
		<c:forEach var="list" items="${list}" varStatus="status" begin="0" end="2">	
				<div class="PR${status.count}">
					<div class="filter${status.count}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" class="profile"/>
							<div class="content">
								<p>
									<c:if test="${list.is_work==1}">
									  구직중
									</c:if>
									<c:if test="${list.is_work==0}">
									 재직중
									</c:if><br/>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									희망 직종 : ${list.prefer_job}<br/>
									comment : ${list.motto}<br/>
									Follow : ${list.followCount} &nbsp;&nbsp;|&nbsp;&nbsp;
									♥ : ${list.goodCount}
									<img src="/DevelopPR/resources/resume/inin.png" class="inin"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.login.userEmail}"/>
								<c:if test="${sessionScope.login.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.login.userEmail==null}">
									<a href="${path}/user/login"></a>
								</c:if>
					</figure>
				</div>
		</c:forEach>
		</div>
		<div class="main2">	
		<c:forEach var="list" items="${list}" varStatus="status" begin="3" end="5">	
				<div class="PR${status.count+3}">
					<div class="filter${status.count+3}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" class="profile"/>
							<div class="content">
							<p>
									<c:if test="${list.is_work==1}">
									  구직중
									</c:if>
									<c:if test="${list.is_work==0}">
									 재직중
									</c:if><br/>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									희망 직종 : ${list.prefer_job}<br/>
									comment : ${list.motto}<br/>
									Follow : ${list.followCount} &nbsp;&nbsp;|&nbsp;&nbsp;
									♥ : ${list.goodCount}
									<img src="/DevelopPR/resources/resume/inin.png" class="inin"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.login.userEmail}"/>
								<c:if test="${sessionScope.login.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.login.userEmail==null}">
									<a href="${path}/user/login"></a>
								</c:if>
						</figure>
				</div>
		</c:forEach>
    	</div>
    	
    	<div class="main3">	
		<c:forEach var="list" items="${list}" varStatus="status" begin="6" end="7">	
				<div class="PR${status.count+6}">
					<div class="filter${status.count+6}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" class="profile"/>
							<div class="content">
								<p>
									<c:if test="${list.is_work==1}">
									  구직중
									</c:if>
									<c:if test="${list.is_work==0}">
									 재직중
									</c:if><br/>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									희망 직종 : ${list.prefer_job}<br/>
									comment : ${list.motto}<br/>
									Follow : ${list.followCount} &nbsp;&nbsp;|&nbsp;&nbsp;
									♥ : ${list.goodCount}
									<img src="/DevelopPR/resources/resume/inin.png" class="inin"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.login.userEmail}"/>
								<c:if test="${sessionScope.login.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.login.userEmail==null}">
									<a href="${path}/user/login"></a>
								</c:if>
					</figure>
				</div>
		</c:forEach>
			<div class="PR9">
				<div class="filter9"></div>
					<figure class="prpic">	
						<img src="<c:url value='/resources/main/image/pl.jpg'/>" alt="pr1" />
						<c:choose>
						<c:when test="${sessionScope.login.userEmail == null}">
						<a href='${path}/user/login'></a>
						</c:when>
						<c:otherwise>
						<c:if test="${sessionScope.login.userIs_seek == 1}">
							<li class="fullmenulist"><a href='${path}/resume/regist'></a></li>
						</c:if>
						<c:if test="${sessionScope.login.userIs_seek == 0}">
							<li class="fullmenulist"><a href='javascript:modifyplz();'></a></li>
						</c:if>
						</c:otherwise>
						</c:choose>
					</figure>		
			</div>
		</div>
		<div class="main4">
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
</div>
</body>
</html>