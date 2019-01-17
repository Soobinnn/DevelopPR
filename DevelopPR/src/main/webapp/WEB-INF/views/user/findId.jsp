<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<script type="text/JavaScript">
	function nextStep() {
		var obj = document.getElementById('radio');
		if(obj.checked == false) {
			alert("본인인증 수단을 선택해주세요.");
			return false;
		}
		location.href = "${path}/user/authCheck"
	}
</script>
<style>

.container {
	display: flex;
	flex-direction: column;
	width: 500px;
	height: 500px;
	border: 2px solid #ddd;
	background: #eeeeee;
}

.area1 {
	width: 500px;
	height: 80px;
	border: 1px solid #ddd;
	border-bottom: 1px solid #ffffff;
}

.area2 {
	width: 500px;
	height: 120px;
	border: 1px solid #ddd;
	border-bottom: 1px solid #ffffff;
	height: 170px;
	overflow: auto;
	white-space: pre-wrap;
}

</style>
</head>
<body>
	<h1 align="center">DPR</h1>
	<div class="container">
		<div class="area1">
			아이디 찾기
		</div>
		<div class="area2">
			아이디 찾기를 위한 본인확인 방법을 선택해주세요.
		</div>
		<div class="area1">
			<label for="radio"><input type="radio" id="radio">휴대폰 인증</label>
			<p>내 명의(이름)로 가입된 휴대폰으로 본인 확인을 진행합니다.
		</div>
		<div style="text-align: center;">
		＊비밀번호를 찾으시나요?
		<input type="button" name="findPw" value="비밀번호 찾기" >
		<br><br><br><br><br>
		<input type="button" name="nextStep" value="다음단계" onclick=nextStep()>
		</div>
	</div>
</body>
</html>