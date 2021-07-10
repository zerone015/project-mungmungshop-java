<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 안내</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="h3 mb-3 font-weight-normal">
		<font style="vertical-align: inherit;">아이디 안내</font>
	</h1>
	<label>아이디 찾기를 완료하였습니다.</label>
	<div class="box6" style="text-align: center">
		<c:forEach var="memberId" items="${memberId}" varStatus="status">
			<p>${status.count}
				: <strong><c:out value="${memberId}" /></strong>
			</p>
		</c:forEach>
	</div>
	<table style="margin-left: auto; margin-right: auto;" width="25%">
		<tr>
			<td>
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					onclick="location.href='${contextPath}/login.do'">
					<font style="vertical-align: inherit;">로그인 하기</font>
				</button>
			</td>
		</tr>
		<tr>
			<td>
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					onclick="location.href='${contextPath}/findPw.do'">
					<font style="vertical-align: inherit;">비밀번호 찾기</font>
				</button>
			</td>
		</tr>
	</table>
</body>
</html>