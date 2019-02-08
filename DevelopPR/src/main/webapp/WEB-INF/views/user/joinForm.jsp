<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">   
var userIs_seekCheck = false;
var CheckEmail = false;
var CheckName = false;
var CheckPw = false;
var CheckPwchk = false;
var CheckNick = false;
var CheckPhone = false;
var userJobCheck = false;

function checks()
{

// 이메일 형식만 가능
var userEmailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
// 한글이름 2~4자
var userNameCheck = /^[가-힣]{2,4}$/;
// 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
// 글자수만 제한
var userNickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
// 핸드폰 숫자형식 9~11자
var userPhoneCheck = /^[0-9]+$/;

// 공백 확인
if($("input:radio[name='userIs_seek']").is(":checked") == true)
{
    $('#userIs_seekMsg').text('').css("color","red");
    userIs_seekCheck =true;
}
if(!userIs_seekCheck)
{
    $('#userIs_seekMsg').text('방문자, 구직자 중 하나를 선택해주세요.').css("color","red");
    $("input:radio[name='userIs_seek']").focus();
    return false;
}
if($('#userEmail').val() =="")
{
    alert("이메일을 입력해주세요.");
    $("#userEmail").focus();
    return false;
}
if($('#userName').val() =="")
{
    alert("이름을 입력해주세요.");
    $("#userName").focus();
    return false;
}
if($('#userPhone').val() =="")
{
    alert("휴대폰번호를 입력해주세요.");
    $("#userPw").focus();
    return false;
}
if($('#userPw').val() =="")
{
    alert("패스워드를 입력해주세요.");
    $("#userPw").focus();
    return false;
}
//비밀번호 체크
if($('#userPw').val() != $('#userPwChk').val())
{
    alert('비밀번호가 일치하지 않습니다.');
    $('#userPw').focus();
    return false;
}
if($('#userNick').val() =="")
{
    alert("닉네임를 입력해주세요.");
    $("#userNick").focus();
    return false;
}
if($("input:radio[name='userJob']").is(":checked") == true)
{
    $('#userjobCheckMsg').text('');
    userJobCheck =true;
}
if(!userJobCheck)
{
    $('#userjobCheckMsg').text('학생, 기업 중 하나를 선택해주세요.').css("color","red");
    $("input:radio[name='userJob']").focus();
    return false;
}

// 유효성검사
if(!userEmailCheck.test($('#userEmail').val()))
{
    alert('이메일형식에 맞게 입력해주세요.')
    $('#userEmail').focus();
    return false;
}
if(!userNameCheck.test($('#userName').val()))
{
    alert('이름형식에 맞게 입력해주세요.')
    $('#userName').focus();
    return false;
}
if(!userPwCheck.test($('#userPw').val()))
{
    alert('최소8자리, 숫자, 문자, 특수문자 최소 1자리를 입력해주세요.')
    $('#userPw').focus();
    return false;
}
if(!userNickCheck.test($('#userNick').val()))
{
    alert('2~20자로 입력해주세요.')
    $('#userNick').focus();
    return false;
}
if(!userPhoneCheck.test($('#userPhone').val()))
{
    alert('번호만 입력해주세요')
    $('#userPhone').focus();
    return false;
}
return true;   
}

function display_visit() 
{
 visit.style.display = 'block';
 job.style.display = 'none';
}

function display_job() 
{
  visit.style.display = 'none';
  job.style.display = 'block';
}
$(function(){

  // 처음에 등록 활성화 끄기
  $('#confirm').prop("disabled", true).css("background-color", "#aaaaa");
  
$('#userEmail').blur(function()
{
    // 이메일 형식만 가능
    var userEmailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    var _userEmail = $('#userEmail').val();
    var param = "userEmail="+_userEmail;
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/user/checkUse",
        success : function(data)
        {
            if(!userEmailCheck.test(_userEmail))
            {      
                $('#userEmail').css({"border" :"2px solid red","background-color":"#FFCECE"});
                /* $('#userEmail').focus(); */
                $('#emailCheckMsg').text('이메일형식에 맞게 입력해주세요.').css("color","red");
                 CheckEmail = false;
            }
            else 
            {
                /* 중복이 없을경우 */
                if(data == '0')
                {                  
                    $('#userEmail').css({"border" :"2px solid green","background-color":"white"});
                    $('#emailCheckMsg').text('가입 가능한 이메일입니다.').css("color","green");
                     CheckEmail = true;
                    
                }
                else if(data == '1')
                {               
                    $('#userEmail').css({"border" :"2px solid red","background-color":"#FFCECE"});
                    $('#emailCheckMsg').text('이미 가입된 이메일입니다.').css("color","red");
                     CheckEmail = false;
                }
            }
        }
        /* error: function(error)
        {
            alert("error : " + error);
        }  */
    });
});

