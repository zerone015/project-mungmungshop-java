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
					<th><button type="button" class="btn btn-outline-dark"
							onclick="delCheck()">선택 삭제</button></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<input type="checkbox"
						class="form-check-input" id="same-address" name="productCheck"
						onclick="checkSelectAll()" /> <img
						src="${contextPath}/resources/image/gaebab.jpg" />
					</td>
					<td><a href="#">상품명입니다123</a></td>
					<td>99,999원</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<input type="checkbox"
						class="form-check-input" id="same-address" name="productCheck"
						onclick="checkSelectAll()" /> <img
						src="${contextPath}/resources/image/gaebab.jpg" />
					</td>
					<td><a href="#">상품명입니다123</a></td>
					<td>99,999원</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<input type="checkbox"
						class="form-check-input" id="same-address" name="productCheck"
						onclick="checkSelectAll()" /> <img
						src="${contextPath}/resources/image/gaebab.jpg" />
					</td>
					<td><a href="#">상품명입니다123</a></td>
					<td>99,999원</td>
				</tr>
				<tr>
					<td><b>총 상품금액</b><br>20,000원</td>
					<td><b>총 결제금액</b><br>20,000원</td>
					<td><h3>
							<b>합계:</b>20,000원
						</h3></td>
				</tr>
			</tbody>
		</table>
		<hr width="100%">
		<div class="bd-example" align="center">
			<input type="button" class="btn btn-danger" onclick="buyCheck()"
				value="구매하기">
		</div>
	</form>
</body>
</html>
