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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>1:1 문의 목록</title>
<style>
	.secret {
		width: 20;
		height: 20;
	}
</style>	
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
	<div class = "container">
	<div class="col-md-7 col-lg-8" align="center">
		<h3 class="mb-3">1:1 문의 게시판</h3>
	</div>
	<div class="bd-example" align="right">
		<a href="${contextPath}/board/qnaWrite.do">
			<input class="btn btn-outline-dark" style="float: right; margin-bottom: 20px;" type="submit" value="글쓰기">
		</a>
	</div>
	<div class="table-responsive" style="margin-top:30;">
		<table class="table table-hover">
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
				    <tr>
				      <!-- 글번호 -->
				      <td class="center">${qnaVO.qna_no}</td>
				      
				      
				      <!-- 제목 -->
					  <c:choose>
					  	<c:when test="${qnaVO.qna_groupLayer == 0}">
					  		<td > <a href="${contextPath}/board/qnaView.do?qna_no=${qnaVO.qna_no}">
				      			${qnaVO.qna_title}</a></td>
					  	</c:when>
					  	<c:otherwise>
					  			<td style="text-indent: ${qnaVO.qna_groupLayer}em;"> <a href="${contextPath}/board/qnaView.do?qna_no=${qnaVO.qna_no}">
				      			<font> ㄴ[답변] ${qnaVO.qna_title}</font></a></td>
					  	</c:otherwise>
					  </c:choose>						      				   
				      <!-- 작성자 -->
				      <td class="center">${qnaVO.qna_writer}</td>
				      <!-- 작성일 --> 
				      <td class="center"><fmt:formatDate value="${qnaVO.qna_date}" pattern="YYYY-MM-dd"/></td>
				      <!-- 조회수 -->
				      <td class="center">${qnaVO.qna_hits}</td>
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