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
<title>자주 묻는 질문 글</title>
<style>
input:focus, textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<table class="table table-sm table-bordered" border="1">
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="#"
				style="width: 100%; border: 0;" value="자주묻는질문 제목입니다." readonly></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>관리자ID</td>
			<th>날짜</th>
			<td>2021-06-05</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="#" rows="10" style="width: 100%; border: 0;" readonly>자주묻는질문 내용입니다.</textarea>
	<hr width="100%">
	<div class="bd-example" align="center">
		<button type="button" class="btn btn-primary btn-lg">목록으로</button>
	</div>
</body>
</html>