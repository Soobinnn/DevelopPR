<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resumeRegist">
<head>
<title>이력서 등록</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<script type="text/javascript" src="jquery-2.2.3.min.js"></script>
<script type="text/javascript">	
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
	    	$('#uploadImg').attr("value", data);
        }
	});
}

function fn_modifyImage() {
	var w = window.open("../imageEditor", "", "width=800,height=650,top=0px,left=200px,status=,resizable=false,scrollbars=no");
}

function fn_removeImage() {
	$('#uploadImage').removeAttr("src");
	$('#imageEditor').css('display', 'none');
}

	function add_item(){
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.classList.add( 'tech' );
		div.innerHTML = document.getElementById('pre_set').innerHTML;
		document.getElementById('techs').appendChild(div);
	}

	function remove_item(obj){
		// obj.parentNode 를 이용하여 삭제
		document.getElementById('techs').removeChild(obj.parentNode);
	}
</script>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
</head>
<body>
<form name="form1" method="post" action="${path}/resume/registConfirm">
    <div class="container">
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">이력서 등록</div>
               <div class="c">"~~~~~~~~~~~~~~~~~~"</div>
            </div>
            <div id="img">
	            <div style="min-height: 260px">
					<img id="uploadImage" />
					<input type="hidden" id= "uploadImg" name="profile_photo"/>
					
				</div>
				<div id="upload_button" style="text-align:center; margin-top: 5px;">
					<a href="javascript:fn_uploadImage('')" class="btn sty13">Load Image</a>
					<div id="imageEditor" style="display:none;">
						<a href="javascript:fn_modifyImage('');" class="btn sty13">Image Editor</a>
						<a href="javascript:fn_removeImage('');" class="btn sty13">Delete</a>
					</div>	
					<input type="file" id="uploadImageFile" onchange="uploadImageFileChange()" style="display:none"/>
				</div>
            </div>
             
        </header>
        <div id="pill">* 는 필수 입력 사항입니다.</div>
    
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
                                <input type="radio" name="is_work" value="0"/>구직중
                                <input type="radio" name="is_work" value="1"/>재직중
                            </div>
                        </div>
                    </div>
                        
                        <div id="p_name">
                            <div class="name" >
                       		     이 름 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="name" placeholder="이름을 입력해주세요.(2~20자)"/>
                            </div>
                        </div>
                        
                         <div id="p_name">
                            <div class="name" >
                       		    나 이 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="age" placeholder="숫자로 입력해주세요."/>
                            </div>
                        </div>

                        <div id="birth">
                            <div class="name">
                            생 일 * 
                            </div>
                            <div class="birth_info">
                                <input type="date" name="birthday" />
                            </div>
                        </div>

                        <div id="phone">
                            <div class="name">
                                핸드폰번호 *
                            </div>
                            <div class="phone_info">
                                <input type="text" placeholder="010123456578 형태로 적어주세요." name="cell_num" class="textshort"/>
                                <input type="radio" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen"/>공개
                                <input type="radio" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose"/>비공개
                            </div>
                        </div>

                        <div id="email">
                            <div class="name">
                                이메일 * 
                            </div>
                            <div class="email_info">
                                <input type="text" name="email" placeholder="9~50자 제한" class="textshort"/>
                                <input type="radio" name="email_is_open" value="1"/>공개
                                <input type="radio" name="email_is_open" value="0"/>비공개
                            </div>
                        </div>

                        <div id="blog">
                            <div class="name">
                       			     블로그
                            </div>
                            <div class="info">
                                <input type="text" name="blog" placeholder="정규표현식 추가" class="textlong"/>
                            </div>
                        </div>

                        <div id="address">
                            <div class="name">
                            주소 *
                            </div>
                            <div class="info">
                                    <input type="text" name="address" placeholder="정규표현식 추가" class="textshort"/>
                                <input type="radio" name="address_is_open" value="1"/>공개
                                <input type="radio" name="address_is_open" value="0"/>비공개
                            </div>
                        </div>

                        <div id="hopeaddress">
                            <div class="name">
                            희망 근무지
                            </div>
                            <div class="info">
                                <input type="text" name="prefer_place" class="textlong"/>
                            </div>
                        </div>

                        <div id="comment">
                            <div class="name">
                            소개/ 좌우명/ Comment
                            </div>
                            <div class="info">
                                <input type="text" class="textlong" name="motto"/>
                            </div>
                        </div>
           </div>

           
           <div class="information">
               
               
     
               <div class="acq">
                   <div class="subject">자격정보</div>
                   <div class="acq_ok">
                       <input type="text" class="textmiddle1" id="acq_date" placeholder="자격증 취득 날짜"/>
                       <input type="text" class="textmiddle2" id="acq_name" placeholder="자격증 이름"/>
                       <input type="button" id="info_button" value="+"/><br/>
                       <div class="ajax">
	                       <div id="date"></div>
	                       <div id="name"></div>
                       </div>
                       <input type="hidden" id="real_acq_date" name="acq_date" value=""/>
                       <input type="hidden" id="real_acq_name" name="acq_name" value=""/>
                       <script type="text/javascript">
                       		        var name="";
                       		        var date="";
                    
                       		$(document).ready(function () {
                       		    $('#info_button').on('click', function () {
                       		        // property를 설정한다.
                       		        $.ajax({
                       		            url : "list.jsp",
                       		            type : "get",
                       		            data : document.getElementById("acq_date").value,
                       		            success : function () {
                       		            	$("#date").append($("<div class='infodate'>").text(document.getElementById("acq_date").value));
                       		 
                       		            	$("#name").append($("<div class='infoname'>").text(document.getElementById("acq_name").value));
                       		            	
                       		            } ,
                       		            error : function () {
                       		            	$("#date").append($("<div class='infodate'>").text(document.getElementById("acq_date").value));
                       		      
                       		            	$("#name").append($("<div class='infoname'>").text(document.getElementById("acq_name").value));
                       		 		
                       		            } 
                       		            
                       		        });
                       		     	date+=document.getElementById("acq_date").value + ",";
                       		     	name+=document.getElementById("acq_name").value + ",";
                       		     	document.getElementById("real_acq_date").value=date;
                       		  		document.getElementById("real_acq_name").value=name;
                    		     	
                       		    })
                       		});
                  
                       </script>
                       
                    </div>
                </div>
                
                
                
                <div class="edu">
                    <div class="subject">학력/교육 정보</div>
                    <div class="edu_ok">
                       <input type="text" class="textmiddle1" id="edu_date" placeholder="자격증 취득 날짜"/>
                       <input type="text" class="textmiddle2" id="edu_name" placeholder="자격증 이름"/>
                       <input type="button" id="info_button2" value="+"/><br/>
                       <div class="ajax">
	                       <div id="date2"></div>
	                       <div id="name2"></div>
                       </div>
	                       <input type="hidden" id="real_edu_date" name="gradu_year" value=""/>
	                       <input type="hidden" id="real_edu_name" name="edu_info" value=""/>
	               
                       <script type="text/javascript">
                       		        var name2="";
                       		        var date2="";
                    
                       		$(document).ready(function () {
                       		    $('#info_button2').on('click', function () {
                       		        // property를 설정한다.
                       		        $.ajax({
                       		            url : "list.jsp",
                       		            type : "get",
                       		            data : document.getElementById("acq_date").value,
                       		            success : function () {
                       		            	$("#date2").append($("<div class='infodate'>").text(document.getElementById("edu_date").value));
                       		 
                       		            	$("#name2").append($("<div class='infoname'>").text(document.getElementById("edu_name").value));
                       		            
                       		            } ,
                       		            error : function () {
                       		            	$("#date2").append($("<div class='infodate'>").text(document.getElementById("edu_date").value));
                       		      
                       		            	$("#name2").append($("<div class='infoname'>").text(document.getElementById("edu_name").value));
                       		 		
                       		            } 
                       		            
                       		        });
                       		     	date2+=document.getElementById("edu_date").value + ",";
                       		     	name2+=document.getElementById("edu_name").value + ",";
                       		     	document.getElementById("real_edu_date").value=date2;
                       		  		document.getElementById("real_edu_name").value=name2;
                    		     	
                       		    })
                       		});
                  
                       </script>
                       
                    </div>
                    
                    
                </div>
                
                
                <div class="career">
                    <div class="subject">경력 정보</div>
                    <div class="career_ok">
                       <input type="text" class="textmiddle1" id="career_date" placeholder="자격증 취득 날짜"/>
                       <input type="text" class="textmiddle2" id="career_name" placeholder="자격증 이름"/>
                       <input type="button" id="info_button3" value="+"/><br/>
                       <div class="ajax">
	                       <div id="date3"></div>
	                       <div id="name3"></div>
                       </div>
                       
                       <input type="hidden" id="real_career_date" name="career_year" value=""/>
                       <input type="hidden" id="real_career_name" name="career_info" value=""/>
                       <script type="text/javascript">
                       		        var name3="";
                       		        var date3="";
                    
                       		$(document).ready(function () {
                       		    $('#info_button3').on('click', function () {
                       		        // property를 설정한다.
                       		        $.ajax({
                       		            url : "list.jsp",
                       		            type : "get",
                       		            data : document.getElementById("career_date").value,
                       		            success : function () {
                       		            	$("#date3").append($("<div class='infodate'>").text(document.getElementById("career_date").value));
                       		 
                       		            	$("#name3").append($("<div class='infoname'>").text(document.getElementById("career_name").value));
                       		            
                       		            } ,
                       		            error : function () {
                       		            	$("#date3").append($("<div class='infodate'>").text(document.getElementById("career_date").value));
                       		      
                       		            	$("#name3").append($("<div class='infoname'>").text(document.getElementById("career_name").value));
                       		 		
                       		            } 
                       		            
                       		        });
                       		     	date3+=document.getElementById("career_date").value + ",";
                       		     	name3+=document.getElementById("career_name").value + ",";
                       		     	document.getElementById("real_career_date").value=date3;
                       		  		document.getElementById("real_career_name").value=name3;
                    		     	
                       		    })
                       		});
                  
                       </script>
                       
                    </div>
                </div>
                
                
            </div>
        </div>
            
            <div class="skill">
                <div class="subject">Tech-stack
                 <input type="button" value=" 추가 " onclick="add_item()">추가 버튼을 눌러보세요.
                </div>
                <div id="techs">
					<div id="pre_set" style="display:none">
							<div>
						       <input type="text" class="abb" name="abb"/>
						    </div>
						    <div class="techinfo">
						       <input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
						       <input class="input-range" type="range" min="0" max="100" value="0" name="tech_percent"/>
						    </div>
						       <input type="button" value="삭제" class="removebutton" onclick="remove_item(this)">
					</div>
                </div>
            </div>
        
   </div>


   <div id="button">
       <div class="holl"></div>
        <input type="button" class="button1" value="취소"/>
        <input type="submit" class="button2" value="등록하기"/>
        <div class="holl"></div>
    </div>
</form>
</body>
</html>