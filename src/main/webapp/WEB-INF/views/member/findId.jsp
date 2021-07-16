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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<c:choose>
	<c:when test="${memberId=='notExists'}">
		<script>
			window.onload = function() {
				alert("입력하신 정보와 일치하는 아이디가 없습니다.다시 시도해주세요.");
			}
		</script>
	</c:when>
</c:choose>
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
</script>
<body>
	<h1 class="h3 mb-3 font-weight-normal">
		<font style="vertical-align: inherit;">아이디 찾기</font>
	</h1>
	<form method="POST" action="${contextPath}/member/resultId.do"
		name="findId">
		<table style="margin-left: auto; margin-right: auto;" width="45%">
			<tr align="center">
				<td>이 름 * <input type="text" name="member_name"
					placeholder="이름을 입력하세요." size="30"></td>
			</tr>
			<tr align="center">
				<td>이메일 * <input type="text" name="member_email"
					placeholder="이메일을 입력하세요." size="30"></td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-lg btn-primary btn-block" type="button"
						onclick="checkIdSelect()">
						<font style="vertical-align: inherit;">다음</font>
					</button>
				<td>
			</tr>
		</table>
	</form>
</body>
</html>