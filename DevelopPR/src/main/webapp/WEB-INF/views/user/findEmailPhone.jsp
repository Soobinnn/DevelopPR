<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/findEmailPhone.css'/>"/>
<title>휴대폰 인증</title>
<script type="text/JavaScript">

$(document).ready(function(){
	$(document).scrollTop(350); 
	$('#phone_Num').focus();
});

$(function(){
	$('#phone_Btn').click(function(){
		// 핸드폰 숫자형식 9~11자
		var userPhoneCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/
		var phone = $('#phone_Num').val();
		var param = "phone="+phone;
		
		if($('#phone_Num').val() ==""){
    		alert('번호를 입력해주세요.')
    	    $('#phone_Num').focus();
    	}
    	else if(!userPhoneCheck.test($('#phone_Num').val()))
    	{
    	    alert('휴대폰 번호 11자리를 입력해주세요.')
    	    $('#phone_Num').focus();
    	}
    	else{
		$.ajax({
			async : true,
	        type :'POST',
	        data : param,
	        url : "${path}/user/PhoneCheck",
	        success : function(result)
	        {
	        	
	        		if(result=='1')
	        			{
	    	        	alert('확인 버튼을 누르면 인증번호가 발송됩니다.')
	    	        	findEmailPhone_form.action="${path}/user/findEmailPhoneCheck";
	    	        	findEmailPhone_form.submit();
	    	        	$(document).scrollTop(350);
	    	        	$('#authNum').focus();
	        			}
	        		else if(result=='0')
	        			{
	        			alert('휴대폰 번호가 일치하지 않습니다. 다시 입력해 주세요.')
	        			$('#phone_Num').focus();
	        			}
	        			
	        	}
	        });
	        
		}
		
	});
});
function authCheck(){
	   var phone = findEmailPhone_form.phone.value;
	  
	   if(findEmailPhone_form.authNum.value != "" && findEmailPhone_form.authNum.value == "${authNum}") {
	      
	      alert("인증되었습니다.");
	            
	      hiddenBtn.style.display='block';
	      hidden_form.phone_hid.value = phone;
	      /* opener.document.join_form.phone.value = phone;    */   
	      
	   }
	   else if($('#authNum').val()=="")
		   {
		   alert('인증번호를 입력해주세요.')
		   }
	   else{
	      alert("인증번호가 틀립니다.");
	      return false;
	   }
}

</script>
</head>
<body>
<div class="findEmailPhone">  
 <header class="findEmailPhone_header">

   </header>
   <section class="findEmailPhone_sec">
      
  <div id="findEmailPhone_sec1">
   		</div>
   <div id="findEmailPhone_sec2">
      <ul id="findEmailPhone_ul">
      <form name="findEmailPhone_form" method="post">  
      <li id="findEmailPhone_li1">
         <span id="findEmailPhone_span"><strong>이메일 찾기</strong></span>
      </li>
      <li id="findEmailPhone_li2">
         <img id="findEmailPhone_img" src="${path}/resources/user/marker.png"> 
      	 <span id="findEmailPhone_span2">휴대폰 본인인증</span>
       <li id="findEmailPhone_li3">
         <input id="phone_Num" type="text" name="phone" value="${phone}" placeholder=" '-'를 제외한 휴대폰 번호" autocomplete="off">
          <input id="phone_Btn" type="button" value="본인인증">
      	
      </li>      
              
        <li id="findEmailPhone_li4"> 
           <input type="text" id="authNum" name="authNum"
                  maxlength="6" placeholder=" 인증번호 6자리를 입력해주세요." autocomplete="off">
          <input id="findEmailPhone_Confirm" type="button" name="authOk" value="확인" onclick="authCheck()" />
         </li>
         </form>      
      
      <form name="hidden_form" action="${path}/user/findEmailResult" method="post">
           <li id="findEmailPhone_li5">
              <input type="hidden" id="phone_hid" name="phone" value="">
               <input type="submit" id="hiddenBtn" name="nextStep" value="다음 단계" style="display: none">
            </li> 
           
      </form>
   </ul>
   </div>
  		 <div id="findEmailPhone_sec3">
     	 </div>
   </section>
   <footer class="findEmailPhone_ft">
      
   </footer>
   </div>
</body>
</html>