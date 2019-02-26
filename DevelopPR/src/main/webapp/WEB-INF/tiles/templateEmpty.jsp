<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/main/sub_icon.ico'/>"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
   <tiles:insertAttribute name="body" />
</body>
</html>
