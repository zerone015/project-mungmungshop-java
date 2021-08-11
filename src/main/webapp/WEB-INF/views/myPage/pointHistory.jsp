<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>포인트 내역</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		
		var url = "${contextPath}/myPage/getPointHistory.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		
		var url = "${contextPath}/myPage/getPointHistory.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${contextPath}/myPage/getPointHistory.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<body>
	<div>
		<h2 class="display-5 fw-bold" style="margin-bottom: 50px;">
			<b>포인트 내역</b>
		</h2>
	</div>
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th>상태</th>
				<th>적립금</th>
				<th>적립 내용</th>
				<th>주문 번호</th>
				<th>적용 일시</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${phList.size() == 0}">
			<tr>
				<td align="center" colspan="5">포인트 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${phList}" var="item" varStatus="status" >
			<tr align="center">
				<td><font style="color:red;"><b>${item.point_status}</b></font></td>
				<c:choose>
					<c:when test="${item.point_status.equals('적립')}">
						<td>+<fmt:formatNumber value="${item.point_value}" pattern="###,###,###"/>원</td>
					</c:when>
					<c:otherwise>
						<td>-<fmt:formatNumber value="${item.point_value}" pattern="###,###,###"/>원</td>
					</c:otherwise>
				</c:choose>
				<td>${item.point_contents}</td>
				<td>${item.order_code}</td>
				<td><fmt:formatDate value="${item.point_date}" type="date" dateStyle="long"></fmt:formatDate></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr width="100%">
	<!-- pagination{s} -->
	<div style="">
		<ul class="pagination" style="width: 0%; justify-content: center;">
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
</body>
</html>
