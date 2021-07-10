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
<title>주문 내역 조회</title>
</head>
<script type="text/javascript">
	function checkCancle() {

		if (confirm('정말로 주문을 취소하시겠습니까?'))
			window.close();
	}
</script>
<body>
	<div>
		<h1 class="display-5 fw-bold">
			<b>주문 내역 조회</b>
		</h1>
	</div>

	<table class="table table-striped">

		<thead>
			<tr>
				<th>상품 정보</th>
				<th>주문 일자</th>
				<th>주문 번호</th>
				<th>주문 금액</th>
				<th>배송 현황</th>
				<th>주문 취소</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td><a href="#">상품명입니다</a></td>
				<td>2021-06-04</td>
				<td>12312312312</td>
				<td>20,000원</td>
				<td>배송 준비중</td>
				<td><button type="button" class="btn btn-primary btn-sm"
						onclick="checkCancle()">주문 취소</button></td>
			</tr>
			<tr>
				<td><a href="#">상품명입니다2</a></td>
				<td>2021-06-04</td>
				<td>12312312322</td>
				<td>30,000원</td>
				<td>배송 준비중</td>
				<td><button type="button" class="btn btn-primary btn-sm"
						onclick="checkCancle()">주문 취소</button></td>
			</tr>
			<tr>
				<td><a href="#">상품명입니다3</a></td>
				<td>2021-06-04</td>
				<td>12312312332</td>
				<td>40,000원</td>
				<td>배송 준비중</td>
				<td><button type="button" class="btn btn-primary btn-sm"
						onclick="checkCancle()">주문 취소</button></td>
			</tr>
		</tbody>
	</table>
	<hr width="100%">
</body>
</html>
