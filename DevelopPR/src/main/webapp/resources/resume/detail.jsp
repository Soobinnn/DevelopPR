<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>이력서 상세보기</title>
<link rel="stylesheet" type="text/css" href="resume.css"/>
</head>
<body> 
<div class="container">
   <div class="head" style="background-image:url(flower.jpg);">
    <header>
    </header>
   </div>
    <div class="img">
        <div class="comment">comment</div>
        <img src="key2.png"/>
        <div class="impormation">
            <div>정보 공개 </div>
            <div> 구직중 </div>
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
	                               		 현재 구직 상태 *
	                            </div> 
	                            <div class="s_info">
	                                <div class="button"> </div>구직중
	                                <div class="button"> </div>재직중
	                            </div>
	                        </div>
	                        
	                        <div id="p_name">
	                            <div class="name" >
	                            이 름 *
	                            </div>
	                            <div class="p_info">
	                                <input type="text" id="pr_name" placeholder="이름을 입력해주세요.(2~20자)"/>
	                            </div>
	                        </div>
	                        
	
	                        <div id="phone">
	                            <div class="name">
	                                핸드폰번호 *
	                            </div>
	                            <div class="phone_info">
	                                <input type="text" placeholder="010123456578 형태로 적어주세요." class="textshort"/>
	                                <input type="radio" class="phone_radio" value="phoneopen"/>공개
	                                <input type="radio" class="phone_radio" value="phoneclose"/>비공개
	                            </div>
	                        </div>
	
	                        <div id="email">
	                            <div class="name">
	                                이메일 * 
	                            </div>
	                            <div class="email_info">
	                                <input type="text" placeholder="9~50자 제한" class="textshort"/>
	                                <input type="radio" value="emailopen"/>공개
	                                <input type="radio" value="emailclose"/>비공개
	                            </div>
	                        </div>
	
	                        <div id="blog">
	                            <div class="name" id="blog">
	                            블로그
	                            </div>
	                            <div class="info">
	                                <input type="text" placeholder="정규표현식 추가" class="textlong"/>
	                            </div>
	                        </div>
	
	                        <div id="address">
	                            <div class="name">
	                            주소 *
	                            </div>
	                            <div class="info">
	                                    <input type="text" placeholder="정규표현식 추가" class="textshort"/>
	                                <input type="radio" value="addressopen"/>공개
	                                <input type="radio" value="addressclose"/>비공개
	                            </div>
	                        </div>
	
	                        <div id="hopeaddress">
	                            <div class="name">
	                            희망 근무지
	                            </div>
	                            <div class="info">
	                                <input type="text" class="textlong"/>
	                            </div>
	                        </div>
	
	                        <div id="comment">
                            <div class="name">
								소개/ 좌우명/ Comment
                            </div>
                            <div class="info">
                                <input type="text" class="textlong"/>
                            </div>
                        </div>
           
                	<div class="project">
                        <div class="subject">프로젝트</div>
                        <button>+</button>
                       		 프로젝트이름, 설명,~~
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
	                 약어 기술명
	                퍼센트바
	            </div>	
            
    </div>

    </div>
    <footer>
        footer 고정
    </footer>
</body>
</html>