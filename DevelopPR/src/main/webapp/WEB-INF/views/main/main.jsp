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
									follow_${list.followCount} &nbsp;&nbsp;
									♥_${list.goodCount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    
									<input type="button" class="pp" value="이력서"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.userEmail}"/>
								<c:if test="${sessionScope.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.userEmail==null}">
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
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" />
							<div class="content">
								<p>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									자격증 : ${list.acq_name}<br/>
									tech-stack : ${list.tech_name}<br/>
									comment : ${list.motto}<br/><br/>
									follow_${list.followCount} &nbsp;
									♥_${list.goodCount}&nbsp;
									<input type="button" class="pp" value="이력서"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.userEmail}"/>
								<c:if test="${sessionScope.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.userEmail==null}">
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
						<img src='<c:url value="/resources/photo/${list.profile_photo}"/>' alt="pr1" />
							<div class="content">
								<p>
									이름 : ${list.name}<br/>
									나이 : ${list.age}<br/>
									희망 근무지 : ${list.prefer_place}<br/>
									자격증 : ${list.acq_name}<br/>
									tech-stack : ${list.tech_name}<br/>
									comment : ${list.motto}<br/><br/>
									follow_${list.followCount} &nbsp;
									♥_${list.goodCount}&nbsp;
									<input type="button" class="pp" value="이력서"/>
								</p>
								<div class="heading">
									<h2><span>${list.name}</span></h2>
								</div>
							</div>
								<input type="hidden" name="email" value="${sessionScope.userEmail}"/>
								<c:if test="${sessionScope.userEmail!=null}">
									<a href="${path}/resume/detail/${list.email}/"></a>
								</c:if>
								<c:if test="${sessionScope.userEmail==null}">
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
</div>
</body>
</html>