<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resumeDetail">
<head>
<title>이력서 상세보기</title>
<%@ include file="../../views/include/tag_header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/resume/resume.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
window.onload = function (){
	if('${chkFollow}'=='1'){
		var f=document.getElementById('unfollow');
		f.style="opacity:1";
		var ff=document.getElementById('follow');
		ff.style="opacity:0";
	}
	if('${chkFollow}'=='0'){
		var f=document.getElementById('unfollow');
		f.style="opacity:0";
		var ff=document.getElementById('follow');
		ff.style="opacity:1";
	}
	if('${chkGood}'=='1'){
		var g=document.getElementById('ungood');
		g.style="opacity:1";
		var gg=document.getElementById('good');
		gg.style="opacity:0";
	}
	if('${chkGood}'=='0'){
		var g=document.getElementById('ungood');
		g.style="opacity:0";
		var gg=document.getElementById('good');
		gg.style="opacity:1";
	}
}
function follow()
{
   	var Email = '${dto.email}';
    console.log(Email);
	var param = "email="+Email;
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/resume/follow",
        success : function(data)
        {
        	console.log(data);
        	if(data=='1'){
        		var f=document.getElementById('unfollow');
        		f.style="opacity:1";
        		var ff=document.getElementById('follow');
        		ff.style="opacity:0";
        	}
        	if(data=='0'){
        		var f=document.getElementById('unfollow');
        		f.style="opacity:0";
        		var ff=document.getElementById('follow');
        		ff.style="opacity:1";
        	}
        }  
    })
}

function unfollow()
{
   	var Email = '${dto.email}';
    console.log(Email);
	var param = "email="+Email;
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/resume/unfollow",
        success : function(data)
        {
         	console.log(data);
        	if(data=='1'){
        		var f=document.getElementById('unfollow');
        		f.style="opacity:1";
        		var ff=document.getElementById('follow');
        		ff.style="opacity:0";
        	}
        	if(data=='0'){
        		var f=document.getElementById('unfollow');
        		f.style="opacity:0";
        		var ff=document.getElementById('follow');
        		ff.style="opacity:1";
        	}
        }
    })
}

function good()
{
   	var param = 'good_email='+'${dto.email}'+'&good_nick='+'${sessionScope.userNick}';
    console.log(param);
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/resume/good",
        success : function(data)
        {
        	console.log(data);
        	if(data=='1'){
        		var g=document.getElementById('ungood');
        		g.style="opacity:1";
        		var gg=document.getElementById('good');
        		gg.style="opacity:0";
        	}
        	if(data=='0'){
        		var g=document.getElementById('ungood');
        		g.style="opacity:0";
        		var gg=document.getElementById('good');
        		gg.style="opacity:1";
        	}
        }  
    })
}

