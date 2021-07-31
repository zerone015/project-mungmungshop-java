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
<title>관리자 상품 관리 페이지</title>
</head>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var sortBy = "${sortBy}";
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		
		if(searchBy == "p_code" || searchBy == "p_name"){
			var url = "${contextPath}/manager/getSearchProducts.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else if(sortBy == "stock"){
			var url = "${contextPath}/manager/managerProduct.do";
			url = url + "?sortBy=" + sortBy;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else {
			var url = "${contextPath}/manager/managerProduct.do";	
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}
		
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		
		var sortBy = "${sortBy}";
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		if(searchBy == "p_code" || searchBy == "p_name"){
			var url = "${contextPath}/manager/getSearchProducts.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else if(sortBy == "stock"){
			var url = "${contextPath}/manager/managerProduct.do";
			url = url + "?sortBy=" + sortBy;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else {
			var url = "${contextPath}/manager/managerProduct.do";	
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		
		var sortBy = "${sortBy}";
		var searchBy = "${searchBy}";
		var searchContents = "${searchContents}";
		
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		if(searchBy == "p_code" || searchBy == "p_name"){
			var url = "${contextPath}/manager/getSearchProducts.do";
			
			url = url + "?searchBy=" + searchBy;
			url = url + "&searchContents=" + searchContents;
			
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else if(sortBy == "stock"){
			var url = "${contextPath}/manager/managerProduct.do";
			url = url + "?sortBy=" + sortBy;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
		}
		
		else {
			var url = "${contextPath}/manager/managerProduct.do";	
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		}

		location.href = url;
	}
</script>
<body>
<h3>
<b>상품 목록</b>
</h3>
<br>
<form method="GET" action="${contextPath}/managerProductAdd.do">	
<span class="bd_example" style="float: left; margin-bottom: 10px;">
	<a href="${contextPath}/manager/managerProduct.do?sortBy=stock">재고 없는순</a> | <a href="${contextPath}/manager/managerProduct.do">상품 등록순</a>
</span>
<span class="bd-example" style="float: right; margin-bottom: 10px;">
		<button type="submit" class="btn btn-primary btn-lg">상품 등록</button>
</span>
	<table class="table table-hover" style="margin-top: 10;">
		<thead>
			<tr>
				<th>상품 번호</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>판매가</th>
				<th>재고 수</th>
				<th>등록 날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${products.size() == 0 && searchBy.length() != 0}">
			<tr>
				<td align="center" colspan="6">상품 검색 결과가 없습니다.</td>
			</tr>
		</c:if>
			<c:forEach items="${products}" var="products">
			<tr>
				<td>${products.p_code}</td>
				<td>
				<a href="${contextPath}/manager/managerProductInfo.do?p_code=${products.p_code}"><b>${products.p_name }</b></a>
				</td>
				<td>${products.p_cl1}-${products.p_cl2}</td>
				<td>
				<fmt:formatNumber value="${products.p_price }" pattern="###,###,###"/>원
				</td>
				<td>${products.p_stock}</td>
				<td><fmt:formatDate value="${products.p_date}" type="both" dateStyle="long" timeStyle="short"></fmt:formatDate></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
	<hr width="100%">
	<form method="GET" action="${contextPath}/manager/getSearchProducts.do">
		<select style="height: 35px;" name="searchBy">
			<option value="p_name" <c:if test="${searchBy == 'p_name'}">selected</c:if>>상품명</option>
			<option value="p_code" <c:if test="${searchBy == 'p_code'}">selected</c:if>>상품 번호</option>
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