<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/findEmail.css'/>"/>
<title>이메일 찾기</title>
<script type="text/JavaScript">
   
$(document).ready(function(){
	$(document).scrollTop(250); 
});

  function nextStep(authform) {
      var url = "${path}/user/findEmailPhone";      
      var obj = document.getElementById('radio');
      
      if(obj.checked == false) {
         alert("본인인증 수단을 선택해주세요.");
         return false;
      }
      else {
    	  $('#nextStep').hover(function()
    			  {
    			  	if(obj.checked == true)
    			  	{
    			  		$('#confirm').css({"background-color":"#b9b9b9"});
    			  	}
    			  },function()
    			  {
    			  	if(obj.checked == true)
    			  	{
    			  		$('#confirm').css({"background-color":"#585858", "border":"2px solid #585858", "color":"white"});
    			  	}
    			  });
      }
      location.href=url;
   }
</script>
</head>
<body>
<div class="findEmail">
    <header class="findEmail_header">

    </header>
   <section class="findEmail_sec">
         <div id="sec1"></div>
         <div id="sec2">
                        <ul id="findEmail_ul">
                        <li id="findEmail_li1">
                           <span id="span_Email">
                              <strong>이메일 찾기</strong></span>
                        </li>
                        <li id="findEmail_li2">
							<img id="findEmail_img1" src="${path}/resources/user/marker.png">                        
                           <span id="span_Email2"> 이메일 찾기를 위한 본인확인 방법을 선택해주세요.</span>
                        </li>
                       <li id="findEmail_li3">
                       	   <img id="findEmail_img2" src="${path}/resources/user/marker.png"> 	
                           <span id="span_sell1">내 명의로 가입된 휴대폰으로 본인 확인을 진행합니다.</span></li>
                        <li id="findEmail_li4">
                           <span id="span_Pw">＊</span><span id="span_Pw2"> 비밀번호를 찾으시나요?</span>
                           <button id="findPw" type="button" name="findPw" onclick="location='${path}/user/findPasswordForm'" >비밀번호 찾기</button></li>
                        <li id="findEmail_li5">
                           <input type="button" id="nextStep" name="nextStep" value="다음단계" onclick="nextStep()">
                        </li>
                              
                                 <input type="radio" id="radio">
                              
                              <label for="radio" id="findEmail_label"></label>
                              <label for="radio" id="findEmail_label2">휴대폰 본인인증</label>
                  </ul>   
            </div>
         <div id="sec3"></div>
   </section>
   <footer class="findEmail_ft">

   </footer>
   </div>
</body>
</html>