<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>로그인페이지</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<style>
    
    .login_container
    {
      display: flex;  
      
      flex-direction: row;
      flex-shrink: 0;
      flex-basis: 500px;
      height : 900px;        
    }
    .login_section
    {
        height: 600px;
        
    }
    #login_header{
        display: flex;
        flex-direction: column;
        width : 500px;
        height : 300px;
        font-size: 30px;
        text-align : center;
        align-items: center;
    }
    
    #logo
    {
        
        display : block;
        width : 220;
    }
    
    #login
    {
        position: relative;
        left:95px;
        font-size : 20px;
        text-align : center;
        padding-bottom : 10px;
        margin-bottom : 40px;
        margin-top : 40px;
        border : 2px solid black;
        padding-top : 15px;
        border-radius : 3% 3% 3% 3% / 50% 50% 50% 50%;
        width: 300px;

    }

    #login_btn:hover{
        background: black;
        opacity: 0.9;
        color : white;
    }
    
    .email{
        margin-top: 35px;

    }
    
    #userEmail
    {
        position : relative;
        left : 95px;
        width : 300px;
        height: 45px;
        border : 2px solid;
        border-radius: 11px/ 11px;
        background : white;
    }
    
    .password{
        margin-top: 20px;
        margin-bottom: 20px;
    }
   
    #userPw{
      position : relative;
        left : 95px;
       width : 300px;
       height : 45px;
       border : 2px solid;
       border-radius: 11px/ 11px;
    }
   
    .item1
    {
       
        width : 50%;
    }
    .item2
    {
        
        width : 500px;
    }
    .item3
    { 
   
        width : 50%;
    }
    .find
    {
        border:1px solid white;
        position:relative;
        left : 73px;
        display:flex;
        text-align : center;
        font-size: 11pt;
        width:350px;
    }

    .tt
    {
        position : relative;
        
        border-right : 2px solid;
        width : 120px;
    }

    .ttt
    {
        width : 30px;
    }
    
    #id
    {
        position:relative;
        left : 9px;
    }

    #id2
    {
        position:relative;
        left : 5px;
    }
    #id3
    {
        position:relative;
        right : 8px;
    }
    #login_findid
    {
        position : relative;
        left : 11px;
        display : block;
        width : 110px;
        text-decoration: none;
        color : black;
    }
    #login_findpw
    {
        position : relative;
        left : 5px;
        display : block;
        width : 110px;
        text-decoration: none;
        color : black;
    }
    
    #login_user
    {
        position : relative;
        right : 10px;
        display : block;
        width : 110px;
        text-decoration: none;
        color : black;
    }
    
    #login_btn
    {
        display : block;
        position:relative;
        left : 96.5px;
        margin-top : 30px;
        margin-bottom: 20px;
        width: 300px;
        background: white;
        border:1px solid black;
        font-size : 20px;
        height : 65px;
        font-size : 23px;
        border-radius: 11px/ 11px;
        border : 2px solid;
    }

    #btn
    {
        width : 100px;
        background: black;
    }
    
    #text1
    {
        position : relative;
        left : 100px;
        margin-bottom : 5px;
    }
    
    #text2
    {
        position : relative;
        left : 180px;
        margin-bottom : 5px;
    }
    
    .login_footer
    {
       
        height : 150px;
        border : 1px solid white;
    }
    
    .login_connect>a>img
    {
        border:1px solid darkkhaki;
    width : 60px;
    position:relative;
    left : 120px;
    top : 30px;
    }
    
    #login_other
    {
    position:relative;
    top : 50px;
    left : 170px;
    }
    
    #login_other>span
    {
    color : gray;
    }
    
</style>

<script>
    $(document).ready(function(){
        $("#login_btn").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userEmail = $("#userEmail").val();
            var userPw = $("#userPw").val();
            if(userEmail == ""){
                alert("이메일을 입력하세요.");
                $("#userEmail").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("비밀번호를 입력하세요.");
                $("#userPw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/user/loginCheck"
            // 제출
            document.form1.submit();
        });
    });
</script>

</head>
<body>
 
    <form name="form1" method="post">
    <div class="login_container">
    <div class="item1">

    </div>
    <div class="item2">
        <header id="login_header">
                   <%--  <img id="logo" src="<c:url value=' >" alt"">  --%>
         </header>
            <section class="login_section">
             <div class="email">   
                     <input type="text" autocomplete="off" value="" placeholder=" 이메일" name="userEmail" id="userEmail">
        
                </div>
    

            <div class="password">
            <input type="password" value="" placeholder=" 비밀번호"  name="userPw" id="userPw">
            </div>
            <div class="login">
             <button type="button" id="login_btn">로그인</button>
            </div>
    
    <div class="find">
      <div class="tt"><a id="login_findid" href="${path}/user/findId">이메일 찾기</a></div>
      <div class="tt"><a id="login_findpw" href="${path}/user/findPassword">패스워드 찾기</a></div>
      <div class="ttt"><a id="login_user" href="${path}/user/policy">회원가입</a></div>
    </div>

    <div class="login_connect">
       <a href="https://kauth.kakao.com/oauth/authorize?client_id=ddf96236e7a9d02c46ce6f523dc484a3&redirect_uri=http://localhost:8080/DevelopPR/user/kakaooauth&response_type=code "><img id="kakao" src="<c:url value='/resources/user/kakao.png'/>"></a> 
       <a href="${path}/user/naverLogin"><img id="naver" src="<c:url value='/resources/user/naver.png'/>"></a>
       <a href="#3"><img id="facebook" src="<c:url value='/resources/user/facebook.png'/>"></a>
       <a href="${path}/user/googleLogin"><img id="google" src="<c:url value='/resources/user/google.png'/>"></a>
    </div>
    <div id="login_other">
       <span id="other">다른 계정으로 로그인</span></div>
 
    </section>
    </div>
    <div class="item3"></div>

</div>
</form>
</body>
</html>