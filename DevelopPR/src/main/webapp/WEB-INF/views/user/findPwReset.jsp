<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정</title>
<script type="text/JavaScript">
function {
   
}

/* function findIdResult() {
   location.href="${path}/user/findIdResult"
} */
</script>
<style>
.authCheck_header
{
   text-align : center;
   font-size: 100px;
   border :1px solid black;
   height:160px;
}
.authCheck_sec {
   display: flex;
   flex-direction: row;
   width: auto;
   height: 600px;
   border :1px solid black;
  
}
#sec1{
   border :1px solid black;
   width : 50%;
}
#sec2{
   display : flex;
   flex-shrink: 0;
   flex-basis: 730px;
   border :1px solid black;
   width : auto;
   justify-content : center;
   height : auto;
}
#authCheck_ul
{
 
 width : 350px;
 height: 400px;
 position: relative;
 top : 90px;
}
#authCheck_li1
{
   color : white;
   margin-bottom : 70px;
}
#authCheck_span
{
   font-size : 35px;
   color : black;
}
#authCheck_li2
{
   color : white;
   margin-bottom : 20px;
}
#phone_Num
{
 height : 40px;
 width : 200px;
}
#phone_Btn
{
   height : 40px;
   width : 90px;
   position : relative;
   top : 0.5px;
   left : 20px;
   background :  #0B173B;
   color : white;
   border : 1px solid white;
   border-radius: 7px 7px / 7px 7px;
}
#authCheck_li3
{
   color : white;
   margin-bottom : 60px;
}
#authNum
{
   width : 200px;
   height : 40px;
}
#authOk
{
   position : relative;
   left : 20px;
   top : 0.5px;
   height : 40px;
   width: 90px;
   background : #0B173B;
   border : 1px solid white;
   border-radius: 7px 7px / 7px 7px;
   color : white;
}
#authCheck_li4
{
   color : white;
   
}
#hiddenBtn
{
 width: 150px;
 height: 50px;
 position : relative;
 left : 90px;
 background :  #0B173B;
 border : 1px solid white;
 color : white;
 border-radius: 11px 11px / 11px 11px;
}
#sec3{
   border :1px solid black;
   width : 50%;
}

.authCheck_ft
{
 border :1px solid black;
}

</style>
</head>
<body>
   <header class="authCheck_header">

   </header>
   <section class="authCheck_sec">
      
   <div id="sec1">
   </div>
   <div id="sec2">
      <ul id="authCheck_ul">
      <form name="auth_form" action="${path}/user/phoneCheck" method="post">  
      <li id="authCheck_li1">
         <span id="authCheck_span"><stron>비밀번호 재설정</strong></span>
      </li>
       <li id="authCheck_li2">
          <input id="phone_Num" type="text" name="phone" value="" placeholder=" 비밀번호를 입력하세요.">
          <input id="phone_Btn" type="submit" value="">
      </li>      
              
        <li id="authCheck_li3"> 
           <input type="text" id="authNum" name="authNum"
                  maxlength="6" placeholder=" 비밀번호 확인">
          <input id="authOk" type="button" name="authOk" value="확인" onclick="authCheck()" />
         </li>
         </form>      
      
         <form name="hidden_form" action="${path}/user/" method="post">
           <li id="authCheck_li4">
    
               <input type="button" id="hiddenBtn" name="nextStep" value="로그인" onclick="">
            </li> 
            
      </form>
   </ul>
   </div>
   <div id="sec3">
      </div>
   </section>
   <footer class="authCheck_ft">
      
   </footer>
</body>
</html>