<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<meta charset="utf-8">
<title>공지사항 수정 글</title>

<style>
input:focus, textarea:focus {
	outline: none;
}

input {
	width: 100%;
	border: 0;
}

textarea {
	width: 100%;
	border: 0;
	resize: none;
}

th {
	background: #e6e6e6;
}
</style>

</head>
<body>
	<form name="noticeModify" method="POST"
		action="${contextPath}/noticeMod.do?notice_no=${noticeVO.notice_no}">
		<table class="table table-sm table-bordered" border="1">

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text"
					value="${noticeVO.notice_title}" id="notice_subject"
					name="notice_title" /></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td><input type="text" id="notice_author" name="notice_author"
					value="${noticeVO.notice_writer}" readonly /></td>
				<th>날짜</th>
				<td><input type="text" id="notice_days" name="notice_date"
					value="<%=sf.format(nowTime)%>" readonly /></td>
			</tr>
		</table>
		<hr width="100%">
		<textarea rows="10" id="notice_contents" name="notice_content"> ${noticeVO.notice_content }"</textarea>
		
		<div class="bd-example" align="center">
			<button class= "btn btn-outline-primary" type="submit">수정</button>
			<button class="btn btn-outline-danger" type="button" 
					onclick="javascript:history.back();">취소</button>
		</div>
	</form>
	
	<hr width="100%">

</body>
</html>