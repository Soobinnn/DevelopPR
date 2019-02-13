<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이력서 수정</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">	
window.onload = function() {
	  var input = document.getElementById("hash").focus();
}
$(function(){
$('#hash').blur(function(){
	$('#comment').css('display', 'none');
	$('#hash').css('border','none');
})
$('#hash').focus(function(){
	$('#comment').css('display','inline-block');
	$('#hash').css('border','solid 2px #585858');
	
})
})

function fn_uploadImage() 
{
	$("#uploadImageFile").click();
}

function uploadImageFileChange() 
{
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
	var w = window.open("${path}/imageEditor", "", "width=800,height=650,top=0px,left=200px,status=,resizable=false,scrollbars=no");
}

function fn_removeImage() {
	$('#uploadImage').attr("src", "/DevelopPR/resources/resume/person.png");
	$('#imageEditor').css('display', 'none');
	$('#LoadImage').css('display', 'inline-block');
}

	function add_item(){
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.classList.add( 'tech' );
		div.innerHTML = document.getElementById('pre_set').innerHTML;
		document.getElementById('techs').appendChild(div);
		 var rangeSlider = function(){
	    	  var slider = $('.tech'),
	    	      range = $('.input-range'),
	    	      value = $('.value');
	    	    
	    	  slider.each(function(){

	    	    range.on('input', function(){
	    	      $(this).next(value).html(this.value);
	    	    });
	    	  });
	    	};

	    	rangeSlider();
	}

	function remove_item(obj){
		// obj.parentNode 를 이용하여 삭제
		document.getElementById('techs').removeChild(obj.parentNode);
	}
	
	
	$(document).ready(function () {
		$('.color').click(function () {
			var color = $('input[name="color"]:checked').val();
			var param = "color="+color;
			 $.ajax({
			        async : true,
			        type :'POST',
			        data : param,
			        url : '${path}/resume/background',
			        success : function(data)
			        {
			        	console.log("success:"+data);
			        	$(".header").attr("src", data);
			        }
			    })
		})
	})
	
	function checks(){
		
		if($('#userPhone').val() =="")
		{
		    alert("휴대폰번호를 입력해주세요.");
		    $("#userPhone").focus();
		    return false;
		}
		if($('#age').val() =="")
		{
		    alert("나이를 입력해주세요.");
		    $("#userage").focus();
		    return false;
		}
		if($('#date').val() =="")
		{
		    alert("생일을 입력해주세요.");
		    $("#date").focus();
		    return false;
		}
		if($('#address2').val() =="")
		{
		    alert("주소를 입력해주세요.");
		    $("#address2").focus();
		    return false;
		}
		if($('#commentss').val() =="")
		{
		    alert("comment를 입력해주세요.");
		    $("#commentss").focus();
		    return false;
		}
	}
	$(function(){
		$('#userPhone').blur(function()
		{
				    // 핸드폰 숫자형식 9~11자
				    var userPhoneCheck = /^[0-9]{9,11}$/;
				    if(!userPhoneCheck.test($('#userPhone').val()))
				    {
				        $('#userPhone').css({"border" :"2px solid red","background-color":"#FFCECE"});
				        $('#phoneCheckMsg').text('휴대폰번호 형식에 맞게 입력해주세요.').css("color","red");
			
				    }
				    else
				    {
				        $('#userPhone').css({"border" :"2px solid green","background-color":"white"});
				        $('#phoneCheckMsg').text('').css("color","green");
			
				    }
		});
		$('#commentss').blur(function()
				{
						    var userCCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{0,1000}$/;
						    if(!userCCheck.test($('#commentss').val()))
						    {
						        $('#commentss').css({"border" :"2px solid red","background-color":"#FFCECE"});
						        $('#CCheckMsg').text('1~1000자로 작성해주세요.').css("color","red");
					
						    }
						    else
						    {
						        $('#commentss').css({"border" :"2px solid green","background-color":"white"});
						        $('#CCheckMsg').text('').css("color","green");
					
						    }
				});
	});

