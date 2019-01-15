<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="resumeRegist">
<head>
<title>이력서 등록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
    <div class="container">
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">이력서 등록</div>
               <div class="c">"~~~~~~~~~~~~~~~~~~"</div>
            </div>
            <div id="img">
                + 
            </div>
        </header>
        <div id="pill">* 는 필수 입력 사항입니다.</div>
    
        <main>
            <div class="detail">
                    <div class="subject">
                        상세 정보
                    </div>
                    <div class="content">
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

                        <div id="birth">
                            <div class="name">
                            생 일 * 
                            </div>
                            <div class="birth_info">
                                <select name="year" id="year">
                                    for문으로 년도~~
                                    <option>----년</option>
                                </select>
                                <select name="month" id="month">
                                    <option>--월</option>
                                </select>
                                <select name="day" id="day">
                                    <option>--일</option>
                                </select>
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
                    </div>

            </div>
            
            <div class="information">

                    <div class="acq">
                        <div class="subject">자격정보</div>
                        <div class="acq_ok">
                            <input type="text" class="textmiddle1" placeholder="자격증 취득 날짜"/>|
                            <input type="text" class="textmiddle2" placeholder="자격증 이름"/>
                            <button>+</button>
                        </div>
                    </div>
                

                    <div class="edu">
                        <div class="subject">학력/교육 정보</div>
                        <div class="edu_ok">
                                <input type="text" class="textmiddle1" placeholder="학력/교육 년도"/>|
                                <input type="text" class="textmiddle2" placeholder="학력 / 교육 이름"/>
                                <button>+</button>
                        </div>
                    
                    
                    </div>
                

                    <div class="career">
                        <div class="subject">경력 정보</div>
                        <div class="career_ok">
                                <input type="text" class="textmiddle1" placeholder="학력/교육 년도"/>|
                                <input type="text" class="textmiddle2" placeholder="학력 / 교육 이름"/>
                                <button>+</button>
                        </div>
                    </div>
            

            </div>
            
            <div class="skill">
                            <div class="subject">Tech-stack</div>
                            <div class="tech">
                                <div class="abb">
                                    <input type="text" id="abb"/>
                                </div>
                                <div class="techinfo">
                                    숫자<br/>
                                    <input type="text" id="techname" placeholder="기술 명"><br/>
                                  
                                   <div class="range" data-value="50">
										<div class="label">
											<div class="value">50</div>
											<div class="drop"></div>		
										</div>
										<div class="input-box">
											<input id="input-range" type="range" min="0" max="100" value="0"/>
											<div class="bar"></div>
										</div>
									</div>
									
									</div>
                            </div>
            </div>
        </main>
        
        <footer>
            aa
        </footer>
    
</div>
</body>
</html>