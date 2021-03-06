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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="undefined" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
function checkPwCertify() {
	var form=document.pwCertify;
	if (form.member_pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.member_pw.focus();
		return false;
	} 

	form.submit();
}
</script>
<script>
	window.onload = function() {
		document.pwCertify.member_pw.focus();
	}
</script>
<body>
<div class="container">
  <div>
  	<h3>비밀번호 확인</h3>
	<hr>
	<p>회원님의 소중한 개인정보 보호를 위해</p>
	<p>비밀번호 확인 후 변경이 가능합니다. </p>
	
	<div style="margin-top: 40;">
		<div style="text-align: center;">
		  <form name="pwCertify" method="POST" action="${contextPath}/myPage/getNewPw.do">
			<input class="form-control" style="width: 300; margin: 0 auto; "
				type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" />
			
		  </form>
		</div>
		<div>
			<button class="btn btn-primary" style="width: 300; margin-top: 5;" type="submit" 
				onclick="checkPwCertify()">다음</button>
		</div>
	</div>
 </div>
</div>
</body>
</html>