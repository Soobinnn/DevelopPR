<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

var CheckEmail = false;

function check()
{

if($('#findPw_email').val() =="")
{
    alert("이메일을 입력해주세요.");
    $("#findPw_email").focus();
    return false;
}

return true;	
}

$(function(){
	
$('#findPw_next').prop("disabled", true).css("background-color", "white");
	 
$('#findPw_email').blur(function(){

    // 이메일 형식만 가능
    var userEmailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    var _userEmail = $('#findPw_email').val();
    var param = "userEmail="+_userEmail;
    
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/user/findPassword",
        success : function(result)
        {
            if(!userEmailCheck.test(_userEmail))
            {		
                $('#findPw_email').css({"border" :"2px solid red","background-color":"#FFCECE"});
                $('#findPw_email').focus();
                $('#emailCheckMsg').text('이메일형식에 맞게 입력해주세요.').css("color","red");
                CheckEmail = false;
            }
            else 
            {
                /* 중복이 없을경우 */
                if(result == '0')
                {						
                    $('#findPw_email').css({"border" :"2px solid red","background-color":"white"});
                    $('#emailCheckMsg').text('이메일이 일치하지 않습니다.').css("color","red");
                    CheckEmail = false; 
                }
                else if(result == '1')
                {					
                    $('#findPw_email').css({"border" :"2px solid green","background-color":"#FFCECE"});
                    $('#emailCheckMsg').text('확인 가능한 이메일 입니다.').css("color","green");
                    CheckEmail = true;
                  
                 $('#findPw_next').prop("disabled", false).css("background-color", "red");
                    
                }
            }
         }
      });
   });
});
</script>
    <style>
        
        #findPw_header
        {
            height: 100px;
            text-align: center;
            font-size : 50px;
            
        }
        
        
        #findPw_sec{
            display:flex;
            
           width : auto;
            height: 550px;
        }
        #findPw_sec_1
        {
            
            width : 40%;
        }
        #findPw_sec_2
        {
            display : flex;
            
            flex-shrink: 0;
            width: auto;
            
        }
        #findPw_sec_2_1
        {
        width : 70%;
        }
        #findPw_sec_2_2
        {
            
            display:flex;
            flex-direction: column;
            flex-shrink: 0;
            flex-basis: 580px;
            width : 800px;
           
            position : relative;
            left : 0px;

        }
        #findPw_sec_2_3
        {
            
            width:70%;
        }
        #findPw_Top
        {
            border-bottom:1px solid gray ;
            height: 75px;
        }
        #findPw_span1
        {
           
            position: relative;
            top: 32px;
            font-size:20px;
        }
        #findPw_mid
        {
           
            height: 250px;
        }
        #findPw_img
        {
            position: relative;
            left : 240px;
            top : 38px;
            width : 100px;
        }
        #findPw_p
        {
            position: relative;
            left: 210px;
            top : 45px;
        }
        #findPw_span2
        {
            position: relative;
            left: 210px;
            color:blue;
            top : 35px;
        }
        #findPw_span3
        {
            position: relative;
            left: 210px;
            top : 35px;
        }
        #findPw_bottom
        {
            display:flex;
            flex-direction: column;
            height: 180px;
            
        }
        #findPw_bottom1
        {
            width : auto;

            border-top:1px solid gray;
            height:130px;
        }
        #findPw_bottom2
        {
            
            border-top:1px solid gray;
            height:110px;
        }

        #findPw_email
        {
            position: relative;
            left : 40px;
            top : 15px;
            height: 40px;
            width: 480px;
            box-shadow: 0 0 0 50px white inset;   
        }
        #findPw_emailCheckMsg
        {
            position:relative;
            top : 22px;
            left : 50px;
        }
        #findPw_span4
        {
            position: relative;
            left : 40px;
            top :10px;
            font-size : 12px;
            color : gray;
        }
        #findPw_findid
        {
            position: relative;
            top :10px;
            left : 300px;
            height : 30px;
            background: black;
            border : 1px solid white;
            border-radius: 7px/ 7px;
            color : white;
        }
        #findPw_next
        {
            position: relative;
            top:55px;
            left:10px;
            width: 105px;
            height :45px;
            background : black;
            border : 1px solid white;
            color : white;
            border-radius: 11px/ 11px;

        }
        #findPw_form
        {
            height:0px;
        }
        #findPw_sec_3
        {
            
            width : 40%;
        }
        #findPw_ft
        {
            height : 100px;
        }
    </style>
</head>
<body class="findPw_body">
    <header id="findPw_header">
        <div id="DPR">
        <span id="find_Pw_DPR"><strong>DPR</strong></span>
            </div>
    </header>
    <section id="findPw_sec">
            
        <div id="findPw_sec_1"></div>
        <div id="findPw_sec_2">
    
            <div id="findPw_sec_2_1"></div>
            <div id="findPw_sec_2_2">
                    
                <div id="findPw_Top">
                    <span id="findPw_span1">
                        <strong>비밀번호 찾기</strong></span>

                </div>
                <div id="findPw_mid">
                        <img id="findPw_img" src="">
                        <p id="findPw_p">비밀번호 찾기를 위한</p>
                        <span id="findPw_span2">이메일</span><span id="findPw_span3">을 입력해주세요.</span>

                </div>
                <form id="FindPw_form" name="FindPw" action="${path}/user/findPwEmail" method="post" onsubmit="return check()">
                <div id="findPw_bottom">
                    <div id="findPw_bottom1">
                        <input id="findPw_email" type="text" name="userEmail" value="${userEmail}"
                        placeholder="  이메일(대소문자 구분)">
                        <input type="hidden" value="" id="hidden" name="hidden">
                        <div id="findPw_emailCheckMsg">
                        <span id="emailCheckMsg"></span>
                        </div>
                </div>

                <div id="findPw_bottom2">
                    <span id="findPw_span4"> * 이메일을 찾으시나요?</span>
                    <button id="findPw_findid" type="button" onclick="location=''">이메일 찾기</button>
                    <input id="findPw_next" type="submit" value="다음 단계">
                </div>
                </div>
            </form>
        </div>
        
        <div id="findPw_sec_2_3"></div>
        </div>
    
        <div id="findPw_sec_3"></div>
    </section>
<footer id="findPw_ft">

</footer>    
</body>
</html>