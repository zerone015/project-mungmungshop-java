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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
				<input type="text" id="notice_title" name="notice_title" style="width:100%; border: 0;" placeholder="제목 입력" />
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
	<textarea name="notice_content" rows="10" style="width:100%; border: 0; resize: none;" placeholder="내용 입력"
		id="notice_content" name="notice_content"></textarea>
	<div class="bd-example" align="right">
		<button type="submit" class="btn btn-primary btn-lg">작성</button>
		<button type="reset" class="btn btn-outline-primary btn-lg">다시쓰기</button>
	</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>