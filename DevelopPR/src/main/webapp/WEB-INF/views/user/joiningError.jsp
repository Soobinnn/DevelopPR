<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<html>
<head>
<script>
$(function(){

	$('#emailNew_span5').text('${msg}');
	
});
</script>
    <style>
        #emailNewConfirm_header
        {
            
            height : 100px;
            background : #0B173B;
            opacity : 0.9;
            
        }
        #emailNewConfirm_sec
        {
            display : flex;
            flex-direction: row;
            width: auto;
            height : 450px;
        }
        .emailNewConfirm_sec_area1
        {
           
            width : 60%;
            background : #0B173B;
            opacity : 0.9;
        }
        .emailNewConfirm_sec_area2
        {
            
            display : flex;
            flex-shrink: 0;
            flex-basis : 800px;
            flex-direction : column;
            word-break:break-all;
            word-wrap:break-word;
        }
        .emailNewConfirm_sec_area3
        {
            width : 60%;
            background : #0B173B;
            opacity : 0.9;
            
        }
        #emailNewConfirm_ft
        {
            
            height : 190px;
            background : #0B173B;
            opacity : 0.9;
        }
        
        #emailNewConfirm_ul
        {
            position : relative;
            top: 40px;
            width: 597px;
            height : 340px;
            left : 70px;
        }
        #emailNewConfirm_li
        {
            color:white;
        }
        #emailNew_span1
        {
            position : relative;
            left : 152px;
            color : black;
            font-size : 32px;
            
        }
        #emailNew_span2
        {
            position : relative;
            top : 30px;
            color : black;
        }
        #emailNew_span3
        {
            position : relative;
            color : black;
            top : 60px;
        }
        #emailNew_span4
        {
            position : relative;
            top : 90px;
            color : black;
            left: 90px;
        }
        #emailNew_span5
        {
            color : red;
        }
        #emailNew_btn
        {
            position : relative;
            top : 120px;
            left : 250px;
            height : 50px;
            width : 80px;
            background : #0B173B;
            opacity : 0.9;
            border : 1px solid white;
            color : white;
            border-radius : 10px 10px / 10px 10px ;
        }
        #emailNewConfirm_input
        {
            position : relative;
            left : 10px;
            width : 280px;
            height : 35px;
        }

    </style>
</head>
<body >
    <header id="emailNewConfirm_header">
        
    </header>
    <section id="emailNewConfirm_sec">
            <div class="emailNewConfirm_sec_area1"></div>
            <div class="emailNewConfirm_sec_area2">
                   <form name="reJoiningForm" id="reJoiningForm" method="post" action="${path}/user/reJoining">
                   <input type="hidden" name="userEmail"value="${userEmail}"/>
                   <ul id="emailNewConfirm_ul">
                       <li id="emailNewConfirm_li">
                           <span id="emailNew_span1"><strong>새 확인 이메일 요청</strong></span>
                       </li>
                       <li id="emailNewConfirm_li">
                           <span id="emailNew_span2">DevelopPR계정에 등록하기 위해 사용할 사용자 이메일을 입력합니다. 대부분 사용자 아이디는 이메일 주소입니다.</span>
                       </li>
                       <li id="emailNewConfirm_li">
                            <span id="emailNew_span3">귀하의 이메일 주소 유효성을 검사하기 위한 버튼이 포함된 이메일을 보냅니다. 이 이메일을 수신하면 버튼을 클릭하십시오.</span>
                        </li>
                        <li id="emailNewConfirm_li">
                            <span id="emailNew_span4">사용자 이메일<span id="emailNew_span5">*</span><input id="emailNewConfirm_input" type="text" name="reUserEmail">
                        </li>
                        <li id="emailNewConfirm_li">
                        	<span id="emailNew_span5"></span><br>
                            <button id="emailNew_btn" type="submit">제출</button>
                        </li>
                   </ul>
                   </form>
            </div>
            <div class="emailNewConfirm_sec_area3"></div>

    </section>
    <footer id="emailNewConfirm_ft">
    
    </footer>

</body>
</html>