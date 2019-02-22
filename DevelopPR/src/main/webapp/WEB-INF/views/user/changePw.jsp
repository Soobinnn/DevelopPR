<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/changePw.css'/>"/>
<script type="text/javascript">

var Check = false;
var CheckNew = false;
var CheckNewConfirm = false;


$(document).ready(function(){
	$(document).scrollTop(580); 
});


$(function(){
	// 처음에 변경 활성화 끄기
	  $('#changePw_changebtn').prop("disabled", true).css({"background-color" : "#aaaaa"});

	//현재 비밀번호 일치하는지 확인
	  $('#changePw_pw').blur(function()
				{
				   // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
				    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				    
				    
				    if($('#changePw_pw').val()=="")
			    	{
			    	$('#changePw_pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
			        $('#changePwCheckMsg').text('비밀번호를 입력해주세요.').css({"color":"red"});
			        $('#changePw_pw').focus();

			    	} 
				    
				    
				    else if(!userPwCheck.test($('#changePw_pw').val()))
				    {
				        $('#changePw_pw').css({"border" :"2px solid red","background-color":"#FFCECE"});
				        $('#changePwCheckMsg').text('비밀번호 형식에 맞게 입력해주세요.').css({"color":"red"});
				        $('#changePw_pw').focus();

				    }
				    
				    else{
				    	var userPw = $('#changePw_pw').val();
				    	var param = "userPw="+userPw;
				    
				    	$.ajax({
				    		async: true,
				    		type: 'POST',
				    		data: param,
				    		url:"${path}/user/goodbyeChk",
				    		success:function(data)
				    		{
				    			if(data==true){
				    		
				    				$('#changePw_pw').css({"border" :"2px solid green","background-color":"white"});
				    	        	$('#changePwCheckMsg').text('비밀번호가 확인되었습니다.').css({"color":"green"});
				    	        	$('#changePw_changebtn').prop("disabled", false);
				    			 }
				    			else if(data==false){
				    				$('#changePwCheckMsg').css({"display" : "block"});
				    				$('#changePw_pw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
				    	        	$('#changePwCheckMsg').text('현재비밀번호가 일치하지 않습니다.').css({"color":"red"});
				    	        	$('#changePw_changebtn').css({"background":"#aaaaa"});
				    	        	$('#changePw_changebtn').prop("disabled", true); 
				    	        	$('#changePw_pw').focus();
				    			
				    		}
				    		}
				    			
				    	});
				    }	
				    	
				   
				});
	//새 비밀번호 유효성검사
	  $('#changePw_NewPw').blur(function()
	    {
	    // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^.,/`~;:])[A-Za-z\d$@$!%*#?&^.,/`~;:]{8,}$/;
	    
	    if($('#changePw_NewPw').val()=="")
    	{
    	$('#changePw_NewPw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#changePwCheckMsg2').text('비밀번호를 입력해주세요.').css({"color":"red"});
        CheckNew = false;
    	} 
	    
	    else if(!userPwCheck.test($('#changePw_NewPw').val()))
	    {
	        
	        $('#changePw_NewPw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
	        $('#changePwCheckMsg2').text('비밀번호 형식에 맞게 입력해주세요.').css({"color":"red"});
	        $('#changePw_NewPw').focus();
	        CheckNew = false;
	    }
	    
	    else   
	    {
	        $('#changePw_NewPw').css({"border" :"2px solid green","background-color":"white"});
	        $('#changePwCheckMsg2').text('변경 가능한 비밀번호 입니다.').css({"color":"green"});
	        CheckNew = true;
	    }
	});
	  //새 비밀번호 확인
	$('#changePw_NewPwConfirm').keyup(function()
	{
    	if($('#changePw_NewPw').val() != $('#changePw_NewPwConfirm').val())
   		{
        $('#changePw_NewPwConfirm').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#changePwCheckMsg3').text('비밀번호가 일치하지 않습니다.').css({"color":"red"});
        $('#changePw_changebtn').css({"background":"white","color":"#585858"});
        $('#changePw_changebtn').prop("disabled", true); 
        CheckNewConfirm = false;
        
    	}
    	else
    		{
       		 if( $('#changePw_NewPwConfirm').val()=='')
        		{
            $('#changePw_NewPwConfirm').css({"border" :"2px solid red","background-color":"#FBF5EF"});
            $('#changePwCheckMsg3').text('비밀번호를 입력하세요.').css({"color":"red"});
            CheckNewConfirm = false;
        	}
        	else
        	{
            $('#changePw_NewPwConfirm').css({"border" :"2px solid green","background-color":"white"});
            $('#changePwCheckMsg3').text('비밀번호가 일치합니다.').css({"color":"green"});
            $('#changePw_changebtn').css({"background":"#585858","color":"white"});
            $('#changePw_changebtn').prop("disabled", false); 
            CheckNewConfirm = true;
            $('#changePw_changebtn').hover(function()
      			{
            	$('#changePw_changebtn').css({"background-color":"#b9b9b9"});
            			
            		},function()
            		{
            	$('#changePw_changebtn').css({"background-color":"#585858", "border":"2px solid #585858", "color":"white"});
            		}); 
            		
        	}
         }
	  });
	  // 재차 확인 창 띄우기
	$('#changePw_changebtn').click(function()
 			{
 			if(confirm("비밀번호를 변경하시겠습니까?") == true)
 			{
 				changePwform.action="${path}/user/changePw";
 				changePwform.submit();
         	    }
         	    else{
         	    	return;
         	    }
 		});
   });

</script>
</head>
<body>
<div class="changePw">
<header class="changePw_header">
  	<strong>DevelopPR</strong>
</header>
    <section id="changePw_sec">
        <div id="changePw_sec_1">
        	<div id="function_div">
  			<%-- <img id="function_img" src="${path}/resources/user/.png">  --%>			
  			<ul id="function_list">
  				<li id="function_li1">
  				<a id="function_a1" href="${path}/user/modifyInfoform">회원 정보수정</a>
  				</li>
				<li id="function_li2">
				<a id="function_a2" href="${path}/user/changePwform">비밀번호 변경</a>
				</li>  			
  				<li id="function_li3">
  				<a id="function_a3" href="${path}/user/goodbyeform">회원 탈퇴</a>
  				</li>
  			</ul> 		
  		</div>  
        </div>
        <div id="changePw_sec_2">

                <div id="changePw_Top">
                    <span id="changePw_span1">
                        <strong>비밀번호 변경</strong></span>
                </div>
                <div id="changePw_mid">
                	<div id="changePw_mid2">
                        <img id="changePw_img" src="${path}/resources/user/lock.png">
                        <p id="changePw_p">비밀번호 변경을 위한</p>
                        <span id="changePw_span2">새 비밀번호</span><span id="changePw_span3">를 입력해주세요.</span>
                
                <form id="changePw_form" name="changePwform" method="post">
                <div id="changePw_bottom">
                     <ul id="changePw_ul">
                     
                       <li  id="changePw_li1"><input type="password" id="changePw_pw" placeholder="현재 비밀번호를 입력해주세요." autocomplete="off">
                          
                       </li>
 						                       
                        <li id="changePw_li2"><input type="password" id="changePw_NewPw" placeholder="새 비밀번호를 입력해주세요." name="userPw" autocomplete="off">
                        <span id="changePwCheckMsg2"></span>
                        </li>
                        
                        <li id="changePw_li3"><p id="changePw_p2">* 비밀번호는 최소 8자 이상 영문, 숫자, 특수문자를 조합해주세요.</p>
                        </li>
                        
                        <li id="changePw_li4"><input type="password" id="changePw_NewPwConfirm" placeholder="새 비밀번호를 한번 더 입력해주세요." autocomplete="off">
                        <span id="changePwCheckMsg3"></span>                 
                        </li>
                        
                        <li id="changePw_li5"><input id="changePw_changebtn" type="button" value="변경">
                        </li> 
                    </ul> 
                    <span id="changePwCheckMsg"> </span>
                    <input type="hidden" name="userEmail" value="${userEmail}">
                   </div>
                </form>
                </div>
                </div>
                </div>

        <div id="changePw_sec_3"></div>
        
    </section>
    
<footer id="changePw_ft">

</footer> 
</div>   
</body>
</html>