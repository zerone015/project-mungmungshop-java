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
<title>이메일 인증</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<script>
	window.onload = function() {
		document.findPwChk_form.passcode_input.focus();
	}
</script>
<script type="text/javascript">
	function fn_passcodeChk() {
		var form = document.findPwChk_form;
		
		var code = "${passcode}";

		if (form.passcode_input.value == "") {
			alert("인증코드를 입력해주세요.");
			form.passcode_input.focus();
			return false;
		}
		
		if (form.passcode_input.value != code) {
			alert("인증코드가 일치하지 않습니다.");
			form.passcode_input.select();
			return false;
		}
		
		form.submit();
	}
	
</script>
<body>
<div align="center">
	<h1 class="display-5 fw-bold">인증을 완료해주세요.</h1>
</div>
<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
	<p class="fs-5 text-muted">입력하신 이메일로 인증번호를 전송했습니다.</p>
	<p class="fs-5 text-muted">아래에 인증번호를 입력하신 후 다음 버튼을 눌러주세요.</p>
</div>
<form method="POST" action="${contextPath}/member/changePw.do" name="findPwChk_form">
	<p><input name="passcode_input" type="text" placeholder="인증번호를 입력해주세요."></p>
	<button type="button" class="btn btn-primary" onclick="fn_passcodeChk();">다음</button>
	<button type="button" class="btn btn-dark" onclick="javascript: history.back();">취소</button>
	   <input type="hidden" name="member_id" value="${id}">
	   <input type="hidden" name="member_email" value="${email}">
</form>
</body>
</html>