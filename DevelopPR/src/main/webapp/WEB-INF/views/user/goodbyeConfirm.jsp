<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 완료</title>
</head>
<body>
	<script type="text/javascript">
		alert('회원탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.');

		window.open('', '_self', ''); // 브라우저창 닫기
		/* window.close(); // 브라우저 창 닫기 */
		self.location = '/DevelopPR/user/login';
		</script>
</body>
</html>