<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderVO" value="${orderMap.orderVO}" />
<c:set var="orderDetailList" value="${orderMap.orderDetailList}" />
<c:set var="deliveryVO" value="${orderMap.deliveryVO}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>관리자 회원 관리 상세 페이지</title>
<style>
.paymentHr {
		border:solid 1px gray;
	}
	
tr { display: block; float: left; }
td, th { display: block; }
</style>
</head>
<script>
function member_kickOut(member_num,id) {
	if(confirm("정말 '"+id+ "' 회원을 회원탈퇴 시키시겠습니까?\n\n"+"확인을 누르면 해당 회원이 회원탈퇴 됩니다.")){
		$.ajax({
			url : "${contextPath}/manager/removeMembers.do",
			type : "POST",
			data : {member_num : member_num},
			success: function(data) {
				if(data == "remove_success"){
					alert("해당 회원이 회원탈퇴 되었습니다.");
					location.href = "${contextPath}/manager/getMembersList.do";
				}
				else {
					alert("시도 실패");
				}
			},
			error : function(data, textStatus) {
				 alert("에러"+data);
			}
		});
	}
	else{
		return false;
	}
}

function manager_grant(member_num,id) {
	if(confirm("관리자로 지정할 회원의 아이디는 '"+id+"' 입니다.\n\n"+"해당 회원을 관리자로 지정하시겠습니까?")){
		$.ajax({
			url : "${contextPath}/manager/modMemberGrant.do",
			type : "POST",
			data : {member_num : member_num},
			success: function(data) {
				if(data == "grant_success"){
					alert(id+" 회원을 관리자로 지정하였습니다.");
					location.href = "${contextPath}/manager/getMembersList.do";
				}
				else {
					alert("해당 회원은 이미 관리자입니다.");
				}
			},
			error : function(data, textStatus) {
				alert("에러"+data);
			}
		});
	}
	else{
		return false;
	}
}

function manager_revoke(member_num,id) {
	if(confirm("관리자 권한을 회수할 회원의 아이디는 '"+id+"' 입니다.\n\n"+"해당 회원의 관리자 권한을 회수하시겠습니까?")){
		$.ajax({
			url : "${contextPath}/manager/modMemberRevoke.do",
			type : "POST",
			data : {member_num : member_num},
			success: function(data) {
				if(data == "revoke_success"){
					alert(id+" 회원의 관리자 권한을 회수했습니다.");
					location.href = "${contextPath}/manager/getMembersList.do";
				}
				else {
					alert("해당 회원은 이미 관리자가 아닙니다.");
				}
			},
			error : function(data, textStatus) {
				alert("에러"+data);
			}
		});
	}
	else {
		return false;
	}
}

</script>
<body>
<form name="modForm" method="POST" action="${contextPath}/manager/modMemberForm.do">
	<div class="col-md-5" style="float: center;">
		<h3>
			<b>회원 정보</b><br>
		</h3>
	</div><br><br>
	<div align="right" style="margin-bottom:20px;">
		<input type="submit" class="btn btn-info" value="회원정보수정"/>
	</div>
		<table class="table table-hover">
			<tr style="width:30%;">
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>휴대폰</th>
				<th>가입일</th>
				<th>최근접속</th>
				<th>포인트</th>
				<th>로그인</th>
				<th>유형</th>
			</tr>
			<tr style="width:70%;">
				<td>${memberVO.member_num}</td>
				<td>${memberVO.member_name}</td>
				<td>${memberVO.member_id}</td>
				<td>${memberVO.member_nick}</td>
				<td>${memberVO.member_email}</td>
				<td>${memberVO.member_phone}</td>
				<td><fmt:formatDate value="${memberVO.member_joindate}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
				<td><fmt:formatDate value="${memberVO.member_logindate}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
				<td><fmt:formatNumber value="${memberVO.member_point}" pattern="###,###,###"/>원</td>
				<td>${memberVO.member_type} 로그인</td>
				<td>
					<c:choose>
						<c:when test="${memberVO.member_manager == 1}">
							<font style="color:red;">관리자</font>
						</c:when>
						<c:otherwise>
							<font style="color:blue;">일반 회원</font>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<input type="hidden" name="member_num" value="${memberVO.member_num}"/>
</form>
<div align="center">		
	<button class="btn btn-primary" type="button" onclick="manager_grant(${memberVO.member_num},'${memberVO.member_id}');"><font style="color:white;">관리자 지정</font></button>
	<button class="btn btn-secondary" type="button" onclick="manager_revoke(${memberVO.member_num},'${memberVO.member_id}');"><font style="color:white;">관리자 회수</font></button>
	<button class="btn btn-danger" type="button" onclick="member_kickOut(${memberVO.member_num},'${memberVO.member_id}');"><font style="color:white;">강제 탈퇴</font></button>
</div>
</body>
</html>