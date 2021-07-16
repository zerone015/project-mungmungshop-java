<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>관리자 상품 관리 페이지</title>
</head>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		
		var url = "${contextPath}/manager/managerProduct.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${contextPath}/manager/managerProduct.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		
		var url = "${contextPath}/manager/managerProduct.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<body>
<h1>
<b>상품 목록</b>
</h1>
<br>
<form method="GET" action="${contextPath}/managerProductAdd.do">	
<div class="bd-example" align="right">
		<button type="submit" class="btn btn-outline-primary btn-lg">상품 등록</button>
</div>
	<table class="table table-striped" style="margin-top: 10;">
		<thead>
			<tr>
				<th>상품 번호</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>판매가</th>
				<th>재고 수</th>
				<th>등록 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="products">
			<tr>
				<td>${products.p_code}</td>
				<td>
				<a href="${contextPath}/manager/managerProductInfo.do?p_code=${products.p_code}"><b>${products.p_name }</b></a>
				</td>
				<td>${products.p_cl1}-${products.p_cl2}</td>
				<td>
				<fmt:formatNumber value="${products.p_price }" pattern="###,###,###"/>원
				</td>
				<td>${products.p_stock}</td>
				<td><fmt:formatDate value="${products.p_date}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr width="100%">
	
	<!-- pagination{s} -->
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
	<!-- pagination{e} -->
</form>
</body>
</html>