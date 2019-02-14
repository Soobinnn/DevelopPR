<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Portfolio Main</title>
<style>
.kks .container{
display : flex;
flex-direction : column;
background:#FAFAFA;
}

.kks #cssmenu{
display:flex;
flex-shrink:0;
vertical-align : baseline;

}

.kks #view{

display:flex;
flex-basis:800px;
flex-shrink:0;
background-image: url( "${path}/resources/kimkiseong/css/new_begin1.png" );


}
@import url(http://fonts.googleapis.com/css?family=Capriola);
#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul li a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  font-family: Capriola, Helvetica, sans-serif;
}
#cssmenu {
  width: auto;
  height: 59px;
  padding-bottom: 4px;
}
#cssmenu.align-right {
  float: right;
}
#cssmenu.align-right ul li {
  float: right;
  margin-right: 0;
  margin-left: 4px;
}
#cssmenu.align-right ul li:first-child,
#cssmenu.align-right ul li:first-child > a {
  border-bottom-right-radius: 3px;
}
#cssmenu #bg-one,
#cssmenu #bg-two,
#cssmenu #bg-three,
#cssmenu #bg-four {
  position: absolute;
  bottom: 0;
  width: 100%;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
}
#cssmenu #bg-one {
  height: 10px;
  background:#585858;
  /* background: #0f71ba; */
}
#cssmenu #bg-two {
  height: 59px;
  z-index: 2;
  background: url('css/bg.png');
}
#cssmenu #bg-three {
  bottom: 4px;
  height: 55px;
  z-index: 3;
  background: #222222;
  background: -moz-linear-gradient(top, #555555 0%, #222222 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #555555), color-stop(100%, #222222));
  background: -webkit-linear-gradient(top, #555555 0%, #222222 100%);
  background: -o-linear-gradient(top, #555555 0%, #222222 100%);
  background: -ms-linear-gradient(top, #555555 0%, #222222 100%);
  background: linear-gradient(to bottom, #555555 0%, #222222 100%);
}
#cssmenu #bg-four {
  bottom: 4px;
  height: 55px;
  z-index: 4;
  background: url('${path}/resources/kimkiseong/css/bg.png');
}
#cssmenu ul {
  height: 59px;
}
#cssmenu ul li {
  float: left;
  margin-right: 4px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  z-index: 5;
}
#cssmenu ul li a {
  padding: 24px 30px 20px 30px;
  margin-bottom: 4px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  color: #eeeeee;
  font-size: 15px;
  text-decoration: none;
}
#cssmenu ul li:first-child,
#cssmenu ul li:first-child > a {
  border-bottom-left-radius: 3px;
}
#cssmenu ul li:hover,
#cssmenu ul li.active {
  background: #0f71ba;
  background: -moz-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3fa4f0), color-stop(100%, #0f71ba));
  background: -webkit-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
  background: -o-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
  background: -ms-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
  background: linear-gradient(to bottom, #3fa4f0 0%, #0f71ba 100%);
}
#cssmenu ul li a:hover,
#cssmenu ul li.active > a {
  background: url('images/bg.png');
  color: #ffffff;
}
</style>

<script>
( function( $ ) {
	$( document ).ready(function() {
	$('#cssmenu').prepend('<div id="bg-one"></div><div id="bg-two"></div><div id="bg-three"></div><div id="bg-four"></div>');
	});
	} )( jQuery );

function call_whoAmI(){ 

	$.ajax({ 
	  type: "POST", 
	  url: "${path}/resources/kimkiseong/whoAmI.jsp", 
	  success: function(result){ 
	    $("#view").html(result); 
	  } 

	})}; // end of call_whoAmI 

	function call_myStory(){ 

		$.ajax({ 
		  type: "POST", 
		  url: "${path}/resources/kimkiseong/myStory.jsp", 
		  success: function(result){ 
		    $("#view").html(result); 
		  } 

		})}; // end of call_whoAmI

		function call_semiProject(){ 

			$.ajax({ 
			  type: "POST", 
			  url: "${path}/resources/kimkiseong/semiProject.jsp", 
			  success: function(result){ 
			    $("#view").html(result); 
			  } 

			})}; // end of call_whoAmI


</script>
</head>
<body>
<div class="kks">  <%-- 전체를 감싸는 div(css) --%>
<div class="container">
<div id='cssmenu'>
<ul>
   <li class='active'><a href='#'><span>Home</span></a></li>
   <li><a href='javascript:call_whoAmI();'><span>Who Am I?</span></a></li>
   <li><a href='javascript:call_semiProject();'><span>Semi Project</span></a></li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
</ul>
</div> <%-- cssmenu 종료 --%>
<div id = "view">



</div> <%--view div 종료 --%>

</div> <%--container div 종료 --%>
</div> <%-- 전체를 감싸는 div 종료(css) --%>
</body>
</html>