<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�̸��� ã�� ����</title>

<style>
.findEmailResult_header
{
   
   height:160px;
}
.findEmailResult_sec {
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
   flex-basis: 800px;
   border :1px solid black;
   width : 800px;
   justify-content: center;
}
#findemailResult_com
{
   margin-top : 40px;
   text-align : center;
   margin-bottom: 55px;
   color: white;
}
#findEmailResult_ul
{
   position: relative;
   top : 40px;
   width : 500px;
   height: 500px;
}
#com_span
{
   color : black;
   font-size: 40px;
}
#emailList_span
{
   font-size : 20px;
   color : black;
}
#findemailResult_emailList
{
   color :#0B173B;
   margin-bottom: 50px;
   
}
#findemailResult_emailList2
{
   color :white;
   position : relative;
   bottom : 20px;
}
#emailList_span
{
   color : black;
}
#findemailResult_email
{
   margin-bottom: 80px;
   color : black;
}
#findemailResult_email_EL
{
   color : black;
}
#findEmailResult_Pw
{
   color : white;
}
#findPw_span
{
 color : #0B173B;
}
#findPw_span2
{
   color : black;
}

#findemailResult_findPwbtn
{
   margin-bottom: 70px;
   position: relative;
   left : 180px;
   background : #0B173B;
   color : white;
   border : 1px solid #0B173B;
   border-radius: 5px 5px / 5px 5px;
   height: 30px;
}
#findemailResult_loginbtn
{
   height :50px;
   width : 120px;
   top :10px;
   position: relative;
   left : 190px;
   background : #0B173B;
   color : white;
   border : 1px solid #0B173B;
   border-radius: 10px 10px / 10px 10px;
}
#sec3{
   border :1px solid black;
   width : 50%;
}
.findEmailResult_ft
{
 border :1px solid black;
}

</style>
</head>
   <body>
      <header class="findEmailResult_header">
            
      </header>
      <section class="findEmailResult_sec">
      <div id="sec1">

      </div>
      <div id="sec2">
            <form action="${path}/user/login" method="post">  
            <ul id="findEmailResult_ul">
              <li id="findemailResult_com">
                 <span id="com_span"><strong>�̸��� ã�� �Ϸ�</strong></span>
                 </li>  
              <li id="findemailResult_emailList">
                 <span id="emailList_span">������ ������ ��ġ�ϴ� �̸��� ����Դϴ�.</span>
              </li>
              <li id="findEmailResult_emailList2">   
              <label for="findemailResult_email">
               <input id="findemailResult_email" type="radio" name="selectedId" value="${email}">
               <span id="findemailResult_email_EL">${email}</span></label>
               </li>
               <li id="findEmailResult_Pw">               
               <span id="findPw_span">*</span> <span id="findPw_span2">��й�ȣ�� ã���ó���?</span>                                                                     
               <button id="findemailResult_findPwbtn" type="button" onclick="location='${path}/user/findPassword'">��й�ȣ ã��</button>
                  </li>
                  <button id="findemailResult_loginbtn" type="submit" onclick="location='${path}/user/login'">�α���</button>
            </ul>
         </form>
      </div>
      <div id="sec3"></div>
      </section>
      <footer class="findEmailResult_ft">

      </footer>
   </body>
</html>