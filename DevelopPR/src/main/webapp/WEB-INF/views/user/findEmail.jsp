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

.findEmail .findEmail_header
{
   text-align : center;
   font-size: 100px;
   border :1px solid black;
   height:160px;
   width: auto;
}
.findEmail .findEmail_sec {
   display: flex;
   flex-direction: row;
   width: auto;
   height: 540px;
   border :1px solid blue;
}
.findEmail #sec1{
   border :1px solid black;
   width : 40%;
}
.findEmail #sec2{
   display : flex;
   position: relative;
   left: 0px;
   flex-shrink: 0;
   flex-basis: 700px;
   border :1px solid red;
   width : auto;
   height: auto;
}
.findEmail #sec3{
   border :1px solid orange;
   width : 40%;
}
.findEmail .findEmail_ft
{
 border :1px solid black;
}
.findEmail #findEmail_li1
{
 color : black;
 font-size: 37px;
 margin-bottom : 60px;
 text-align : center;
 color : white;
}

.findEmail #findEmail_li2
{
   color : #02456F;
   
   font-size: 20px;
   margin-bottom : 70px;
}

.findEmail #findEmail_li3
{
   color :#02456F;
   font-size: 20px;
   margin-bottom : 60px;
}
.findEmail #findEmail_li4
{
   font-size: 17px;
   margin-bottom : 40px;
   color : white;
}
.findEmail #findEmail_li5
{
   color : white;
   margin-bottom : 30px;
   
}
.findEmail #findEmail_ul
{
   list-style-type: circle;
   width: 500px;
   height: 470px;
   position : relative;
   left : 70px;
   top : 50px;
}

.findEmail #span_Email
{
   color : black;
   font-family: 'Noto Sans KR', sans-serif;
}

.findEmail #span_Email2
{
   color : black;
   font-family: 'Noto Sans KR', sans-serif;
}

.findEmail #span_sell1
{
   color:black;
   font-family: 'Noto Sans KR', sans-serif;
}

.findEmail #span_sell2
{
  font-family: 'Noto Sans KR', sans-serif;
   position :relative;
   bottom: 290px;
   left : 10px;
}
.findEmail #span_Pw
{
   font-family: 'Noto Sans KR', sans-serif;
color : #02456F;
   font-size : 15px;
}
.findEmail #span_Pw2
{
   font-family: 'Noto Sans KR', sans-serif;
   color : black;
}
.findEmail #radio
{
   position:relative;
   bottom: 290px;
   left : 10px;
   border :1px solid black;
   height: 20px;
   width: 20px;
   
}
.findEmail #findPw
{
   border: 1px solid  #02456F;
   background : #02456F;
   color : white;
   position: relative;
   left : 150px;
   border-radius: 150px / 150px;
   height : 33px;
   font-family: 'Noto Sans KR', sans-serif;
}
.findEmail #nextStep
{
   font-family: 'Noto Sans KR', sans-serif;
   width : 120px;
   height: 48px;
   background : #02456F;
   border : 1px solid #02456F;
   color : white;
   position: relative;
   left : 190px;
   top : 30px;
   border-radius: 120px / 120px;
  font-size : 19px;
}
.findEmail #nextStep :hover
{
   background-color:rgba( 255, 255, 255, 0.1 );
}

</style>
</head>
<body>
<div class="findEmail">
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
                       <li id="findEmail_li3">
                           <span id="span_sell1">내 명의로 가입된 휴대폰으로 본인 확인을 진행합니다.</span></li>
                        <li id="findEmail_li4">
                           <span id="span_Pw">＊</span><span id="span_Pw2"> 비밀번호를 찾으시나요?</span>
                           <button id="findPw" type="button" name="findPw" onclick="location='${path}/user/findPasswordForm'" >비밀번호 찾기</button></li>
                        <li id="findEmail_li5">
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
   </div>
</body>
</html>