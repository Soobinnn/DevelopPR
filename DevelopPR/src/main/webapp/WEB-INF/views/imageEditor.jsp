<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../views/include/tag_header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>PaintWeb</title>
    <script type="text/javascript" src="resources/paintweb/paintweb.js"></script>
    <script type="text/javascript" src="resources/paintweb/html2canvas.min.js"></script>
    <script type="text/javascript" src="resources/paintweb/es6-promise.min.js"></script>
    <script type="text/javascript" src="resources/paintweb/es6-promise.auto.min.js"></script>
</head>
<body>
    <img id="editableImage"/>
        
    <div id="PaintWebTarget"></div>
    
    
	<script type="text/javascript">
var srcImg = null, img1 =null;

(function () {
	srcImg = window.opener.document.getElementById("uploadImage");

	img1 = document.getElementById('editableImage');
	img1.src = srcImg.src;
	img1.onload = function () {
		initEditor();
		img1.style.display = 'none';
	}
})();

function initEditor() {
	var target = document.getElementById('PaintWebTarget'),
	pw = new PaintWeb();
	pw.config.guiPlaceholder = target;
	pw.config.configFile     = 'config-example.json';
	pw.config.imageLoad 	 = img1;
	
	pw.config.imageSaveURL   = "${path}/saveImage"; // imageSave == image upload   
	pw.config.imageDownloadURL = "${path}/fileDownload";
	pw.config.afterImageSave   = afterImageSave;
	pw.init();
}
function afterImageSave(){
	window.close();
}
</script>
</body>
</html>
