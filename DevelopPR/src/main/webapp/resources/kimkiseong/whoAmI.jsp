<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Who am I?</title>

<style>
.kks_whoAmI .container{
    display:flex;
    flex-direction:column;
    flex-basis: 600px;
    
    
                        }
.kks_whoAmI #photo{
    display : flex;
    flex-basis:450px; 
    margin-bottom : 100px;   
    
                               }
.kks_whoAmI #introduce{
width:100%;
height:100%;                       


                       }
.kks_whoAmI #a{
    font-size:15px;
               }
</style>
<body>
 <div class="kks_whoAmI"> 
    <div class="container">
     <div id="photo">
     <img src="${path}/resources/kimkiseong/myPhoto/whoiskks.PNG" width="500px">
     </div> <!--end of photo-->
     
     <div id="introduce">
      <ul id="a">
      <li>김기성(Kim Kiseong)</li>
      <li>웅지세무대 세무행정 전공</li>
      <li>KH정보교육원 JAVA개발자 과정(2018.08.01~2019.02.27)</li>
      <li>TechStack : Java, JavaScript, Oracle</li>
      <li>Main tools : STS, Visual Studio Code</li>
      
      </ul>
            </div> <!--end of introduce -->

    </div> <!--end of container-->
</div> <!-- end of kks_whoAmI -->
</body>
</html>