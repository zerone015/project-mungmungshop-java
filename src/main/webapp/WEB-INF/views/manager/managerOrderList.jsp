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
					<th>회원번호</th>
					<th>주문일자</th>
					<th>주문내역</th>
					<th>결제방식</th>
					<th>배송 상태</th>
					<th>배송 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1521352153</td>
					<td>12</td>
					<td>2021-06-15</td>
					<td>주문자:홍길동<br> 주문자 전화번호:010-1234-5678<br> 수령자:홍길동<br>
						수령자 전화번호:010-1234-5678<br> 주문상품명(수량):상품입니다(1)<br>
						사용포인트:123원<br>
						적립포인트:123132원<br>
						총 결제금액:10000원
					</td>
					<td>신용카드</td>
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
			</tbody>
		</table>
		<hr width="100%">
	</form>
</body>
</html>