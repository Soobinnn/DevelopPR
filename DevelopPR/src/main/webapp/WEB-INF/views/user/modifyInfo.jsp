<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/modifyInfo.css'/>"/>

<script type="text/javascript">

 $(document).ready(function(){
	$(document).scrollTop(400); 
	
	var profile  = "${vo.profile}";
	
	if(profile == "" || profile == "null") // 처음 회원가입한 회원들
	{
	$('#uploadImage').attr("src","/DevelopPR/resources/resume/person.jpg"); // 기존 사진을 불러온다.
	$('#uploadImg').val("/DevelopPR/resources/resume/person.jpg"); // 히든 input 값에 기존 사진 넣어줌.
	}
	else //그렇지 않으면
		{
		 $('#uploadImage').attr("src",profile);
		 $('#uploadImg').val(profile);
		}
		
}); 
 
function fn_uploadImage() {
	$("#uploadImageFile").click();
}

function uploadImageFileChange() {
	var formData = new FormData();
	formData.append('upfile', $('#uploadImageFile')[0].files[0]); 
	$.ajax({
		url: "${path}/fileUpload",
	    data: formData,
	    type: 'POST',
	    contentType: false,
	    processData: false,
	    success : function(data){
	    	$('#uploadImage').attr("src", "${path}/fileDownload?filename="+data);
	    	$('#imageEditor').css('display', 'inline-block');
	    	$('#LoadImage').css('display', 'none');
	    	$('#uploadImg').attr("value", data);
        }
	});
}

function fn_modifyImage() {
	var w = window.open("../imageEditor", "", "width=800,height=650,top=0px,left=200px,status=, resizable=false,scrollbars=no");
}
//사진 삭제 버튼
function fn_removeImage() {
	$('#uploadImage').attr("src", "/DevelopPR/resources/resume/person.jpg");
	$('#uploadImg').val("/DevelopPR/resources/resume/person.jpg"); // 히든 값으로 기본 사진 경로를 넣어줌. 안 넣어주면 기존 사진 값이 DB에 들어감.
	$('#imageEditor').css('display', 'none');
	$('#LoadImage').css('display', 'inline-block');
}

//다른 계정 로그인일 경우 비밀번호 제한 .
function pwLimit()
{
	alert("다른 계정 로그인인 경우 비밀번호 변경이 불가능 합니다.");
}

//다른 계정 로그인일 경우 회원탈퇴
function deleteUser()
{
	if(confirm("다른 계정 로그인인 경우 확인버튼을 누르면 별다른 절차 없이 회원 탈퇴가 진행됩니다. 정말 탈퇴하시겠습니까?") == true)
	{
		location.href="${path}/user/goodbyeOther";
	    }
	    else{
	    	return;
	    }
}

