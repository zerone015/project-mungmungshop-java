<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script>
	window.onload = function() {
		document.quitPw.member_pw.focus();
	}
</script>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<script type="text/javascript">
function checkQuit() {
	var form=document.quitPw;
			
	var pw = form.member_pw;
	var pwCheck = form.pwCheck;

	if (pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	}
	
	if (pwCheck.value == "") {
		alert("비밀번호 확인을 입력해주세요.");
		pwCheck.focus();
		return false;
	}
	
	if (pw.value != pwCheck.value) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.")
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
  	<h3>회원 탈퇴</h3>
	<hr>
	<div>
		<p>회원 탈퇴 시, 회원님께서 보유하신 비현금성 포인트 등은 모두 삭제됩니다.</p>
	</div>
	<div style="margin-top: 20;">
		<div style="text-align: center;">
		  <form name="quitPw" method="POST" action="${contextPath}/myPage/removeMember.do">
			<input class="form-control" style="width: 300; margin: 0 auto;"
				type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" onkeyup="enterkey();" /> 
			<input class="form-control" style="width: 300; margin: 0 auto; margin-top: 5;"
				type="password" name="pwCheck" placeholder="비밀번호를 다시 한번 입력해주세요" onkeyup="enterkey();" />
		  </form>
		</div>
		<div>
			<button class="btn btn-primary" style="width: 300; margin-top: 5;" type="button" 
				 onclick="checkQuit()">다음</button>
		</div>
	</div>
 </div>
</div>
</body>
</html>