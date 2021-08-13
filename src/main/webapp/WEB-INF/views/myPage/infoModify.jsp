<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정창</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
function inputNickChk() {
	document.infoModify.nickDuplication.value = "nickUncheck";
}

function checkinfoModify() {
	var form=document.infoModify;
	
	var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/; 				//한글,영어만 사용 가능
	var regExpNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;  		//한글,영어만 사용 가능
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
	
	var name = form.member_name;
	var nickName = form.member_nick;
	var email = form.member_email;
	var phoneNumb = form.member_phone;
	var nickDuplication = form.nickDuplication;
	
	if (name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	
	else if (!regExpName.test(name.value)) {
		alert("이름은 한글,영문으로만 입력 가능합니다.");
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
	
	
	
	form.submit();
}

function fn_nickChk() {
	var form = document.infoModify;

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
				"member_nick" : $("#member_nick").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 닉네임입니다.");
				} else if (data == 0) {
					$("#nickChk").attr("value", "Y");
					document.infoModify.nickDuplication.value = "nickCheck";
					alert("사용 가능한 닉네임입니다.");
				}
			}
		})
	}
}
</script>
<style>
	.infoDiv {
		width: 500px;
	    height: 40px;
	    display: flex;
	    font-size: 16px;
	    line-height: 40px;
	    margin-top: 10px;
	    margin-left: 30;
	}
	.infoDiv font {
		height: 40px;
		width: 80px;
		margin: 5px;
	}
	.infoDiv input {
		height: 40px;
		width: 300px;
		vertical-align: middle;
	}
	#nickChk {
		margin-left: 10px;
	}
	.infoBtn {
		margin: 50 0 0 0;
	}
	.info {
		width: 500px;   		
	}
</style>
<body>
 <h4><b>회원 정보 수정</b></h4><br><br>
<form name="infoModify" method="post" action="${contextPath}/myPage/modifyInfo.do" >
	<div align="center" class="info">
	   <div class="infoDiv">
	     <font >아이디</font>
		 <input class="form-control" type="text" name="member_id" value="${memberVO.member_id}" readonly >
		</div>
	   <div class="infoDiv">
	     <font>이름</font>
	     <input class="form-control" type="text" name="member_name" value="${memberVO.member_name}" maxlength="45" >
	   </div>
	   <div class="infoDiv">
	     <font>닉네임</font>
	     <input class="form-control" type="text" id="member_nick" name="member_nick" value="${memberVO.member_nick}" onkeydown="inputNickChk()"  maxlength="20" >	
	   
	   	 <button class="btn btn-outline-dark" type="button" id="nickChk" onclick="fn_nickChk();"value="N">중복확인</button>
	     <input type="hidden" name="nickDuplication" value="nickUncheck">
	   </div>
	   <div class="infoDiv">
	     <font>이메일</font>
	     <input class="form-control" type="text" name="member_email"  value="${memberVO.member_email}" maxlength="50" readonly>
	   </div>
	   <div class="infoDiv">
	     <font>휴대전화</font>
	     <input class="form-control" type="text" name="member_phone" value="${memberVO.member_phone}" >
	   </div>
	   <div class="infoBtn" align="center" >
	     <button class="btn btn-outline-dark" type="button"  onclick="checkinfoModify();" > 수정하기 </button>
	 	 <button class="btn btn-outline-danger " type="button" onclick="location.href='${contextPath}/myPage/quit.do'">회원탈퇴</button>
	  </div>
  </div>
</form>
</body>
</html>