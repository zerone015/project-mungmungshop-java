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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>장바구니</title>
<style>
	.container {
	width: 100%;
	padding: 5px;
	margin: 0px auto;
	text-align: center;
	border: 0px solid #bcbcbc;
	}
	
	.content {
		width: 100%;
		margin-right: 5px;
		/* float: left; */
		border: 0px solid #bcbcbc;
	}
</style>
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

function fn_modify_cartQty(p_code,index,cartQty_btnVal) {
	var length = document.cartForm.cart_quantity.length;
	var _cart_quantity = 0;
	
	 if(length>1) {
		 _cart_quantity = document.cartForm.cart_quantity[index].value;
	 }else{
		 _cart_quantity = document.cartForm.cart_quantity.value;
	 }
	 
	var cart_quantity = Number(_cart_quantity);
	 
	 $.ajax({
		 type : "POST",
		 async : false,
		 url : "${contextPath}/cart/modifyCartQty.do",
		 data : {
			 p_code : p_code,
			 cart_quantity : cart_quantity,
			 cartQty_btnVal : cartQty_btnVal
		 },
		 
		 success : function(data, textStatus) {
			 if(data.trim()=='modify_success'){
				 $("#content").load("${contextPath}/cart/myCartList.do .content");
				 return;
			 }
			 else if(data.trim()=='modify_failed'){
				 alert("수량을 0개 이하로 설정하실 수 없습니다.");
			 }
			 else{
				 alert("상품 재고 수량이 "+data+"개 남았습니다.");
			 }
			 
			 $("#content").load("${contextPath}/cart/myCartList.do .content");
		 },																									
		 error : function(data, textStatus) {
			 alert("숫자만 입력 가능합니다.");
			 $("#content").load("${contextPath}/cart/myCartList.do .content");
		 }
	 })
}
</script>
<body>
<div class="content">
	<div class="container">
		<div>
			<h1>장바구니</h1>
		</div>
		<span style="margin-right: 915px;">
				<input type="checkbox" class="form-check-input" id="same-address" name="selectall" onclick="selectAll(this)" style="margin-top: 14px;" checked >전체 선택
		</span>	
		<button type="button" class="btn btn-danger" onclick="delCheck()" style="margin-bottom: 5px;">선택 삭제</button>
		<form name="cartForm" method="GET" action="">			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>&nbsp;&nbsp;&nbsp;상품이미지</th>
						<th>상품명</th>
						<th>상품 수량</th>
						<th>상품 가격</th>
				</thead>
	
				<tbody>
					<c:forEach var="myProductsList" items="${myProductsList}" varStatus="status">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="form-check-input" id="same-address" name="productCheck" onclick="checkSelectAll()" checked/> 
								<img src="${contextPath}/resources/image/category/${myProductsList.p_imageFileName}" alt="상품 이미지"/>
							</td>
							<td>
								<a href="${contextPath}/product/getProduct.do?p_code=${myProductsList.p_code}"><b>${myProductsList.p_name}</b></a>
							</td>
							<td>
								<button type="button" onclick="fn_modify_cartQty('${myProductsList.p_code}',${status.count-1},'minus');">-</button>
								<input type="text" name="cart_quantity" onkeyup="fn_modify_cartQty('${myProductsList.p_code}',${status.count-1},'inputKey');" maxlength=2 size=2 value="${myCartList[status.index].cart_quantity}">
								<button type="button" onclick="fn_modify_cartQty('${myProductsList.p_code}',${status.count-1},'plus');">+</button>
							</td>
							<td><b><fmt:formatNumber value="${myProductsList.p_price*myCartList[status.index].cart_quantity}" pattern="###,###,###"/></b>원</td>
						</tr>
						<c:set var="totalGoodsPrice" value="${totalGoodsPrice+myProductsList.p_price*myCartList[status.index].cart_quantity }"/>
					</c:forEach>
					<tr class="table-danger">
						<td>
							<h4>총 상품금액<br><b><fmt:formatNumber value="${totalGoodsPrice}" pattern="###,###,###"/>원</b></h4>
						</td>
						<td>
							<h4>배송비<br><b>0원</b></h4>
						</td>
						<td>
							<h4>총 할인 금액<br><b>0원</b></h4>
						</td>
						<td>
							<h2>합계:<b><br><fmt:formatNumber value="${totalGoodsPrice}" pattern="###,###,###"/></b>원</h2>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="bd-example" align="center">
				<input type="button" class="btn btn-danger" onclick="buyCheck()"
					value="구매하기">
			</div>
		</form>
	</div>
</div>
</body>
</html>
