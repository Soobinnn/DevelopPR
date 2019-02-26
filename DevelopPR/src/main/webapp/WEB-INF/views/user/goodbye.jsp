<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/goodbye.css'/>"/>
<title>회원 탈퇴</title>
<script type="text/JavaScript">

$(function(){

	$('#goodbye_delete').click(function()
	{
	   // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	    if($('#goodbye_Pw').val() =="")
	    {
	       alert("비밀번호를 입력해주세요.");
	       $("#goodbye_Pw").focus();
	       return false;
	    }
	  //유효성검사 , 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    else if(!userPwCheck.test($('#goodbye_Pw').val()))
	    {
	    	alert('비밀번호 형식에 맞게 최소8자리, 숫자, 문자, 특수문자 최소 1자리를 입력해주세요.')
	        $('#goodbye_Pw').focus();
	    } 
	    else{
	    	var userPw = $('#goodbye_Pw').val();
	    	var param = "userPw="+userPw;
	    
	    	$.ajax({
	    		async: true,
	    		type: 'POST',
	    		data: param,
	    		url:"${path}/user/goodbyeChk",
	    		success:function(data)
	    		{
	    		if(data==true){
	    	        if(confirm("정말 회원 탈퇴를 진행하시겠습니까? 삭제된 데이터는 복구되지 않습니다.") == true)
	     			{
	    	        	goodbve_form.action="${path}/user/goodbye";
	    	        	goodbve_form.submit();
	             	    }
	             	    else{
	             	    	return;
	             	    }
	    		 }
	    		else if(data==false){
	    	        alert('비밀번호가 일치하지 않습니다.')	
	    		}
	    		}
	    			
	    	});
	    }	
	    	
	   
	});
});

</script>
</head>
<body>
<div class="goodbye">
   <header class="goodbye_header">

   </header>
   <section class="goodbye_sec">
      
  <div id="goodbye_sec1">
  		 <img id="function_img" src="${path}/resources/user/logogo.png"> 	
  	<div id="function_div">
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
  <div id="goodbye_sec2">
      <ul id="goodbye_ul">
      <form id="goodbve_form" name="goodbve_form" method="post">
      <li id="goodbye_li1">
         <span id="goodbye_span1"><strong>회원 탈퇴</strong></span>
      </li>
      <li id="goodbye_li2">
      	<span id="goodbye_span2"><strong>회원탈퇴를 하기 전에 안내사항을 꼭 확인해주세요.</strong></span>
      </li>
      <li id="goodbye_li3">
      <img id="goodbye_img1" src="${path}/resources/user/marker.png">
      	<p id="goodbye_p1"><strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong></p>
      	<p id="goodbye_p2">삭제된 데이터는 복구되지 않습니다.</p>
      </li>
      <li id="goodbye_li4">
      <img id="goodbye_img2" src="${path}/resources/user/marker.png">
      	<p id="goodbye_p3"><strong>탈퇴 후 게시판에 등록한 게시물은 그대로 남아 있습니다.</strong></p>
      	<p id="goodbye_p4">삭제를 원하는 게시글이 있다면</p> <span id="goodbye_span3">반드시 탈퇴 전 삭제하시기 바랍니다.</span>
      	<p id="goodbye_p5">탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어,</p>
      	<p id="goodbye_p6">게시글을 임의로 삭제해드릴 수 없습니다.</p>
      </li>
      <li id="goodbye_li5">
      	<img id="goodbye_img3" src="${path}/resources/user/marker.png">
      	<p id="goodbye_p7">회원 정보 확인</p>
      </li>
      <li id="goodbye_li6">
      <input id="goodbye_email" type="text" readonly="readonly" value="${userEmail}">
      </li>
       <li id="goodbye_li7">
          <input id="goodbye_Pw" type="password" name="userPw"  placeholder=" 비밀번호 입력" autocomplete="off">
          <span id="goodbye_msg"></span>
          <span id="goodbye_msg2"></span>
        </li>      
        
         <li id="goodbye_li8">
            <input id="goodbye_delete" type="button" value="탈퇴">
         </li>
         </form>      
       </ul>
      
   </div>
   <div id="goodbye_sec3">
   </div>
   </section>
   <footer class="goodbye_ft">
      
   </footer>
   </div>
</body>
</html>