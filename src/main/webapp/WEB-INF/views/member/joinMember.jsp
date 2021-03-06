<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	td > b{
		font-size: 15px;
	}
	
	input[type="text"] {
		width: 400px; height: 50px; display:inline-block;
	}
	
	input[type="password"] {
		width: 400px; height: 50px; display:inline-block;
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
		document.userInfo.member_id.focus();
	}
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var code = "";
	var codeCheck = false;

	function inputIdChk() {
		document.userInfo.idDuplication.value = "idUncheck";
	}

	function inputNickChk() {
		document.userInfo.nickDuplication.value = "nickUncheck";
	}

	function fn_checkJoin() {
		var form = document.userInfo;

		var regExpId = /^[A-Za-z0-9+]*$/; // 영문,숫자만 사용 가능
		var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //8자이상 영문,슛자,특수문자 포함 필수
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //여
		var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/; //한글,영문만 사용 가능
		var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; //-포함 휴대폰 번호 형식
		var regExpNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/; //한글,영문,숫자만 사용 가능

		var idDuplication = form.idDuplication;
		var nickDuplication = form.nickDuplication;

		var id = form.member_id;
		var pw = form.member_pw;
		var checkPw = form.joinPwCheck;
		var email = form.member_email;
		var name = form.member_name;
		var nickName = form.member_nick;
		var phoneNumb = form.member_phone;
		var passcode = form.passcode;

		if (id.value == "") {
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}

		else if (!regExpId.test(id.value)) {
			alert("아이디는 영문,숫자만 사용 가능합니다.");
			id.select();
			return false;
		}

		else if (id.value.length < 5) {
			alert("아이디를 최소 5자 이상 입력해주세요.");
			id.select();
			return false;
		}

		else if (idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			pw.focus();
			return false;
		}

		else if (!regExpPw.test(pw.value)) {
			alert("비밀번호를 영문,슛자,특수문자 포함 8자 이상 입력해주세요.")
			pw.select();
			return false;
		}

		if (checkPw.value == "") {
			alert("비밀번호 확인을 입력해주세요.");
			checkPw.focus();
			return false;
		}

		else if (pw.value != checkPw.value) {
			alert("비밀번호가 비밀번호 확인과 일치하지 않습니다.");
			checkPw.select();
			return false;
		}

		if (email.value == "") {
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}

		else if (!regExpEmail.test(email.value)) {
			alert("이메일 형식이 잘못되었습니다. 다시 입력해주세요.");
			email.select();
			return false;
		}

		if (passcode.value == "") {
			alert("인증번호를 입력해주세요.");
			passcode.focus();
			return false;
		}

		if (name.value == "") {
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}

		else if (!regExpName.test(name.value)) {
			alert("이름은 한글,영문만 사용 가능합니다.");
			name.select();
			return false;
		}

		if (nickName.value == "") {
			alert("닉네임을 입력해주세요.");
			nickName.focus();
			return false;
		}

		else if (nickName.value.length < 2) {
			alert("닉네임을 최소 2글자 이상 입력해주세요.")
			nickName.select()
			return false;
		}

		else if (!regExpNickName.test(nickName.value)) {
			alert("닉네임은 한글,영문,숫자만 사용 가능합니다.")
			nickName.select()
			return false;

		}

		else if (nickDuplication.value != "nickCheck") {
			alert("닉네임 중복체크를 해주세요.");
			return false;
		}

		if (phoneNumb.value == "") {
			alert("휴대폰 번호를 입력해주세요.");
			phoneNumb.focus();
			return false;
		}

		else if (!regExpPhone.test(phoneNumb.value)) {
			alert("잘못된 휴대폰 번호 입니다. -를 포함한 숫자만 입력해주세요.");
			phoneNumb.select();
			return false;
		}

		if (codeCheck == false) {
			alert("이메일 인증을 완료해주세요.")
			return false;
		}

		form.submit();
	}

	function fn_idChk() {
		var form = document.userInfo;

		var id = form.member_id;
		var regExpId = /^[A-Za-z0-9+]*$/; // 영문,숫자만 사용 가능

		if (id.value == "") {
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}

		else if (!regExpId.test(id.value)) {
			alert("아이디는 영문,숫자만 사용 가능합니다.");
			id.select();
			return false;
		}

		else if (id.value.length < 5) {
			alert("아이디를 최소 5자 이상 입력해주세요.");
			id.select();
			return false;
		}

		else {
			$.ajax({
				url : "${contextPath}/member/idChk",
				type : "post",
				dataType : "json",
				data : {
					"member_id" : $("#Member_ID").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 아이디입니다.");
					} else if (data == 0) {
						$("#idChk").attr("value", "Y");
						document.userInfo.idDuplication.value = "idCheck";
						alert("사용 가능한 아이디입니다.");
					}
				}
			});
		}
	}

	function fn_nickChk() {
		var form = document.userInfo;

		var nickName = form.member_nick;
		var regExpNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/; //한글,영문,숫자만 사용 가능

		if (nickName.value == "") {
			alert("닉네임을 입력해주세요.");
			nickName.focus();
			return false;
		}

		else if (nickName.value.length < 2) {
			alert("닉네임을 최소 2글자 이상 입력해주세요.")
			nickName.select()
			return false;
		}

		else if (!regExpNickName.test(nickName.value)) {
			alert("닉네임은 한글,영문,숫자만 사용 가능합니다.")
			nickName.select()
			return false;

		}

		else {
			$.ajax({
				url : "${contextPath}/member/nickChk",
				type : "post",
				dataType : "json",
				data : {
					"member_nick" : $("#Member_Nick").val()
				},
				success : function(data) {
					if (data == 0) {
						$("#nickChk").attr("value", "Y");
						document.userInfo.nickDuplication.value = "nickCheck";
						alert("사용 가능한 닉네임입니다.");
						
					} else{
						alert("중복된 닉네임입니다.");	
					}
				}
			});
		}
	}

	function fn_mailSend() {
		var form = document.userInfo;
		
		var email = $("#mail_input").val();
		var checkBox = $("#mail_check_input");
		
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if (form.member_email.value == "") {
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
		
		if (!regExpEmail.test(form.member_email.value)) {
			alert("이메일 형식이 잘못되었습니다. 다시 입력해주세요.");
			form.member_email.select();
			return false;
		}
		
		$.ajax({

			type : "GET",
			url : "${contextPath}/mail/sendMailByJoin.do?email=" + email,
			success : function(data) {
				const checkNum = $.trim(data);
				if (checkNum == 0) {
					alert("해당 이메일로 더 이상 계정을 생성하실 수 없습니다.");
				}else{
					checkBox.attr("disabled", false);
					code = data;
					alert("입력하신 이메일로 인증번호를 전송했습니다.");
				}
			}
		});
	}

	function fn_codeCheck() {
		var inputCode = $("#mail_check_input").val();
		
		if (document.userInfo.passcode.value == "") {
			alert("인증번호를 입력해주세요.");
			passcode.focus();
		}
		
		if (inputCode == code) {
			codeCheck = true;
			alert("인증번호가 일치합니다.");
		} else {
			codeCheck = false;
			alert("인증번호가 일치하지 않습니다.");
		}
	}
</script>
<body>
	<div>
		<h4 style="margin-bottom: 60px;"><b>회원 가입</b></h4>
		<form method="POST" action="${contextPath}/member/addMember.do"
			name="userInfo">
			<table>
				<tr>
					<td><b>아이디</b><font>*</font></td>
					<td><input class="form-control" type="text" maxlength="11"
						placeholder="5~11자 이내 입력" name="member_id" id="Member_ID"
						onkeydown="inputIdChk()">
						<button style="margin-bottom: 5px; margin-left: 5px;" class="btn btn-outline-dark" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						<input type="hidden" name="idDuplication" value="idUncheck">
					</td>
				</tr>
				<tr>
					<td><b>비밀번호</b><font>*</font></td>
					<td><input class="form-control" type="password" maxlength="20"
						placeholder="영문,숫자,특수문자 포함 8자 이상" name="member_pw"></td>
				</tr>
				<tr>
					<td><b>비밀번호 확인</b><font>*</font></td>
					<td><input class="form-control" type="password" maxlength="20"
						placeholder="다시 한번 입력해주세요." name="joinPwCheck"></td>
				</tr>
				<tr>
					<td><b>이메일</b><font>*</font></td>
					<td><input class="form-control" type="text" maxlength="50"
						placeholder="@을 포함한 이메일 주소" id="mail_input" name="member_email">
						<button style="margin-bottom: 5px; margin-left: 5px;" class="btn btn-outline-dark" type="button" onclick="fn_mailSend();">인증번호 전송</button></td>
				</tr>
				<tr>
					<td><b>인증번호</b><font>*</font></td>
					<td><input class="form-control" type="text" maxlength="6"
						placeholder="인증번호를 입력하세요." id="mail_check_input" name="passcode"
						disabled="disabled">
						<button style="margin-bottom: 5px; margin-left: 5px;" class="btn btn-outline-dark" type="button" onclick="fn_codeCheck();">인증</button></td>

				</tr>
				<tr>
					<td><b>이름</b><font>*</font></td>
					<td><input class="form-control" type="text" maxlength="45" placeholder="이름"
						name="member_name"></td>
				</tr>
				<tr>
					<td><b>닉네임</b><font>*</font></td>
					<td><input class="form-control" type="text" maxlength="20" placeholder="닉네임"
						id="Member_Nick" name="member_nick" onkeydown="inputNickChk()">
						<button style="margin-bottom: 5px; margin-left: 5px;" class="btn btn-outline-dark" type="button" id="nickChk" onclick="fn_nickChk();"
							value="N">중복확인</button> <input type="hidden"
						name="nickDuplication" value="nickUncheck"></td>
				</tr>
				<tr>
					<td><b>휴대전화</b><font>*</font></td>
					<td><input class="form-control" type="text" placeholder="-를 포함한 휴대폰 번호"
						name="member_phone" /></td>
				</tr>
			</table>
			<br> <button class="btn btn-dark btn-lg" type="button" onclick="fn_checkJoin()">회원가입</button>
		</form>
	</div>
</body>
</html>