$('#userName').blur(function()
{
    // 한글이름 2~4자
    var userNameCheck = /^[가-힣]{2,4}$/;
    if(!userNameCheck.test($('#userName').val()))
    {
        $('#userName').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#nameCheckMsg').text('이름 형식에 맞게 입력해주세요.').css("color","red");
        CheckName = false;
    }
    else   
    {
        $('#userName').css({"border" :"2px solid green","background-color":"white"});
        $('#nameCheckMsg').text('').css("color","green");
        CheckName = true;
    }
});
$('#userPw').blur(function()
{
    // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    if(!userPwCheck.test($('#userPw').val()))
    {
        
        $('#userPw').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#pwCheckMsg').text('비밀번호 형식에 맞게 입력해주세요.').css("color","red");
        $('#userPw').focus();
        CheckPw = false;
    }
    else   
    {
        $('#userPw').css({"border" :"2px solid green","background-color":"white"});
        $('#pwCheckMsg').text('사용 가능한 비밀번호 입니다.').css("color","green");
        CheckPw = true;
    }
});

$('#userPwChk').blur(function()
{
    if($('#userPw').val() != $('#userPwChk').val())
    {
        $('#userPwChk').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#pwchCheckMsg').text('비밀번호가 일치하지 않습니다.').css("color","red");
        CheckPwchk = false;
    }
    else
    {
        if( $('#userPwChk').val()=='')
        {
            $('#userPwChk').css({"border" :"2px solid red","background-color":"#FFCECE"});
            $('#pwchCheckMsg').text('비밀번호를 입력하세요.').css("color","red");
            CheckPwchk = false;
        }
        else
        {
            $('#userPwChk').css({"border" :"2px solid green","background-color":"white"});
            $('#pwchCheckMsg').text('비밀번호가 일치합니다.').css("color","green");
            CheckPwchk = true;
        }
    }
});

$('#userNick').blur(function()
{
    // 글자수만 제한
    var userNickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
    var _userNick = $('#userNick').val();
    var param = "userNick="+_userNick;
        $.ajax({
            async : true,
            type :'POST',
            data : param,
            url : "${path}/user/checkNick",
            success : function(data)
            {
                if(!userNickCheck.test(_userNick))
                {      
                    $('#userNick').css({"border" :"2px solid red","background-color":"#FFCECE"});
                    /* $('#userEmail').focus(); */
                    $('#nickCheckMsg').text('닉네임 형식에 맞게 입력해주세요.').css("color","red");
                    CheckNick = false;
                }
                else 
                {
                    /* 중복이 없을경우 */
                    if(data == '0')
                    {                  
                        $('#userNick').css({"border" :"2px solid green","background-color":"white"});
                        $('#nickCheckMsg').text('사용 가능한 닉네임입니다.').css("color","green");
                        CheckNick = true;
                    }
                    else if(data == '1')
                    {               
                        $('#userNick').css({"border" :"2px solid red","background-color":"#FFCECE"});
                        $('#nickCheckMsg').text('이미 사용된 닉네임입니다.').css("color","red");
                        CheckNick = false;
                    }
                }
            }
                /* error: function(error)
                {
                    alert("error : " + error);
                } */
            });
});

$('#userPhone').blur(function()
{
    // 핸드폰 숫자형식 9~11자
    var userPhoneCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
    if(!userPhoneCheck.test($('#userPhone').val()))
    {
        $('#userPhone').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#phoneCheckMsg').text('휴대폰번호 형식에 맞게 입력해주세요.').css("color","red");
        CheckPhone = false;
    }
    else
    {
        $('#userPhone').css({"border" :"2px solid green","background-color":"white"});
        $('#phoneCheckMsg').text('').css("color","green");
        CheckPhone = true;
    }
});
$(document).keyup(function()
{
    console.log("test");
    if(CheckEmail && CheckName && CheckPw && CheckPwchk && CheckNick && CheckPhone == true)
    {
         $('#confirm').prop("disabled", false).css("background-color", "gray");
    }
});

