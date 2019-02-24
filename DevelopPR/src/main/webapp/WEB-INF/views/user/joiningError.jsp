<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/joiningError.css'/>"/>  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>
$(document).ready(function(){
	$(document).scrollTop(450);
	$('#joiningError_input').focus();
});


function check()
{
	// 이메일 형식만 가능
	var userEmailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;

	if($('#joiningError_input').val() =="")
	{
	    alert("이메일을 입력해주세요.");
	    $("#joiningError_input").focus();
	    return false;
	}
	if(!userEmailCheck.test($('#joiningError_input').val()))
	{
	    alert('이메일형식에 맞게 입력해주세요.')
	    $('#joiningError_input').focus();
	    return false;
	}
}

$(function(){
	$('#joiningError_span6').text('${msg}');
	
});
</script>
    
</head>
<body >
<div class="joiningError">
    <header id="joiningError_header">
        
    </header>
    <section id="joiningError_sec">
            <div class="joiningError_sec_area1"></div>
            <div class="joiningError_sec_area2">
            <img id="joiningError_msg" src="<c:url value='/resources/msg/message.png'/>">
                   <form name="reJoiningForm" id="reJoiningForm" method="post" action="${path}/user/reJoining" onsubmit="return check()">
                   <input type="hidden" name="userEmail"value="${userEmail}"/>
                   <ul id="joiningError_ul">
                       <li id="joiningError_li">
                           <p id="joiningError_p1"><strong>새 확인 이메일 요청</strong></p>
                       </li>
                       <li id="joiningError_li">
                       <img id="joiningError_img1" src="${path}/resources/user/marker.png">
                           <p id="joiningError_p2">DevelopPR계정에 등록하기 위해 사용할 사용자 이메일을 입력합니다.</p>
                       </li>
                       <li id="joiningError_li">
                            <p id="joiningError_p3">대부분 사용자 아이디는 이메일 주소입니다.</p>
                        </li>
                        <li id="joiningError_li">
                        <img id="joiningError_img2" src="${path}/resources/user/marker.png">
                        	<p id="joiningError_p4">귀하의 이메일 주소 유효성을 검사하기 위한 버튼이 포함된 이메일을 보냅니다.</p>
                        </li>
                        <li id="joiningError_li">
                        	<p id="joiningError_p5">이 이메일을 수신하면 버튼을 클릭하십시오.</p>
                        	</li>
                        <li id="joiningError_li">
                            <p id="joiningError_p6">사용자 이메일<span id="joiningError_span5">*</span></p>
                            <input id="joiningError_input" type="text" name="reUserEmail" placeholder="이메일을 입력하세요.">
                        </li>
                        <li id="joiningError_li">
                        	<span id="joiningError_span6"></span><br>
                            <button id="joiningError_btn" type="submit">제출</button>
                        </li>
                   </ul>
                   </form>
            </div>
            <div class="joiningError_sec_area3"></div>

    </section>
    <footer id="joiningError_ft">
    
    </footer>
</div>
</body>
</html>