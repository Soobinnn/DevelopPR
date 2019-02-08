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
    #emailSave
    {
        position : relative;
        left : 100px;
        bottom : 7px;
        width: 25px;
        height: 20px;
        border:1px solid black;
    }
    #emailSave_span
    {
        color: gray;
        font-size:15px;
        position: relative;
        left: 95px;
        bottom : 11px;
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
           /*--->  // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/user/loginCheck"
            // 제출
            document.form1.submit(); <-- 준형 : form태그 안에 넣음*/
        });
    });
  //--> 준형 : 이메일 저장 쿠키 추가
    $(document).ready(function(){ 
        
        // 저장된 쿠키값을 가져와서 email 칸에 넣어준다. 없으면 공백으로 들어감.
        var key = getCookie("key");
        $("#userEmail").val(key); 
         
        if($("#userEmail").val() != ""){ // 그 전에 email를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 email가 표시된 상태라면,
            $("#emailSave").attr("checked", true); // email 저장하기를 체크 상태로 두기.
        }
         
        $("#emailSave").change(function(){ // 체크박스에 변화가 있다면,
            if($("#emailSave").is(":checked")){ // email 저장하기 체크했을 때,
                setCookie("key", $("#userEmail").val(), 7); // 7일 동안 쿠키 보관
            }else{ // email 저장하기 체크 해제 시,
                deleteCookie("key");
            }
        });
         
        // email 저장하기를 체크한 상태에서 email를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("#userEmail").keyup(function(){ // email 입력 칸에 email를 입력할 때,
            if($("#emailSave").is(":checked")){ // email 저장하기를 체크한 상태라면,
                setCookie("key", $("#userEmail").val(), 7); // 7일 동안 쿠키 보관
            }
        });
    });
    
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1); // 어제 날짜를 쿠키 소멸 날짜로 지정.
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);

        /*     cookieName = 쿠키 이름

        value = 쿠키에 넣을 값

        exdays = 만료일 (일 단위)
     */
 //---> 이메일 저장 쿠키 추가 
    }
   
</script>

</head>
<body>
 
    <form name="form1" method="post" action="${path}/user/loginCheck"> <%--스크립트 form 코드 태그안에 추가 : 준형 --%>
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
            
            <%--이메일 저장 추가 : 준형 ---------------------%>
            <input type="checkbox" id="emailSave" >
            <label id="emailSave_label" for="emailSave"><span id="emailSave_span">이메일 저장</span></label>
            <%--이메일 저장 추가 : 준형 ---------------------%>
            
            <%--로그인 버튼 클릭시 예외처리 (c:if문), button->submit 변경 : 준형 ------%>
            <div class="login">
             <button type="submit" id="login_btn">로그인</button>
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
    		<%--로그인 버튼 클릭시 예외처리 : 준형 ---------------------------%>
    		
    		
    <div class="find">
      <div class="tt"><a id="login_findid" href="${path}/user/findEmail">이메일 찾기</a></div>
      <div class="tt"><a id="login_findpw" href="${path}/user/findPasswordForm">패스워드 찾기</a></div>
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