function ungood()
{
   	var param = 'good_email='+'${dto.email}'+'&good_nick='+'${sessionScope.userNick}';
    console.log(param);
    $.ajax({
        async : true,
        type :'POST',
        data : param,
        url : "${path}/resume/ungood",
        success : function(data)
        {
         	console.log(data);
          	if(data=='1'){
        		var g=document.getElementById('ungood');
        		g.style="opacity:1";
        		var gg=document.getElementById('good');
        		gg.style="opacity:0";
        	}
        	if(data=='0'){
        		var g=document.getElementById('ungood');
        		g.style="opacity:0";
        		var gg=document.getElementById('good');
        		gg.style="opacity:1";
        	}
        }
    })
}
</script>
</head>
<body> 
<div class="container">
   <div class="head">
    	<img id="color" src='<c:url value="/resources/resume/${dto.color}.jpg"/>'/>
   </div>
    <div class="img">
        <div class="comment">${dto.motto}</div>
        <img src='<c:url value="/resources/photo/${dto.profile_photo}"/>'/>
        
        <div class="information">
            <div class="textshort1">
            	정보 공개 
            	
            </div>
            <div class="textshort1">
		       <c:if test="${dto.is_work==0}">구직중</c:if>
		       <c:if test="${dto.is_work==1}">재직중</c:if>
		       
	       	</div>
            <div class="textshort2">포트폴리오</div>
             
             
            <div id="unfollow" style="opacity:0">
               <!-- 팔로우가 되어 있다면 언팔로우, 언팔이면 팔로우 뜨게.. -->       
               	  <input type="hidden"  value="${dto.email}"> 
                  <input type="button" onclick="unfollow()" name="unfollow" value="언팔로우">
            </div>
            <div id="follow" style="opacity:0">      
            	  <input type="hidden" value="${dto.email}" > 
                  <input type="button" onclick="follow()" name="follow"  value="팔로우">
            </div>
            
            <div id="ungood" style="opacity:0">
               <!-- 팔로우가 되어 있다면 언팔로우, 언팔이면 팔로우 뜨게.. -->       
                  <input type="button" onclick="ungood()" name="ungood" value="좋아요 취소">
            </div>
            <div id="good" style="opacity:0">      
                  <input type="button" onclick="good()" name="good"  value="좋아요">
            </div>
            
        </div>
    </div>
    <div class="content">
    	<div class="up">
                <div class="left">
                        <div class="subject">상세정보</div>
                        <div class="detail">
                        
	                        <div class="state">             
	                            <div class="name">
	                               		 현재 구직 상태 
	                            </div> 
	                            <div class="textshort">
		                            <c:if test="${dto.is_work==0}">구직중</c:if>
		                            <c:if test="${dto.is_work==1}">재직중</c:if>
	                            </div>
	                        </div>
	                        
	                        <div class="p_name">
	                            <div class="name" >
	                           		 이 름 
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.name}</div>
	                            </div>
	                        </div>
	                        
	                          <div class="p_name">
	                            <div class="name" >
	                           		 나 이
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.age}</div>
	                            </div>
	                        </div>
	                        
	                          <div class="p_name">
	                            <div class="name" >
	                           		 생 일 
	                            </div>
	                            <div >
	                            	<div class="textshort">${dto.birthday}</div>
	                            </div>
	                        </div>
	                        
	                        
	                        
	                        <div id="phone">
	                            <div class="name">
	                               		 핸드폰번호 
	                            </div>
	                            <div class="phone_info">
	                            	<c:if test="${dto.cnum_is_open==0}">
	                            		<div class="textshort">비공개</div>
	                            	</c:if>
	                            	<c:if test="${dto.cnum_is_open==1}">	                            	
	                                	<div class="textshort">${dto.cell_num}</div>
	                        		</c:if>
	                            </div>
	                        </div>
	
	                        <div id="email">
	                            <div class="name">
	                               	 이메일 
	                            </div>
	                            <div class="email_info">
	                            	<c:if test="${dto.email_is_open==0}">
	                            		<div class="textshort">비공개</div>
	                            	</c:if>
	                            	<c:if test="${dto.email_is_open==1}">
	                                <div class="textshort">${dto.email}</div>
	                                </c:if>
	                            </div>
	                        </div>
	
	                        <div id="blog">
	                            <div class="name">
	                            	블로그
	                            </div>
	                            <div class="info">
	                               <div class="textshort">${dto.blog}</div>
	                            </div>
	                        </div>
	
	                        <div id="address">
	                            <div class="name">
	                            	주소
	                            </div>
	                            <div class="info">
	                            	<c:if test="${dto.address_is_open==0}">
	                            		<div class="textshort">비공개</div>
	                            	</c:if>
	                            	<c:if test="${dto.address_is_open==1}">
	                                   <div class="textshort">${dto.address}</div>
	                            	</c:if>
	                                 
	                            </div>
	                        </div>
	
	                        <div id="hopeaddress">
	                            <div class="name">
	                           		 희망 근무지
	                            </div>
	                            <div class="info">
	                                <div class="textshort">${dto.prefer_place}</div>
	                            </div>
	                        </div>
	
	                       
           
                	<div class="projects">
                        <div class="subject">프로젝트</div>
                          	<input type="button" id="p_button" value="프로젝트 추가"/>
                          	<div class="project">
                          		aa
                          	</div>
                    </div>
                    </div>
               </div>

                <div class="right">
                    <div class="certificate">
                        <div class="subject">자격 정보</div>
                       
         				<script type="text/javascript">
                      
                        	 var acq_date = "${dto.acq_date}";      
 							 var dateSplit = acq_date.split(',');
 							
 							 var acq_name = "${dto.acq_name}";      
							 var nameSplit = acq_name.split(',');
							
 							for (var i in dateSplit){
								 document.write('<div class="acq"><div class="acqdate">' + dateSplit[i] +'</div><div class="acqname">'+nameSplit[i]+ '</div></div>'); 
							 }
                          </script>
                    </div>

                    <div class="edu">
                        <div class="subject">학력/교육 사항</div>
                            <script type="text/javascript">
                      
                        	 var gradu_date = "${dto.gradu_year}";      
 							 var gdateSplit = gradu_date.split(',');
 							
 							 var edu_name = "${dto.edu_info}";      
							 var enameSplit = edu_name.split(',');
							
 							for (var i in gdateSplit){
								 document.write('<div class="acq"><div class="acqdate">' + gdateSplit[i] +'</div><div class="acqname">'+ enameSplit[i]+ '</div></div>'); 
							 }
                          </script> 
                    </div>

                    <div class="career">
                        <div class="subject">경력 사항</div>
                               <script type="text/javascript">
                      
	                        	 var c_date = "${dto.career_year}";      
	 							 var cdateSplit = c_date.split(',');
	 							
	 							 var c_name = "${dto.career_info}";      
								 var cnameSplit = c_name.split(',');
								
	 							for (var i in cdateSplit){
									 document.write('<div class="acq"><div class="acqdate">' + cdateSplit[i] +'</div><div class="acqname">'+ cnameSplit[i]+ '</div></div>'); 
								}
	                          </script>
                    </div>                
                </div>
       </div> 
            	<div class="tech-stack">
	                <div class="subject">Tech-stack
	              
	                </div>
	                 
	                <div class="techs">
		                  <script type="text/javascript">
						 
							 var abb = "${dto.abb}";      
							 var abbSplit = abb.split(',');
							 
							 var tech_name = "${dto.tech_name}";
							 var nameSplit = tech_name.split(',');
							 
							 var tech_percent = "${dto.tech_percent}";
							 var percentSplit = tech_percent.split(',');
							 
							for (var i=0; i<abbSplit.length-1;i++){
								 document.write('<div class="tech"><div class="abb">' + abbSplit[i] + '</div><div class="techinfo"><div class="tech_name">'+nameSplit[i]+ '</div>'
						       		   + '<input class="input-range" type="range" value="'+ percentSplit[i] +'" readonly/>'
						       		   + percentSplit[i] + '</div></div>'); 
							}
							 </script>
            	</div>
   				 </div>

    </div>
</div>
	<div class="button">
		<a href="history.back()">BACK</a>
		<a href="${path}/resume/list">LIST</a>
		<a href="${path}/main">HOME</a>
		<c:if test="${sessionScope.userEmail==dto.email}">
			<input type="hidden" value="${dto.email}" name="email"/>
			<a href="${path}/resume/modify/${dto.email}/">MODIFY</a>
		</c:if>
	</div>
    <footer>
        footer 고정
    </footer>
</body>
</html>