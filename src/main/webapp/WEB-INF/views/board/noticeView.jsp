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
<title>이벤트 글</title>

<style> 
	input:focus, textarea:focus {     
		outline: none; 
	} 
	input {
		border: 0;
	}
	
	textarea {
		width:100%; border: 0; 
		resize: none;
	}
	th {
		background: #e6e6e6;
	}
</style>

</head>
<body>
	<form action="${contextPath}/board/noticeView.do" method="GET" name="noticeWrite" >
	<table class="table table-sm table-bordered" border="1" >
		<tr>
			<th>제목</th>
			<td colspan="5">
				<input type="text" value="${noticeVO.notice_title}" id="notice_title" name="notice_title" readonly/>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" id = "notice_writer" name = "notice_writer" value="${noticeVO.notice_writer}" readonly/>
			</td>
			<th >날짜</th>
			<td>
				<input type="text" id = "notice_date" name = "notice_date" value="${noticeVO.notice_date}"  readonly>
			</td>
			<th> 조회수</th>
			<td>
				<input type="text" id = "notice_hits" name = "notice_hits" value="${noticeVO.notice_hits}" readonly>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="notice_content" rows="10"  
		id="notice_content" name="notice_content" readonly>${noticeVO.notice_content}</textarea>
	<div class="bd-example" align="center">
		
		<font class="btn btn-primary btn-lg" ><a style="color: white!important;"
			 href="${contextPath}/board/noticeList.do">목록</a>
		</font>
		
	
			 <c:if test="${manager == 1}">
				<font class="btn btn-warning btn-lg" ><a style="color: white!important;"
			 	href="${contextPath}/board/noticeMod.do?notice_no=${noticeVO.notice_no}">수정</a>
				</font>
				<font class="btn btn-danger btn-lg"><a style="color: white!important;"
				href="${contextPath}/board/noticeRemove.do?notice_no=${noticeVO.notice_no}">삭제</a>
				</font>
			</c:if>
	</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>