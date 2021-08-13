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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<a href="${contextPath}/manager/getOrderList.do">주문 관리</a>
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
			<a href="${contextPath}/manager/getReviewList.do">후기 관리</a>
		</h4>
	</div>
</body>
</html>