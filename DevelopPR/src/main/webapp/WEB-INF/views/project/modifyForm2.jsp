<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">



<meta charset="UTF-8">
<title>Project Regist Form</title>

  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/project/pr_registForm.css'/>"/>
   
  
<style>
.pr_regist .techstacklist{
              display : flex;      /* ... */
              flex-wrap :wrap;
			  width: 360px;
		 	  margin-left: 148px;
                            }
.pr_regist .techstacklist > li{
              width : 100px;
              height : 50px;
              text-align: center;
                                   }

#techstack_btns {position: relative;}
 #techstack_btns input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
 position: absolute;
width: 1px;
height: 1px;
padding: 0;
margin: -1px;
overflow: hidden;
clip:rect(0,0,0,0);
border: 0 
}
 
#techstack_btns input[type="checkbox"] + label {
 display: inline-block;
position: relative;
cursor: pointer;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none; }

#techstack_btns input[type="checkbox"] + label:before { /* 가짜 체크박스 */
 content: ' '; display: inline-block; width: 21px; /* 체크박스의 너비를 지정 */
  height: 21px; /* 체크박스의 높이를 지정 */
   line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
    margin: -2px 8px 0 0;
     text-align: center;
      vertical-align: middle;
       background: #fafafa; border: 1px solid #cacece;
        border-radius : 3px;
         box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); }

 #techstack_btns input[type="checkbox"] + label:active:before,
  #techstack_btns input[type="checkbox"]:checked + label:active:before {
       box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); 
} 

#techstack_btns input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */
 content: '\2714'; /* 체크표시 유니코드 사용 */
  color: #99a1a7; 
  text-shadow: 1px 1px #fff; 
  background: #e9ecee; 
  border-color: #adb8c0; 
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
   }



 
