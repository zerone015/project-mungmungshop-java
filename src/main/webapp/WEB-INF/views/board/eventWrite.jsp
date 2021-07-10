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
<meta charset="utf-8">
<title>이벤트 글</title>
<style>
input:focus, textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<table class="table table-sm table-bordered" border="1">
		<tr>
			<th style="background: #e6e6e6;">제목</th>
			<td colspan="3"><input type="text" name="#"
				style="width: 100%; border: 0;" value="이벤트 제목입니다." readonly></td>
		</tr>
		<tr>
			<th style="background: #e6e6e6;">작성자</th>
			<td>관리자ID</td>
			<th style="background: #e6e6e6;">날짜</th>
			<td>2021-06-05</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="#" rows="10" style="width: 100%; border: 0;" readonly>이벤트 내용입니다.</textarea>
	<hr width="100%">
	<div class="bd-example" align="center">
		<button type="button" class="btn btn-primary btn-lg">목록으로</button>
	</div>
</body>
</html>