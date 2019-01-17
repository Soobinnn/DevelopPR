<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<style>
    .body
    {
        display: flex;
        border:1px solid white;
            
    }
   .container
    {
      
      display: flex;  
     border:1px solid white;
     flex-direction: row;
      height : 650px;        
    }

    header{
        display: flex;
        flex-direction: column;
        width : 500px;
        height : 300px;
        border:1px solid white;
        font-size: 30px;
        text-align : center;
    }
    #head2
    {
        display:flex;
        flex-direction:row;
        border: 1px solid white;
        height : 180px;
    }
    #head2_1
    {
        border : 1px solid white;
        padding-right : 27.8%;
        
    }
    #head2_2
    {
        display : block;
        background : white;
        
        border : 1px solid white;
        padding-right : 40%;
        
    }
    #head2_3
    {
        border : 1px solid white;
        padding-right : 27.8%;
    }
    #head3
    {
        border: 1px solid white;
    }
    footer{
        border:1px solid white;
        height : 150px;
    }
    .login_img
    {
        display: flex;
        flex-direction: column;
        border:1px solid white;
        width : 500px;
    
        height: 60px;
    }
    #logo
    {
        display : block;
        width : 210;
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
        border-radius : 5% 5% 5% 5% / 50% 50% 50% 50%;
        width: 300px;

    }

    #login_btn:hover{
        background: black;
        opacity: 0.9;
        color : white;
    }
    
    .email{
       
        
        border:1px solid white;
        margin-top: 35px;

    }
    #emailinput
    {
        position : relative;
        left : 95px;
        width : 300px;
        height: 45px;
        border : 2px solid;
        border-radius: 5% 5% 5% 5% / 50% 50% 50% 50%;
        background : white;
    }
    .password{
        border:1px solid white;
        margin-top: 20px;
        margin-bottom: 20px;
    }
   
   #passwordinput{
    position : relative;
        left : 95px;
       width : 300px;
       height : 45px;
       border : 2px solid;
       border-radius: 5% 5% 5% 5% / 50% 50% 50% 50%;
   }
   
    .item1
    {
        border:1px solid white;
        width : 40%;
    }
    .item2
    {
        border:1px solid white;
        width : 500px;
    }
    .item3
    { 
        border:1px solid white;
        width : 600px;
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
    a
    {
        display : block;
        
        width : 110px;
        text-decoration: none;
        color : black;
    }

    #login_btn
    {
        display : block;
        position:relative;
        left : 98px;
        margin-top : 30px;
        margin-bottom: 20px;
        width: 300px;
        background: white;
        border:1px solid black;
        font-size : 20px;
        height : 65px;
        font-size : 23px;
        border-radius: 5% 5% 5% 5% / 50% 50% 50% 50%;
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
</style>
<script>
    $(document).ready(function(){
        $("#login_btn").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("아이디를 입력하세요.");
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
	<nav id="min"class="top_nav">
		<img id="navimg" src="<c:url value='/resources/main/image/nav.png'/>" alt="nav" />
		<span id="navspan">MENU</span>
	</nav>
	<c:choose>
	<c:when test="${sessionScope.userEmail == null}">
	<nav id="full" class="top_nav">
		<img id="navclose" class="navx" src="<c:url value='/resources/main/image/x.png'/>" alt="x"/>
		<ul class="fullmenu">
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="${path}/main">HOME</a></li>
			<li class="fullmenulist"><a href='${path}/user/login'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='#4'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='${path}/user/login'>CHAT / FOLLOW</a></li>
			<li class="fullmenulist"></li>
			<li id="fulljoin"class="fullbtn"><a href="${path}/user/policy">JOIN US</a></li>
			<li id="fulllogin"class="fullbtn"><a href="${path}/user/login">LOGIN</a></li>
		</ul>
	</nav>
	</c:when>
	<c:otherwise>
	<nav id="full" class="top_nav">
		<img id="navclose" class="navx" src="<c:url value='/resources/main/image/x.png'/>" alt="x"/>
		<ul class="fullmenu">
			<li class="fullmenulist">MENU</li>
			<li class="fullmenulist"><a href="${path}/main">HOME</a></li>
			<li class="fullmenulist"><a href='#3'>RESUME LIST</a></li>
			<li class="fullmenulist"><a href='#4'>COMMUNITY</a></li>
			<li class="fullmenulist"><a href='#5'>CHAT / FOLLOW</a></li>
			<li class="fullmenulist"><a href='#5'>이력서 등록</a></li>
			<li id="fulljoin"class="fullbtn"><a href="${path}/user/policy">MODIFICATION</a></li>
			<li id="fulllogin"class="fullbtn"><a href="${path}/user/logout">LOGOUT</a></li>
		</ul>
	</nav>
	</c:otherwise>
	</c:choose>
    <form name="form1" method="post">
      <div class="container">
    <div class="item1"></div>
    <div class="item2">
    <header>
     <div class="login_img">
        </div>
        <div id="head2">
               <div id="head2_1"></div>
               <div id="head2_2">
                   <%--  <img id="logo" src="<c:url value=' >" alt"">  --%>

                   </div>
               <div id="head2_3"> </div> 
            </div>

        <div id="head3"> </div>
      
   </header>

   <section>
    <div class="email">   
        
        <input id="emailinput" type="text" autocomplete="off" value="" placeholder=" 이메일" name="userEmail" id="userId">

    </div>
    

    <div class="password">
    <input id="passwordinput" type="password" value="" placeholder=" 비밀번호"  name="userPw" id="userPw">
    </div>
    <div class="login">
     <button type="button" id="login_btn">로그인</button>
     <c:if test="${msg == 'failure'}">
                    <div id="text1" style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div id="text2" style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
    </div>
    
    <div class="find">
      <div class="tt"><a id="id" href="${path}/user/findId">아이디 찾기</a></div>
      <div class="tt"><a id="id2" href="#2">패스워드 찾기</a></div>
      <div class="ttt"><a id="id3" href="${path}/user/policy">회원가입</a></div>
      
    </div>
</div>
<div class="item3"></div>
</form>
</section>
</body>
</div>
<footer>

</footer>  
</html>