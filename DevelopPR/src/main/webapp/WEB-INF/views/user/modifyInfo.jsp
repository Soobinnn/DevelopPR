<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/modifyInfo.css'/>"/>

<script type="text/javascript">   
var userIs_seekCheck = false;
var CheckPw = false;
var CheckPwchk = false;
var CheckNick = false;
var CheckPhone = false;
var userJobCheck = false;


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

function checks()
{
// 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^.,/`~;:])[A-Za-z\d$@$!%*#?&^.,/`~;:]{8,}$/;
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
if($('#userPhone').val() =="")
{
    alert("휴대폰번호를 입력해주세요.");
    $("#userPhone").focus();
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

$(function(){

	var visit = ${vo.userIs_seek};
	var job = ${vo.userJob};
	
	if(visit == '0' && job == '0')
	{
	  $('#radio').checked  = true;
	  $('#radio3').checked = true;
	}

	else if (visit == '0' && job =='1')
	{
	  $('#radio').checked = true;
	  $('#radio4').checked = true;
	}

	else if (visit == "1" && job == "0")
	{
	  $('#radio2').checked = true;
	  $('#radio5').checked = true;
	}
	
	else if (visit == '1' && job =='1')
	{
	  $('#radio2').checked = true;
	  $('#radio6').checked = true;
	}
	
  // 처음에 수정 활성화 끄기
  $('#modify').prop("disabled", true).css("background-color", "#aaaaa");
  // 보이게하기
  display_visit();
  

$('#userPw').blur(function()
{
    // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^.,/`~;:])[A-Za-z\d$@$!%*#?&^.,/`~;:]{8,}$/;
    if(!userPwCheck.test($('#userPw').val()))
    {
        
        $('#userPw').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#pwCheckMsg').text('비밀번호 형식에 맞게 입력해주세요.').css("color","red");
        $('#p4').css("color","red");
        $('#userPw').focus();
    }
    else   
    {
    		var userPw = $('#userPw').val();
    		var param = "userPw="+userPw;

    	$.ajax({
    		async: true,
    		type: 'POST',
    		data: param,
    		url:"${path}/user/goodbyeChk",
    		success:function(data)
    		{
    			if(data==true){
    			
    				$('#userPw').css({"border" :"2px solid green","background-color":"white"});
    		        $('#pwCheckMsg').text('비밀번호가 확인되었습니다.').css("color","green");
    			 }
    			else if(data==false){
    				$('#pwCheckMsg').css({"display" : "block"});
    				$('#userPw').css({"border" :"2px solid red","background-color":"white"});
    		        $('#pwCheckMsg').text('비밀번호가  기존번호와 다릅니다.').css("color","red");
    			}
    			}
    				
    		});
    }
});

$('#userPwChk').keyup(function()
{
    if($('#userPw').val() != $('#userPwChk').val())
    {
        $('#userPwChk').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#pwchCheckMsg').text('비밀번호가 일치하지 않습니다.').css("color","red");
        $('#modify').css({"background":"white","color":"#585858"});
        $('#modify').prop("disabled", true);
    }
    else
    {
        if( $('#userPwChk').val()=='')
        {
            $('#userPwChk').css({"border" :"2px solid red","background-color":"#FBF5EF"});
            $('#pwchCheckMsg').text('비밀번호를 입력하세요.').css("color","red");

        }
        else
        {
            $('#userPwChk').css({"border" :"2px solid green","background-color":"white"});
            $('#pwchCheckMsg').text('비밀번호가 일치합니다.').css("color","green");
            $('#modify').css({"background":"#585858","color":"white"});
            $('#modify').prop("disabled", false);
            $('#modify').hover(function()
            		{
            				$('#modify').css({"background-color":"#b9b9b9"});
            		},function()
            		{
            				$('#modify').css({"background-color":"#585858", "border":"2px solid #585858", "color":"white"});

            		});
        }
    }
});

$('#modify').click(function()
{
    // 글자수만 제한
    var userNickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
    var _userNick = $('#userNick').val();
    var param = "userNick="+_userNick;
    var userNick = "<%=(String)session.getAttribute("userNick")%>"
    
    if(_userNick == userNick)
    	{
    	    $('#userNick').css({"border" :"2px solid green","background-color":"white"});
    	    modifyInfo_form1.action="${path}/user/modifyInfo";
    	    modifyInfo_form1.submit();
    	}
    else
    {
    	$.ajax({
    
            async : true,
            type :'POST',
            data : param,
            url : "${path}/user/checkNick",
            success : function(data)
            {
                if(!userNickCheck.test(_userNick))
                {      
                    $('#userNick').css({"border" :"2px solid red","background-color":"#FBF5EF"});
                    /* $('#userEmail').focus(); */
                    $('#nickCheckMsg').text('닉네임 형식에 맞게 입력해주세요.').css("color","red");
                }
                else 
                {
                    /* 중복이 없을경우 */
                    if(data == '0')
                    {                  
                        $('#userNick').css({"border" :"2px solid green","background-color":"white"});
                        $('#nickCheckMsg').text('사용 가능한 닉네임입니다.').css("color","green");
                        modifyInfo_form1.action="${path}/user/modifyInfo";
                	    modifyInfo_form1.submit();
                    }
                    else if(data == '1')
                    {               
                        $('#userNick').css({"border" :"2px solid red","background-color":"#FBF5EF"});
                        $('#nickCheckMsg').text('이미 사용된 닉네임입니다.').css("color","red");
                    }
                }
            }
               
            });
    }
});

$('#userPhone').blur(function()
{
    // 핸드폰 숫자형식 9~11자
    var userPhoneCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
    if(!userPhoneCheck.test($('#userPhone').val()))
    {
        $('#userPhone').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#phoneCheckMsg').text('휴대폰번호 형식에 맞게 입력해주세요.').css("color","red");

    }
    else
    {
        $('#userPhone').css({"border" :"2px solid green","background-color":"white"});
        $('#phoneCheckMsg').text('').css("color","green");

    }
});


$("input:radio[name='userIs_seek']").click(function()
{
    $('#userIs_seekMsg').text('');

});

$("input:radio[name='userJob']").click(function()
{
    $('#userjobCheckMsg').text('');

});

$("#modify").keyup(function(event) {
	  // Enter 처리
	  if (event.keyCode == '13') {
	    $("#modify").trigger("click");
	  };
	});

});

</script>

</head>
<body>
<div class="modifyInfo">
<header class="user_header">
  <div class="head"></div>
  <div class="head2">
     <strong>DevelopPR</strong>
  </div>
  <div class="head3"></div>
</header>
<section class="user_section">
  <div class="sec1"></div>
  <div class="sec2">
     <div id="sec2_1"></div>
     <div id="sec2_2">
        <div id="top">
           <span id="information"> <strong>정보 수정</strong></span> <span
              id="obligatory"> 비밀번호 확인 후 수정가능 </span>
        </div>
        <div id="middle">
           <form id="modifyInfo_form" action="${path}/user/modifyInfo" name="modifyInfo_form1" method="post" onsubmit="return checks()">
              <ul id="user_ul">
                 <li class="user_li1">
                    <div class="radio_">
                       <input type="radio" value="0" name="userIs_seek" id="radio" checked="checked"
                          onclick="display_visit()"><label for="radio">방문자</label> <input type="radio"
                          value="1" name="userIs_seek" id="radio2"
                          onclick="display_job()"><label for="radio2">구직자</label>
                    </div>
                    <span id="userIs_seekMsg"></span>
                 </li>
                 <li class="user_li2" id="user_li_email"><input id="userEmail" type="text" autocomplete="off"
                    value="${vo.userEmail}" placeholder=" 이메일" name="userEmail" readonly="readonly">
                    <span id="emailCheckMsg"></span>
                    <p id="p1">이메일 형식으로 입력해 주세요. 이메일은 아이디로 사용됩니다.</p>
                    <p id="p2">이메일 인증이 진행되니 정확한 이메일 주소를 입력해 주시기 바랍니다.</p>
                 </li>
                 <li class="user_li3"><input id="userName" type="text" autocomplete="off" value="${vo.userName}"
                    placeholder=" 이름" name="userName" readonly="readonly">
                    <span id="nameCheckMsg"></span>
                    <p id="p3">이름은 한글2~4자를 입력해주세요</p>
                 </li>
                 <li class="user_li4"><input id="userPw" type="password" value=""
                    placeholder=" 현재 비밀번호 입력" name="userPw">
                     <span id="pwCheckMsg"></span>
                    <p id="p4">비밀번호는 최소 8자 이상, 문자, 숫자, 특수문자 1자 이상 조합해 주세요.</p></li>
                 <li class="user_li5"><input id="userPwChk" type="password" value=""
                    placeholder=" 비밀번호 확인">
                     <span id="pwchCheckMsg"></span>
                    <p id="p5">비밀번호를 다시 한번 입력해 주세요.</p></li>
                 <li class="user_li6"><input id="userNick" type="text" autocomplete="off"
                    value="${vo.userNick}" placeholder=" 닉네임" name="userNick">
                     <span id="nickCheckMsg"></span>
                    <p id="p6">사용하실 닉네임을 2자~20자 한글, 영문, 숫자를 사용해 입력해주세요.</p>
                </li>
                <li class="user_li7"><input id="userPhone" type="text" autocomplete="off"
                    value="${vo.userPhone}" placeholder=" 핸드폰" name="userPhone">
                    <span id="phoneCheckMsg"></span>
                    <p id="p7">핸드폰 번호는 '-'를 제외하고 숫자만 입력해 주세요.</p>
                </li>
                 
                    <li id="visit" style="display: none">
                    <div class="radio_1">
                       <input type="radio" value="0" name="userJob" id="radio3"><label for="radio3">학생</label>
                       <input type="radio" value="1" name="userJob" id="radio4"><label for="radio4">기업</label>
                        <span id="userjobCheckMsg"></span>
                    </div>
                 </li>
                 <li id="job" style="display: none">
                    <div class="radio_2">
                       <input type="radio" value="0" name="userJob" id="radio5"><label for="radio5">구직중</label>
                       <input type="radio" value="1" name="userJob" id="radio6"><label for="radio6">구직완료</label>
                        <span id="userJobCheckMsg"></span>
                    </div>
                 </li>
                 

                 <li class="user_li8"> <!-- 입력 자동완성 제거 : 준형 -->
                     <input id="explain" type="text" name="userJob_detail" autocomplete="off" value="${vo.userJob_detail}"
                    placeholder="학생이면 학교, 기업이면 기업에 대하여 입력해주세요.">
                      <span id="userjobdetailCheckMsg"></span>   
                 </li>
              </ul>
              <input type="hidden" name="profile" value="null"/>
        <div id="bottom">
           <input id="modify" type="button" value="수정" >
           <button id="cancel" type="button" onclick="location='${path}/user/login'">취소</button>
        </div>
        </form>
         </div>
     </div>
     <div id="sec2_3"></div>
  </div>
  <div class="sec3"></div>
</section>
</div>
</body>
</html>