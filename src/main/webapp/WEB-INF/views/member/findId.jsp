<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="memberId" value="${param.memberId }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<c:choose>
	<c:when test="${memberId=='notExists'}">
		<script>
			window.onload = function() {
				alert("입력하신 정보와 일치하는 아이디가 없습니다.다시 시도해주세요.");
				document.findId.member_name.focus();
			}
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.onload = function() {
				document.findId.member_name.focus();
			}
		</script>
	</c:otherwise>
</c:choose>
<style>
	input[type="text"] {
		width: 400px; height: 50px; display:inline-block;
	}
	td > font {
		color: red;
		font-weight: bold;
		margin-left: 2px;
	}
</style>
</head>
<script type="text/javascript">
	function checkIdSelect() {
		var form = document.findId;

		var name = form.member_name;
		var email = form.member_email;

		if (name.value == "") {
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}

		if (email.value == "") {
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}

		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	checkIdSelect();
        }
	}
</script>
<body>
	<h4 style="margin-bottom: 55px; margin-left: 38px;">
		<b>아이디 찾기</b>
	</h4>
	<form method="POST" action="${contextPath}/member/resultId.do"
		name="findId">
		<table>
			<tr align="center">
				<td><b style="font-size: 13px;">이 름</b><font>*</font><input style="margin-left: 12px; margin-bottom: 15px;" class="form-control" type="text" name="member_name"
					placeholder="이름을 입력하세요." size="30" onkeyup="enterkey();"></td>
			</tr>
			<tr align="center">
				<td><b style="font-size: 13px;">이메일</b><font style="margin-right: 7px;">*</font><input style="margin-right: 5px; margin-bottom: 15px;" class="form-control" type="text" name="member_email"
					placeholder="이메일을 입력하세요." size="30" onkeyup="enterkey();"></td>
			</tr>
			<tr align="center">
				<td>
					<button style="width: 400px; margin-left: 55px;" class="btn btn-lg btn-primary btn-block" type="button"
						onclick="checkIdSelect()">
						다음
					</button>
				<td>
			</tr>
		</table>
	</form>
</body>
</html>