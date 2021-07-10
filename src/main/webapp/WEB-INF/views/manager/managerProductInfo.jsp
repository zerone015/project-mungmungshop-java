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
<title>상품 정보</title>
</head>
<body>
<div align="center">
<h1>
<b>상품 정보</b>
</h1>
</div>	
	<br>
	<br>
	<form name="productInfo" method="POST" action="#">
		<table align="center">
		<tr>
			<td>
				<b style="color:blue;">1차 분류</b> &nbsp;${product.p_cl1}&nbsp;<b style="color:blue;">2차 분류</b> &nbsp;${product.p_cl2}
			</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">상품명</b> ${product.p_name}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">판매가</b> <fmt:formatNumber value="${product.p_price}" pattern="###,###,###"/>원</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">브랜드명</b> ${product.p_brand}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">원산지</b> ${product.p_origin}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">재고 수</b> ${product.p_stock}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">상품 소개</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>${product.p_description}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><b style="color:blue;">상품 이미지</b></td>
		</tr>
		<tr>
			<td><img src="${contextPath}/resources/image/category/food/${product.p_imageFileName}" alt="상품 이미지"></td>
		</tr>
		</table>
		<br><br>
		<div align="center">
			<button type="button" class="btn btn-primary"
				onclick="location.href='${contextPath}/manager/managerProductModify.do?p_code=${product.p_code}'">수정</button>
			<button type="button" class="btn btn-dark"
			 	onclick="location.href='${contextPath}/manager/removeProduct.do?p_code=${product.p_code}'">삭제</button>
		</div>
	</form>
</body>
</html>