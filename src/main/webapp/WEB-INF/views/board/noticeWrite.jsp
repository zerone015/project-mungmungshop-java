<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>공지사항</title>

<style> input:focus, textarea:focus{     outline: none; } </style>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
	<form action="${contextPath}/noticeWrite.do" method="POST" name="noticeWrite" >
	<table class="table table-sm table-bordered" border="1" >
		<tr>
			<th style="background: #e6e6e6;">제목</th>
			<td colspan="3">
				<input type="text" id="notice_title" name="notice_title" style="width:100%; border: 0;" />
			</td>
		</tr>
		<tr>
			<th style="background: #e6e6e6;">작성자</th>
			<td>
				<input type="text" id = "notice_writer" name = "notice_writer" style="width:100%; border: 0;" value="${ID}" readonly />
			</td>
			<th style="background: #e6e6e6;">날짜</th>
			<td>
				<input type="text" id = "notice_date" name = "notice_date" value="<%=sf.format(nowTime)%>" style="width:100%;  border: 0;"  readonly>
			</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="notice_content" rows="10" style="width:100%; border: 0; resize: none;" 
		id="notice_content" name="notice_content">공지사항입니다.</textarea>
	<div class="bd-example" align="right">
		<button type="submit" class="btn btn-primary btn-lg">작성</button>
		<button type="reset" class="btn btn-outline-primary btn-lg">다시쓰기</button>
	</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>