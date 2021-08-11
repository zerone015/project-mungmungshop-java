<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import = "com.myspring.petshop.board.notice.vo.NoticeVO" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
 	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>공지사항 목록</title>
</head>
<body>
	<div>
	<h3 class="display-5 fw-bold">공지사항</h3>
	</div>
	<div class="table-responsive" style="margin-top:30;">
		<table class="table table-hover">
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
				<c:forEach items="${noticeList}" var="noticeVO">
				    <tr>
				      <td>${noticeVO.notice_no}</td>
				      <td><a href="${contextPath}/board/noticeView.do?notice_no=${noticeVO.notice_no}">${noticeVO.notice_title}</a></td>
				      <td>${noticeVO.notice_writer}</td>
				      <td>${noticeVO.notice_date}</td>
				      <td>${noticeVO.notice_hits}</td>
				    </tr>
				</c:forEach>					
			</tbody>
		</table>	
	</div>
		
		<c:if test="${manager == 1}">
					<form action="${contextPath}/board/noticeWrite.do" method="GET">
						<input class="btn btn-outline-dark" type="submit" value="글 작성">
					</form>
				</c:if>	
</body>
</html>