$("input:radio[name='userIs_seek']").click(function()
{
    $('#userIs_seekMsg').text('');
    userIs_seekCheck =true;
});

$("input:radio[name='userJob']").click(function()
{
    $('#userjobCheckMsg').text('');
    userJobCheck =true;
});

});


</script>
<style>
.user_header
{
    display : flex;
    flex-direction : column;
    flex-shrink: 0;
    height : 120px;
}
.head 
{
    height: 10px;
}
.head2
{

    height : 90px;
    text-align : center;
    font-size : 70px;
}
#information
{
    font-size : 23px;
    position : relative;
    left : 10px;
}
#obligatory
{
    position : relative;
    left : 460px;
    color : red;
}
.head3
{

}

.user_section{
    display :flex;
    flex-direction: row;
    
    width: auto;
}

.sec1
{
    
    height : 700px;
    width : 40%;
}

.sec2
{
    
    display: flex;
    height : 800px;
    width : 800px;
    flex-shrink : 0;
    flex-basis : 600px;
}
#sec2_1
{
    
    width : 10%;
}
#sec2_2
{
    
    display : flex;
    flex-direction: column;
    height: 700px;
    width : 800px;
}

#top
{
    border-bottom:1px solid gray;
    height : 60px;
    
}
#middle
{
    border : 1px solid white;
    position : relative;
    height : 655px;
    width: 800px;

}
.radio_ , .radio_1, .radio_2
{
    color : black;
    font-size : 14px;
    opacity : 0.6;
}
.radio_1, .radio_2
{
    position: relative;
    bottom : 17px;
}
#user_ul{
    position: relative;
    width : 640px;
    left : 60px;
    top : 0px;
    border : 1px solid white;
    height: 630px;
  
    
}
.user_li1,.user_li2,.user_li3,.user_li4,.user_li5,.user_li6,.user_li7,.user_li8
{
    color : skyblue;
    font-size : 14px;
    margin-bottom : 15px;
}
.user_li2
{
    margin-bottom : 10px;
}
.user_li3
{
    margin-bottom : 5px;
}
.user_li4
{
    margin-bottom : 6px;
}
.user_li5
{
    margin-bottom : 10px;
}
.user_li6
{
    margin-bottom : 10px;
}
.user_li7
{
    margin-bottom : 30px;
}
.user_li8
{
    margin-bottom : 10px;
}
#userEmail
{
    

}
#userEmail, #userName, #userPw, #userPwChk, #userNick,#userPhone
{
    width:380px;
    height : 38px;
}
#userPw
{
  
}
#sec2_3
{
    width : 10%;
}
.sec3
{
    height : 800px;
    width : 40%;
}
#p1,#p2,#p3,#p4,#p5,#p6,#p7
{
    color : gray;
    font-size : 12px;
}
#p1
{
    position:relative;
    bottom : 3px;
    left : 4px;
}
#p2
{
    position:relative;
    bottom : 12px;
    left : 4px;
}
#p3
{
    position:relative;
    bottom : 6px;
    left : 4px;
}
#p4
{
    position:relative;
    bottom : 5px;
    left : 4px;
}
#p5
{
    position:relative;
    bottom : 5px;
    left : 4px;
}
#p6
{
    position:relative;
    bottom : 5px;
    left : 4px;
}
#p7
{
    position : relative;
    bottom : 5px;
    left : 4px;
}
#explain
{
    width : 380px;
    height : 50px;
    box-shadow: 0 0 0 50px white inset;
}
#bottom
{
    display : flex;
    flex-shrink: 0;
    flex-basis : 20px;
    border-top: 1px solid gray;
    height : 110px;
    
}

#confirm
{
    background : white;
    border : 1px solid gray;
    position : relative;
    left : 32%;
    top : 24px;
    height : 35px;
    width : 70px;
}

#cancel
{
    background : white;
    border : 1px solid gray;
    position : relative;
    left : 44%;
    top : 24px;
    height : 35px;
    width : 70px;
}
#userPhone
{
position : relative;

}

