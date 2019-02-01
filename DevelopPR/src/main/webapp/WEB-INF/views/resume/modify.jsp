<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resumeRegist">
<head>
<title>이력서 수정</title>
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
<form name="form1" method="post" action="${path}/resume/modifyupdate">
    <div class="container">
        <header>
            <div class="head">
               <div class="a">DevelopPR</div>
               <div class="b">이력서 수정</div>
               <div class="c">"~~~~~~~~~~~~~~~~~~"</div>
            </div>
            <div id="img">
	            <div style="min-height: 260px">
					<img id="uploadImage" src='<c:url value="/resources/photo/${dto.profile_photo}"/>'/>
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
        <div id="pills">
	        <div class="pill">1. * 는 필수 입력 사항입니다.</div>
	        <div class="pill">2. <input type="button" value="+">을 누르면 해당 정보를 추가 기입 할 수 있습니다.</div>
	    	<div class="pill">3. 자격증, 학력/교육, 경력, tech-stack 정보 기입 시 빈 칸이라면 <input type="button" value="삭제">를 추천합니다.</div>
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
                                <input type="radio" name="is_work" value="0" checked/>구직중
                            	<input type="radio" name="is_work" value="1"/>재직중    
                              </c:if>
                              <c:if test="${dto.is_work==1}">
	                              <input type="radio" name="is_work" value="0"/>구직중
	                              <input type="radio" name="is_work" value="1" checked/>재직중
                              </c:if>
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
                        
                         <div id="p_name">
                            <div class="name" >
                       		    나 이 *
                            </div>
                            <div class="p_info">
                                <input type="text" class="textlong" name="age" value="${dto.age}" placeholder="숫자로 입력해주세요."/>
                            </div>
                        </div>

                        <div id="birth">
                            <div class="name">
                            생 일 * 
                            </div>
                            <div class="birth_info">
                                <input type="date" value="${dto.birthday}" name="birthday" />
                            </div>
                        </div>

                        <div id="phone">
                            <div class="name">
                                핸드폰번호 *
                            </div>
                            <div class="phone_info">
                                <input type="text" placeholder="010123456578 형태로 적어주세요." name="cell_num" value="${dto.cell_num}" class="textshort"/>
                           
                           	<c:if test="${dto.cnum_is_open==0}">
                                <input type="radio" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen"/>공개
                                <input type="radio" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose" checked/>비공개
                            </c:if>
                          	<c:if test="${dto.cnum_is_open==1}">
                                <input type="radio" name="cnum_is_open" value="1" class="phone_radio" value="phoneopen" checked/>공개
                                <input type="radio" name="cnum_is_open" value="0" class="phone_radio" value="phoneclose"/>비공개
                            </c:if>
                            
                            </div>
                        </div>

                        <div id="email">
                            <div class="name">
                                이메일 * 
                            </div>
                            <div class="email_info" style="display:flex;">
                                <div class="textshort">${dto.email}</div>
                                <input type="hidden" value="${dto.email}" name="email"/>
                                <div style="padding-top:20px">
                              	<c:if test="${dto.email_is_open==0}">
	                                <input type="radio" name="email_is_open" value="1"/>공개
	                                <input type="radio" name="email_is_open" value="0" checked/>비공개
	                            </c:if>
	                            <c:if test="${dto.email_is_open==1}">
	                                <input type="radio" name="email_is_open" value="1" checked/>공개
	                                <input type="radio" name="email_is_open" value="0"/>비공개
	                            </c:if>
	                            </div>
                            </div>
                        </div>

                        <div id="blog">
                            <div class="name">
                       			     블로그
                            </div>
                            <div class="info">
                                <input type="text" name="blog" placeholder="정규표현식 추가" value="${dto.blog}" class="textlong"/>
                            </div>
                        </div>

                        <div id="address">
                            <div class="name">
                            주소 *
                            </div>
                            <div class="info">
                                    <input type="text" name="address" placeholder="정규표현식 추가" value="${dto.address}" class="textshort"/>
                                    
                                	<c:if test="${dto.address_is_open==0}">    
		                                <input type="radio" name="address_is_open" value="1"/>공개
		                                <input type="radio" name="address_is_open" value="0" checked/>비공개
		                            </c:if>
		                            <c:if test="${dto.address_is_open==1}">    
		                                <input type="radio" name="address_is_open" value="1" checked/>공개
		                                <input type="radio" name="address_is_open" value="0"/>비공개
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

                        <div id="comment">
                            <div class="name">
                            소개/ 좌우명/ Comment
                            </div>
                            <div class="info">
                                <input type="text" class="textlong" value="${dto.motto}" name="motto"/>
                            </div>
                        </div>
           </div>

           
           <div class="information">
               
               
     
               <div class="acq">
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
							                     '<input type="button" value="삭제" onclick="remove_acqitem(this)"/></div>'); 
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
                
                
                
                <div class="edu">
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
						                        '<input type="button" value="삭제" onclick="remove_eduitem(this)"/></div>'); 
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
                
                
                <div class="career">
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
							                 '<input type="button" value="삭제" onclick="remove_caritem(this)"/></div>'); 
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
								 document.write('<div class="tech"><div><input type="text" class="abb" value="'+abbSplit[i]+'" name="abb"/></div>'+
										 		'<div class="techinfo"><input type="text" class="techname" value="'+nameSplit[i]+ '" placeholder="기술 명" name="tech_name"/><br/>'+
												'<input class="input-range" type="range" value="'+ percentSplit[i] +'"min="0" max="100" value="0" name="tech_percent"/>'+
												'</div><input type="button" value="삭제" class="removebutton" onclick="remove_item(this)"></div>'); 
							}
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
							<div>
						       <input type="text" class="abb" name="abb"/>
						    </div>
						    <div class="techinfo">
						       <input type="text" class="techname" placeholder="기술 명" name="tech_name"><br/>
						       <input class="input-range" type="range" min="0" max="100" value="0" name="tech_percent"/>
						    </div>
						       <input type="button" value="삭제" class="removebutton" onclick="remove_item(this)">
					</div>
					
					<div id="career" style="display:none">
	                       <input type="text" class="textmiddle1" id="career_date" name="career_year" placeholder="경력 해당 년도"/>
	                       <input type="text" class="textmiddle2" id="career_name" name="career_info" placeholder="회사 이름"/>
	                       <input type="button" value="삭제" onclick="remove_caritem(this)"/>
	                </div>
					
					<div id="edu" style="display:none">
                       <input type="text" class="textmiddle1" id="edu_date" name="gradu_year" placeholder="학력/교육 해당 년도"/>
                       <input type="text" class="textmiddle2" id="edu_name" name="edu_info" placeholder="학력/교육 이름"/>
                       <input type="button" value="삭제" onclick="remove_eduitem(this)"/>
					</div>
					
					<div id="acq" style="display:none">
                       <input type="text" class="textmiddle1" id="acq_date" name="acq_date" placeholder="자격증 취득 날짜"/>
                       <input type="text" class="textmiddle2" id="acq_name" name="acq_name" placeholder="자격증 이름"/>
                        <input type="button" value="삭제" onclick="remove_acqitem(this)"/>
                   	</div>
</form>
</body>
</html>