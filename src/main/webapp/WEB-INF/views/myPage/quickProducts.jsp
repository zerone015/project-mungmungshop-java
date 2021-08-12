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
<title>최근 본 상품</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		
		
		var url = "${contextPath}/myPage/quickProducts.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/myPage/quickProducts.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${contextPath}/myPage/quickProducts.do";
		
		url = url + "?page=" + page;
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
</style>
<body>
<div class="container">
	<div align="center">
		<h4>
			<b>최근 본 상품</b>
		</h4>
	</div>
	<hr width="100%">
	<div>
		<div class="col">
			<div class="row" >
			<c:if test="${quickProductsList == null}">
				<div style="margin-top: 300px;">
					<h3>최근 본 상품이 없습니다.</h3>
				</div>	
			</c:if>
			<c:forEach items="${quickProductsList}" var="item">
	            <div class="product">
	                <div class="bd-placeholder-img card-img-top">
	                <a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">
	                    <img
	                        src="${contextPath}/download?imageFileName=${item.p_imageFileName}"
	                        style="width: 50%; height: 225;" alt="상품 이미지" />
	                </a>
	                </div>
	                <div class="card-body">
	                   
	                    <p style="font-size: 14px;">
	                    <a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">${item.p_name}</a>
	                    </p>
	        
	                    <p style="font-size: 14px;">
	                     <a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">
	                        <b><fmt:formatNumber value="${item.p_price }"
	                            pattern="###,###,###" />
	                        </b>원
	                     </a>
	                    </p>
	                    <div class="d-flex justify-content-between align-items-center">
	                        <div class="btn-group"></div>
	                        <p style="color: red;">♥ ${item.p_loves}</p>
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