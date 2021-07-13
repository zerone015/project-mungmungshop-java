<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myProductsList" value="${cartMap.myProductsList}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>장바구니</title>
</head>
<script>
function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes = document.querySelectorAll('input[name="productCheck"]');
  // 선택된 체크박스
  const checked = document.querySelectorAll('input[name="productCheck"]:checked');
  // select all 체크박스
  const selectAll = document.querySelector('input[name="selectall"]');
  
  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll)  {
  const checkboxes = document.getElementsByName('productCheck');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

function buyCheck() {
	var check=document.cartForm.productCheck;
	var num=0;
	
	for(var i=0; i<check.length; i++) {
		if (check[i].checked) {
			num++;
		}
	}
	if(!num){
		alert("구매하실 상품을 선택해주세요.")
		return false;
		}
}

function delCheck() {
	var check=document.cartForm.productCheck;
	var num=0;
	
	for(var i=0; i<check.length; i++) {
		if (check[i].checked) {
			num++;
		}
	}
	if(!num){
		alert("삭제하려는 상품을 선택해주세요.")
		return false;
		}
}
</script>
<body>
	<div>
		<h1 class="display-5 fw-bold">장바구니</h1>
	</div>

	<form name="cartForm" method="GET" action="">
		<table class="table table-striped">

			<thead>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;<input type="checkbox"
						class="form-check-input" id="same-address" name="selectall"
						onclick="selectAll(this)"><label class="form-check-label"
						for="same-address">전체 선택</label>
					</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
					<th><button type="button" class="btn btn-outline-dark"
							onclick="delCheck()">선택 삭제</button></th>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;상품이미지</th>
					<th>상품명</th>
					<th>상품 수량</th>
					<th>상품 가격</th>
			</thead>

			<tbody>
				<c:forEach var="myProductsList" items="${myProductsList}" varStatus="status">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<input type="checkbox"
						class="form-check-input" id="same-address" name="productCheck"
						onclick="checkSelectAll()" /> <img
						src="${contextPath}/resources/image/category/${myProductsList.p_imageFileName}"/>
					</td>
					<td><a href="#">${myProductsList.p_name}</a></td>
					<td><input type="number" style="text-align: center; width: 80;" class="form-control mr-sm-3" id="quantity" min='1' max='99' value="${myCartList[status.index].cart_quantity}"  /></td>
					<td><b><fmt:formatNumber value="${myProductsList.p_price*myCartList[status.index].cart_quantity}" pattern="###,###,###"/></b>원</td>
				</tr>
				</c:forEach>
				<tr class="table-danger">
					<td><b>총 상품금액</b><br>20,000원</td>
					<td><b>배송비</b><br>0원</td>
					<td><b>총 할인 금액</b><br>0원</td>
					<td><h3>
							<b>합계:</b>20,000원
						</h3></td>
				</tr>
			</tbody>
		</table>
		<br>
		<hr width="100%">
		<div class="bd-example" align="center">
			<input type="button" class="btn btn-danger" onclick="buyCheck()"
				value="구매하기">
		</div>
	</form>
</body>
</html>
