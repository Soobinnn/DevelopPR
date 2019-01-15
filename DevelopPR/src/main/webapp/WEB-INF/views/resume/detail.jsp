<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>이력서 상세보기</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
<div class="container">
    <header>
        <div class="comment">comment</div>
    </header>
    <div class="img">
        <img src="../key2.png"/>
        <div class="impormation">
            <label>정보 공개 </label>
            <label> 구직중 </label>
            <button>포트폴리오</button>
        </div>
    </div>
    <section class="content">
			<main>
                <div class="left">
                    <div class="detail">
                        <label class="subject">상세정보</label>
                        <ul>
                            <li>* 이름</li>
                            <li>* 나이</li>
                            <li>~~</li>
                        </ul>
                    </div>

                    <div class="project">
                        <label class="subject">프로젝트</label>
                        <button>+</button>
                        프로젝트이름, 설명,~~
                    </div>
                </div>

                <div class="right">
                    <div class="certificate">
                        <label class="subject">자격 정보</label>
                            <ul>
                                <li>취득날짜 | 자격증 이름</li> 
                                <li>취득날짜 | 자격증 이름</li> 
                            </ul>  
                    </div>

                    <div class="edu">
                        <label class="subject">학력 사항</label>
                            <ul>
                                <li>해당년도 | 학력정보</li> 
                                <li>해당년도 | 학력정보</li> 
                            </ul>  
                    </div>

                    <div class="career">
                        <label class="subject">경력/교육 사항</label>
                            <ul>
                                <li>해당년도 | 경력정보</li> 
                                <li>해당년도 | 경력정보</li> 
                            </ul>  
                    </div>                
                </div>
            </main>
            
            <div class="tech-stack">
                <label class="subject">Tech-stack</label>
                 약어 기술명
                퍼센트바
            </div>
            
    </section>

    </div>
    <footer>
        footer 고정
    </footer>
</body>
</html>