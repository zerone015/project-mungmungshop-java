<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="undefined" crossorigin="anonymous">
</head>
<script type="text/javascript">
function checkPwChange() {
	var form=document.pwChange;
	
	var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/   //8자이상 영문,슛자,특수문자 포함 필수
	
	var pw = form.pw;
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
		<form name="pwChange" method="GET" action="#">
		<div style="text-align: center;">
			<input class="form-control" style="width: 300; margin: 0 auto;"
				type="password" name="pw" placeholder="새로운 비밀번호를 입력해주세요" maxlength="15" /> 
			<input class="form-control" style="width: 300; margin: 0 auto; margin-top: 5;"
				type="password" name="checkPw" placeholder="비밀번호를 다시 한번 입력해주세요" maxlength="15" />
		</div>
		<div>
			<button class="btn btn-primary" style="width: 300; margin-top: 5;" type="button" 
				 onclick="checkPwChange()">다음</button>
		</div>
		</form>
	</div>
 </div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>