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
		width:100%; border: 0;
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
<div class="container">
	<form action="" method="POST" name="eventView" >
	<table class="table table-sm table-bordered" border="1" >
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" value="${event.event_title}" id="event_title" name="event_title" readonly/>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" id = "event_writer" name = "event_writer" value="${event.event_writer}" readonly/>
			</td>
			<th >날짜</th>
			<td>
				<input type="text" id = "event_date" name = "event_date" value="<fmt:formatDate value="${event.event_date}" pattern="YYYY-MM-dd"/>" readonly>
			</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="event_content" rows="10"  
		id="event_content" name="event_content" readonly>${event.event_content}</textarea>
	<div class="bd-example" align="center">
		
		<button class= "btn btn-outline-primary"
			type="submit" onclick="javascript: form.action='${contextPath}/board/eventList.do';">목록으로</button>
		
		<button class= "btn btn-outline-warning"
			type="submit" onclick="javascript: form.action='${contextPath}/board/eventMod.do?event_no=${event.event_no}';">수정</button>
		
		<button class= "btn btn-outline-danger"
			type="submit" onclick="javascript: form.action='${contextPath}/board/eventRemove.do?event_no=${event.event_no}';"">삭제</button>
		
	</div>
	</form>
	
	<hr width="100%">
	
</div>
</body>
</html>