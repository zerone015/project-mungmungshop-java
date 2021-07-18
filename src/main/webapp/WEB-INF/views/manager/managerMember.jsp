<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>관리자 회원 목록 페이지</title>
<style>
	.container {
	width: 100%;
	padding: 5px;
	margin: 0px auto;
	text-align: center;
	border: 0px solid #bcbcbc;
	}
	
	.content {
		width: 100%;
		margin-right: 5px;
		/* float: left; */
		border: 0px solid #bcbcbc;
	}
	table {
		font-size: 14px;
		text-align: center;
	}
	
	thead {
		font-weight: bold;
	}
</style>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		
		var url = "${contextPath}/manager/getMembersList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${contextPath}/manager/getMembersList.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		
		var url = "${contextPath}/manager/getMembersList.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
	
	function member_kickOut(member_num,id) {
		if(confirm("정말 '"+id+ "' 회원을 회원탈퇴 시키시겠습니까?\n\n"+"확인을 누르면 해당 회원이 강제로 회원탈퇴 됩니다.")){
			$.ajax({
				url : "${contextPath}/manager/removeMembers.do",
				type : "POST",
				data : {member_num : member_num},
				success: function(data) {
					if(data == "remove_success"){
						alert("해당 회원이 회원탈퇴 되었습니다.");
						$("#content").load("${contextPath}/manager/getMembersList.do .content");
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
		if(confirm("관리자로 지정할 회원의 아이디는 '"+id+"' 입니다.\n\n"+"정말 해당 회원을 관리자로 지정하시겠습니까?\n\n"+"잘못 지정할 경우 막대한 피해를 입을 수 있습니다.")){
			$.ajax({
				url : "${contextPath}/manager/modMemberGrant.do",
				type : "POST",
				data : {member_num : member_num},
				success: function(data) {
					if(data == "grant_success"){
						alert(id+" 회원을 관리자로 지정하였습니다.");
						$("#content").load("${contextPath}/manager/getMembersList.do .content");
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
		if(confirm("관리자 권한을 회수할 회원의 아이디는 '"+id+"' 입니다.\n\n"+"정말 해당 회원의 관리자 권한을 회수하시겠습니까?")){
			$.ajax({
				url : "${contextPath}/manager/modMemberRevoke.do",
				type : "POST",
				data : {member_num : member_num},
				success: function(data) {
					if(data == "revoke_success"){
						alert(id+" 회원의 관리자 권한을 회수했습니다.");
						$("#content").load("${contextPath}/manager/getMembersList.do .content");
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
<div class="content">
	<div class="container">
<h1>
<b>회원 목록</b>
</h1>
<br>
	<table class="table table-sm table-bordered">
		<thead>
			<tr>
				<td>회원 번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>휴대폰 번호</td>
				<td>이메일</td>
				<td style="width: 280px">가입 날짜</td>
				<td style="width: 280px">최근 접속 날짜</td>
				<td>관리자 여부</td>
				<td style="width: 280px">관리 하기</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${members}" var="members">
			<tr>
				<td>${members.member_num}</td>
				<td>${members.member_id}</td>
				<td>${members.member_name}</td>
				<td>${members.member_nick}</td>
				<td>${members.member_phone}</td>
				<td>${members.member_email}</td>
				<td><fmt:formatDate value="${members.member_joindate}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
				<td><fmt:formatDate value="${members.member_logindate}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
				<c:choose>
					<c:when test="${members.member_manager == 1}">
						<td><font style="color: red">관리자</font></td>
					</c:when>
					<c:otherwise>
						<td><font style="color: blue">일반 회원</font></td>
					</c:otherwise>
				</c:choose>
				<td>
				<c:choose>
					<c:when test="${members.member_id == 'manager' }">
						<font style="color: red">해당 아이디는 권한 회수 및 삭제 불가</font>
					</c:when>
					<c:otherwise>
						<button class="btn btn-primary" type="button" onclick="manager_grant(${members.member_num},'${members.member_id}');"><font style="font-size: 11px">관리자 지정</font></button>
						<button class="btn btn-secondary" type="button" onclick="manager_revoke(${members.member_num},'${members.member_id}');"><font style="font-size: 11px">관리자 회수</font></button>
						<button class="btn btn-danger" type="button" onclick="member_kickOut(${members.member_num},'${members.member_id}');"><font style="font-size: 11px">강제 탈퇴</font></button>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- pagination{s} -->
		<ul class="pagination" style="width: 0%; justify-content: center;">
			<c:if test="${pagination.prev}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
				</li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
				</li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
				</li>
			</c:if>
		</ul>
	<!-- pagination{e} -->
	</div>
</div>
</body>
</html>