#joinForm_form
{
width:800px;
height: 770px;
border: 1px solid white;
}
#userIs_seekMsg,#emailCheckMsg,#nameCheckMsg,#pwCheckMsg,#pwchCheckMsg,#nickCheckMsg,#phoneCheckMsg,#userjobCheckMsg
{
    position: relative;
    left: 7px;
}
</style>
</head>
<body>
<header class="user_header">
  <div class="head"></div>
  <div class="head2">
     <strong>DPR</strong>
  </div>
  <div class="head3"></div>
</header>
<section class="user_section">
  <div class="sec1"></div>
  <div class="sec2">
     <div id="sec2_1"></div>
     <div id="sec2_2">
        <div id="top">
           <span id="information"> <strong>정보 입력</strong></span> <span
              id="obligatory"> 전부 필수 입력사항입니다. </span>
        </div>
        <div id="middle">
           <form id="joinForm_form" action="${path}/user/joining" name="form1" method="post" onsubmit="return checks()">
              <ul id="user_ul">
                 <li class="user_li1">
                    <div class="radio_">
                       <input type="radio" value="0" name="userIs_seek" id="radio"
                          onclick="display_visit()">방문자 <input type="radio"
                          value="1" name="userIs_seek" id="radio2"
                          onclick="display_job()">구직자
                    </div>
                    <span id="userIs_seekMsg"></span>
                 </li>
                 <li class="user_li2" id="user_li_email"><input id="userEmail" type="text" autocomplete="off"
                    value="" placeholder=" 이메일" name="userEmail">
                    <span id="emailCheckMsg"></span>
                    <p id="p1">이메일 형식으로 입력해 주세요. 이메일은 아이디로 사용됩니다.</p>
                    <p id="p2">이메일 인증이 진행되니 정확한 이메일 주소를 입력해 주시기 바랍니다.</p>
                 </li>
                 <li class="user_li3"><input id="userName" type="text" autocomplete="off" value=""
                    placeholder=" 이름" name="userName">
                    <span id="nameCheckMsg"></span>
                    <p id="p3">이름은 한글2~4자를 입력해주세요</p>
                 </li>
                 <li class="user_li4"><input id="userPw" type="password" value=""
                    placeholder=" 비밀번호" name="userPw">
                     <span id="pwCheckMsg"></span>
                    <p id="p4">비밀번호는 최소 8자 이상 영문, 숫자, 특수문자를 조합해 주세요.</p></li>
                 <li class="user_li5"><input id="userPwChk" type="password" value=""
                    placeholder=" 비밀번호 확인">
                     <span id="pwchCheckMsg"></span>
                    <p id="p5">비밀번호를 다시 한번 입력해 주세요.</p></li>
                 <li class="user_li6"><input id="userNick" type="text" autocomplete="off"
                    value="" placeholder=" 닉네임" name="userNick">
                     <span id="nickCheckMsg"></span>
                    <p id="p6">사용하실 닉네임을 2자~20자 한글, 영문, 숫자를 사용해 입력해주세요.</p>
                </li>
                <li class="user_li7"><input id="userPhone" type="text" autocomplete="off"
                    value="" placeholder=" 핸드폰" name="userPhone">
                    <span id="phoneCheckMsg"></span>
                    <p id="p7">핸드폰 번호는 '-'를 제외하고 숫자만 입력해 주세요.</p>
                </li>
                 
                    <li id="visit" style="display: none">
                    <div class="radio_1">
                       <input type="radio" value="0" name="userJob" id="radio3">학생
                       <input type="radio" value="1" name="userJob" id="radio4">기업
                        <span id="userjobCheckMsg"></span>
                    </div>
                 </li>
                 <li id="job" style="display: none">
                    <div class="radio_2">
                       <input type="radio" value="0" name="userJob" id="radio5">구직중
                       <input type="radio" value="1" name="userJob" id="radio6">구직완료
                        <span id="userJobCheckMsg"></span>
                    </div>
                 </li>
                 

                 <li class="user_li8">
                     <input id="explain" type="text" name="userJob_detail"
                    placeholder="학생이면 학교, 기업이면 기업에 대하여 입력해주세요.">
                      <span id="userjobdetailCheckMsg"></span>   
                 </li>
              </ul>
        <div id="bottom">
           <input id="confirm" type="submit" value="확인" >
           <button id="cancel" type="button" onclick="location='${path}/user/login'">취소</button>
        </div>
        </form>
         </div>
     </div>
     <div id="sec2_3"></div>
  </div>
  <div class="sec3"></div>
</section>
</body>
</html>