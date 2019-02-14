<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/joining.css'/>"/>
<script>
$(document).ready(function(){
	$(document).scrollTop(450);
});

function joiningErrorSubmit()
	{
		joinErrorForm.submit();
	}
</script>
 
</head>
<body>
<div class="joining">
    <header id="joining_header">
        
    </header>
    <section id="joining_sec">
            <div class="joining_sec_area1"></div>
            <div class="joining_sec_area2">
                   <img id="joining_msg" src="<c:url value='/resources/msg/message.png'/>">
                   <ul id="joining_ul">
                       <li id="joining_li">
                           <p id="joining_p1"><strong>이메일을 확인하십시오</strong></p>
                       </li>
                       <li id="joining_li">
                       <img id="joining_img1" src="${path}/resources/user/marker.png">
                           <p id="joining_p2"><Strong>계정을 사용하려면 이메일 주소를 확인하십시오</Strong> </p>
                       </li>
                       <li id="joining_li">
                       <img id="joining_img2" src="${path}/resources/user/marker.png">
                            <p id="joining_p3">귀하의 이메일 주소 유효성을 검사하기 위한 버튼이 포함된 이메일이 </p>
                            <p id="joining_p4"><span id="joining_Email"><strong>${userEmail}</strong></span>(으)로 전송되었습니다. </p>
                        </li>
                        <li id="joining_li">
                        <img id="joining_img3" src="${path}/resources/user/marker.png">
                            <p id="joining_p5">이메일을 수신하셨습니까? 수신하지 못한 경우 3일 내에</p> 
                            <p id="joining_p6"><a id="joining_a"href="javascript:joiningErrorSubmit();">새 확인 이메일 요청</a>을 하십시오. 3일 내로 이메일 주소를 확인하지</p>
                            <p id="joining_p7">않은 경우 새 계정을 만들어야 합니다.</p>
                        </li>
                   </ul>
                   <%-- <button id="joining_main" type="button" onclick="location='${path}/main'">메인으로</button> --%>
                   <button id="joining_login"type="button" onclick="location='${path}/user/login'">로그인</button> 
            </div>
            <div class="joining_sec_area3">
            <form name="joinErrorForm"id="joinErrorForm" action="${path}/user/joiningError" method="post">
            	<input type="hidden" name="userEmail" value="${userEmail}"/> 
            </form>
            </div>

    </section>
    <footer id="joining_ft">
    </footer>
</div>
</body>
</html>
