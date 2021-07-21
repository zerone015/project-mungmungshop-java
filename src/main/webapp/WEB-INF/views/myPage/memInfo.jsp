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
<style>
  .cls1 {
     font-size:40px;
     text-align:center;
   }
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<script type="text/javascript">
function checkinfoModify() {
	var form=document.infoModify;
	
	var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/; 				//한글,영어만 사용 가능
	var regExpNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;  		//한글,영어만 사용 가능
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
	
	var name = form.name
	var nickName = form.Nickname;
	var email = form.email;
	var phoneNumb = form.telNum;
	
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
	
	
	if (!(nickName.value == "") && nickName.value.length < 2) {  
		alert("닉네임을 최소 2글자 이상 입력해주세요.")
		nickName.select()
		return false;
	}
	    
	else if (!(nickName.value == "") && !(regExpNickName.test(nickName.value))) {  
	    alert("닉네임은 한글,영문으로만 사용 가능합니다.")
	    nickName.select()
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
</script>
<body>
 <h1 class="cls1">회원 정보 수정창</h1>
<form name="infoModify" method="post" action="#">
 <table align="center" >
   <tr>
     <td width="200"><p align="right" >아이디</td>
     <td width="400"><input   type="text" name="id" value="${memInfo.id}" readonly ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이름</td>
     <td width="400"><input   type="text" name="name" value="${memInfo.name}" maxlength="45" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >닉네임</td>
     <td width="400"><input   type="text" name="Nickname" value="${memInfo.Nickname}" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이메일</td>
     <td width="400"><input   type="text" name="email"  value="${memInfo.email}" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >휴대전화</td>
     <td width="400"><input   type="text" name="telNum" value="${memInfo.telNum}" ></td>
   </tr>
   <tr align="center" >
    <td colspan="2" width="400"><input type="button" value="수정하기" onclick="checkinfoModify()" >
    <h1></h1>
    <a href="">회원 탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;
   </tr>
 </table>
</form>
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>