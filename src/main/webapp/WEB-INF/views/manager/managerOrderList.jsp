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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>관리자 주문 관리 페이지</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		if(searchBy == null){
			var url = "${contextPath}/manager/getOrderList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getOrderList.do";
			
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
			var url = "${contextPath}/manager/getOrderList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getOrderList.do";
			
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
			var url = "${contextPath}/manager/getOrderList.do";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		else {
			var url = "${contextPath}/manager/getOrderList.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}

		location.href = url;
	}
</script>
<body>
	<div class="col-md-5" style="float: center;">
		<h3>
			<b>주문 관리</b>
		</h3>
	</div><br><br>
	<span class="bd_example" style="float: right; margin-bottom: 30px;">
		<a href="${contextPath}/manager/getRefundList.do"><font style="color: #0078FF; font-size: 20px;">환불 관리</font></a>
	</span>
	<form name="orderList" method="GET" action="#">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상세번호</th>
					<th>주문일자</th>
					<th>주문내역</th>
					<th>결제방식</th>
					<th>주문현황</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>				
			<c:if test="${orderList.size() == 0 && searchBy.length() != 0}">
				<tr>
					<td align="center" colspan="7">주문 검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${orderList}" var="item">
				<tr>
					<td>${item.order_code}</td>
					<td>${item.order_detailCode}</td>
					<td><fmt:formatDate value="${item.order_date}" type="date" dateStyle="long"></fmt:formatDate></td>
					<td>
					주문자 : ${item.member_name}<br>
					주문자 휴대폰 : ${item.member_phone}<br>
					주문자 이메일 : ${item.member_email}<br>
					수령인 : ${item.address_recipent}<br><br>
					주문상품명 : ${item.p_name} <br>
					상품금액 (수량) : <fmt:formatNumber value="${item.p_price}" pattern="###,###,###"/>원 (${item.order_quantity}개)<br>
					<c:choose>
						<c:when test="${item.order_usePoint != 0}">
							사용 포인트 : -<fmt:formatNumber value="${item.p_price * item.order_quantity / 10}" pattern="###,###,###"/>원<br>
							적립 포인트 : +<fmt:formatNumber value="${item.p_price * item.order_quantity / 60}" pattern="###,###,###"/>원<br><br>
							<b>결제 금액 : <fmt:formatNumber value="${item.p_price * item.order_quantity - item.p_price * item.order_quantity / 10}" pattern="###,###,###"/>원</b>
						</c:when>
						<c:otherwise>
							사용 포인트 : -0원<br>
							적립 포인트 : +<fmt:formatNumber value="${item.p_price * item.order_quantity / 60}" pattern="###,###,###"/>원<br><br>
							<b>결제 금액 : <fmt:formatNumber value="${item.p_price * item.order_quantity}" pattern="###,###,###"/>원</b>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${item.order_method}</td>
					<td>${item.order_status}</td>
					<td><button class="btn btn-primary btn-sm" type="button" onClick="location.href='${contextPath}/manager/getOrderInfo.do?order_code=${item.order_code}'">상세 주문 내역</button></td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<hr width="100%">
	</form>
	<form method="GET" action="${contextPath}/manager/getSearchOrders.do">
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