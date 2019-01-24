<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<%@ include file="../../views/include/tag_header.jsp" %>
</head>
<body>
	<h2>회원 목록</h2>
	<table border="1" width="700px">
        <tr>
            <th>아메일</th>
            <th>방문자/구직자</th>
            <th>닉네임</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>직업</th>
            <th>직업상세</th>
            <th>최근 접속일</th>
            <th>이메일인증여부</th>
            <th>이메일인증코드</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${row.userEmail}</td>
            <td>${row.userIs_seek}</td>
            <td>${row.userNick}</td>
            <td>${row.userPw}</td>
            <td>${row.userName}</td>
            <td>${row.userJob}</td>
            <td>${row.userJob_detail}</td>
            <td>${row.userRecent_access}</td>
            <td>${row.userAuthStatus}</td>
            <td>${row.userAuthCode}</td>
        </tr>
        </c:forEach>
</body>
</html>