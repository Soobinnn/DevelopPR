<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>로그인페이지</title>
<%@ include file="../../views/include/tag_header.jsp" %>

<script>
  // 준형 : 이메일 저장 쿠키 추가
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
        
        // 엔터 시 로그인
        $('#userEmail').keypress(function(event) 
        {	
        	var keycode = (event.keyCode ? event.keyCode : event.which);
        	if (keycode == '13') 
        	{
        		document.form1.submit();
        	}
        	event.stopPropagation();
        });
        $('#userPw').keypress(function(event) 
        {	
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') 
            {
                document.form1.submit();
            }
            event.stopPropagation();
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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/login.css'/>"/>
</head>
<body>
<div id="loginn">
    <form name="form1" method="post" action="${path}/user/loginCheck"> <%--스크립트 form 코드 태그안에 추가 : 준형 --%>
            <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
    <div class="login_container">
    <div class="item1">

    </div>
    <div class="item2">
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
       <a href="https://kauth.kakao.com/oauth/authorize?client_id=ddf96236e7a9d02c46ce6f523dc484a3&redirect_uri=https://developpr.org/DevelopPR/user/kakaooauth&response_type=code "><img id="kakao" src="<c:url value='/resources/user/kakao.png'/>"></a> 
       <a href="${path}/user/naverLogin"><img id="naver" src="<c:url value='/resources/user/naver.png'/>"></a>
       <a href="${facebook_url}"><img id="facebook" src="<c:url value='/resources/user/facebook.png'/>"></a>
       <a href="${path}/user/googleLogin"><img id="google" src="<c:url value='/resources/user/google.png'/>"></a>
    </div>
    <div id="login_other">
       <span id="other">다른 계정으로 로그인</span></div>
 
    </section>
    </div>
    <div class="item3"></div>

</div>
</form>
</div>
<script src="<c:url value='/resources/user/login.js'/>"></script>
</body>
