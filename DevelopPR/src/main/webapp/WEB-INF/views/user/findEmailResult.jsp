<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/findEmailResult.css'/>"/>
<meta charset="UTF-8">
<title>이메일 찾기 성공</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>
$(document).ready(function(){
	$(document).scrollTop(350); 
});
</script>
</head>
   <body>
   <div class="findEmailResult">
      <header class="findEmailResult_header">
            
      </header>
      <section class="findEmailResult_sec">
      <div id="sec1">

      </div>
      <div id="sec2">
            <form action="${path}/user/login" method="post">  
            <ul id="findEmailResult_ul">
              <li id="findemailResult_com">
                 <span id="com_span"><strong>이메일 찾기 </strong></span>
                 </li>  
              <li id="findemailResult_emailList">
              	 <img id="findEmailResult_img" src="${path}/resources/user/marker.png">
                 <span id="emailList_span">고객님의 정보와 일치하는 이메일 목록입니다.</span>
              </li>
              <li id="findEmailResult_emailList2">   
               <input id="findemailResult_email" type="radio" name="selectedId" value="${email}">
               <label for="findemailResult_email" id="findemailResult_label"></label>
               <label for="findemailResult_email" id="findemailResult_email_EL">${email}</label>
               </li>
               <li id="findEmailResult_Pw">               
               <span id="findPw_span">*</span> <span id="findPw_span2">비밀번호를 찾으시나요?</span>                                                                     
               <button id="findemailResult_findPwbtn" type="button" onclick="location='${path}/user/findPasswordForm'">비밀번호 찾기</button>
                  </li>
                  <button id="findemailResult_loginbtn" type="submit" onclick="location='${path}/user/login'">로그인</button>
            </ul>
         </form>
      </div>
      <div id="sec3"></div>
      </section>
      <footer class="findEmailResult_ft">

      </footer>
      </div>
   </body>
</html>