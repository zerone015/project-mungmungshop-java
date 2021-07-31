<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderVO" value="${orderMap.orderVO}" />
<c:set var="orderDetailList" value="${orderMap.orderDetailList}" />
<c:set var="deliveryVO" value="${orderMap.deliveryVO}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<title>관리자 주문 관리 상세 페이지</title>
<style>
.paymentHr {
		border:solid 1px gray;
	}
</style>
</head>
<script>
function modOrderStatus(index) {
	if(confirm("정말 주문 상태를 변경하시겠습니까?")){
		document.orderForm[index].submit();
	}
	else{
		return false;
	}	
}

</script>
<body>
	<div class="col-md-5" style="float: center;">
		<h3>
			<b>주문 상세</b><br>
		</h3>
		<h4>
			주문번호 : ${orderVO.order_code}
		</h4>
	</div><br><br>
	<hr class="paymentHr">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>주문번호</th>
					<th>상품명</th>
					<th>개당 가격</th>
					<th>구매 수량</th>
					<th>합계</th>
					<th>주문 현황</th>
					<th>상태 변경</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${orderDetailList}" var="item" varStatus="status">
				<tr>
					<td><img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}" alt="상품 이미지" /></td>
					<td>${item.order_code}</td>
					<td><a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}"><b>${item.p_name}</b></a></td>
					<td><fmt:formatNumber value="${item.p_price}" pattern="###,###,###"/>원</td>
					<td>${item.order_quantity}개</td>
					<td><fmt:formatNumber value="${item.p_price * item.order_quantity}" pattern="###,###,###"/>원</td>
					<td>${item.order_status}</td>
					<td>
					<form name="orderForm" method="POST" action="${contextPath}/manager/modOrderStatus.do">
						<select class="form-select" name="order_status">
							<option value="결제완료">결제완료</option>
							<option value="배송준비중">배송준비중</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
							<option value="구매확정">구매확정</option>
							<option value="환불완료">환불완료</option>
						</select>
						<input type="hidden" name="order_detailCode" value="${item.order_detailCode}"/>
						<input type="hidden" name="order_code" value="${item.order_code}"/>
						<button type="button" class="btn btn-outline-dark"
							onclick="modOrderStatus(${status.count - 1})">상태 수정</button>
						</form>
					</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<hr class="paymentHr"><br><br>
			<div class="col-md-5" style="float: center;">
		<h3>
			<b>배송 정보</b>
		</h3>
	</div><br><br>
	<table class="table table-hover">
		<thead>
		 <tr>
			<th>수령인</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>배송 요청사항</th>	
		 </tr>
		</thead>
		<tbody>
		 <tr>
			<td>${deliveryVO.deli_name}</td>
			<td>${deliveryVO.deli_tel}</td>
			<td>${deliveryVO.deli_address1} ${deliveryVO.deli_address2} ${deliveryVO.deli_address3}</td>
			<td>${deliveryVO.deli_request}</td>
		 </tr>
		</tbody>
	</table>
	<hr class="paymentHr"><br><br>
		<div class="col-md-5" style="float: center;">
		<h3>
			<b>결제 정보</b>
		</h3>
	</div><br><br>
	<table class="table table-hover">
		<thead>
		 <tr>
		 	<th>회원번호</th>
		 	<th>주문자 이름</th>
		 	<th>주문자 휴대폰</th>
		 	<th>주문자 이메일</th>
			<th>할인 포인트</th>
			<th>적립 포인트</th>
			<th>총 구매수량</th>
			<th>총 결제금액</th>	
		 </tr>
		</thead>
		<tbody>
		 <tr>
		 	<td>${orderVO.member_num}</td>
		 	<td>${orderVO.member_name}</td>
		 	<td>${orderVO.member_phone}</td>
		 	<td>${orderVO.member_email}</td>
			<td><fmt:formatNumber value="${orderVO.order_usePoint}" pattern="###,###,###"/>원</td>
			<td><fmt:formatNumber value="${orderVO.order_addPoint}" pattern="###,###,###"/>원</td>
			<td>${orderVO.order_totalQuantity}</td>
			<td><b style="font-size: 20px;"><fmt:formatNumber value="${orderVO.order_totalPrice}" pattern="###,###,###"/>원</b></td>
		 </tr>
		</tbody>
	</table>
</body>
</html>