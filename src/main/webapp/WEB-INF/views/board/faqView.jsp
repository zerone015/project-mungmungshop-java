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
	<form action="" method="POST" name="faqView" >
	<table class="table table-sm table-bordered" border="1" >
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" value="${faqVO.faq_title}" id="faq_title" name="faq_title" readonly/>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" id = "faq_writer" name = "faq_writer" value="${faqVO.faq_writer}" readonly/>
			</td>
			<th >날짜</th>
			<td>
				<input type="text" id = "faq_date" name = "faq_date" value="${faqVO.faq_date}"  readonly>
			</td>
		</tr>
	</table>
	<hr width="100%">
	<textarea name="faq_content" rows="10"  
		id="faq_content" name="faq_content" readonly>${faqVO.faq_content}</textarea>
	<div class="bd-example" align="center">
		
		<button class= "btn btn-outline-primary"
			type="submit" onclick="javascript: form.action='${contextPath}/board/faqList.do';">목록으로</button>
		
		<button class= "btn btn-outline-warning"
			type="submit" onclick="javascript: form.action='${contextPath}/board/faqMod.do?faq_no=${faqVO.faq_no}';">수정</button>
		
		<button class= "btn btn-outline-danger"
			type="submit" onclick="javascript: form.action='${contextPath}/board/faqRemove.do?faq_no=${faqVO.faq_no}';"">삭제</button>
		
	</div>
	</form>
	
	<hr width="100%">
	
	
</body>
</html>