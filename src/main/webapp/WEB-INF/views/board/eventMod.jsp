<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>이벤트 글</title>
<script type="text/javascript">
function checkBoard() {
	var form=document.eventModify;		

	var title = form.event_title;
	var content = form.event_content;
	
	if (title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}
	if (content.value == "") {
		alert("내용을 입력해주세요.");
		content.focus();
		return false;
	}
	form.submit();
}
</script>
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
	<form name="eventModify" method="POST" action="${contextPath}/eventMod.do?event_no=${eventVO.event_no}">
		<table class="table table-sm table-bordered" border="1" >
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" value="${eventVO.event_title}" id="event_title" name="event_title" />
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" id = "event_writer" name = "event_writer" value="${eventVO.event_writer}" readonly/>
				</td>
				<th >날짜</th>
				<td>
					<input type="text" id = "event_date" name = "event_date" value="${eventVO.event_date}" readonly>
				</td>
			</tr>
		</table>
		<hr width="100%">
		<textarea name="event_content" rows="10"  
			id="event_content" name="event_content">${eventVO.event_content}</textarea>
		
		<div class="bd-example" align="center">
			<button type="button" class="btn btn-outline-primary" onclick="checkBoard()">작성</button>
			<button class= "btn btn-outline-danger"	type="button" onclick="javascript:history.back();">취소</button>
		</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>