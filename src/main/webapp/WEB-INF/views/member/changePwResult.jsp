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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div align="center">
<h3 style="margin-bottom: 50px;" class="display-5 fw-bold">비밀번호 변경이 완료되었습니다.</h3>
</div>
<p><button style="width: 400px; height: 50px;" type="button" class="btn btn-primary" onclick="location.href='${contextPath}/login.do'">로그인 하기</button>
<p><button style="width: 400px; height: 50px;" type="button" class=" btn btn-outline-primary" onclick="location.href='${contextPath}/main.do'">메인 화면으로</button>
</body>
</html>