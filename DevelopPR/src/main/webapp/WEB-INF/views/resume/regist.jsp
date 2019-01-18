<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resumeRegist">
<head>
<title>이력서 등록</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
<form name="form1" method="post" action="${path}/resume/registConfirm">
    <div class="container">
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">이력서 등록</div>
               <div class="c">"~~~~~~~~~~~~~~~~~~"</div>
            </div>
            <div id="img">
                + <input type="text" name="profile_photo"/>
            </div>
        </header>
        <div id="pill">* 는 필수 입력 사항입니다.</div>
    
        <div class="main">
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
                                <input type="radio" name="is_work" value="0"/>구직중
                                <input type="radio" name="is_work" value="1"/>재직중
                            </div>
                        </div>
                    </div>
                        
                        <div id="p_name">
                            <div class="name" >
                       		     이 름 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="name" placeholder="이름을 입력해주세요.(2~20자)"/>
                            </div>
                        </div>
                        
                         <div id="p_name">
                            <div class="name" >
                       		    나 이 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="age" placeholder="숫자로 입력해주세요."/>
                            </div>
                        </div>

                        <div id="birth">
                            <div class="name">
                            생 일 * 
                            </div>
                            <div class="birth_info">
                                <input type="date" name="birthday" />
                            </div>
                        </div>

                        <div id="phone">
                            <div class="name">
                                핸드폰번호 *
                            </div>
                            <div class="phone_info">
                                <input type="text" placeholder="010123456578 형태로 적어주세요." name="cell_num" class="textshort"/>
                                <input type="radio" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen"/>공개
                                <input type="radio" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose"/>비공개
                            </div>
                        </div>

                        <div id="email">
                            <div class="name">
                                이메일 * 
                            </div>
                            <div class="email_info">
                                <input type="text" name="email" placeholder="9~50자 제한" class="textshort"/>
                                <input type="radio" name="email_is_open" value="1"/>공개
                                <input type="radio" name="email_is_open" value="0"/>비공개
                            </div>
                        </div>

                        <div id="blog">
                            <div class="name">
                       			     블로그
                            </div>
                            <div class="info">
                                <input type="text" name="blog" placeholder="정규표현식 추가" class="textlong"/>
                            </div>
                        </div>

                        <div id="address">
                            <div class="name">
                            주소 *
                            </div>
                            <div class="info">
                                    <input type="text" name="address" placeholder="정규표현식 추가" class="textshort"/>
                                <input type="radio" name="address_is_open" value="1"/>공개
                                <input type="radio" name="address_is_open" value="0"/>비공개
                            </div>
                        </div>

                        <div id="hopeaddress">
                            <div class="name">
                            희망 근무지
                            </div>
                            <div class="info">
                                <input type="text" name="prefer_place" class="textlong"/>
                            </div>
                        </div>

                        <div id="comment">
                            <div class="name">
                            소개/ 좌우명/ Comment
                            </div>
                            <div class="info">
                                <input type="text" class="textlong" name="motto"/>
                            </div>
                        </div>
           </div>

           
           <div class="information">
               
               <div class="acq">
                   <div class="subject">자격정보</div>
                   <div class="acq_ok">
                       <input type="text" class="textmiddle1" name="acq_date" placeholder="자격증 취득 날짜"/>|
                       <input type="text" class="textmiddle2" name="acq_name" placeholder="자격증 이름"/>
                       <button>+</button>
                    </div>
                </div>
                
                
                <div class="edu">
                    <div class="subject">학력/교육 정보</div>
                    <div class="edu_ok">
                        <input type="text" class="textmiddle1" name="gradu_year" placeholder="학력/교육 년도"/>|
                        <input type="text" class="textmiddle2" name="edu_info" placeholder="학력 / 교육 이름"/>
                        <button>+</button>
                    </div>
                    
                    
                </div>
                
                
                <div class="career">
                    <div class="subject">경력 정보</div>
                    <div class="career_ok">
                        <input type="text" class="textmiddle1" name="career_year" placeholder="학력/교육 년도"/>|
                        <input type="text" class="textmiddle2" name="career_info" placeholder="학력 / 교육 이름"/>
                        <button>+</button>
                    </div>
                </div>
                
                
            </div>
        </div>
            
            <div class="skill">
                <div class="subject">Tech-stack</div>
               
                <div class="techs">
                    <div class="tech">
                        <div>
                            <input type="text" class="abb" name="abb"/>
                        </div>
                        <div class="techinfo">
                            <input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
                            <input class="input-range" type="range" min="0" max="100" value="0" name="tech_percent"/>
                            숫자
                        </div>
                    </div>

                    <div class="tech">
                        <div>
                            <input type="text" class="abb" name="abb"/>
                        </div>
                        <div class="techinfo">
                            <input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
                            <input class="input-range" type="range" min="0" max="100" value="0" name="tech_percent"/>
                            숫자
                        </div>
                    </div>
                    
                    <div class="tech">
                        <div>
                            <input type="text" class="abb" name="abb"/>
                        </div>
                        <div class="techinfo">
                            <input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
                            <input class="input-range" type="range" min="0" max="100" value="0" name="tech_percent"/>
                            숫자
                        </div>
                    </div>

                </div>

            </div>
        
   </div>


   <div id="button">
       <div class="holl"></div>
        <input type="button" class="button1" value="취소"/>
        <input type="submit" class="button2" value="등록하기"/>
        <div class="holl"></div>
    </div>
</form>
</body>
</html>