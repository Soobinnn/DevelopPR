<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/findPasswordForm.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	 
$('#findPw_next').click(function(){

    // 이메일 형식만 가능
    var userEmailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    var _userEmail = $('#findPw_email').val();
    var param = "userEmail="+_userEmail;
    
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/user/findPassword",
        success : function(result)
        {
            if(!userEmailCheck.test(_userEmail))
            {		
                $('#findPw_email').css({"border" :"2px solid red","background-color":"#FFCECE"});
                $('#findPw_email').focus();
                $('#emailCheckMsg').text('이메일형식에 맞게 입력해주세요.').css("color","red");
            }
            else if($('#findPw_email').val() =="")
            	{
            	$('#findPw_email').css({"border" :"2px solid red","background-color":"#FFCECE"});
                $('#findPw_email').focus();
                $('#emailCheckMsg').text('이메일을 입력해주세요.').css("color","red");
            	}
            else 
            {
                /* 중복이 없을경우 */
                if(result == '0')
                {						
                    alert('이메일이 일치하지 않습니다.')
                    $('#findPw_email').focus();
                    
                }
                else if(result == '1')
                {	
                	$('#findPw_next').css({"background-color" : "#585858" , "color":"white"});
                	alert('이메일이 확인되었습니다.')
                	FindPwform.action="${path}/user/findPwEmail";
                	FindPwform.submit();
                                 
                }
            }
         }
      });
   });
$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
});

</script>
</head>
<body>
<div class="findPasswordForm">
    <section id="findPw_sec">
            
        <div id="findPw_sec_1"></div>
        <div id="findPw_sec_2">
    
            <div id="findPw_sec_2_1"></div>
            <div id="findPw_sec_2_2">
                    
                <div id="findPw_Top">
                    <span id="findPw_span1">
                        <strong>비밀번호 찾기</strong></span>

                </div>
                <div id="findPw_mid">
                        <img id="findPw_img" src="${path}/resources/user/lock.png">
                        <p id="findPw_p">비밀번호 찾기를 위한</p>
                        <span id="findPw_span2">이메일</span><span id="findPw_span3">을 입력해주세요.</span>

                </div>
                <form id="FindPw_form" name="FindPwform" method="post">
                <div id="findPw_bottom">
                    <div id="findPw_bottom1">
                        <input id="findPw_email" type="text" name="userEmail" value="${userEmail}"
                        placeholder="  이메일(대소문자 구분)">
                        <input type="hidden" value="" id="findPw_hidden" name="hidden">
                        <div id="findPw_emailCheckMsg">
                        <span id="emailCheckMsg"></span>
                        </div>
                </div>

                <div id="findPw_bottom2">
                    <span id="findPw_span5">*</span>
                    <span id="findPw_span4">이메일을 찾으시나요?</span>
                    <button id="findPw_findemail" type="button" onclick="location='${path}/user/findEmail'">이메일 찾기</button>
                    <input id="findPw_next" type="button" value="다음 단계">
                </div>
                </div>
            </form>
        </div>
        
        <div id="findPw_sec_2_3"></div>
        </div>
    
        <div id="findPw_sec_3"></div>
    </section>
<footer id="findPw_ft">

</footer> 
</div>   
</body>
</html>