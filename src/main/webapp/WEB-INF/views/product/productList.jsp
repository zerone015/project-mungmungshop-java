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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>상품 목록</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var sortBy = "${sortBy}";
		
		var url = "${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}";
		
		url = url + "&sortBy=" + sortBy;
		url = url + "&page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var sortBy = "${sortBy}";
		
		var url = "${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}";
		
		url = url + "&sortBy=" + sortBy;
		
		url = url + "&page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var sortBy = "${sortBy}";
		
		var url = "${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}";
		
		
		url = url + "&sortBy=" + sortBy;
		
		url = url + "&page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<style>
	.product{
	    cursor: pointer; 
	    width: 330px; 
	    height: 400px;
	    margin-right: auto;
	}
	
	.sort:hover {
		font-weight: 900;
	}
	
	.active{
		color: #D94C1A !important;
		font-weight: bold;	
	}
	
	
</style>
<body>
<div class="container">
	<div align="left">
		<h2>
			<b>${category.p_cl1} - ${category.p_cl2}</b>
		</h2>
	</div>
	<div align="right"> 
		<a  class="sort" href="${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}&sortBy=new"><font <c:if test="${sortBy.equals('new') || sortBy.equals('default')}"> class="active"</c:if> style="color: #B2B2B2;">신상품</font>&nbsp;&nbsp;&nbsp;</a>
		<a  class="sort" href="${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}&sortBy=love"><font <c:if test="${sortBy.equals('love')}"> class="active"</c:if> style="color: #B2B2B2;">인기상품</font>&nbsp;&nbsp;&nbsp;</a>
		<a  class="sort" href="${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}&sortBy=lowPrice"><font <c:if test="${sortBy.equals('lowPrice')}"> class="active"</c:if> style="color: #B2B2B2;">낮은가격</font>&nbsp;&nbsp;&nbsp;</a> 
		<a  class="sort" href="${contextPath}/product/productList.do?p_cl1=${category.p_cl1}&p_cl2=${category.p_cl2}&sortBy=highPrice"><font <c:if test="${sortBy.equals('highPrice')}"> class="active"</c:if> style="color: #B2B2B2;">높은가격</font>&nbsp;&nbsp;&nbsp;</a>
	</div>
	<hr width="100%">
	<div>
	
		<div class="col">
			<div class="row" >
			<c:forEach items="${products}" var="products">
	            <div class="product">
	                <div class="bd-placeholder-img card-img-top">
	                <a href="${contextPath}/product/getProduct.do?p_code=${products.p_code}">
	                    <img
	                        src="${contextPath}/thumbnail/download?imageFileName=${products.p_imageFileName}"
	                        style="width: 50%; height: 225;" alt="상품 이미지" />
	                </a>
	                </div>
	                <div class="card-body">
	                   
	                    <p style="font-size: 14px;">
	                    <a href="${contextPath}/product/getProduct.do?p_code=${products.p_code}">${products.p_name}</a>
	                    </p>
	        
	                    <p style="font-size: 14px;">
	                     <a href="${contextPath}/product/getProduct.do?p_code=${products.p_code}">
	                        <b><fmt:formatNumber value="${products.p_price }"
	                            pattern="###,###,###" />
	                        </b>원
	                     </a>
	                    </p>
	                    <div class="d-flex justify-content-between align-items-center">
	                        <div class="btn-group"></div>
	                        <p style="color: red;">♥ ${products.p_loves}</p>
	                    </div>
	                </div>
	            </div>
	            </c:forEach>
			</div>
		</div>
	
	</div>
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
</div>
</body>
</html>