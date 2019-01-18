<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>이력서 상세보기</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body> 
<div class="container">
   <div class="head" style='background-image:url(<c:url value="/resources/resume/flower.jpg"/>);'>
    <header>
    </header>
   </div>
    <div class="img">
        <div class="comment">${dto.motto}</div>
        <img src='<c:url value="/resources/resume/${dto.profile_photo}"/>'/>
        
        <div class="information">
            <div class="textshort">
            	정보 공개 
            </div>
            <div class="textshort">
		       <c:if test="${dto.is_work==0}">구직중</c:if>
		       <c:if test="${dto.is_work==1}">재직중</c:if>
	       	</div>
            <button>포트폴리오</button>
        </div>
    </div>
    <div class="content">
    	<div class="up">
                <div class="left">
                        <div class="subject">상세정보</div>
                        <div class="detail">
                        
	                        <div class="state">             
	                            <div class="name">
	                               		 현재 구직 상태 
	                            </div> 
	                            <div class="textshort">
		                            <c:if test="${dto.is_work==0}">구직중</c:if>
		                            <c:if test="${dto.is_work==1}">재직중</c:if>
	                            </div>
	                        </div>
	                        
	                        <div class="p_name">
	                            <div class="name" >
	                           		 이 름 
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.name}</div>
	                            </div>
	                        </div>
	                        
	                          <div class="p_name">
	                            <div class="name" >
	                           		 나 이
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.age}</div>
	                            </div>
	                        </div>
	                        
	                          <div class="p_name">
	                            <div class="name" >
	                           		 생 일 
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.birthday}</div>
	                            </div>
	                        </div>
	                        
	                        
	                        
	                        <div id="phone">
	                            <div class="name">
	                               		 핸드폰번호 
	                            </div>
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
	                            <div class="name">
	                               	 이메일 
	                            </div>
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
	                            <div class="name">
	                            	블로그
	                            </div>
	                            <div class="info">
	                               <div class="textshort">${dto.blog}</div>
	                            </div>
	                        </div>
	
	                        <div id="address">
	                            <div class="name">
	                            	주소
	                            </div>
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
	                            <div class="name">
	                           		 희망 근무지
	                            </div>
	                            <div class="info">
	                                <div class="textshort">${dto.prefer_place}</div>
	                            </div>
	                        </div>
	
	                       
           
                	<div class="projects">
                        <div class="subject">프로젝트</div>
                          	<input type="button" id="p_button" value="프로젝트 추가"/>
                          	<div class="project">
                          		aa
                          	</div>
                    </div>
                    </div>
               </div>

                <div class="right">
                    <div class="certificate">
                        <div class="subject">자격 정보</div>
                            <ul>
                                <li>취득날짜 | 자격증 이름</li> 
                                <li>취득날짜 | 자격증 이름</li> 
                            </ul>  
                    </div>

                    <div class="edu">
                        <div class="subject">학력 사항</div>
                            <ul>
                                <li>해당년도 | 학력정보</li> 
                                <li>해당년도 | 학력정보</li> 
                            </ul>  
                    </div>

                    <div class="career">
                        <div class="subject">경력/교육 사항</div>
                            <ul>
                                <li>해당년도 | 경력정보</li> 
                                <li>해당년도 | 경력정보</li> 
                            </ul>  
                    </div>                
                </div>
       </div> 
            	<div class="tech-stack">
	                <div class="subject">Tech-stack</div>
	                 
	                <div class="techs">
		                    <div class="tech">
		                        <div>
		                            ${dto.abb}
		                        </div>
		                        <div class="techinfo">
		                            ${dto.tech_name}<br/>
		                            <input class="input-range" type="range" value="${dto.tech_percent}" readonly/>
		                           		${dto.tech_percent}
		                        </div>
		                    </div>
		               </div>
            
   				 </div>

    </div>
    <footer>
        footer 고정
    </footer>
</body>
</html>