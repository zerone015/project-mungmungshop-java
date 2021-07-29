<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>이벤트 목록</title>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${contextPath}/board/eventList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/board/eventList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${contextPath}/board/eventList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>

</head>
<body>
<div class="container">
	<div>
	<h3 class="mb-3">이벤트</h3>
	<c:if test="${manager == 1}">
		<form action="${contextPath}/board/eventWrite.do" method="GET">
			<input class="btn btn-outline-dark" style="float: right; margin-bottom: 20px;" type="submit" value="글쓰기">
		</form>
	</c:if>
	</div>
	<div class="table-responsive" style="margin-top:30;">
			<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${eventList}" var="eventVO" varStatus="status">
				    <tr>
				      <td>${eventVO.event_no}</td>
				      <td><a href="${contextPath}/board/eventView.do?event_no=${eventVO.event_no}">${eventVO.event_title}</a></td>
				      <td>${eventVO.event_writer}</td>
				      <td><fmt:formatDate value="${eventVO.event_date}" pattern="YYYY-MM-dd"/></td>
				      <td>${eventVO.event_hits}</td>
				    </tr>
				</c:forEach>							
			</tbody>
		</table>
		<!-- pagination{s} -->
		<div style="">
			<ul class="pagination" style="width: 0%; justify-content:center;">
				<c:if test="${pagination.prev}">
					<li class="page-item">
						<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item">
						<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->
		
	</div>
</div>
</body>
</html>