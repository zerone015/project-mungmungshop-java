<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
	window.onload = function() {
		document.pwChange.member_pw.focus();
	}
</script>
<script type="text/javascript">
function checkPwChange() {
	var form=document.pwChange;
	
	var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;   //8자이상 영문,슛자,특수문자 포함 필수
	
	var pw = form.member_pw;
	var checkPw = form.checkPw;
	
	if (pw.value == "") {
		alert("새로운 비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	} 
	
	else if (!regExpPw.test(pw.value)) {
		alert("비밀번호를 영문,슛자,특수문자 포함 8자 이상 입력해주세요.");
		pw.focus();
		return false;
	} 
	
	if (checkPw.value == "") {
		alert("비밀번호 확인을 입력해주세요.");
		form.checkPw.focus();
		return false;
	}
	
	
	if (pw.value != checkPw.value) {
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
		return false;
	}
	

	
	form.submit();
}

function enterkey() {
    if (window.event.keyCode == 13) {
    	checkPwChange();
    }
}
</script>
<body>
<div class="container">
  <div>
  	<h3>비밀번호 변경</h3>
	<hr>
	<p>새로운 비밀번호를 등록해주세요</p>
	
	<div style="margin-top: 20;">
			<p style="font-size: 12px; color: gray; 
			margin: 0 auto; margin-bottom: 5;">영문, 숫자, 특수문자 포함 8자 이상</p>
		<form name="pwChange" method="POST" action="${contextPath}/myPage/modPw.do">
		<div style="text-align: center;">
			<input class="form-control" style="width: 300; margin: 0 auto;"
				type="password" name="member_pw" placeholder="새로운 비밀번호를 입력해주세요" maxlength="15" onkeyup="enterkey();"/> 
			<input class="form-control" style="width: 300; margin: 0 auto; margin-top: 5;"
				type="password" name="checkPw" placeholder="비밀번호를 다시 한번 입력해주세요" maxlength="15" onkeyup="enterkey();" />
		</div>
		<div>
			<button class="btn btn-primary" style="width: 300; margin-top: 5;" type="button" onClick="checkPwChange();">다음</button>
		</div>
		</form>
	</div>
 </div>
</div>
</body>
</html>