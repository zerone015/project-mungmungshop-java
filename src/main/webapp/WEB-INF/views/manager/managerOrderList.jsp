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
<title>관리자 주문 조회 페이지</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${contextPath}/manager/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/manager/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

			var url = "${contextPath}/manager/getOrderList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<body>
	<div class="col-md-5" style="float: center;">
		<h3>
			<b>주문 조회</b>
		</h3>
	</div>
	<form name="orderList" method="GET" action="#">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문회원번호</th>
					<th>주문일자</th>
					<th>주문내역</th>
					<th>결제방식</th>
					<th>배송 상태</th>
					<th>배송 수정</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${orderList}" var="item">
				<tr>
					<td>${item.order_code}</td>
					<td>${item.member_num}</td>
					<td><fmt:formatDate value="${item.order_date}" type="date" dateStyle="long"></fmt:formatDate></td>
					<td>
					주문상품명(수량) : ${item.p_name}(${item.order_quantity}개)<br>
					총 상품 금액 : <fmt:formatNumber value="${item.p_price * item.order_quantity}" pattern="###,###,###"/>원<br>
					총 사용포인트 : <fmt:formatNumber value="${item.order_usePoint}" pattern="###,###,###"/>원<br>
					총 적립포인트 : <fmt:formatNumber value="${item.order_addPoint}" pattern="###,###,###"/>원<br>
					총 결제금액 : <fmt:formatNumber value="${item.order_totalPrice}" pattern="###,###,###"/>원
					</td>
					<td>${item.order_method}</td>
					<td><select class="form-select">
							<option value="">배송 준비중</option>
							<option value="">배송중</option>
							<option value="">배송 완료</option>
							<option value="">구매 확정</option>
							<option value="">환불 완료</option>
					</select></td>
					<td><button type="button" class="btn btn-outline-dark"
							onclick="checkOrderList()">배송 수정</button></td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<hr width="100%">
	</form>
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