<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MyPortFolio</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    
    <!--커스텀 메인프레임 자바스크립트, css파일 추가 -->
    <script type="text/javascript" src="./js/mainFrame.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/mainFrame.css">
    <!-- 파일 추가 종료 -->
<script>


function call_whoAmI(){ 

	$.ajax({ 
	  type: "POST", 
	  url: "${path}/resources/kimkiseong/whoAmI.jsp", 
	  success: function(result){ 
	    $("#who_kks").html(result); 
	  } 

	})}; // end of call_whoAmI 

	function call_myStory(){ 

		$.ajax({ 
		  type: "POST", 
		  url: "${path}/resources/kimkiseong/myStory.jsp", 
		  success: function(result){ 
		    $(".kks #who_kks").html(result); 
		  } 

		})}; // end of call_whoAmI

		function call_semiProject(){ 

			$.ajax({ 
			  type: "POST", 
			  url: "${path}/resources/kimkiseong/semiProject.jsp", 
			  success: function(result){ 
			    $("#who_kks").html(result); 
			  } 

			})}; // end of call_whoAmI
	
	</script>

</head>
<body>
<div class="kks">  
<div class="mainContainer">
    <div id="left"><!-- 왼쪽 여백용 div -->
    <div id="menu">
        <div class="hamburger">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div> <%--end of menu --%>
        
        <div class="menu-inner">
           <ul>
                <li><a href="javascript:call_myStory();">My Story</a></li>             
                <li><a href="javascript:call_whoAmI();">Who am I?</a></li>
                <li>Scouting Report</li>
                <li><a href="javascript:call_semiProject();">Semi Project</a></li>
                <li>Final Project</li>
                <li>Contact</li>
            </ul>
        </div> <%--end of menu-inner --%>

  
        
        <svg version="1.1" id="blob"xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <path id="blob-path" d="M60,500H0V0h60c0,0,20,172,20,250S60,900,60,500z"/>
        </svg>
    </div> <!-- end of menu div -->
    </div> <!--  end of left -->
 
 
 <div id="who_kks"></div> 
  
  
  </div> <!-- end of mainContainer -->
</div> <!--  end of kks -->
</body>
</html>