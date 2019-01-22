<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>휴대폰 인증</title>
<script type="text/JavaScript">
function authCheck() {
	var phone = auth_form.phone.value;

	if(auth_form.authNum.value != "" && auth_form.authNum.value == "${authNum}") {
		
		alert("인증되었습니다.");
				
		hiddenBtn.style.display='block';
		hidden_form.phone.value = phone;
		/* opener.document.join_form.phone.value = phone;	 */	
		
	} else{
		alert("인증번호가 틀립니다.");
		return false;
	}
}

/* function findIdResult() {
	location.href="${path}/user/findIdResult"
} */
</script>
</head>
<body>
	<center>
		<h3>휴대폰 인증</h3>
		<br>
		<br>
		<form name="auth_form" action="${path}/user/phoneCheck" method="post">
			<table>
				<tr>
					<td>Phone&nbsp;<input type="text" id="phone" name="phone" value="${phone}"></td>
					<td><input type="submit" value="본인인증"></td>
				</tr>
				<tr>
					<td>인증번호&nbsp;<input type="text" id="authNum" name="authNum"
						maxlength="6"></input></td>
					<td><input type="button" name="authOk" value="확인"
						onclick="authCheck()" /></td>
				</tr>
				<br><br>
		</form>
		<form name="hidden_form" action="${path}/user/findIdResult" method="post">
				<input type="hidden" id="phone" name="phone" value="">
				<tr id="hiddenBtn" style="display: none">
					<td><input type="submit" name="nextStep" value="다음 단계"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>