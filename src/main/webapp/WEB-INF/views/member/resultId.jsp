<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 안내</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h4 style="margin-bottom: 40px;">
		<b>아이디 안내</b>
	</h4>
	<label style="margin-bottom: 35px;">아이디 찾기를 완료하였습니다.</label>
	<div class="box6" style="text-align: center">
		<c:forEach var="memberList" items="${memberList}" varStatus="status">
			<p>
				아이디 : <strong><c:out value="${memberList.member_id}" /></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 가입일 : <strong><fmt:formatDate value="${memberList.member_joindate}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></strong> 
			</p>
		</c:forEach>
	</div>
	<table style="margin-left: auto; margin-right: auto;" width="25%">
		<tr>
			<td>
				<button style="margin-top: 30px;" class="btn btn-lg btn-primary btn-block" type="submit"
					onclick="location.href='${contextPath}/login.do'">
					<font style="color: white;">로그인 하기</font>
				</button>
			</td>
		</tr>
		<tr>
			<td>
				<button style="margin-top: 10px;" class="btn btn-lg btn-outline-primary btn-block" type="submit"
					onclick="location.href='${contextPath}/findPw.do'">
					<font style="color: #0d6efd;">비밀번호 찾기</font>
				</button>
			</td>
		</tr>
	</table>
</body>
</html>