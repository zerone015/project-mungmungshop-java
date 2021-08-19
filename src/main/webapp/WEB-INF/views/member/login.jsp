<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="result" value="${param.result }" />
	<c:if test="${not empty cookie.rememberId }">
		<c:set value="checked" var="checked" />
	</c:if>
	<c:choose>
		<c:when test="${result=='loginFailed' }">
		<script>
			window.onload = function() {
				var cookie = "${cookie.rememberId}";
				
				if(cookie){
					alert("아이디나 비밀번호가 틀립니다.다시 로그인 해주세요.");
					document.login.member_pw.focus();
				}
				else{
					alert("아이디나 비밀번호가 틀립니다.다시 로그인 해주세요.");
					document.login.member_id.focus();
				}
			}
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.onload = function() {
				var cookie = "${cookie.rememberId}";
				
				if(cookie){
					document.login.member_pw.focus();
				}
				else{
					document.login.member_id.focus();
				}
			}
		</script>
	</c:otherwise>
	</c:choose>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
	input[type="text"] {
		width: 400px; height: 50px; display:inline-block;
	}
	
	input[type="password"] {
		width: 400px; height: 50px; display:inline-block;
	}
</style>
</head>
<script type="text/javascript">
	function fn_checkLogin() {
		var form = document.login;

		if (form.member_id.value == "") {
			alert("아이디를 입력해주세요.");
			form.member_id.focus();
			return false;
		}
		if (form.member_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			form.member_pw.focus();
			return false;
		}

		form.submit();
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	 fn_checkLogin();
        }
}
</script>
  <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '${contextPath}/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  
  </script>
<body>
	<form id="login" name="login" method="POST"
		action="${contextPath}/member/login.do">
		<table style="border: 0; width: 400; align: center;">
			<tr align="center">
				<td><h4 style="margin-bottom: 50px; font-weight: bold;">로그인</h4></td>
			</tr>
			<tr align="center">
				<td><input style="margin-bottom: 15px;" class="form-control" type="text" name="member_id"
					value="${cookie.rememberId.value}" size="30" onkeyup="enterkey();"
					 placeholder="아이디 입력"></td>
			</tr>
			<tr align="center">
				<td><input class="form-control" type="password" name="member_pw" size="30" onkeyup="enterkey();"
					 placeholder="비밀번호 입력"></td>
			</tr>
			<tr align="left">
				<td><input style="margin-top: 15px;" type="checkbox" name="remember_userId" onkeyup="enterkey();"
					value="checked" ${checked}> 아이디 기억</td>
			</tr>
			<tr align="center">
				<td>
				<button class="btn btn-primary" type="button" onclick="fn_checkLogin();" style="width: 370; height: 60px; margin-top: 35px;">로그인</button>
				<div id="naver_id_login" style="text-align:center; margin-top: 15px;"><a href="${naver_url}"><img style="width: 370; height: 60px;" src="${contextPath}/download?imageFileName=btnG_완성형.png" alt="네이버 로그인 이미지"/></a></div>
				<div id="kakao_id_login" style="text-align: center"> <a href="#" onclick="kakaoLogin();"> <img style="width: 370; height: 70px; margin-top: 15px;" src="${contextPath}/download?imageFileName=kakao_login_medium_narrow.png" /></a> </div>
				</td>
			</tr>
		</table>
	</form>
	<div style="margin-top: 15px;">
		<a href="${contextPath}/findId.do">아이디 찾기</a> |
		<a href="${contextPath}/findPw.do">비밀번호 찾기</a>
	</div>
	<div style="margin-top: 15px;">
		<a href="${contextPath}/member/joinAgree.do"><font style="color: #0078FF;">회원가입</font></a>
	</div>
</body>
</html>