<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="java.sql.Timestamp"%>
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
<title>자주 묻는 질문 글</title>

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
	<form action="" method="POST" name="qnaView" >
	<table class="table table-sm table-bordered" border="1" >
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" value="${qnaVO.qna_title}" id="qna_title" name="qna_title" />
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" id = "qna_writer" name = "qna_writer" value="${qnaVO.qna_writer}" readonly />
			</td>
			<th >날짜</th>
			<td>
				<input type="text" id = "qna_date" name = "qna_date" value="<fmt:formatDate value="${qnaVO.qna_date}" pattern="YYYY-MM-dd"/>" readonly />
			</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="qna_content" rows="10"  
		id="qna_content" name="qna_content">${qnaVO.qna_content}</textarea>
	<div class="bd-example" align="center">
		
		<button class= "btn btn-outline-primary"
			type="submit" onclick="javascript: form.action='${contextPath}/board/qnaList.do';">목록으로</button>
		
		<button class= "btn btn-outline-warning"
			type="submit" onclick="javascript: form.action='${contextPath}/board/qnaMod.do?qna_no=${qnaVO.qna_no}';">수정</button>
			
		<button class= "btn btn-outline-dark"
			type="submit" onclick="javascript: form.action='${contextPath}/board/qnaReply.do?qna_no=${qnaVO.qna_no}';">답변</button>
		
		<button class= "btn btn-outline-danger"
			type="submit" onclick="javascript: form.action='${contextPath}/board/qnaRemove.do?qna_no=${qnaVO.qna_no}';">삭제</button>

	</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>