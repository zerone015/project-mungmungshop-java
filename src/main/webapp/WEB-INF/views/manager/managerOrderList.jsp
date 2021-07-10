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
<title>관리자 주문 조회 페이지</title>
</head>
<script>
	function checkOrderList() {
		alert("배송 상태가 수정되었습니다")
	}
</script>
<body>
	<div class="col-md-5" style="float: center;">
		<h1>
			<b>주문 조회</b>
		</h1>
	</div>
	<hr>
	<form name="orderList" method="GET" action="#">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>주문내역</th>
					<th>배송 상태</th>
					<th>배송 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1521352153</td>
					<td>2021-06-15</td>
					<td>주문자:홍길동<br> 주문자 전화번호:010-1234-5678<br> 수령자:홍길동<br>
						수령자 전화번호:010-1234-5678<br> 주문상품명(수량):상품입니다(1)
					</td>
					<td><select class="form-select">
							<option value="">주문 취소</option>
							<option value="">입금 완료</option>
							<option value="">배송 준비중</option>
							<option value="">배송중</option>
							<option value="">배송 완료</option>
							<option value="">구매 확정</option>
							<option value="">환불 완료</option>
					</select></td>
					<td><button type="button" class="btn btn-outline-primary"
							onclick="checkOrderList()">배송 수정</button></td>
				</tr>
				<tr>
					<td>1521352153</td>
					<td>2021-06-15</td>
					<td>주문자:홍길동<br> 주문자 전화번호:010-1234-5678<br> 수령자:홍길동<br>
						수령자 전화번호:010-1234-5678<br> 주문상품명(수량):상품입니다(1)
					</td>
					<td><select class="form-select">
							<option value="">입금 취소</option>
							<option value="">입금 완료</option>
							<option value="">배송 준비중</option>
							<option value="">배송중</option>
							<option value="">배송 완료</option>
							<option value="">구매 확정</option>
					</select></td>
					<td><button type="button" class="btn btn-outline-primary"
							onclick="checkOrderList()">배송 수정</button></td>
				</tr>
				<tr>
					<td>1521352153</td>
					<td>2021-06-15</td>
					<td>주문자:홍길동<br> 주문자 전화번호:010-1234-5678<br> 수령자:홍길동<br>
						수령자 전화번호:010-1234-5678<br> 주문상품명(수량):상품입니다(1)
					</td>
					<td><select class="form-select">
							<option value="">입금 취소</option>
							<option value="">입금 완료</option>
							<option value="">배송 준비중</option>
							<option value="">배송중</option>
							<option value="">배송 완료</option>
							<option value="">구매 확정</option>
					</select></td>
					<td><button type="button" class="btn btn-outline-primary"
							onclick="checkOrderList()">배송 수정</button></td>
				</tr>
			</tbody>
		</table>
		<hr width="100%">
	</form>
</body>
</html>