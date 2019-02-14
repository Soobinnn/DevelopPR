<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<script type="text/JavaScript">

function checks()
{
//비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
if($('#goodbye_Pw').val() =="")
{
   alert("비밀번호를 입력해주세요.");
   $("#goodbye_Pw").focus();
   return false;
}
//비밀번호 체크
if($('#goodbye_Pw').val() != $('#goodbye_PwChk').val())
{
   alert('비밀번호가 일치하지 않습니다.');
   $('#goodbye_Pw').focus();
   return false;
}  
//유효성검사 , 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
if(!userPwCheck.test($('#goodbye_Pw').val()))
{
   alert('비밀번호 형식에 맞게 최소8자리, 숫자, 문자, 특수문자 최소 1자리를 입력해주세요.')
   $('#goodbye_Pw').focus();
   return false;
}
//최종 확인 여부
if(confirm("삭제하시겠습니까?"))
{
	return true;   
}
}
$(function(){

	$('#goodbye_Pw').blur(function()
	{
	   // 비밀번호 최소8자리, 숫자,문자, 특수문자 최소 1개
	    var userPwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	    if(!userPwCheck.test($('#goodbye_Pw').val()))
	    {
	        $('#goodbye_Pw').css({"border" :"2px solid red","background-color":"#FFCECE"});
	        $('#goodbye_msg').text('비밀번호 형식에 맞게 입력해주세요.').css("color","red");
	        $('#goodbye_Pw').focus();
	    } 
	    else{
	    	var userPw = $('#goodbye_Pw').val();
	    	var param = "userPw="+userPw;
	    
	    $.ajax({
	    	async: true,
	    	type: 'POST',
	    	data: param,
	    	url:"${path}/user/goodbyeChk",
	    	success:function(data)
	    	{
	    		if(data==true){
	    		
	    			$('#goodbye_Pw').css({"border" :"2px solid blue","background-color":"white"});
	    	        $('#goodbye_msg').text('비밀번호가 확인되었습니다.').css("color","blue");
	    		 }
	    		else if(data==false){
	    			$('#goodbye_msg2').css({"display" : "block"});
	    			$('#goodbye_Pw').css({"border" :"2px solid red","background-color":"white"});
	    	        $('#goodbye_msg2').text('비밀번호가  기존번호와 다릅니다.').css("color","red");
	    			
	    		}
	    		}
	    			
	    	});
	    }	
	    	
	   
	});
	
	$('#goodbye_PwChk').blur(function()
	{
    	if($('#goodbye_Pw').val() != $('#goodbye_PwChk').val())
   		 {
        $('#goodbye_PwChk').css({"border" :"2px solid red","background-color":"#FFCECE"});
        $('#goodbye_msgChk').text('비밀번호가 일치하지 않습니다.').css("color","red");
        
    	}
    	else
    		{
       		 if( $('#goodbye_PwChk').val()=='')
        		{
            $('#goodbye_PwChk').css({"border" :"2px solid red","background-color":"#FFCECE"});
            $('#goodbye_msgChk').text('비밀번호를 입력하세요.').css("color","red");
           
        	}
        	else
        	{
            $('#goodbye_PwChk').css({"border" :"2px solid green","background-color":"white"});
            $('#goodbye_msgChk').text('비밀번호가 일치합니다.').css("color","green");
        	}
    }
	});

});

</script>
<style>
.goodbye_header
{
   text-align : center;
   font-size: 100px;
   border :1px solid black;
   height:160px;
}
.goodbye_sec {
   display: flex;
   flex-direction: row;
   width: auto;
   height: 600px;
   border :1px solid black;
  
}
#goodbye_sec1{
   border :1px solid black;
   width : 50%;
}
#goodbye_sec2{
    
   display : flex;
   flex-shrink: 0;
   flex-basis: 730px;
   border :1px solid black;
   width : auto;
   justify-content : center;
   height : auto;
}
#goodbve_form
{
      
    width: 490px;
    height: 400px;
    border: 1px solid red;
}
#goodbye_ul
{
 position: relative;
 left: 50px;
 border :1px solid blue;
 width : 490px;
 height: 400px;
 position: relative;
 top : 90px;
}
#goodbye_li1
{
   color : white;
   margin-bottom : 70px;
}
#goodbye_span
{
   font-size : 35px;
   color : black;
}
#goodbye_li2
{
   color : white;
   margin-bottom : 20px;
}
#goodbye_Pw
{
 height : 40px;
 width : 250px;
}

#goodbye_li3
{
   color : white;
   margin-bottom : 60px;
}
#goodbye_PwChk
{
   width : 250px;
   height : 40px;
}
#goodbye_delete
{
   position : relative;
   left : 20px;
   top : 0.5px;
   height : 40px;
   width: 90px;
   background : #0B173B;
   border : 1px solid white;
   border-radius: 11px 11px / 11px 11px;
   color : white;
}
#goodbye_cancel
{
position : relative;
   left: 70px;
   height : 40px;
   width: 90px;
   background : #0B173B;
   border : 1px solid white;
   border-radius: 11px 11px / 11px 11px;
   color: white;

}
#goodbye_li4
{
   color : white;
   
}
#goodbye_sec3{
   border :1px solid black;
   width : 50%;
}

.goodbye_ft
{
 border :1px solid black;
}

#goodbye_msg
{
    color: black;
}
#goodbye_msg2
{
	display:none;
}
</style>
</head>
<body>
   <header class="goodbye_header">

   </header>
   <section class="goodbye_sec">
      
  <div id="goodbye_sec1">
   		</div>
   <div id="goodbye_sec2">
      <ul id="goodbye_ul">
      <form id="goodbve_form" name="goodbve_form" action="${path}/user/goodbye" method="post" onsubmit="return checks()">  
      <li id="goodbye_li1">
         <span id="goodbye_span"><strong>회원 탈퇴</strong></span>
      </li>
       <li id="goodbye_li2">
          <input id="goodbye_Pw" type="password" name="userPw"  placeholder=" 비밀번호 입력" autocomplete="off">
          <span id="goodbye_msg"></span>
          <span id="goodbye_msg2"></span>
        </li>      
        <li id="goodbye_li3"> 
           <input type="password" id="goodbye_PwChk" placeholder=" 비밀번호를 한번 더 입력해주세요" autocomplete="off">
           <span id="goodbye_msgChk"></span>
        </li>
         <li id="goodbye_li4">
            <button id="goodbye_delete" type="submit">삭제</button>
            <button id="goodbye_cancel" type="button" onclick="location='${path}/main'">취소</button>
         </li>
         </form>      
      
   </ul>
   </div>
  		 <div id="goodbye_sec3">
     	 </div>
   </section>
   <footer class="goodbye_ft">
      
   </footer>
</body>
</html>