</script>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
<div class="resumeRegist">
<form name="form1" method="post" action="${path}/resume/registConfirm" onsubmit="return checks();">
    <div class="container">
			<img src="/DevelopPR/resources/resume/black.jpg" class="header"/>
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">이력서 등록</div>
            </div>
            <div id="img">
	            <div style="min-height: 260px">
					<img id="uploadImage" src="/DevelopPR/resources/resume/person.png"/>
					<input type="hidden" id= "uploadImg" name="profile_photo"/>
					
				</div>
				<div id="upload_button" style="text-align:center; margin-top: 5px;">
					<div id="LoadImage">
						<a href="javascript:fn_uploadImage('')" class="btn sty13">이력서 사진 변경</a>
					</div>
					<div id="imageEditor" style="display:none;">
						<a href="javascript:fn_modifyImage('');" class="btn sty13">사진 수정</a>
						<a href="javascript:fn_removeImage('');" class="btn sty13">사진 삭제</a>
					</div>	
					<input type="file" id="uploadImageFile" onchange="uploadImageFileChange()" style="display:none"/>
				</div>
            </div>
             
        </header>
        	<div id="comments">
	        	<div id="comment">Comment</div>
	        	<input type="text" name="motto" class="hash" id="hash" value="${dto.motto}"/>
	        </div>
        <div class="colors">
          <div id="HeadBack">헤더 배경 선택</div>
           	<div class="a">
	           			<input type="radio" id="r01" name="color" class="color" value="black"/>
	                    <label for="r01" class="la5"><p class="p_label">Black</p></label>
	                    <input type="radio" id="r02" name="color" class="color" value="bluewhite"/>
	                    <label for="r02" class="la1"><p class="p_label">BlueWhite</p></label>
		           		<input type="radio" id="r03" name="color" class="color" value="brown"/>
		           		<label for="r03" class="la5"><p class="p_label">Brown</p></label>
	           		</div>
	           		
	           		<div class="b">
	           		<input type="radio" id="r04" name="color" class="color" value="colorful"/>
	           		 <label for="r04" class="la1"><p class="p_label">Colorful1</p></label>
	           		<input type="radio" id="r05" name="color" class="color" value="colorful2"/>
	           		 <label for="r05" class="la1"><p class="p_label">Colorful2</p></label>
	           		<input type="radio" id="r06" name="color" class="color" value="gray"/>
	           		 <label for="r06" class="la4"><p class="p_label">Gray</p></label>
	           		</div>
	           		
	           		<div class="c">
	           		<input type="radio" id="r07" name="color" class="color" value="green"/>
	           		 <label for="r07" class="la5"><p class="p_label">Green</p></label>
	           		<input type="radio" id="r08" name="color" class="color" value="mint"/>
	           		 <label for="r08" class="la4"><p class="p_label">Mint</p></label>
	           		<input type="radio" id="r09" name="color" class="color" value="pink"/>
	           		 <label for="r09" class="la4"><p class="p_label">Pink</p></label>
					</div>
					
	           		<div class="d">
	           		<input type="radio" id="r10" name="color" class="color" value="purple"/>
	           		 <label for="r10" class="la6"><p class="p_label">Purple</p></label>
	           		<input type="radio" id="r11" name="color" class="color" value="white"/>
	           		 <label for="r11" class="la5"><p class="p_label">White</p></label>
	           		<input type="radio" id="r12" name="color" class="color" value="yellow"/>
	           		 <label for="r12" class="la6"><p class="p_label">Yellow</p></label>
	           		</div>
           	</div>
        <div id="pills">
        	<div id="danger">주의사항</div>
	        <div class="pill">1. * 는 필수 입력 사항입니다.</div>
	        <div class="pill">2. <input type="button" class="plus" value="+"> 를 누르면 해당 정보를 추가 기입 할 수 있습니다.</div>
	    	<div class="pill">3. 자격증, 학력/교육, 경력, tech-stack 정보 기입 시 빈 칸이라면 <input type="button" class="x" value="X"> 를 추천합니다.</div>
	    </div>
        <div class="main">
            <div class="detail">
                    <div class="subject">
                        상세 정보
                    </div>
                    <div class="content">
                        <div class="state">             
                            <div class="name">
                                현재 구직 상태 *
                            </div> 
                            <div class="s_info">
                              <c:if test="${dto.is_work==0}">
                                <input type="radio" id="r1" name="is_work" value="0" checked/>
                                <label for="r1" class="la2"><p class="p_label">구직중 </p></label>
                            	<input type="radio" id="r2"  name="is_work" value="1"/>
 								<label for="r2" class="la2"><p class="p_label">재직중 </p></label>
                              </c:if>
                              <c:if test="${dto.is_work==1}">
                                <input type="radio" id="r1" name="is_work" value="0"/>
                                <label for="r1" class="la2"><p class="p_label">구직중 </p></label>
                            	<input type="radio" id="r2"  name="is_work" value="1" checked/>
 								<label for="r2" class="la2"><p class="p_label">재직중 </p></label>                              </c:if>
                            </div>
                        </div>
                    </div>
                        
                        <div id="p_name">
                            <div class="name" >
                       		     이 름 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="name" value="${dto.name}" placeholder="이름을 입력해주세요.(2~20자)"/>
                            </div>
                        </div>
                        
                         <div id="p_age">
                            <div class="name" >
                       		    나 이 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="age" value="${dto.age}" placeholder="숫자로 입력해주세요."/>
                            </div>
                              <span id="ageCheckMsg"></span>
                        </div>

                        <div id="birth">
                            <div class="name">
                            생 일 * 
                            </div>
                            <div class="birth_info">
                                <input type="date" id="date" value="${dto.birthday}" name="birthday" />
                            </div>
                        </div>

                        <div id="phone">
                            <div class="name">
                              휴대폰번호 *
                            </div>
                            <div class="phone_info">
                            <input id="userPhone" type="text" autocomplete="off" value="${dto.cell_num}" placeholder="ex) 01012345678" name="cell_num" class="textshort">
                           	<c:if test="${dto.cnum_is_open==0}">
                                <input type="radio" id="pr1" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen"/>
                                <label for="pr1" class="la" ><p class="p_label">공개 </p></label>
                                <input type="radio" id="pr2" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose" checked/>
                                <label for="pr2" class="la" ><p class="p_label">비공개 </p></label>
                       
                            </c:if>
                          	<c:if test="${dto.cnum_is_open==1}">
                                 <input type="radio" id="pr1" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen" checked/>
                                <label for="pr1" class="la" ><p class="p_label">공개 </p></label>
                                <input type="radio" id="pr2" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose"/>
                                <label for="pr2" class="la" ><p class="p_label">비공개 </p></label>
                            </c:if>
                            <br/> <span id="phoneCheckMsg"></span>
                            </div>
                        </div>

                        <div id="email">
                            <div class="name">
                           		     이메일 * 
                            </div>
                            <div class="email_info">
                                <div class="textshort">${dto.email}</div>
                                <input type="hidden" value="${dto.email}" name="email"/>
                              	<c:if test="${dto.email_is_open==0}">
	                                <input type="radio" name="email_is_open" id="er1" value="1"/>
	                                <label for="er1" class="la"><p class="p_label">공개 </p></label>
	                                <input type="radio" name="email_is_open" id="er2" value="0" checked/>
	                                <label for="er2" class="la"><p class="p_label">비공개 </p></label>
	                            </c:if>
	                            <c:if test="${dto.email_is_open==1}">
	                                <input type="radio" name="email_is_open" id="er1" value="1" checked/>
	                                <label for="er1" class="la"><p class="p_label">공개 </p></label>
	                                <input type="radio" name="email_is_open" id="er2" value="0"/>
	                                <label for="er2" class="la"><p class="p_label">비공개 </p></label>
	                            </c:if>
	                            </div>
                        </div>

                        <div id="blog">
                            <div class="name">
                       			     블로그
                            </div>
                            <div class="info">
                                <input type="text" name="blog" placeholder="" value="${dto.blog}" class="textlong"/>
                            </div>
                        </div>

                        <div id="address">
                            <div class="name">
                         		   주소 *
                            </div>
                            <div class="info">
                                    <input type="text" name="address" placeholder="정규표현식 추가" value="${dto.address}" class="textshort"/>
                                    
                                	<c:if test="${dto.address_is_open==0}">    
		                                <input type="radio" id="ar1" name="address_is_open" value="1"/>
		                                	<label for="ar1" class="la"><p class="p_label">공개 </p></label>
		                                <input type="radio" id="ar2" name="address_is_open" value="0" checked/>
		                                	<label for="ar2" class="la"><p class="p_label">공개 </p></label>
		                            </c:if>
		                            <c:if test="${dto.address_is_open==1}">    
		                          		<input type="radio" id="ar1" name="address_is_open" value="1" checked/>
		                                	<label for="ar1" class="la"><p class="p_label">공개 </p></label>
		                                <input type="radio" id="ar2" name="address_is_open" value="0"/>
		                                	<label for="ar2" class="la"><p class="p_label">공개 </p></label>
		                            </c:if>
		                            
                            </div>
                        </div>

                        <div id="hopeaddress">
                            <div class="name">
                            희망 근무지
                            </div>
                            <div class="info">
                                <input type="text" name="prefer_place" value="${dto.prefer_place}" class="textlong"/>
                            </div>
                        </div>

           </div>

           
           <div class="information">
               
               
     
               <div class="acqall">
	               <div class="subject">자격 정보 <input type="button" value=" + " class="plus" onclick="add_acqitem()"></div>
	                    <div class="acq_ok">
	                       <div id="acqs">
	                   			<script type="text/javascript">
		      
		                        	 var acq_date = "${dto.acq_date}";      
		 							 var dateSplit = acq_date.split(',');
		 							
		 							 var acq_name = "${dto.acq_name}";      
									 var nameSplit = acq_name.split(',');
									
		 							for (var i in dateSplit){
										 document.write('<div class="acq">'+
												 '<input type="text" class="textmiddle1" id="acq_date" value="'+dateSplit[i]+'" name="acq_date" placeholder="자격증 취득 날짜"/>'+
												 '<input type="text" class="textmiddle2" id="acq_name" value="'+nameSplit[i]+'" name="acq_name" placeholder="자격증 이름"/>'+
							                     '<input type="button" class="x" value="X" onclick="remove_acqitem(this)"/></div>'); 
									 }
	                          </script>
                          </div>
                          
		                       <script type="text/javascript">
				                       function add_acqitem(){
					                   		var div = document.createElement('div');
					                   		div.classList.add( 'acq' );
					                   		div.innerHTML = document.getElementById('acq').innerHTML;
					                   		document.getElementById('acqs').appendChild(div);
					                   	}
					                   	function remove_acqitem(obj){
					                   		document.getElementById('acqs').removeChild(obj.parentNode);
					                   	}
		                       </script>
                       
                    	</div>
                </div>
                
                
                
                <div class="eduall">
                    <div class="subject">학력/교육 정보 <input type="button" value=" + " class="plus" onclick="add_eduitem()"></div>
                    <div class="edu_ok">
                       <div id="edus">
	                       
							 <script type="text/javascript">
                      
                        	 var gradu_date = "${dto.gradu_year}";      
 							 var gdateSplit = gradu_date.split(',');
 							
 							 var edu_name = "${dto.edu_info}";      
							 var enameSplit = edu_name.split(',');
							
 							for (var i in gdateSplit){
								 document.write('<div class="edu"><input type="text" class="textmiddle1" id="edu_date" value="'+ gdateSplit[i] +'" name="gradu_year" placeholder="학력/교육 해당 년도"/>'+
										 		'<input type="text" class="textmiddle2" id="edu_name" value="'+ enameSplit[i]+ '" name="edu_info" placeholder="학력/교육 이름"/>'+
						                        '<input type="button"  class="x" value="X" onclick="remove_eduitem(this)"/></div>'); 
							 }
                          </script> 
							
                       </div>
                       
                       
                       
                       <script type="text/javascript">
			                   	function add_eduitem(){
			                   		var div = document.createElement('div');
			                   		div.classList.add( 'edu' );
			                   		div.innerHTML = document.getElementById('edu').innerHTML;
			                   		document.getElementById('edus').appendChild(div);
			                   	}
			                   	function remove_eduitem(obj){
			                   		document.getElementById('edus').removeChild(obj.parentNode);
			                   	}
                       </script>
                    </div>
                </div>
                
                
                <div class="careerall">
                    <div class="subject">경력 정보 <input type="button" value=" + " class="plus" onclick="add_caritem()"></div>
                    <div class="career_ok">
                    
                       <div id="careers">
                       		   <script type="text/javascript">
                      
	                        	 var c_date = "${dto.career_year}";      
	 							 var cdateSplit = c_date.split(',');
	 							
	 							 var c_name = "${dto.career_info}";      
								 var cnameSplit = c_name.split(',');
								
	 							for (var i in cdateSplit){
									 document.write('<div class="career">'+
											 '<input type="text" class="textmiddle1" id="career_date" value="' + cdateSplit[i] +'" name="career_year" placeholder="경력 해당 년도"/>'+
											 '<input type="text" class="textmiddle2" id="career_name" value="'+ cnameSplit[i]+ '" name="career_info" placeholder="회사 이름"/>'+
							                 '<input type="button" value="X" class="x" onclick="remove_caritem(this)"/></div>'); 
								 }
	                          </script>   
                       </div>
                       
                       <script type="text/javascript">
			                   	function add_caritem(){
			                   		// pre_set 에 있는 내용을 읽어와서 처리..
			                   		var div = document.createElement('div');
			                   		div.classList.add( 'career' );
			                   		div.innerHTML = document.getElementById('career').innerHTML;
			                   		document.getElementById('careers').appendChild(div);
			                   	}
			                   	function remove_caritem(obj){
			                   		// obj.parentNode 를 이용하여 삭제
			                   		document.getElementById('careers').removeChild(obj.parentNode);
			                   	}
                       </script>
                    </div>
                </div>
            </div>
        </div>
            
            <div class="skill">
                <div class="subject">Tech-stack 
					<input type="button" value=" + " class="plus" onclick="add_item()">
                </div>
                <div id="techs">
	              
					    <script type="text/javascript">
						 
							 var abb = "${dto.abb}";      
							 var abbSplit = abb.split(',');
							 
							 var tech_name = "${dto.tech_name}";
							 var nameSplit = tech_name.split(',');
							 
							 var tech_percent = "${dto.tech_percent}";
							 var percentSplit = tech_percent.split(',');
							 
							for (var i=0; i<abbSplit.length;i++){
										 		'<input type="text" placeholder="기술약자" value="'+abbSplit[i]+'" class="abb" name="abb"/>'+
												'<input type="text" class="techname" placeholder="기술 명" value="'+nameSplit[i]+'" name="tech_name"><br/>'+
												'<input class="input-range" type="range" min="0" step="5" max="100" value="'+percentSplit[i]+'" name="tech_percent"/>'+
												'<div class="value">'+percentSplit[i]+'</div><br/><input type="button" class="x" value="X" onclick="remove_item(this)">';
							}; 
						    
								    var rangeSlider = function(){
								    	  var slider = $('.tech'),
								    	      range = $('.input-range'),
								    	      value = $('.value');
								    	    
								    	  slider.each(function(){

								    	    value.each(function(){
								    	      var value = $(this).prev().attr('value');
								    	      $(this).html(value);
								    	    });

								    	    range.on('input', function(){
								    	      $(this).next(value).html(this.value);
								    	    });
								    	  });
								    	};

								    	rangeSlider();
							 </script>
					
					
                </div>
            </div>
        
   </div>


   <div id="button">
       <div class="holl"></div>
        <input type="button" class="button1" value="취소" onclick="history.back()"/>
        <input type="submit" class="button2" value="등록하기"/>
        <div class="holl"></div>
    </div>

					<div id="pre_set" style="display:none">
							<input type="text" placeholder="기술약자" class="abb" name="abb"/>
							<input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
							<input class="input-range" type="range" min="0" step="5" max="100" value="0" name="tech_percent"/>
							 <div class="value">0</div>
							<br/>
							<input type="button" class="x" value="X" onclick="remove_item(this)">			
					</div>
					
					<div id="career" style="display:none">
	                       <input type="text" class="textmiddle1" id="career_date" name="career_year" placeholder="경력 해당 년도"/>
	                       <input type="text" class="textmiddle2" id="career_name" name="career_info" placeholder="회사 이름"/>
	                       <input type="button" class="x" value="X" onclick="remove_caritem(this)"/>
	                </div>
					
					<div id="edu" style="display:none">
                       <input type="text" class="textmiddle1" id="edu_date" name="gradu_year" placeholder="학력/교육 해당 년도"/>
                       <input type="text" class="textmiddle2" id="edu_name" name="edu_info" placeholder="학력/교육 이름"/>
                       <input type="button" class="x" value="X" onclick="remove_eduitem(this)"/>
					</div>
					
					<div id="acq" style="display:none">
                       <input type="text" class="textmiddle1" id="acq_date" name="acq_date" placeholder="자격증 취득 날짜"/>
                       <input type="text" class="textmiddle2" id="acq_name" name="acq_name" placeholder="자격증 이름"/>
                        <input type="button" class="x" value="X" onclick="remove_acqitem(this)"/>
                   	</div>
</form>
</div>
</body>
</html>