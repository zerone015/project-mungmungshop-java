<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="email" value="${param.email }" />
<c:choose>
	<c:when test="${email=='notExists' }">
		<script>
			window.onload = function() {
				alert("입력하신 정보와 일치하는 계정이 없습니다. 다시 시도해주세요.");
				document.findPw.member_id.focus();
		}
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.onload = function() {
				document.findPw.member_id.focus();
			}
		</script>
	</c:otherwise>
</c:choose>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	function checkPwSelect() {
		var form = document.findPw;

		if (form.member_id.value == "") {
			alert("아이디를 입력해주세요.");
			form.member_id.focus();
			return false;
		}

		if (form.member_email.value == "") {
			alert("이메일을 입력해주세요.");
			form.member_email.focus();
			return false;
		}

		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	checkPwSelect();
        }
	}
</script>
<body>
<h1 class="h3 mb-3 font-weight-normal">
		 <font style="vertical-align: inherit;">비밀번호 찾기 </font>
</h1>
	<form name="findPw" method="POST" action="${contextPath}/mail/findPwCheck.do">
		<table style="margin-left: auto; margin-right: auto;" width="45%">
			<tr align="center">
				<td>
				아이디 * <input name="member_id" type="text" placeholder="아이디를 입력하세요." size="30" onkeyup="enterkey();">
				</td>
			</tr>
			<tr align="center">
				<td>
				이메일 * <input name="member_email" placeholder="이메일을 입력하세요." type="text" size="30" onkeyup="enterkey();">
				</td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-lg btn-primary btn-block" type="button"
						onclick="checkPwSelect()">
						 <font style="vertical-align: inherit;">확인</font>
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>