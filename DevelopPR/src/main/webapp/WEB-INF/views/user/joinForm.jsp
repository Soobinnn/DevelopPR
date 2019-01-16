<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <style>
    header
    {
        display : flex;
        flex-direction : column;
        flex-shrink: 0;
        border : 1px solid white;
    }
    .head 
    {
        border : 1px solid white;
    }
    .head2
    {
        border : 1px solid white;
        height : 80px;
        text-align : center;
        font-size : 50px;
    }
    #information
    {
        font-size : 23px;
        position : relative;
        left : 10px;
    }
    #obligatory
    {
        position : relative;
        left : 300px;
    }
    .head3
    {
        border : 1px solid white;
    }

    section{
        display :flex;
        flex-direction: row;
    }

    .sec1
    {
        border : 1px solid white;
        height : 800px;
        width : 40%;
    }

    .sec2
    {
        display: flex;
        border : 1px solid white;
        height : 800px;
        width : 40%;
        flex-shrink : 0;
        flex-basis : 45%;
    }
    #sec2_1
    {
        border:1px solid white;
        width : 10%;
    }
    #sec2_2
    {
        display : flex;
        flex-direction: column;
        border:1px solid white;
        width : 170%;
    }

    #top
    {
        border-bottom:1px solid gray;
        height : 110px;
        
    }
    #middle
    {
        border:1px solid white;
        height : 1500px;
    }
    .radio_ , .radio_1, .radio_2
    {
        color : black;
    }
    ul{
        position: relative;
        left : 70px;
    }
    li
    {
        color : skyblue;
        font-size : 14px;
        position: relative;
        
    }
    #email
    {
        position : relative;
        top : 7px;

    }
    #email, #name, #pwd, #pwdChk, #nickname
    {
        width:380px;
        height : 38px;
    }
    #pwd
    {
        position:relative;
        top : 12px;
    }
    #bottom
    {
        border-top: 1px solid gray;
        height : 120px;
    }

    #sec2_3
    {
        border:1px solid white;
        width : 10%;
    }
    .sec3
    {
        border : 1px solid white;
        height : 800px;
        width : 40%;
    }
    p
    {
        color : gray;
        font-size : 12px;
    }
    #p1
    {
        position:relative;
        bottom : 3px;
        left : 4px;
    }
    #p2
    {
        position:relative;
        bottom : 12px;
        left : 4px;
    }
    #p3
    {
        position:relative;
        top : 3px;
        left : 4px;
    }
    #p4
    {
        position:relative;
        bottom : 5px;
        left : 4px;
    }
    #p5
    {
        position:relative;
        bottom : 5px;
        left : 4px;
    }
    #explain
    {
        position:relative;
        top : 16px;
        width : 380px;
        height : 150px;

        
        
    }
    #confirm
    {
        background : white;
        border : 1px solid black;
        position : relative;
        left : 30%;
        top : 9px;
        height : 35px;
        width : 70px;
        
    }
    #cancel
    {
        background : white;
        border : 1px solid black;
        position : relative;
        left : 50%;
        top : 9px;
        height : 35px;
        width : 70px;
    }
    </style>
</head>
<body>
    <header>
            <div class="head"></div>
            <div class="head2">
            <strong>DPR</strong></div>
            <div class="head3"></div>
    </header>
    <section>
        <div class="sec1"></div>
        <div class="sec2">
            <div id="sec2_1"></div>
            <div id="sec2_2">
                <div id="top">
                    <span id="information">
                        <strong>정보 입력</strong></span>
                    <span id="obligatory">
                        전부 필수 입력사항입니다.
                    </span>
                </div>
                <div id="middle">
                    <form action="${path}/user/joining" name="form1" method="post">
                    <ul>
                    <li>
                        <div class="radio_">
                    <input type="radio" value="0" name="userIs_seek" id="radio">방문자
                    <input type="radio" value="1" name="userIs_seek" id="radio2">구직자
                            </div>
                </li>
                    
                    <li>
                    
                      <input id="email" type="text" autocomplete="off" value="" placeholder=" 이메일" name="userEmail">                        
                      <p id="p1">이메일 형식으로 입력해 주세요. 이메일은 아이디로 사용됩니다.</p>
                      <p id="p2">이메일 인증이 진행되니 정확한 이메일 주소를 입력해 주시기 바랍니다.</p>
                    </li>
                    <li>
                      <input id="name" type="text" autocomplete="off" value="" placeholder=" 이름" name="userName"></li>
                    <li>
                      <input id="pwd" type="password" value="" placeholder=" 비밀번호"  name="userPw" >
                      <p id="p3">비밀번호는 ~ 영문, 숫자, 특수문자를 조합해 주세요.</p>
                    </li>
                    <li>
                      <input id="pwdChk" type="password" value="" placeholder=" 비밀번호 확인" > 
                      <p id="p4">비밀번호를 다시 한번 입력해 주세요.</p>
                    </li>
                    <li>
                    <input id="nickname" type="text" autocomplete="off" value="" placeholder=" 닉네임" name="userNick" >
                     <p id="p5">사용하실 닉네임을 2자~20자 한글, 영문, 숫자를 사용해 입력해주세요.</p>
                    
                   </li>
                    <li>
                            <div class="radio_1">
                            <input type="radio" value="0" name="userJob" id="radio3">학생
                            <input type="radio" value="1" name="userJob" id="radio4">기업
                            </div>
                    </li>
                    <li>
                          <div class="radio_2">
                          <input type="radio" value="0" id="radio5">구직중
                          <input type="radio" value="1" id="radio6">구직완료
                          </div>
                    </li>
                    <li>
                           <input id="explain" type="text" name="userJob_detail" placeholder=" 간략히 서술해주세요."> 
                    </li>

                    </ul>
                    
               
                </div>
                <div id="bottom">
                    <input id="confirm" type="submit" value="확인">
                    <button id="cancel" type="button">취소</button>
                </div> 
              </form> 
            </div>
            <div id="sec2_3"></div>
        </div>
        <div class="sec3"></div>
    </section>
</body>
</html>