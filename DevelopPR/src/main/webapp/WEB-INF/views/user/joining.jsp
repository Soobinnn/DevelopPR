<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <style>
        #emailConfirm_header
        {
           
            height : 100px;
            background : #0B173B;
            opacity : 0.9;
            
        }
        #emailConfirm_sec
        {
            
            display : flex;
            flex-direction: row;
            width: auto;
            height : 450px;
        }
        .emailConfirm_sec_area1
        {
            
            width : 50%;
            background : #0B173B;
            opacity : 0.9;
        }
        .emailConfirm_sec_area2
        {
            
            display : flex;
            flex-shrink: 0;
            flex-basis : 200px;
            flex-direction : column;
            word-break:break-all;
            word-wrap:break-word;
            width: 1000px;
            
        }
        .emailConfirm_sec_area3
        {
            
            width : 50%;
            background : #0B173B;
            opacity : 0.9;
        }
        #emailConfirm_ft
        {
            
            height : 190px;
            background : #0B173B;
            opacity : 0.9;
        }
        #msg
        {
            width : 60px;
            position : relative;
            top : 10px;
            left : 300px;
        }
        #emailConfirm_ul
        {
            position : relative;
            top: 10px;
            border:1px solid white;
            width: 597px;
            height : 300px;
        }
        #emailConfirm_li
        {
            color:white;
        }
        #span1
        {
            position : relative;
            left : 155px;
            color : black;
            font-size : 28px;
            
        }
        #span2
        {
            position : relative;
            top : 30px;
            color : black;
        }
        #span3
        {
            position : relative;
            color : black;
            top : 60px;
        }
        #span4
        {
            position : relative;
            top : 90px;
            color : black;
        }
    </style>
</head>
<body >
    <header id="emailConfirm_header">
        
    </header>
    <section id="emailConfirm_sec">
            <div class="emailConfirm_sec_area1"></div>
            <div class="emailConfirm_sec_area2">
                   <img id="msg" src="<c:url value=''/>">
                   <ul id="emailConfirm_ul">
                       <li id="emailConfirm_li">
                           <span id="span1"><strong>이메일을 확인하십시오</strong></span>
                       </li>
                       <li id="emailConfirm_li">
                           <span id="span2"><Strong>계정을 사용하려면 이메일 주소를 확인하십시오</Strong> </span>
                       </li>
                       <li id="emailConfirm_li">
                            <span id="span3">${joinName}님의 이메일 주소 유효성을 검사하기 위한 버튼이 포함된 이메일이 ${joinEmail}(으)로 전송되었습니다. </span>
                        </li>
                        <li id="emailConfirm_li">
                            <span id="span4">이메일을 수신하셨습니까? 수신하지 못한 경우 스팸 폴더를 확인하거나 3일 내에 <a href="${path}/user/joiningError">새 확인 이메일 요청</a>을 하십시오. 3일 내로 이메일 주소를 확인하지 않은 경우 새 계정을 만들어야 합니다.</span>
                        </li>
                   </ul>
            </div>
            <div class="emailConfirm_sec_area3">
                
            </div>

    </section>
    <footer id="emailConfirm_ft">
    
    </footer>

</body>
</html>