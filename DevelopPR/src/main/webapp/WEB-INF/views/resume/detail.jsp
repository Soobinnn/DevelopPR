<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>이력서 상세보기</title>
<%@ include file="../../views/include/tag_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/resume/resume.css'/>" />
</head>
<body>
	<div class="container">
		<div class="head"
			style='background-image:url(<c:url value="/resources/resume/flower.jpg"/>);'>
			<header> </header>
		</div>
		<div class="img">
			<div class="comment">${dto.motto}</div>
			<img src='<c:url value="/resources/photo/${dto.profile_photo}"/>' />

			<div class="information">
				<div class="textshort1">정보 공개</div>
				<div class="textshort1">
					<c:if test="${dto.is_work==0}">구직중</c:if>
					<c:if test="${dto.is_work==1}">재직중</c:if>
				</div>
				<div class="textshort2">포트폴리오</div>
				<c:choose>
				<c:when test="${chkFollow == 1}">
				<div id="unfollow">
					<!-- 팔로우가 되어 있다면 언팔로우, 언팔이면 팔로우 뜨게.. -->		
					<form action="${path}/resume/unfollowing" name="unfollow_form" method="post" >
						<input type="hidden" value="${dto.email}" name="email"> 
						<input type="hidden" value="${sessionScope.userName}" name="follower_nick"> 
						<input type="hidden" value="${dto.name}" name="following_nick">
						<input type="submit" name="unfollow" value="언팔로우">
					</form>
				</div>
				</c:when>
				<c:otherwise>
				<div id="follow">		
					<form action="${path}/resume/following" name="follow_form" method="post" >
						<input type="hidden" value="${dto.email}" name="email"> 
						<input type="hidden" value="${sessionScope.userName}" name="follower_nick"> 
						<input type="hidden" value="${dto.name}" name="following_nick"> 
						<input type="submit" name="follow"  value="팔로우" class="follow">
					</form>
				</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="content">
			<div class="up">
				<div class="left">
					<div class="subject">상세정보</div>
					<div class="detail">

						<div class="state">
							<div class="name">현재 구직 상태</div>
							<div class="textshort">
								<c:if test="${dto.is_work==0}">구직중</c:if>
								<c:if test="${dto.is_work==1}">재직중</c:if>
							</div>
						</div>

						<div class="p_name">
							<div class="name">이 름</div>
							<div>
								<div class="textshort">${dto.name}</div>
							</div>
						</div>

						<div class="p_name">
							<div class="name">나 이</div>
							<div>
								<div class="textshort">${dto.age}</div>
							</div>
						</div>

						<div class="p_name">
							<div class="name">생 일</div>
							<div>
								<div class="textshort">${dto.birthday}</div>
							</div>
						</div>



						<div id="phone">
							<div class="name">핸드폰번호</div>
							<div class="phone_info">
								<c:if test="${dto.cnum_is_open==0}">
									<div class="textshort">비공개</div>
								</c:if>
								<c:if test="${dto.cnum_is_open==1}">
									<div class="textshort">${dto.cell_num}</div>
								</c:if>
							</div>
						</div>

						<div id="email">
							<div class="name">이메일</div>
							<div class="email_info">
								<c:if test="${dto.email_is_open==0}">
									<div class="textshort">비공개</div>
								</c:if>
								<c:if test="${dto.email_is_open==1}">
									<div class="textshort">${dto.email}</div>
								</c:if>
							</div>
						</div>

						<div id="blog">
							<div class="name">블로그</div>
							<div class="info">
								<div class="textshort">${dto.blog}</div>
							</div>
						</div>

						<div id="address">
							<div class="name">주소</div>
							<div class="info">
								<c:if test="${dto.address_is_open==0}">
									<div class="textshort">비공개</div>
								</c:if>
								<c:if test="${dto.address_is_open==1}">
									<div class="textshort">${dto.address}</div>
								</c:if>

							</div>
						</div>

						<div id="hopeaddress">
							<div class="name">희망 근무지</div>
							<div class="info">
								<div class="textshort">${dto.prefer_place}</div>
							</div>
						</div>



						<div class="projects">
							<div class="subject">프로젝트</div>
							<input type="button" id="p_button" value="프로젝트 추가" />
							<div class="project">aa</div>
						</div>
					</div>
				</div>

				<div class="right">
					<div class="certificate">
						<div class="subject">자격 정보</div>

						<script type="text/javascript">
							var acq_date = "${dto.acq_date}";
							var dateSplit = acq_date.split(',');

							var acq_name = "${dto.acq_name}";
							var nameSplit = acq_name.split(',');

							for ( var i in dateSplit) {
								document
										.write('_$tag_____________$tag________________'
												+ dateSplit[i]
												+ '_$tag__$tag________________'
												+ nameSplit[i] + '_$tag__$tag_');
							}
						</script>
					</div>

					<div class="edu">
						<div class="subject">학력 사항</div>
						<script type="text/javascript">
							var gradu_date = "${dto.gradu_year}";
							var gdateSplit = gradu_date.split(',');

							var edu_name = "${dto.edu_info}";
							var enameSplit = edu_name.split(',');

							for ( var i in gdateSplit) {
								document
										.write('<div class="acq"><div class="acqdate">'
												+ gdateSplit[i]
												+ '</div><div class="acqname">'
												+ enameSplit[i]
												+ '</div></div>');
							}
						</script>
					</div>



					<div class="career">
						<div class="subject">경력/교육 사항</div>
						<script type="text/javascript">
							var c_date = "${dto.career_year}";
							var cdateSplit = c_date.split(',');

							var c_name = "${dto.career_info}";
							var cnameSplit = c_name.split(',');

							for ( var i in cdateSplit) {
								document
										.write('<div class="acq"><div class="acqdate">'
												+ cdateSplit[i]
												+ '</div><div class="acqname">'
												+ cnameSplit[i]
												+ '</div></div>');
							}
						</script>
					</div>
				</div>
			</div>
			<div class="tech-stack">
				<div class="subject">Tech-stack</div>

				<div class="techs">
					<script type="text/javascript">
						var abb = "${dto.abb}";
						var abbSplit = abb.split(',');

						var tech_name = "${dto.tech_name}";
						var nameSplit = tech_name.split(',');

						var tech_percent = "${dto.tech_percent}";
						var percentSplit = tech_percent.split(',');

						for ( var i in abbSplit) {
							document
									.write('<div class="tech"><div class="abb">'
											+ abbSplit[i]
											+ '</div><div class="techinfo"><div class="tech_name">'
											+ nameSplit[i]
											+ '</div>'
											+ '<input class="input-range" type="range" value="'+ percentSplit[i] +'" readonly/>'
											+ percentSplit[i] + '</div></div>');
						}
					</script>
				</div>
			</div>

		</div>
		<footer> footer 고정 </footer>
    </div>
</div>
    <footer>
        footer 고정
    </footer>
</body>
</html>