$(function(){
	//라디오 버튼 값 가져와서 체크하기
	var visit = ${vo.userIs_seek};
	var job = ${vo.userJob};
	
	$('#radio').click(function() 
			{
				$('#visit').css({"display" : "block"});
				$('#job').css({"display" : "none"});
				$('#radio3').prop("checked", true);
			});


	$('#radio2').click(function()
			{
				$('#visit').css({"display" : "none"});
				$('#job').css({"display" : "block"});
				$('#radio5').prop("checked", true);
			});
	
	if(visit == 0 && job == 0)
	{
	  $('#radio').prop("checked", true);
	  $('#radio3').prop("checked", true);
	  $('#visit').css({"display" : "block"});
	  
	}

	else if (visit == 0 && job == 1)
	{
		$('#radio').prop("checked", true);
		$('#radio4').prop("checked", true);
		$('#visit').css({"display" : "block"});
	}

	else if (visit == 1 && job ==  0)
	{
		$('#radio2').prop("checked", true);
		$('#radio5').prop("checked", true);
		$('#job').css({"display" : "block"});
	}
	
	else if (visit == 1 && job == 1)
	{
		$('#radio2').prop("checked", true);
		$('#radio6').prop("checked", true);
		$('#job').css({"display" : "block"});
	}
	
//수정 버튼 클릭 이벤트
$('#modify').click(function()
{
    // 글자수만 제한
    var userNickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
    var _userNick = $('#userNick').val();
    var param = "userNick="+_userNick;
    var userNick = "${vo.userNick}"; 
    										
    // 핸드폰 숫자형식 9~11자
    var userPhoneCheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
 	// 핸드폰 숫자형식 9~11자
    var userPhoneCheck_num = /^[0-9]*$/;
 	
    if($('#userNick').val() =="")
    {
        alert("닉네임를 입력해주세요.");
        $('#userNick').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $("#userNick").focus();
        return false;
    }
    //닉네임 유효성검사
    else if(!userNickCheck.test($('#userNick').val()))
    {
        alert('2~20자로 입력해주세요.')
        $('#userNick').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#userNick').focus();
        return false;
    }
    
    else if($('#userPhone').val() =="")
    {
        alert("휴대폰번호를 입력해주세요.");
        $("#userPhone").focus();
        return false;
    }
	
    else if(!userPhoneCheck_num.test($('#userPhone').val()))
    {
        alert('번호만 입력해주세요')
        $('#userPhone').focus();
        return false;
    }

    else if(!userPhoneCheck.test($('#userPhone').val()))
    {
        alert('번호형식에 맞게  입력해주세요')
        $('#userPhone').focus();
        return false;
    }
    
    else if(_userNick == userNick ) // 기존에 가지고 있던 닉네임 값과 입력된 값이 일치하면 수정할 수 있음. 중복체크를 하지 않기위해
    	{
    	    $('#userNick').css({"border" :"2px solid green","background-color":"white"});
    	    
    	    if(confirm("정말 수정하시겠습니까?") == true){
    	    modifyInfo_form1.action="${path}/user/modifyInfo";
    	    modifyInfo_form1.submit();
    	    }
    	    else{
    	    	return;
    	    }
    	}
    else // 닉네임을 수정할 경우 중복체크
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
                    $('#nickCheckMsg').text('닉네임 형식(2~20자)에 맞게 입력해주세요.').css({"color":"red"});
                    $("#userNick").focus();
                    
                }
                else 
                {
                    /* 중복이 없을경우 */
                    if(data == '0')
                    {                   
                        if(confirm("정말 수정하시겠습니까?") == true){
                    	    modifyInfo_form1.action="${path}/user/modifyInfo";
                    	    modifyInfo_form1.submit();
                    	    }
                    	    else{
                    	    	return;
                    	    }
                    }
                    else if(data == '1') // 중복인 경우
                    {               
                        $('#userNick').css({"border" :"2px solid red","background-color":"#FBF5EF"});
                        $('#nickCheckMsg').text('이미 사용된 닉네임입니다.').css({"color":"red"});
                        $("#userNick").focus();
                    }
                }
            }
               
            });
    }
});

// 휴대폰번호 유효성 검사
$('#userPhone').keyup(function()
{
    // 핸드폰 숫자형식 9~11자
    var userPhoneCheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

    if(!userPhoneCheck.test($('#userPhone').val()))
    {
        $('#userPhone').css({"border" :"2px solid red","background-color":"#FBF5EF"});
        $('#phoneCheckMsg').text('휴대폰번호 형식에 맞게 입력해주세요.').css({"color":"red"});
        $('#userPhone').focus();

    }
    else
    {
        $('#userPhone').css({"border" :"2px solid green","background-color":"white"});
        $('#phoneCheckMsg').text('').css({"color":"green"});
        $('#userPhone').focus();

    }
});
//취소버튼 클릭 
$('#cancel').click(function()
		{
	if(confirm("정말 취소하시겠습니까?") == true){
	    window.location.href='${path}/main';
	    }
	    else{
	    	return;
	    }
		});
});

</script>

</head>
<body>
<div class="modifyInfo">

<header class="user_header">
  	
