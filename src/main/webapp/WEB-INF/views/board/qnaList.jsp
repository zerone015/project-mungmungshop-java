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
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>1:1 문의 목록</title>

<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${contextPath}/board/qnaList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/board/qnaList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${contextPath}/board/qnaList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>

</head>


<body>
	<div class="col-md-7 col-lg-8" align="center">
		<h4 class="mb-3">1:1 문의 게시판</h4>
	</div>
	<div class="bd-example" align="right">
		<a href="${contextPath}/board/qnaWrite.do">
			<button type="button" class="btn btn-outline-primary" >글 작성</button>		
		</a>
	</div>
	<div class="table-responsive" style="margin-top:30;">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaList}" var="qnaVO">
					<c:if test="${qnaVO.qnaGroupLayer} = 0">
					    <tr>
					      <td>${qnaVO.qna_no}</td>
					      <td><a href="${contextPath}/board/qnaView.do?qna_no=${qnaVO.qna_no}">${qnaVO.qna_title}</a></td>
					      <td>${qnaVO.qna_writer}</td>
					      <td>${qnaVO.qna_date}</td>
					      <td>${qnaVO.qna_hits}</td>
					    </tr>
				    </c:if>
					<c:if test="${qnaVO.qnaGroupLayer} = 1">
					    <tr>
					      <td>${qnaVO.qna_no}</td>
					      <td><a href="${contextPath}/board/qnaView.do?qna_no=${qnaVO.qna_no}"> [답변]${qnaVO.qna_title}</a></td>
					      <td>${qnaVO.qna_writer}</td>
					      <td>${qnaVO.qna_date}</td>
					      <td>${qnaVO.qna_hits}</td>
					    </tr>
				    </c:if>
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
</body>
</html>