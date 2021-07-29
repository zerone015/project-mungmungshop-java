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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<title>주문 내역 조회</title>
</head>
<script type="text/javascript">
	function checkCancle() {

		if (confirm('정말로 주문을 취소하시겠습니까?'))
			window.close();
	}
</script>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		
		var url = "${contextPath}/myPage/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		
		var url = "${contextPath}/myPage/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${contextPath}/myPage/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<body>
	<div>
		<h2 class="display-5 fw-bold" style="margin-bottom: 50px;">
			<b>주문 내역 조회</b>
		</h2>
	</div>

	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th>&nbsp;</th>
				<th>상품 정보</th>
				<th>주문 일자</th>
				<th>주문 번호</th>
				<th>상품 금액(수량)</th>
				<th>주문 상태</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${orderList}" var="item">
		<tr align="center">
				<td><img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}" style=" width: 80%; height: 80%;"/></td>
				<td><a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">${item.p_name}</a></td>
				<td><fmt:formatDate value="${item.order_date}" type="date" dateStyle="long"></fmt:formatDate></td>
				<td>${item.order_code}</td>
				<td>
				<fmt:formatNumber value="${item.p_price * item.order_quantity}" pattern="###,###,###"/>원<br>
				${item.order_quantity}개<br>
				총 주문금액 : <fmt:formatNumber value="${item.order_totalPrice}" pattern="###,###,###"/>원
				</td>
				<td>${item.order_status}</td>
				<td><button type="button" class="btn btn-primary btn-sm"
						onclick="checkCancle()">환불 요청</button> <button type="button" class="btn btn-primary btn-sm">교환 요청</button></td>
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