</style>
<script>
          $(document).ready(function()
            {
        	  $(document).scrollTop(550);

//////////////////////////프로젝트 관련 이미지 받아오기 시작//////////////////////        	  

	
	var chk_img = "${dto.project_image}";                   //project_image값을 받아온다. String값이므로 따옴표로 묶지 않으면 에러가 난다.
    var img_split = chk_img.split(',');                 //받아온 값을 콤마 단위로 잘라서 저장한다.
                                                                         
        if(img_split.includes("java")>-1){
               var elem = document.createElement("img");
    	 	   elem.setAttribute("src", img_split);
    	 	   elem.setAttribute("height", "140");
    	 	   elem.setAttribute("width", "140");
    	 	   elem.setAttribute("id","del_java");
    	 	   elem.setAttribute("class", "java_pic");
    	 	   document.getElementById("img_added").appendChild(elem);
    	       
    	 	   var elem_h = document.createElement("input");
    	 	       elem_h.setAttribute("type", "hidden");
    	 	       elem_h.setAttribute("name", "project_image");
    	 	       elem_h.setAttribute("value",img_split);
    	 	       document.getElementById("img_added").appendChild(elem_h);
       return;
        }  // end of if	  
      
        if(img_split.includes("android")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_android");
 	 	   elem.setAttribute("class", "android_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("sharp")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_c_sharp");
 	 	   elem.setAttribute("class", "c_sharp_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("db")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_db");
 	 	   elem.setAttribute("class", "db_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("desktop")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_desktop");
 	 	   elem.setAttribute("class", "desktop_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("html")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_html");
 	 	   elem.setAttribute("class", "html_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("iphone")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_ophone");
 	 	   elem.setAttribute("class", "iphone_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("jquery")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_jquery");
 	 	   elem.setAttribute("class", "jquery_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("js")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_js");
 	 	   elem.setAttribute("class", "js_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("mysql")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_mysql");
 	 	   elem.setAttribute("class", "mysql_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("php")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_php");
 	 	   elem.setAttribute("class", "php_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("python")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_python");
 	 	   elem.setAttribute("class", "python_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
        if(img_split.includes("server")>-1){
         	
     	   var elem = document.createElement("img");
 	 	   elem.setAttribute("src", img_split);
 	 	   elem.setAttribute("height", "140");
 	 	   elem.setAttribute("width", "140");
 	 	   elem.setAttribute("id","del_server");
 	 	   elem.setAttribute("class", "server_pic");
 	 	   document.getElementById("img_added").appendChild(elem);
 	       
 	 	   var elem_h = document.createElement("input");
 	 	       elem_h.setAttribute("type", "hidden");
 	 	       elem_h.setAttribute("name", "project_image");
 	 	       elem_h.setAttribute("value",img_split);
 	 	       document.getElementById("img_added").appendChild(elem_h);
 	 	     return;
        }  // end of if
     
         
 //////////////////////////프로젝트 관련 이미지 받아오기 종료//////////////////////        	  
        	  
        	  
        	  
        	  
//////////////////////////////프로젝트 관련 이미지 추가//////////////////////
        	  
$("#java_clicked").click(function(){
	  if( $("#img_added> #del_java").length >0 ){
		  var del_p = document.getElementById("img_added");  	
		  var del = document.getElementById("del_java");
	        	del_p.removeChild(del);
		        				 
	  } else if ( $("#img_added> #del_java").length == 0) {
	      var elem = document.createElement("img");
 	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_java.png");
 	   elem.setAttribute("height", "140");
 	   elem.setAttribute("width", "140");
 	   elem.setAttribute("id","del_java");
 	   elem.setAttribute("class", "java_pic");
 	   document.getElementById("img_added").appendChild(elem);
       
 	   var elem_h = document.createElement("input");
 	       elem_h.setAttribute("type", "hidden");
 	       elem_h.setAttribute("name", "project_image");
 	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_java.png");
 	       document.getElementById("img_added").appendChild(elem_h);
 	   
 	   //end of img_add_java()
			 return;       					
	  }
  });

$("#android_clicked").click(function(){
if( $("#img_added> #del_android").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_android");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_android").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_android.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_android");
	   elem.setAttribute("class","android_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_android.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#c_sharp_clicked").click(function(){
if( $("#img_added> #del_c_sharp").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_c_sharp");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_c_sharp").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_c_sharp.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_c_sharp");
	   elem.setAttribute("class","c_sharp_pic");
	
	   document.getElementById("img_added").appendChild(elem);
    
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_c_sharp.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#db_clicked").click(function(){
if( $("#img_added> #del_db").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_db");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_db").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_db.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_db");
	   elem.setAttribute("class","db_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
    
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_db.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#desktop_clicked").click(function(){
if( $("#img_added> #del_desktop").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_desktop");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_desktop").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_desktop.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_desktop");
	   elem.setAttribute("class","desktop_pic");
	  	   document.getElementById("img_added").appendChild(elem);
      
	  	 var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_desktop.png");
	       document.getElementById("img_added").appendChild(elem_h);
	  	   
	  	   
	  	   //end of img_add_java()
		 return;       					
}
});
$("#html_clicked").click(function(){
if( $("#img_added> #del_html").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_html");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_html").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_html.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_html");
	   elem.setAttribute("class","html_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_html.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#iphone_clicked").click(function(){
if( $("#img_added> #del_iphone").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_iphone");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_iphone").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_iphone.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_iphone");
	   elem.setAttribute("class","iphone_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_iphone.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#jquery_clicked").click(function(){
if( $("#img_added> #del_jquery").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_jquery");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_jquery").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_jquery.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_jquery");
	   elem.setAttribute("class","jquery_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_jquery.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#js_clicked").click(function(){
if( $("#img_added> #del_js").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_js");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_js").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_js.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_js");
	   elem.setAttribute("class","js_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_js.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#mysql_clicked").click(function(){
if( $("#img_added> #del_mysql").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_mysql");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_mysql").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_mysql.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_mysql");
	   elem.setAttribute("class","mysql_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_mysql.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#php_clicked").click(function(){
if( $("#img_added> #del_php").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_php");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_php").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_php.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_php");
	   elem.setAttribute("class","php_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_php.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});
$("#python_clicked").click(function(){
if( $("#img_added> #del_python").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_python");
      	del_p.removeChild(del);
				 
} else if ( $("#img_added> #del_python").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_python.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_python");
	   elem.setAttribute("class","python_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
       
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_python.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});

$("#server_clicked").click(function(){
if( $("#img_added> #del_server").length >0 ){
	  var del_p = document.getElementById("img_added");  	
	  var del = document.getElementById("del_server");
      	del_p.removeChild(del);
	        				 
} else if ( $("#img_added> #del_server").length == 0) {
    var elem = document.createElement("img");
	   elem.setAttribute("src", "${path}/resources/project_imgs/presets_logo_server.png");
	   elem.setAttribute("height", "140");
	   elem.setAttribute("width", "140");
	   elem.setAttribute("id","del_server");
	   elem.setAttribute("class","server_pic");
	   
	   document.getElementById("img_added").appendChild(elem);
	   var elem_h = document.createElement("input");
	       elem_h.setAttribute("type", "hidden");
	       elem_h.setAttribute("name", "project_image");
	       elem_h.setAttribute("value","${path}/resources/project_imgs/presets_logo_server.png");
	       document.getElementById("img_added").appendChild(elem_h);
	   
	   
	   //end of img_add_java()
		 return;       					
}
});

           	  
//////////////////////////////프로젝트 관련 이미지 종료//////////////////////        	  
        	  document.getElementById("techstack_hidden_show").style.display = "none";
        	          	  
        	  <%--프로젝트명 추가부분, 프로젝트 등급 버튼 --%>
        	  var ul = document.querySelector('.techstacklist'); 
 		     $('.gradebtn').click(function(){
                       var text =  $(this).val();
                       $('#project_grade').val(text);
                   });
   
            
              <%--값 전송 버튼 시작 --%>  
 		      $("#btnSave").click(function(){
                    var project_name = $("#project_name").val();
                    var project_content = $("#project_content").val();
                    var project_term1 = $("#project_term1").val();
                    var project_term2 = $("#project_term2").val();
                    /*정규표현식을 이용한 유효성 검증을 위해 값을 담아올 변수를 생성한다.*/
                    var project_name = $('#textarea_title').val();
                    var project_content = $('#textarea_introduce').val();
                    
                    
                    
                    if (project_name.replace(/ |　/gi, '') == ''){ 
                        alert("프로젝트 제목을 입력해주세요.");
                        document.form1.project_name.focus();
                        return; 
                    }
                    
                    if (project_content.replace(/ |　/gi, '') == ''){ 
                        alert("프로젝트 내용을 입력해주세요.");
                        document.form1.project_content.focus();
                        return; 
                    }
                    
                  
                    if(project_term1 == ""){
                    	alert("프로젝트 시작 날짜를 입력하세요");
                    	document.form1.project_term1.focus();
                    	return;
                    }
                    
                    if(project_term2 == ""){
                    	alert("프로젝트 종료 날짜를 입력하세요");
                    	document.form1.project_term2.focus();
                        return;
                    }
                     
    /////////////////테크스택 체크박스 밸리데이션 시작/////////////////////    
                    var cbox = document.forms["form1"]["techstack"];
                   if (
                     cbox[0].checked == false &&
                     cbox[1].checked == false &&
                     cbox[2].checked == false &&
                     cbox[3].checked == false &&
                     cbox[4].checked == false &&
                     cbox[5].checked == false &&
                     cbox[6].checked == false &&
                     cbox[7].checked == false &&
                     cbox[8].checked == false &&
                     cbox[9].checked == false &&
                     cbox[10].checked == false &&
                     cbox[11].checked == false &&
                     cbox[12].checked == false &&
                     cbox[13].checked == false &&
                     cbox[14].checked == false &&
                     cbox[15].checked == false &&
                     cbox[16].checked == false
                     
                   ) {
                     alert("테크스택을 하나 이상 체크해주세요.");
                     return false;
                   } 
                 /////////////////테크스택 체크박스 밸리데이션 종료/////////////////////
                    
            ////////////////프로젝트 관련 이미지 밸리데이션 시작///////////////////      
                   if( $("#img_added > #img_checking").length == 0){
                   	alert("프로젝트를 대표할 이미지 하나 이상 선택해주세요.")
                   	document.form1.project_image.focus();
                  return;
                   }
             ////////////////프로젝트 관련 이미지 밸리데이션 종료/////////////////// 
                    
                    
                    document.form1.submit();
                });  
                     <%--값 전송 및 유효성 검증 종료 --%>            
            
         <%-- project_tech_name을 가져와서 버튼이 체크된상태로 페이지가 시작되게 한다. --%>            
                     


       
         
         $(".techbuttons").click(function () {                         //클래스가 techbuttons인 것을 누르면 이 함수가 동작한다
              var chkbox_obj = document.getElementsByName('techstack');  //chkbox_obj 변수를 설정하는데 이 페이지안에서 name값이 techstack인 것을 찾아온다
              var chkbox_obj_cnt = chkbox_obj.length;                    //chkbox_obj_cnt에는 위에 담긴 값의 수가 들어간다.
              for (var k = 0; k < chkbox_obj_cnt; k++) {                 //위에 담긴 수만큼 for문을 돌린다
           	   if (chkbox_obj[k].value == $(this).val()) {            //chkbox_obj안의 value가 techbuttons을 name으로 가진 value와 같을때
           		  if (!chkbox_obj[k].checked) {                       //chkbox_obj로 가져온 값이 체킹되어있지 않다면
           		  	 chkbox_obj[k].checked = true;                    //체크하고
           		  }
           		  else {
           			 chkbox_obj[k].checked = false;                  //아니면 체크값을 해제한다.
           		  }
           	   }
              }
           }); //end of button-check            
                     
                     
            
            
            
           
      
         
         
         
         /* ajax 검색 로직 추가 */           
    $(function() {   // <input>요소에 문자가 입력될 때마다 호출됨.
        $(".project_tech_name").keyup(function() {
                var tech_name_input = $('.project_tech_name').val();
        	    var param = "tech_name_input=" + tech_name_input;    //컨트롤러로 값을 넘기기 위해서 이름을 담은 매개변수 선언
         	$.ajax({ // Ajax 요청을 작성
         	    url: "${path}/project/autocomplete",
         	    data: param,
         	    method: "POST",
         	    success: function (result) {
         	        if (tech_name_input == "" || tech_name_input == null) {       // techstack 입력란이 비워져 있을 경우
         	        	document.getElementById("techstack_hidden_show").style.display = "hidden";  	        	                                                                 	 //start of if
         	            $('ul').empty();            
                      } else {                                                  //end of if and start of else
         	            var output = document.createElement('div');            //div에서 span으로 변경
         	            for (var i in result)                                   // result에서 받아온 값의 개수만큼 for문을 돌린다
         	            {
         	                var techName = result[i].tech_name_input;
         	                
         	                var listBtn = document.createElement('button');
         	               
         	               document.getElementById("techstack_hidden_show").style.display = "block";

         	               listBtn.textContent = techName;
         	                listBtn.type = 'button'; //버튼의 type을 button으로 지정해주어 눌렀을때 페이지전환을 막는다.
         	                listBtn.value = techName;
         	                listBtn.style.marginTop = '6px';
         	                listBtn.style.marginRight = '6px';
         	                listBtn.setAttribute('class', "techbuttons");  //각 버튼의 value를 지정한다.
         	                output.appendChild(listBtn);

         	                $(".techstacklist").html(output);

         	                $(".techbuttons").click(function () {                         //클래스가 techbuttons인 것을 누르면 이 함수가 동작한다
         	                   var chkbox_obj = document.getElementsByName('techstack');  //chkbox_obj 변수를 설정하는데 이 페이지안에서 name값이 techstack인 것을 찾아온다
         	                   var chkbox_obj_cnt = chkbox_obj.length;                    //chkbox_obj_cnt에는 위에 담긴 값의 수가 들어간다.
         	                   for (var k = 0; k < chkbox_obj_cnt; k++) {                 //위에 담긴 수만큼 for문을 돌린다
         	                	   if (chkbox_obj[k].value == $(this).val()) {            //chkbox_obj안의 value가 techbuttons을 name으로 가진 value와 같을때
         	                		  if (!chkbox_obj[k].checked) {                       //chkbox_obj로 가져온 값이 체킹되어있지 않다면
         	                		  	 chkbox_obj[k].checked = true;                    //체크하고
         	                		  }
         	                		  else {
         	                			 chkbox_obj[k].checked = false;                  //아니면 체크값을 해제한다.
         	                		  }
         	                	   }
         	                   }
         	                }); //end of button-check

         	            } //end of for

         	        } //end of else

         	    } // end of success


         	}); //end of ajax

    }); // end of keyup function
        	
    });
///////////////체크박스 체크 로직 시작.
     
     	var chk_received = "${dto.techstack}";                   //techstack값을 받아온다. String값이므로 따옴표로 묶지 않으면 에러가 난다.
        var chk_split = chk_received.split(',');               //받아온 값을 콤마 단위로 잘라서 저장한다.
                                                                         
        if(chk_split.includes("Java")>-1) 

         {
   $("#techstack_java").prop("checked", true);
          }
        
         if(chk_split.includes("JavaScript")>-1) 
        {
  $("#techstack_javascript").prop("checked", true);
         }
                
        
         if(chk_received.includes("C#")>-1) 
        {
  $("#techstack_c3").prop("checked", true);
         }
        
         if(chk_received.includes("php")>-1) 

        {
  $("#techstack_php").prop("checked", true);
         }
        
         if(chk_received.includes("android")>-1) 

        {
  $("#techstack_android").prop("checked", true);
         }
        
         if(chk_received.includes("jquery")>-1) 

        {
  $("#techstack_jquery").prop("checked", true);
         }
        
         if(chk_received.includes("python")>-1) 

        {
  $("#techstack_python").prop("checked", true);
         }
        
         if(chk_received.includes("html")>-1) 

        {
  $("#techstack_html").prop("checked", true);
         }
        if(chk_received.includes("c++")>-1) 

        {
  $("#techstack_c2").prop("checked", true);
         }
        if(chk_received.includes("ios")>-1) 

        {
  $("#techstack_ios").prop("checked", true);
         }

        if(chk_received.includes("css")>-1) 

        {
  $("#techstack_css").prop("checked", true);
         }
        if(chk_received.includes("mySql")>-1) 

        {
  $("#techstack_mysql").prop("checked", true);
         }
        
        if(chk_split.includes("Oracle")>-1) 

        {
  $("#techstack_oracle").prop("checked", true);
         }
        

        if(chk_split.includes("asp")>-1){
  $("#techstack_asp").prop("checked", true);
         }
        
        if(chk_received.includes("ruby-on-rails")>-1) 

        {
  $("#techstack_ruby-on-rails").prop("checked", true);
         }
        if(chk_received.includes("objective-c")>-1) 

        {
  $("#techstack_objective-c").prop("checked", true);
         }
        if(chk_received.includes("c")>-1) 

        {
  $("#techstack_c").prop("checked", true);
         }    
             
/////////////////////////////체크박스 체크 로직 종료        
              }); //end of document.ready  

          </script>

</head>
<body>

<!--ProjectVO에 있는 변수명과  여기의 name값이 일치해야 한다. -->
<div class="pr_regist">
<div class="container">
<%-- <form name="form1" id="form1" method="post" action="${path}/project/regist" enctype="multipart/form-data"> --%>  
<form name="form1" id="form1" action="${path}/project/modify" method ="post" enctype="multipart/form-data">
  <div id="project_make"><span id="main_title">프로젝트 수정하기</span><br><span id="subtitle_make">쉽고 빠르게 프로젝트를 등록해보세요.</span></div>
  <div id="title_line_top"> <!--라인 넣기용 div--><hr id="title_top"></div>
  
  
  <div class="title_input">
   
   <div id="title">*제목</div>
   <div id="titleWrite"><input type="text" size="30" id="textarea_title" name="project_name" value="${dto.project_name}" autofocus/></div>
   <div class="title_warn"><!--자바스크립트로 경고 메시지를 띄운다.--></div>
  </div> <!--end of title_input-->

  <div class="introduce">
   <div id="introMenu">요약</div>
   <div id="introWrite"><textarea id="textarea_introduce" name="project_content" cols="80" rows="4" placeholder="프로젝트를 요약하는 문구를 씁니다." >${dto.project_content}</textarea></div>    
  </div> <!-- end of introduce-->
  
  <div class="regdate_term"><div id="regdate_hr_">  <hr id="regdate_top"></div>
    <div id="regdate_term_title">&nbsp;&nbsp;날짜 / 기간</div>
    <div id="regdate_calendar">
    <input type="date" id="project_term1" name="project_term1" value="${dto.project_term1}"/>
    &nbsp; ~ &nbsp;
    <input type="date" id="project_term2" name="project_term2" value="${dto.project_term2}"/>
    
    
    <!--시작일~종료일 달력 메뉴 --></div>
  </div> <!-- end of regdate_trem-->

  <div class="TechStack"> <div id="techstack_top_"><hr id="techstack_top"></div>
   <div id="techstack_q"><div id="techstack_font">&nbsp;&nbsp;어떤 Tech Stack을 사용하셨나요?</div></div>
      
   
   <div id="techstack_input">
   <input type="text" class="project_tech_name" name="project_tech_name" placeholder="...Tech Stack"/> <!-- 입력폼 -->
   
   <div id="techstack_hidden_show"> <!--버튼을 누르면 테크스택들이 입력되는 곳(입력이 없을 땐 숨긴다.)  -->
        <ul class="techstacklist"></ul>
      </div>
   
   
   
   <!--테크스택을 직접 입력하는 textarea, placeholder를 쓴다.--></div>
   <div id="techstack_btns">
   <!--테크스택 버튼들을 나열하는 곳.-->
   
                         <br>
                            <input type="checkbox" id="techstack_javascript" name="techstack" value="JavaScript" class="techstack">
                            <label for="techstack_javascript">Javascript</label>
                            <input type="checkbox" id="techstack_java" name="techstack" value="Java" class="techstack">
                            <label for="techstack_java">Java</label>
                            <input type="checkbox" id="techstack_c3" name="techstack" value="C#" class="techstack">
                            <label for="techstack_c#">c#</label>
                            <input type="checkbox" id="techstack_php"name="techstack" value="php" class="techstack">
                            <label for="techstack_php">php</label>
                            <input type="checkbox" id="techstack_android" name="techstack" value="android" class="techstack">
                            <label for="techstack_android">android</label>
                            <input type="checkbox" id="techstack_jquery"name="techstack" value="jquery" class="techstack">
                            <label for="techstack_jquery">jquery</label>
                            <input type="checkbox" id="techstack_python"name="techstack" value="python" class="techstack">
                            <label for="techstack_python">python</label>
                            <input type="checkbox" id="techstack_html"name="techstack" value="html" class="techstack">
                            <label for="techstack_html">html</label>
                            <input type="checkbox" id="techstack_c2"name="techstack" value="c++" class="techstack">
                            <label for="techstack_c++">c++</label>
                            <input type="checkbox" id="techstack_ios"name="techstack" value="ios" class="techstack">
                            <label for="techstack_ios">ios</label>
                            <input type="checkbox" id="techstack_css"name="techstack" value="css" class="techstack">
                            <label for="techstack_css">css</label>
                            <input type="checkbox" id="techstack_mysql"name="techstack" value="mySql" class="techstack">
                            <label for="techstack_mysql">mysql</label>
                            <input type="checkbox" id="techstack_oracle"name="techstack" value="Oracle" class="techstack">
                            <label for="techstack_oracle">oracle</label>
                            <input type="checkbox" id="techstack_asp"name="techstack" value="asp" class="techstack">
                            <label for="techstack_asp">asp</label>
                            <input type="checkbox" id="techstack_ruby-on-rails"name="techstack" value="ruby-on-rails" class="techstack">
                            <label for="techstack_ruby-on-rails">ruby-on-rails</label>
                            <input type="checkbox" id="techstack_objective-c"name="techstack" value="objective-c" class="techstack">
                            <label for="techstack_objective-c">objective-c</label>
                            <input type="checkbox" id="techstack_c"name="techstack" value="c" class="techstack">
                            <label for="techstack_c">c</label> 
                          </div>
  </div> <!-- end of tachStack-->

  <div class="projectUpload"> <div id="projectUpload_top_"><hr id="projectUpload_top"></div>
    <div id="upload_title"><div id="upload_font">&nbsp;&nbsp;pdf 또는 ppt파일을 업로드해주세요.</div></div>
         
        <div class="file_sub"> <!-- 프로젝트 서브 div -->
         
         <div id="upload_sub1">프로젝트를 소개할 파일이 있나요?</div> <!--  end of upload_sub1 -->
         
         <div id="upload_sub2">
         <div id="file_upload">
         <label for="file_label"></label>
         <input type="file" id="file_label" name="file" value="${dto.download_name}"> <%-- VO에 name값과 동일한 매개변수를 만든다. --%>
         </div> <%-- end of file_upload --%>
          
          <div id="file_name">${dto.download_name}</div>
         <div id="file_download"><a href="${path}/resources/project_upload/${dto.download_name}" download>프로젝트 파일 다운로드</a></div>
         
       </div> <!--  end of upload_sub2 -->
    	
         </div><!-- end of file_sub -->
  </div> <!-- end of projectUpload-->
 
 
 
 <!--프로젝트 관련 이미지 업로드 추가  -->
 
 <div class="images"> <!-- 프로젝트 관련 이미지를 담는 div, display:flex 시작 -->
       <div id="img_title">관련 이미지</div>
        <div id="img_subtitle">프로젝트를 설명하는 이미지가 있나요?</div>
         <div id="img_added"><!-- 밑에서 고른 이미지가 추가되는 곳. -->

         </div>
           <div id="img_exam"><!-- 예시 이미지들이 나열되는 곳. -->
           
           <span class="small_img" id="small_java"><img id="java_clicked" src='${path}/resources/project_imgs/presets_logo_java.png' height="58" width="58"></span>
           <span class="small_img" id="small_android"><img id="android_clicked" src='${path}/resources/project_imgs/presets_logo_android.png' height="58" width="58"></span>
           <span class="small_img" id="small_c_sharp"><img id="c_sharp_clicked" src='${path}/resources/project_imgs/presets_logo_c_sharp.png' height="58" width="58"></span>
           <span class="small_img" id="small_db"><img id="db_clicked" src='${path}/resources/project_imgs/presets_logo_db.png' height="58" width="58"></span>
           <span class="small_img" id="small_desktop"><img id="desktop_clicked" src='${path}/resources/project_imgs/presets_logo_desktop.png' height="58" width="58" ></span>
           <span class="small_img" id="small_html"><img id="html_clicked" src='${path}/resources/project_imgs/presets_logo_html.png' height="58" width="58" ></span>
           <span class="small_img" id="small_iphone"><img id="iphone_clicked" src='${path}/resources/project_imgs/presets_logo_iphone.png' height="58" width="58"> </span>
           <span class="small_img" id="small_jquery"><img id="jquery_clicked" src='${path}/resources/project_imgs/presets_logo_jquery.png' height="58" width="58"></span>
           <span class="small_img" id="small_js"><img id="js_clicked" src='${path}/resources/project_imgs/presets_logo_js.png' height="58" width="58"></span>
           <span class="small_img" id="small_mysql"><img id="mysql_clicked" src='${path}/resources/project_imgs/presets_logo_mysql.png' height="58" width="58" ></span>
           <span class="small_img" id="small_php"><img id="php_clicked" src='${path}/resources/project_imgs/presets_logo_php.png' height="58" width="58"></span>
           <span class="small_img" id="small_python"><img id="python_clicked" src='${path}/resources/project_imgs/presets_logo_python.png' height="58" width="58"></span>
           <span class="small_img" id="small_server"><img id="server_clicked" src='${path}/resources/project_imgs/presets_logo_server.png' height="58" width="58" ></span>      
           </div>
 
     </div> <!-- end of images -->
 
 <!-- 프로젝트 관련 이미지 업로드 종료 -->
 
  <div class="projectLvl"> <div id="projectLvl_top_"><hr id="projectLvl_top"></div>
    <div id="projectLvl_title"><div id="lvl_font">&nbsp;&nbsp;프로젝트 등급</div></div>
    <div id="projectLvl_q">프로젝트의 등급이 어떻게 되나요?</div>
    
    
       <div id="projectLvl_input">
      <input type="text" id="project_grade" name="project_grade" value="${dto.project_grade}"/>
      <div id="projectLvl_txt">수준</div>   
        </div>
  
    <div id="projectLvl_btns">
         
             <%-- type="button"을 써서 버튼을 누르자마자 전송되는 것을 막는다. --%>
                
              <button type="button" value="상용화" class="gradebtn">상용화</button>
              <button type="button" value="베타테스트" class="gradebtn">베타테스트</button>
              <button type="button" value="알파테스트" class="gradebtn">알파테스트</button>
              <button type="button" value="튜토리얼" class="gradebtn">튜토리얼</button>
              <button type="button" value="과제" class="gradebtn">과제</button>
              <button type="button" value="연구" class="gradebtn">연구</button>
              <button type="button" value="개인프로젝트" class="gradebtn">개인프로젝트</button>
              <button type="button" value="팀프로젝트" class="gradebtn">팀프로젝트</button>
    </div>
  
  
  </div> <!-- end of projectLvl-->

   <div class="final_btns"> <div id="final_top_"><hr id="final_top"></div>
   <!--이곳에 등록 버튼을 만든다.-->
     <button type="reset" class="final_btn" id="btnCancel">취소</button>
     <button type="button" class="final_btn" id="btnSave">수정</button>
   </div>

</form> <!-- end of form1 -->



</div>  <!--end of container-->
</div>  <!--css선택자 추가용 div-->

</body>
</html>