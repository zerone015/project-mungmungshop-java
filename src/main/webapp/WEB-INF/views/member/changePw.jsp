<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	input[type="password"] {
		width: 500px; height: 50px; display:inline-block;
	}
	td > font {
		color: red;
		font-weight: bold;
		margin-left: 2px;
	}
</style>
</head>
<script>
	window.onload = function() {
		document.changePw.member_pw.focus();
	}
</script>
<script type="text/javascript">
	function checkChangePw() {
		var form = document.changePw;

		var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //8자이상 영문,슛자,특수문자 포함 필수

		var newPw = form.member_pw;
		var checkPw = form.checkPw;
		

		if (newPw.value == "") {
			alert("변경하실 비밀번호를 입력해주세요.");
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
		
		
		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	checkChangePw();
        }
}
</script>
<body>
	<h4 style="margin-bottom: 55px;">
		<b>비밀번호 변경</b>
	</h4>
	<form name="changePw" method="POST" action="${contextPath}/member/updatePw.do">
		<table>
			<tr align="center">
				<td><b style="font-size: 13px;">새로운 비밀번호</b><font>*</font><input style="margin-left: 12px; margin-bottom: 15px;" class="form-control" name="member_pw"
					placeholder="새로운 비밀번호를 입력하세요." type="password" size="30"
					maxlength="20" onkeyup="enterkey();"></td>
			</tr>
			<tr align="center">
				<td><b style="font-size: 13px;">비밀번호 확인</b><font>*</font><input style="margin-left: 25px; margin-bottom: 15px;" class="form-control" name="checkPw"
					placeholder="새로운 비밀번호를 입력하세요." type="password" size="30"
					maxlength="20" onkeyup="enterkey();"></td>
			</tr>
			<tr>
				<td align="center">
				<input style="margin-top: 30px; width: 600px;" class="btn btn-lg btn-primary btn-block" type="button" onclick="checkChangePw()" value="확인">
				<input type="hidden" name="member_id" value="${id}">
				<input type="hidden" name="member_email" value="${email}">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>