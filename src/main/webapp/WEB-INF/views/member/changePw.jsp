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
<title>비밀번호 변경</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<script type="text/javascript">
	function checkChangePw() {
		var form = document.changePw;

		var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //8자이상 영문,슛자,특수문자 포함 필수

		var newPw = form.Member_PW;
		var checkPw = form.checkPw;
		
		var originalPw = "${originalPw}";

		if (newPw.value == "") {
			alert("새로운 비밀번호를 입력해주세요.");
			newPw.focus();
			return false;
		}

		else if (!regExpPw.test(newPw.value)) {
			alert("비밀번호를 영문,슛자,특수문자 포함 8자 이상 입력해주세요.")
			newPw.select();
			return false;
		}

		if (checkPw.value == "") {
			alert("비밀번호 확인을 입력해주세요.");
			checkPw.focus();
			return false;
		}

		if (newPw.value != checkPw.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
			return false;
		}
		
		if (newPw.value == originalPw){
			alert("기존 비밀번호와 다른 비밀번호로 다시 시도해주세요.");
			newPw.select();
			return false;
		}
		
		form.submit();
	}
</script>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 class="h3 mb-3 font-weight-normal">
		 <font style="vertical-align: inherit;">
		 비밀번호 변경 
		 </font>
	</h1>
	<form name="changePw" method="POST" action="${contextPath}/member/updatePw.do">
		<table style="margin-left: auto; margin-right: auto;">
			<tr align="center">
				<td>새로운 비밀번호 * <input name="Member_PW"
					placeholder="새로운 비밀번호를 입력하세요." type="password" size="30"
					maxlength="20"></td>
			</tr>
			<tr align="center">
				<td>비밀번호 확인 * <input name="checkPw"
					placeholder="새로운 비밀번호를 입력하세요." type="password" size="30"
					maxlength="20"></td>
			</tr>
			<tr>
				<td>
				<input class="btn btn-lg btn-primary btn-block" type="button" onclick="checkChangePw()" value="확인">
				<input type="hidden" name="Member_ID" value="${id}">
				<input type="hidden" name="Member_email" value="${email}">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>