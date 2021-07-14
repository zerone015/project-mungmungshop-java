<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>자주 묻는 질문 목록</title>
</head> 
<body>
	<div>
	<h1 class="display-5 fw-bold">자주 묻는 질문</h1>
	<a href="#">
		<button class="btn btn-outline-dark" style="float: right;margin-bottom: 20px;margin-left: 10;">1:1 문의내역</button>
	</a>
	<a href="${contextPath }/board/faqWrite.do">
		<button class="btn btn-outline-dark" style="float: right;margin-bottom: 20px;">1:1 문의하기</button>
	</a>
	</div>
	<div class="table-responsive" style="margin-top:30;">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${faqList}" var="faqVO">
				    <tr>
				      <td>${faqVO.faq_no}</td>
				      <td><a href="${contextPath}/board/faqView.do?faq_no=${faqVO.faq_no}">${faqVO.faq_title}</a></td>
				      <td>${faqVO.faq_writer}</td>
				      <td>${faqVO.faq_date}</td>
				      <td>${faqVO.faq_hits}</td>
				    </tr>
				</c:forEach>							
			</tbody>
		</table>
		
	</div>
</body>
</html>