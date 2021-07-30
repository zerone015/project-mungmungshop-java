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
<title>상품 정보</title>
</head>
<script>
	function fn_delete(){
		var form = document.productInfo;
		
		if(confirm('정말 삭제하시겠습니까?')){
			form.method = "GET";
			form.action = "${contextPath}/manager/removeProduct.do"
			form.submit();
		}
		else{
			return false;
		}
	}
</script>
<body>
<div align="center">
<h1>
<b>상품 정보</b>
</h1>
</div>	
	<br>
	<br>
	<form name="productInfo" method="GET" action="#">
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
			<td><img src="${contextPath}/thumbnail/download?imageFileName=${product.p_imageFileName}" alt="상품 이미지"></td>
		</tr>
		</table>
		<br><br>
		<div align="center">
			<button type="button" class="btn btn-primary"
				onclick="location.href='${contextPath}/manager/managerProductModify.do?p_code=${product.p_code}'">수정</button>
			<button type="button" class="btn btn-danger" onclick="fn_delete()">삭제</button>
		</div><br>
		<div align="center">
			<button type="button" class="btn btn-outline-primary btn-lg" onClick="location.href='${contextPath}/manager/managerProduct.do'">목록으로</button>
		</div>
		<input type="hidden" name="p_code" value="${product.p_code}"/>
	</form>
</body>
</html>