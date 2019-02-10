<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
 
 function checks()
 {
// 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
if($('#findPwEmailReset_Pw').val() =="")
 {
    alert("비밀번호를 입력해주세요.");
    $("#findPwEmailReset_Pw").focus();
    return false;
 }
//비밀번호 체크
if($('#findPwEmailReset_Pw').val() != $('#findPwEmailResetConfirm_Pw').val())
 {
    alert('비밀번호가 일치하지 않습니다.');
    $('#findPwEmailReset_Pw').focus();
    return false;
 }  
// 유효성검사
if(!userPwCheck.test($('#findPwEmailReset_Pw').val()))
{
    alert('최소8자리, 숫자, 문자, 특수문자 최소 1자리를 입력해주세요.')
    $('#findPwEmailReset_Pw').focus();
    return false;
}
return true;   
}

$(function(){

	// 처음에 재설정 활성화 끄기
	  $('#findPwEmailReset_btn').prop("disabled", true).css("background-color", "#aaaaa");


	$('#findPwEmailReset_Pw').blur(function()
	{
	    // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	    if(!userPwCheck.test($('#findPwEmailReset_Pw').val()))
	    {
	        
	        $('#findPwEmailReset_Pw').css({"border" :"2px solid red","background-color":"#FFCECE"});
	        $('#findPwEmailCheckMsg').text('비밀번호 형식에 맞게 입력해주세요.').css("color","red");
	        $('#findPwEmailReset_Pw').focus();
	    }
	    else   
	    {
	        $('#findPwEmailReset_Pw').css({"border" :"2px solid green","background-color":"white"});
	        $('#findPwEmailCheckMsg').text('확인 가능한 비밀번호 입니다.').css("color","green");
	    }
	});
	$('#findPwEmailResetConfirm_Pw').blur(function()
	{
    	if($('#findPwEmailReset_Pw').val() != $('#findPwEmailResetConfirm_Pw').val())
   		 {
        $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#findPwEmailCheckMsg').text('비밀번호가 일치하지 않습니다.').css("color","red");
        
    	}
    	else
    		{
       		 if( $('#findPwEmailResetConfirm_Pw').val()=='')
        		{
            $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid red","background-color":"#FFCECE"});
            $('#findPwEmailCheckMsg').text('비밀번호를 입력하세요.').css("color","red");
           
        	}
        	else
        	{
            $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid green","background-color":"white"});
            $('#findPwEmailCheckMsg').text('비밀번호가 일치합니다.').css("color","green");
        	}
    }
	});
	
	
	//재설정 다시 활성화
	$('#findPwEmailReset_btn').prop("disabled", false).css("background-color", "");

});
 
 
$(document).ready(function(){
	
  $("#findPwEmail_Confirm").click(function()
    {
	  if($('#findPwEmail_num').val()=="")
	  {
	      alert("인증번호를 입력해주세요.");
	      $('#findPwEmail_num').focus();
	  }
	  
		var AuthNum = $('#findPwEmail_num').val();
		var param ="AuthNum="+AuthNum;
		
		$.ajax({
			async: true,
			type : 'POST',
			data : param,
			url : "${path}/user/findPwAuth",
			success : function(data)
			{
				console.log(data);
				
				if(data == true){
					alert("인증번호가 일치합니다.");
					$('#findPwEmail_div').css("display", "none");
					$('#findPwEmail_form').css("display", "block");
					$('#findPwEmail_main').css("display", "block");
				}
				else if (data == false){
					$('#findPwEmail_num').css({"border" :"2px solid red","background-color":"white"});
                    $('#findPwEmail_Msg').text('인증번호가 일치하지 않습니다.').css("color","red");
					$('#findPwEmail_num').focus();
					$('#findPwEmail_num').val(''); // 공백표시
			    }
		}
    });
 });
});

  </script>
    <style>
        #findPwEmail_header
        {
            height : 100px;
            background : #0B173B; 
            opacity : 0.9;
        }
        #findPwEmail_sec
        {
         
            display : flex;
            flex-direction: row;
            width: auto;
            height : 580px;
        }
        .findPwEmail_sec_area1
        {
            width : 50%;
            background : #0B173B; 
            opacity : 0.9;
        }
        .findPwEmail_sec_area2
        {
            display : flex;
            flex-shrink: 0;
            flex-basis : 200px;
            flex-direction : column;
            word-break:break-all;
            word-wrap:break-word;
            width: 1000px;
            position : relative;
            right : 0px;
            height:580px;
           
            
        }
        .findPwEmail_sec_area3
        {
            width : 50%;
            background : #0B173B; 
            opacity : 0.9;
        }
        #findPwEmail_ft
        {
            height : 190px;
            background : #0B173B; 
            opacity : 0.9;
        }
        #msg
        {
            width : 60px;
            position : relative;
            top : 14px;
            left : 295px;
        }
        #findPwEmail_ul
        {
            position : relative;
            top: 10px;
            right : 15px;
            width: 597px;
            height : 580px;
            
        }
        #findPwEmail_li
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
        #findPwEmail_confirm
        {
            position: relative;
            left: 100px;
        
            width: 100px;
            height : 45px;
            background:#0B173B;
            border :1px solid white;
            color : white;
            border-radius: 11px/ 11px;
        }
        #findPwEmail_num
        {
            width:220px;
            height: 43px;
            position: relative;
            left: 70px;
            top: 0px;
            border-radius: 11px/ 11px;
            border:2px solid #0B173B;
        }
        #findPwEmail_Msg
        {
            position: relative;
            right:260px;
            top : 38px;
            width: auto;
            height: auto;
        }
        #findPwEmail_div
        {
            position: relative;
            bottom:120px;
            left : 40px;
            
            width: 560px;
            height: 50px;
            
        }
        #findPwEmail_form
        {
            position: relative;
            bottom: 50px;
            width: 635px;
            height: 160px;
            display: none;
        }
        #findPwEmailReset
        {
            width:auto;
            height:auto;
        }
        #findPwEmailReset_ul
        {
            width:auto;
            height:auto;
        }
        #findPwEmailReset_li1, #findPwEmailReset_li2, #findPwEmailReset_li3,#findPwEmailReset_li4,#findPwEmailReset_li5
        {
            color: white;
    
        }
        #findPwEmailReset_li4
        {
            position: relative;
            bottom : 15px;
        }
        #findPwEmailReset_li5
        {
            position: relative;
            left: 110px;
        }
        #findPwEmailReset_span
        {
            position: relative;
            bottom:7px;
            color: black;
            left : 5px;
        }
        #findPwEmailReset_p
        {   
            position:relative;
            bottom:12px;
            color: red;
            left:4px;
            font-size : 10.5px;
        }
        #findPwEmailReset_Pw
        {
            border : 1.5px solid #0B173B;
            border-radius: 7px 7px;
            width: 300px;
            height: 35px;
        }
        #findPwEmailResetConfirm_Pw
        {
            border : 1.5px solid #0B173B;
            border-radius: 7px 7px;
            width : 300px;
            height: 35px;
        }
        #findPwEmailReset_btn
        {
            position : relative;
            top: 7px;
            width:100px;
            height:45px;
            background : black;
            border : 1px solid #0B173B;
            color: white;
            background-color: #0B173B;
            border-radius: 11px 11px;
            position: relative;
            bottom: 62px;
            left: 13px;
        }
        #findPwEmail_main
        {
            position: relative;
            left: 415px;
            top: 151px;
            width: 100px;
            height: 90px;
            background: #0B173B;
            border :1px solid #0B173B;
            color : white;
            border-radius: 11px/ 11px; 
            display: none;
            
           
        }
        #findPwEmailCheckMsg
        {
            color: black;
            position: relative;
            left: 7px;
        }
    </style>
    </head>
    <body >
    <header id="findPwEmail_header">
        
    </header>
    <section id="findPwEmail_sec">
            <div class="findPwEmail_sec_area1"></div>
            <div class="findPwEmail_sec_area2">
                   <img id="msg" src="<c:url value='/resources/msg/msg.png'/>">
                   <ul id="findPwEmail_ul">
                       <li id="findPwEmail_li">
                           <span id="span1"><strong>이메일을 확인하십시오</strong></span>
                       </li>
                       <li id="findPwEmail_li">
                           <span id="span2"><Strong>비밀번호 재설정을 위한 이메일 주소를 확인하십시오</Strong> </span>
                       </li>
                       <li id="findPwEmail_li">
                            <span id="span3">귀하의 이메일 주소에 인증코드가 포함된 이메일이 ${userEmail}(으)로 전송되었습니다. 메일 확인 후 인증코드를 입력하세요.</span>
                        </li>
                        <li id="findPwEmail_li">
                            <span id="span4">이메일을 수신하셨습니까? 수신하지 못한 경우 스팸 폴더를 확인하거나 3일 내에 <a href="${path}/user/findPasswordForm">이메일 재확인</a>을 하십시오. 3일 내로 이메일 주소를 확인하지 않은 경우 이메일이 소멸합니다.</span>
                        </li>
                   </ul>
                  
                   <button id="findPwEmail_main" type="button" onclick="location='${path}/main'">메인화면</button>
                   
                   
                   <div id="findPwEmail_div">
                        <input type="text" id="findPwEmail_num" placeholder=" 인증번호 10자리를 입력하세요." autocomplete="off"> 
                        <button id="findPwEmail_Confirm" type="button">확인</button>
                        <span id="findPwEmail_Msg"></span>
                        </div>
               
    
                   <form name="form1" id="findPwEmail_form" action="${path}/user/findPwReset" method="POST" onsubmit="return checks()">
                    <div id="findPwEmailReset">
                     <ul id="findPwEmailReset_ul">
                       <li  id="findPwEmailReset_li1"><span id="findPwEmailReset_span"><strong>비밀번호 재설정</strong></span></li>
                        <li id="findPwEmailReset_li2"><input type="password" id="findPwEmailReset_Pw" placeholder=" 비밀번호" name="userPw" autocomplete="off">
                        <span id="findPwEmailCheckMsg"></span></li>
                        <li id="findPwEmailReset_li3"><p id="findPwEmailReset_p">* 비밀번호는 최소 8자 이상 영문, 숫자, 특수문자를 조합해주세요.</p></li>
                        <li id="findPwEmailReset_li4"><input type="password" id="findPwEmailResetConfirm_Pw" placeholder=" 비밀번호를 한번 더 입력해주세요" autocomplete="off">
                        <span id="findPwEmailCheckMsg"></span>                 
                        </li>
                        <li id="findPwEmailReset_li5"><button id="findPwEmailReset_btn" type="submit">재설정</button></li> 
                    </ul> 
                    <input type="hidden" name="userEmail" value="${userEmail}">
                   </div>
                   
                   </form>
                   
                   
                   </div>
            <div class="findPwEmail_sec_area3">
            </div>
    </section>
    <footer id="findPwEmail_ft">
    </footer>
    </body>
    </html>