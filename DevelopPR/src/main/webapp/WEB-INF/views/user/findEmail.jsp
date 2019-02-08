<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>이메일 찾기</title>
<script type="text/JavaScript">
   
   function nextStep(authform) {
      var url = "${path}/user/findEmailPhone";      
      var obj = document.getElementById('radio');
      if(obj.checked == false) {
         alert("본인인증 수단을 선택해주세요.");
         return false;
      }
      location.href=url;
   }
</script>
<style>

.findEmail_header
{
   text-align : center;
   font-size: 100px;
   border :1px solid black;
   height:160px;
}
.findEmail_sec {
   display: flex;
   flex-direction: row;
   width: auto;
   height: 540px;
   border :1px solid black;
}
#sec1{
   border :1px solid black;
   width : 50%;
}
#sec2{
   display : flex;
   flex-shrink: 0;
   flex-basis: 700px;
   border :1px solid black;
   width : 1000px;
   height: auto;
}
#sec3{
   border :1px solid black;
   width : 50%;
}
.container
{
  
}
.findEmail_ft
{
 border :1px solid black;
}
#findEmail_li1
{
 color : white;
 font-size: 37px;
 margin-bottom : 60px;
 text-align : center;

 
}
#findEmail_li2
{
   color : navy;
   
   font-size: 20px;
   margin-bottom : 70px;
}
#findEmail_li4
{
   color : navy;
   font-size: 20px;
   margin-bottom : 60px;
}
#findEmail_li5
{
   color : white;
   font-size: 17px;
   margin-bottom : 40px;
}
#findEmail_li6
{
   color: white;
   margin-bottom : 30px;
}
#findEmail_ul
{
   list-style-image : url("${patj}/resources/marker.png");
   width: 500px;
   height: 470px;
   position : relative;
   left : 70px;
   top : 50px;
}
#span_Email
{
   color : black;
}
#span_Email2
{
   color : black;
}
#span_sell1
{
   color:black;
   
}
#span_sell2
{
   position :relative;
   bottom: 280px;
   left : 10px;
}
#span_Pw
{
color : blueviolet;
}
#span_Pw2
{
   color : black;
}
#radio
{
   position:relative;
   bottom: 280px;
   left : 10px;
   border :1px solid black;
}
#findPw
{
   border: 1px solid  white;
   background : #0B173B;
   color : white;
   position: relative;
   left : 150px;
   border-radius: 7px / 7px;
   height : 30px;
}
#nextStep
{
   width : 120px;
   height: 48px;
   background : #0B173B;
   border : 1px solid white;
   color : white;
   position: relative;
   left : 190px;
   top : 30px;
   border-radius: 11px / 11px;

}

</style>
</head>
<body>
    <header class="findEmail_header">
         <strong></strong>
    </header>
   <section class="findEmail_sec">
         <div id="sec1"></div>
         <div id="sec2">
                        <ul id="findemail_ul">
                        <li id="findEmail_li1">
                           <span id="span_Email">
                              <strong>이메일 찾기</strong></span>
                        </li>
                        <li id="findEmail_li2">
                           <span id="span_Email2">
                           이메일 찾기를 위한 본인확인 방법을 선택해주세요.</span>
                        </li>
                       <li id="findEmail_li4">
                           <span id="span_sell1">내 명의로 가입된 휴대폰으로 본인 확인을 진행합니다.</span></li>
                        <li id="findEmail_li5">
                           <span id="span_Pw">＊</span><span id="span_Pw2">비밀번호를 찾으시나요?</span>
                           <button id="findPw" type="button" name="findPw" onclick="location='${path}/user/findPasswordForm'" >비밀번호 찾기</button></li>
                        <li id="findEmail_li6">
                           <input type="button" id="nextStep" name="nextStep" value="다음단계" onclick="nextStep()">
                        </li>
                              <label for="radio">
                                 <input type="radio" id="radio">
                              <span id="span_sell2">휴대폰 인증</span>
                              </label>
                  </ul>   
            </div>
         <div id="sec3"></div>
   </section>
   <footer class="findEmail_ft">

   </footer>
</body>
</html>