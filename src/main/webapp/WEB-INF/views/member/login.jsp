<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
	<c:if test="${not empty cookie.rememberId }">
		<c:set value="checked" var="checked" />
	</c:if>
	<c:if test="${result=='loginFailed' }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 해주세요.");
			}
		</script>
	</c:if>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utfo-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function fn_checkLogin() {
		var form = document.login;

		if (form.member_id.value == "") {
			alert("아이디를 입력해주세요.");
			form.member_id.focus();
			return false;
		}
		if (form.member_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			form.member_pw.focus();
			return false;
		}

		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	 fn_checkLogin();
        }
}
</script>
<body>
	<form id="login" name="login" method="POST"
		action="${contextPath}/member/login.do">
		<table style="border: 0; width: 400; align: center;">
			<tr align="center">
				<td><h4>로그인</h4></td>
			</tr>
			<tr align="center">
				<td>ID<input type="text" name="member_id"
					value="${cookie.rememberId.value}" size="30" onkeyup="enterkey();"
					style="margin-left: 12; margin-top: 20;" placeholder="아이디 입력"></td>
			</tr>
			<tr align="center">
				<td>PW<input type="password" name="member_pw" size="30" onkeyup="enterkey();"
					style="margin-left: 5;" placeholder="비밀번호 입력"></td>
			</tr>
			<tr align="center">
				<td><input type="checkbox" name="remember_userId"
					value="checked" ${checked}> 아이디 기억</td>
			</tr>
			<tr align="center">
				<td><button class="btn btn-primary" type="button"
						onclick="fn_checkLogin();" style="margin: 10; width: 310;">로그인</button></td>
			</tr>
		</table>
	</form>
	<a href="${contextPath}/findId.do">아이디 찾기</a> |
	<a href="${contextPath}/findPw.do">비밀번호 찾기</a> |
	<a href="${contextPath}/member/joinAgree.do">회원가입</a>
</body>
</html>