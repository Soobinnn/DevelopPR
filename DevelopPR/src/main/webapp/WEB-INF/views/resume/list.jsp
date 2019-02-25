<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<title>이력서 목록보기</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<script>
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/resume/list?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
    }
</script>
</head>
<body>
<div class="container">

	<section class="main_section">
		<div class="search">
				<form name="form1" method="post" action="${path}/resume/list">
			        <select id="search_select" name="searchOption">
			            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
			            <option value="prefer_job" <c:out value="${map.searchOption == 'prefer_job'?'selected':''}"/> >희망 직종</option>
			            <option value="prefer_place" <c:out value="${map.searchOption == 'prefer_place'?'selected':''}"/> >희망 지역</option>
			            <option value="acq_name" <c:out value="${map.searchOption == 'acq_name'?'selected':''}"/> >기술</option>
			            <option value="tech_name" <c:out value="${map.searchOption == 'tech_name'?'selected':''}"/> >자격증</option>
			        </select>
			        <input name="keyword" id="keyword" value="${map.keyword}">
			        <input type="submit" id="search_submit" value="조회">
			    </form>
			   <div id="count">${map.count}개의 이력서가 있습니다.</div> 
	    </div>
		<div class="main1">	
		<c:forEach var="list" items="${map.list}" varStatus="status" begin="0" end="2">	
				<div class="PR${status.count}">
					<div class="filter${status.count}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/profile/${list.profile_photo}"/>' alt="pr1" class="profile"/>
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
						<a href="${path}/resume/detail/${list.email}/">
						<input type="hidden" name="email" value="${sessionScope.login.userEmail}"/>
						</a>
					</figure>
				</div>
		</c:forEach>
		</div>
		
		
		<div class="main2">	
		<c:forEach var="list" items="${map.list}" varStatus="status" begin="3" end="5">	
				<div class="PR${status.count+3}">
					<div class="filter${status.count+3}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/profile/${list.profile_photo}"/>' alt="pr1" class="profile"/>
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
						<a href="${path}/resume/detail/${list.email}/">
						<input type="hidden" name="email" value="${sessionScope.login.userEmail}"/>
						</a>					
					</figure>
				</div>
		</c:forEach>
    	</div>
		
		<div class="main3">	
		<c:forEach var="list" items="${map.list}" varStatus="status" begin="6" end="8">	
				<div class="PR${status.count+6}">
					<div class="filter${status.count+6}"></div>
					<figure class="prpic">
						<img src='<c:url value="/resources/profile/${list.profile_photo}"/>' alt="pr1" class="profile"/>
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
							
						<a href="${path}/resume/detail/${list.email}/">
						</a>
					</figure>
				</div>
		</c:forEach>
    	</div>
		<div class="resume_paging">
		 	                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.resumePager.curBlock > 1}">
                    <a href="javascript:list('1')"> << </a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.resumePager.curBlock > 1}">
                    <a id="pagestart" href="javascript:list('${map.resumePager.prevPage}')"> < </a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.resumePager.blockBegin}" end="${map.resumePager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.resumePager.curPage}">
                            <span style="color: #02456F">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.resumePager.curBlock <= map.resumePager.totBlock}">
                    <a id="pagedaum" href="javascript:list('${map.resumePager.nextPage}')">></a>
                </c:if>
                               <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.resumePager.curPage <= map.resumePager.totPage}">
                    <a id="pageend" href="javascript:list('${map.resumePager.totPage}')">>></a>
                </c:if>
		</div>
	</section>
	</div>
</body>
</html>