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
<title>관리자 환불 관리 페이지</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		if(searchBy == null){
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}

		location.href = url;		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		if(searchBy == null){
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		if(searchBy == null){
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getRefundList.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}

		location.href = url;
	}
</script>
<script>
	function fn_refund(index) {
		if(confirm('확인을 누르면 해당 주문의 환불이 완료됩니다.\n정말 환불 처리를 완료하시겠습니까?')) {
			var form = document.refundForm;
			
			var length = form.order_detailCode.length;
			
			if(length>1) {
				var refund_price = form.refund_price[index];
				var order_code = form.order_code[index];
				var order_detailCode = form.order_detailCode[index];
				var order_usePoint = form.order_usePoint[index];
				var p_price = form.p_price[index];
				var refund_quantity = form.refund_quantity[index];
				var member_num = form.member_num[index];
				var p_code = form.p_code[index];
				var order_status = form.order_status[index];
			 }
			else{
				var refund_price = form.refund_price;
				var order_code = form.order_code;
				var order_detailCode = form.order_detailCode;
				var order_usePoint = form.order_usePoint;
				var p_price = form.p_price;
				var refund_quantity = form.refund_quantity;
				var member_num = form.member_num;
				var p_code = form.p_code;
				var order_status = form.order_status;
			 }
			 
			refund_price.disabled = false;
			order_code.disabled = false;
			order_detailCode.disabled = false;
			order_usePoint.disabled = false;
			p_price.disabled = false;
			refund_quantity.disabled = false;
			member_num.disabled = false;
			p_code.disabled = false;
			order_status.disabled = false;
			
			form.submit();
		}
		else{
			return false;
		}
	}
</script>
<body>
	<form name="refundForm" method="POST" action="${contextPath}/manager/modRefundStatus.do">
	<div class="col-md-5" style="float: center;">
		<h3>
			<b>환불 관리</b>
		</h3>
	</div><br><br>
	<span class="bd_example" style="float: right; margin-bottom: 30px;">
		<a href="${contextPath}/manager/getOrderList.do"><font style="color: #0078FF; font-size: 20px;">주문 관리</font></a>
	</span>
	<table class="table table-hover" style="margin-top: 10;">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>상세번호</th>
				<th>요청일자</th>
				<th>환불내역</th>
				<th>주문현황</th>
				<th>구매자책임</th>
				<th>판매자책임</th>
				<th>변경</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${refundList.size() == 0 && searchBy.length() != 0}">
			<tr>
				<td align="center" colspan="9">환불 검색 결과가 없습니다.</td>
			</tr>
		</c:if>
			<c:forEach items="${refundList}" var="item" varStatus="status">
			<tr>
				<td>${item.order_code}</td>
				<td>${item.order_detailCode}</td>
				<td><fmt:formatDate value="${item.order_date}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
				<td>
					주문자 : ${item.member_name}<br>
					주문자 휴대폰 : ${item.member_phone}<br>
					주문자 이메일 : ${item.member_email}<br>
					수령인 : ${item.address_recipent}<br><br>
					<img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}" alt="상품 이미지"><br>
					환불 상품명 (수량) : ${item.p_name}  (${item.order_quantity}개) <br>
						<c:choose>
						<c:when test="${item.order_usePoint != 0}">
							사용 포인트 : <fmt:formatNumber value="${item.p_price * item.order_quantity / 10}" pattern="###,###,###"/>원<br><br>
						</c:when>
						<c:otherwise>
							사용 포인트 : 0원<br><br>
						</c:otherwise>
					</c:choose>
					환불금액 : <fmt:formatNumber value="${item.order_totalPrice}" pattern="###,###,###"/>원
				</td>
				<td>${item.order_status}</td>
				<td>${item.buyer_reason}</td>
				<td>${item.seller_reason}</td>
				<td>
					<c:if test="${item.order_status.equals('환불요청')}">
						<button class="btn btn-danger" type="button" onClick="fn_refund(${status.index})">환불 완료</button>
					</c:if>
					<input type="hidden" name="refund_price" value="${item.order_totalPrice}" disabled/>
					<input type="hidden" name="order_code" value="${item.order_code}" disabled/>
					<input type="hidden" name="order_detailCode" value="${item.order_detailCode}" disabled/>
					<input type="hidden" name="order_usePoint" value="${item.order_usePoint}" disabled/>
					<input type="hidden" name="p_price" value="${item.p_price}" disabled/>
					<input type="hidden" name="refund_quantity" value="${item.order_quantity}" disabled/>
					<input type="hidden" name="member_num" value="${item.member_num}" disabled/>
					<input type="hidden" name="p_code" value="${item.p_code}" disabled/>
					<input type="hidden" name="order_status" value="${item.order_status}" disabled/>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<form method="GET" action="${contextPath}/manager/getSearchRefunds.do">
		<select style="height: 35px;" name="searchBy">
			<option value="member_name" <c:if test="${searchBy == 'member_name'}">selected</c:if>>주문자 이름</option>
			<option value="order_status" <c:if test="${searchBy == 'order_status'}">selected</c:if>>주문 현황</option>
			<option value="order_code" <c:if test="${searchBy == 'order_code'}">selected</c:if>>주문 번호</option>
			<option value="member_phone" <c:if test="${searchBy == 'member_phone'}">selected</c:if>>휴대폰 번호</option>
		</select>
		<input style="width: 300px; height: 35px;" type="text" name="searchContents"/>
		<input style="margin-bottom: 5px; height: 35px;" class="btn btn-primary btn-sm" type="submit" value="검색"/>
</form> <br>
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
</body>
</html>