</header>
<section class="user_section">
  <div class="sec1">
  		<div id="function_div">
  			<%-- <img id="function_img" src="${path}/resources/user/.png">  --%>		
  			<ul id="function_list">
  			
  				<li id="function_li1">
  				<a id="function_a1" href="${path}/user/modifyInfoform">회원 정보수정</a>
  				</li>
  				
  				<c:choose> 
  				<c:when test = "${vo.userEmail.indexOf('_') > -1}">
				<li id="function_li2">
				<a id="function_a2" href='javascript:pwLimit();'>비밀번호 변경</a>
				</li> 
				</c:when>
				<c:otherwise>
				<li id="function_li2">
				<a id="function_a2" href="${path}/user/changePwform">비밀번호 변경</a>
				</c:otherwise>
				</c:choose>
							
  				<c:choose> 
  				<c:when test = "${vo.userEmail.indexOf('_') > -1}">
				<li id="function_li3">
				<a id="function_a3" href='javascript:deleteUser();'>회원 탈퇴</a>
				</li> 
				</c:when>
				<c:otherwise>
				<li id="function_li3">
				<a id="function_a3" href="${path}/user/goodbyeform">회원 탈퇴</a>
				</c:otherwise>
				</c:choose>
  			</ul> 		
  		</div>  
  </div>
  <div class="sec2">
     <div id="sec2_1"></div>
     <div id="sec2_2">
        <div id="top">
           <span id="information"> <strong>정보 수정</strong></span> <span
              id="obligatory"> 수정할 부분을 입력하세요. </span>
        </div>
        <div id="middle">
        <form id="modifyInfo_form" name="modifyInfo_form1" method="post">
        	<div id="img">
       				<img id="uploadImage"/>
       				<input type="hidden" id="uploadImg" name="profile"/>
    		</div>
 			<div id="upload_button" style="text-align:center; margin-top: 5px;">
				<div id="LoadImage">
					<a href="javascript:fn_uploadImage('')" class="img_btn1">프로필 사진 추가</a>
				</div>
				<div id="imageEditor" style="display:none;">
					<a href="javascript:fn_modifyImage('');" class="img_btn2">사진 수정</a>
					<a href="javascript:fn_removeImage('');" class="img_btn3">사진 삭제</a>
				</div>	
					<input type="file" id="uploadImageFile" onchange="uploadImageFileChange()" style="display:none"/>
			</div>   
              <ul id="user_ul">
              <li id="user_li0">
              <span id="user_li0_span1">*</span><span id="user_li0_span2">이력서 등록을 하시려면 구직자로 변경하셔야 합니다.</span>
              </li>
                 <li class="user_li1">
                    <div class="radio_">
                       <input type="radio" value="0" name="userIs_seek" id="radio">
                       <label for="radio">방문자</label> 
                       <input type="radio"
                          value="1" name="userIs_seek" id="radio2"><label for="radio2">구직자</label>
                    </div>
                    <span id="userIs_seekMsg"></span>
                 </li>
                 <li class="user_li2" id="user_li_email"><input id="userEmail" type="text" autocomplete="off"
                    value="${vo.userEmail}" placeholder=" 이메일" name="userEmail" readonly="readonly">
                    <span id="emailCheckMsg"></span>
                    <p id="p1">사용자 이메일</p>
                    
                 </li>
                 <li class="user_li3"><input id="userName" type="text" autocomplete="off" value="${vo.userName}"
                    placeholder=" 이름" name="userName" readonly="readonly">
                    <span id="nameCheckMsg"></span>
                    <p id="p3">사용자 이름</p>
                 </li>

                 <li class="user_li6"><input id="userNick" type="text" autocomplete="off"
                    value="${vo.userNick}" placeholder=" 닉네임" name="userNick">
                     <span id="nickCheckMsg"></span>
                    <p id="p6">수정하실 닉네임을 2자~20자 한글, 영문, 숫자를 사용해 입력해주세요.</p>
                </li>
                <li class="user_li7"><input id="userPhone" type="text" autocomplete="off"
                    value="${vo.userPhone}" placeholder=" 핸드폰" name="userPhone">
                    <span id="phoneCheckMsg"></span>
                    <p id="p7">핸드폰 번호는 '-'를 제외하고 숫자만 입력해 주세요.</p>
                </li>
                 
                    <li id="visit" >
                    <div class="radio_1">
                       <input type="radio" value="0" name="userJob" id="radio3"><label for="radio3">학생</label>
                       <input type="radio" value="1" name="userJob" id="radio4"><label for="radio4">기업</label>
                        <span id="userjobCheckMsg"></span>
                    </div>
                 </li>
                 <li id="job" >
                    <div class="radio_2">
                       <input type="radio" value="0" name="userJob" id="radio5"><label for="radio5">구직중</label>
                       <input type="radio" value="1" name="userJob" id="radio6"><label for="radio6">구직완료</label>
                        <span id="userJobCheckMsg"></span>
                    </div>
                 </li>
                 

                 <li class="user_li8">
                     <input id="explain" type="text" name="userJob_detail" autocomplete="off" value="${vo.userJob_detail}"
                    placeholder="학생이면 학교, 기업이면 기업에 대하여 입력해주세요.">
                      <span id="userjobdetailCheckMsg"></span>   
                 </li>
              </ul>
              
        <div id="bottom">
           <input id="modify" type="button" value="수정" >
           <button id="cancel" type="button">취소</button>
        </div>
         </form>
         </div>
     </div>
     <div id="sec2_3"></div>
  </div>
  <div class="sec3"></div>
</section>
<footer id="modifyInfo_ft">


</footer>
</div>
</body>
</html>