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
<title>관리자 메인 페이지</title>
</head>
<body>
	<div class="col-md-5" style="float: center;">
		<h1>
			<b>관리자 모드</b>
		</h1>
	</div>
	<hr>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="${contextPath}/manager/managerProduct.do">상품 관리</a>
		</h4>
	</div>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="${contextPath}/managerOrderList.do">주문 관리</a>
		</h4>
	</div>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="${contextPath}/manager/getMembersList.do">회원 관리</a>
		</h4>
	</div>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="#">배송 관리</a>
		</h4>
	</div>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="#">후기 관리</a>
		</h4>
	</div>
	<br>
	<br>
	<div class="col-md-5" style="float: left;">
		<h4>
			<a href="#">게시판 관리</a>
		</h4>
	</div>
</body>
</html>