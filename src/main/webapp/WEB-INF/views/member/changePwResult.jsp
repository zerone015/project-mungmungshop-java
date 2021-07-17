<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utfo-8">
<title>비밀번호 변경 완료</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div align="center">
<h1 class="display-5 fw-bold">비밀번호 변경이 완료되었습니다.</h1>
</div>
<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/login.do'">로그인 하기</button>
<button type="button" class="btn btn-light" onclick="location.href='${contextPath}/main.do'">메인 화면으로</button>
</body>
</html>