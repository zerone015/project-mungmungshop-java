<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>회원가입 환영 화면</title>
</head>
<body>
	<div class="px-4 py-5 my-5 text-center">
		<img class="d-block mx-auto mb-4"
			src="${contextPath}/resources/image/cutedog.PNG" alt="" width="200"
			height="150">
		<h1 class="display-5 fw-bold">환영합니다.</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">
			<p>저희 사이트의 회원이 되신 것을 진심으로 환영합니다.</p>
			<p>이제부터 다양한 컨텐츠들을 이용하실 수 있습니다.</p>
			<form name="#" method="GET" action="#">
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<input type="submit" class="btn btn-primary btn-lg px-4 gap-3"
						value="메인 화면으로"
						onclick="javascript: form.action='${contextPath}/main.do';" /> <input
						type="submit" class="btn btn-outline-secondary btn-lg px-4"
						value="로그인하기"
						onclick="javascript: form.action='${contextPath}/login.do';" />
				</div>
			</form>
		</div>
	</div>

</body>
</html>