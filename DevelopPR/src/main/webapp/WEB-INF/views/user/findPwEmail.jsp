<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/findPwEmail.css'/>"/>
<script type="text/javascript">
 
$(function(){

	// 처음에 재설정 활성화 끄기
	  $('#findPwEmailReset_btn').prop("disabled", true).css("background-color", "#aaaaa");

	  $('#findPwEmailReset_Pw').blur(function()
	    {
	    // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^.,/`~;:])[A-Za-z\d$@$!%*#?&^.,/`~;:]{8,}$/;
	    
	    if($('#findPwEmailReset_Pw').val()=="")
    	{
    	$('#findPwEmailReset_Pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#findPwEmailCheckMsg').text('비밀번호를 입력해주세요.').css("color","red");
    	} 
	    
	    else if(!userPwCheck.test($('#findPwEmailReset_Pw').val()))
	    {
	        
	        $('#findPwEmailReset_Pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
	        $('#findPwEmailCheckMsg').text('비밀번호 형식에 맞게 입력해주세요.').css("color","red");
	        $('#findPwEmailReset_Pw').focus();
	    }
	    
	    else   
	    {
	        $('#findPwEmailReset_Pw').css({"border" :"2px solid green","background-color":"white"});
	        $('#findPwEmailCheckMsg').text('재설정 가능한 비밀번호 입니다.').css("color","green");
	    }
	});
	  
	$('#findPwEmailResetConfirm_Pw').keyup(function()
	{
    	if($('#findPwEmailReset_Pw').val() != $('#findPwEmailResetConfirm_Pw').val())
   		{
        $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#findPwEmailCheckMsg2').text('비밀번호가 일치하지 않습니다.').css("color","red");
        $('#findPwEmailReset_btn').css({"background":"white","color":"#585858"});
        $('#findPwEmailReset_btn').prop("disabled", true);
        
    	}
    	else
    		{
       		 if( $('#findPwEmailResetConfirm_Pw').val()=='')
        		{
            $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
            $('#findPwEmailCheckMsg2').text('비밀번호를 입력하세요.').css("color","red");
           
        	}
        	else
        	{
            $('#findPwEmailResetConfirm_Pw').css({"border" :"2px solid green","background-color":"white"});
            $('#findPwEmailCheckMsg2').text('비밀번호가 일치합니다.').css("color","green");
            $('#findPwEmailReset_btn').css({"background":"#585858","color":"white"});
            $('#findPwEmailReset_btn').prop("disabled", false);
            
            $('#findPwEmailReset_btn').hover(function()
      			{
            	$('#findPwEmailReset_btn').css({"background-color":"#b9b9b9"});
            			
            		},function()
            		{
            	$('#findPwEmailReset_btn').css({"background-color":"#585858", "border":"2px solid #585858", "color":"white"});
            			
            		});
            
            
        	}
         }
	  });
	
	$('#findPwEmailReset_btn').click(function()
			{
			if(confirm("비밀번호를 재설정하시겠습니까?") == true)
			{
				findPwEmail_form1.action="${path}/user/findPwReset";
				findPwEmail_form1.submit();
        	    }
        	    else{
        	    	return;
        	    }
		
		
		});
   });
   
$(document).ready(function(){
	  $(document).scrollTop(520); 
	  $('#findPwEmail_num').focus();
		
	  $("#findPwEmail_Confirm").click(function()
	    {
		  if($('#findPwEmail_num').val()=="")
		  {
		      alert("인증번호를 입력해주세요.");
		      $('#findPwEmail_num').focus();
		  }
		  else{
			var AuthNum = $('#findPwEmail_num').val();
			var param ="AuthNum="+AuthNum;
			
			$.ajax({
				async: true,
				type : 'POST',
				data : param,
				url : "${path}/user/findPwAuth",
				success : function(data)
				{
					/* console.log(data);
					 */
					if(data == true){
						alert("인증번호가 일치합니다.")
						$('#findPwEmail_div').css("display", "none");
						$('#findPwEmailReset').css("display", "block");
						$('#findPwEmail_main').css("display", "block");
					}
					else if (data == false){
						alert("인증번호가 일치하지 않습니다.")
						$('#findPwEmail_num').focus();
						$('#findPwEmail_num').val(''); // 공백표시
				    }
				}
	   		 });
		  }
	 });
});
  </script>
    </head>
    <body>
    <div class="findPwEmail">
    <header id="findPwEmail_header">
        
    </header>
    <section id="findPwEmail_sec">
            <div class="findPwEmail_sec_area1"></div>
            <div class="findPwEmail_sec_area2">
                   <img id="msg" src="<c:url value='/resources/msg/message.png'/>">
                   <img id="findPwEmail_img1" src="${path}/resources/user/marker.png">
                   <img id="findPwEmail_img2" src="${path}/resources/user/marker.png">
                   <img id="findPwEmail_img3" src="${path}/resources/user/marker.png">
                   <ul id="findPwEmail_ul">
                       <li id="findPwEmail_li1">
                           <p id="findPwEmail_p1"><strong>이메일을 확인하십시오</strong></p>
                       </li>
                       <li id="findPwEmail_li2">
                       
                           <p id="findPwEmail_p2"><Strong>비밀번호 재설정을 위한 이메일 주소를 확인하십시오.</Strong> </p>
                       </li>
                       <li id="findPwEmail_li3">
                       	
                            <p id="findPwEmail_p3">귀하의 이메일 주소에 인증코드가 포함된 이메일이 <span id="findPwEmail_span">${userEmail}</span>(으)로</p> 
                            <p id="findPwEmail_p6">전송되었습니다. 메일 확인 후 인증코드를 입력하세요.</p>
                        </li>
                        <li id="findPwEmail_li4">
                        
                            <p id="findPwEmail_p4">이메일을 수신하셨습니까? 수신하지 못한 경우 3일 내에 <a href="${path}/user/findPasswordForm">이메일 재확인</a>을 하십시오.</p> 
                            <p id="findPwEmail_p5">3일 내로 이메일 주소를 확인하지 않은 경우 이메일이 소멸합니다.</p>
                        </li>
                   </ul>
         
                   <div id="findPwEmail_div">
                        <input type="text" id="findPwEmail_num" placeholder=" 인증번호 10자리를 입력하세요." autocomplete="off"> 
                        <button id="findPwEmail_Confirm" type="button">확인</button>
                        <span id="findPwEmail_Msg"></span>
                        </div>
               
    
                   <form name="findPwEmail_form1" id="findPwEmail_form" method="POST">
                    <div id="findPwEmailReset">
                     <ul id="findPwEmailReset_ul">
                       <li  id="findPwEmailReset_li1"><span id="findPwEmailReset_span"><strong>비밀번호 재설정</strong></span></li>
                        <li id="findPwEmailReset_li2"><input type="password" id="findPwEmailReset_Pw" placeholder=" 비밀번호를 입력해주세요." name="userPw" autocomplete="off">
                        <span id="findPwEmailCheckMsg"></span></li>
                        <li id="findPwEmailReset_li3"><p id="findPwEmailReset_p">* 비밀번호는 최소 8자 이상 영문, 숫자, 특수문자를 조합해주세요.</p></li>
                        <li id="findPwEmailReset_li4"><input type="password" id="findPwEmailResetConfirm_Pw" placeholder=" 비밀번호를 한번 더 입력해주세요." autocomplete="off">
                        <span id="findPwEmailCheckMsg2"></span>                 
                        </li>
                        <li id="findPwEmailReset_li5"><input id="findPwEmailReset_btn" type="button" value="재설정"></li> 
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
    </div>
    </body>
    </html>