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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>회원가입 완료</title>
</head>
<body>
	<div class="px-4 py-5 my-5 text-center">
		<img class="d-block mx-auto mb-4"
			src="${contextPath}/resources/image/cutedog.PNG" alt="강아지 사진" width="200"
			height="150">
		<h1 class="display-5 fw-bold">환영합니다.</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">
			<p>뭉뭉샵의 회원이 되신 것을 진심으로 환영합니다.</p>
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