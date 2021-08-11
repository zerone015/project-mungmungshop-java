<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
//배너 기본 5초
	 $('.carousel').carousel({ 
		 interval: 2000
	 })

</script>

<style> 
	.carousel-inner{
		width: 1200!important;
	}
	.carousel-inner > .carousel-item > img { 
	width: 1200!important; height: 500px;
	} 
	.rank {
	color:red; 
	position: absolute; 
	top: 10px; 
	left: 10px;
	font-size: 30px;
	font-weight: 700;
	font-family: HY수평선B;
	}
	
	section {
		text-align: center;
	}
	.product{
	    cursor: pointer; 
	    width: 330px; 
	    height: 400px;
	    margin-right: auto;
	}

</style>
</head>
<body>
	<!-- 배너 -->

	<section>
	   <div class="container" style="z-index: 0;"> 
	      	<div id="demo" class="carousel slide" data-ride="carousel" style="text-align: center; margin-left: -35;">
		      	<div class="carousel-inner" style="display: inline;"> 
		      		<!-- 슬라이드 쇼 --> 
		      		<div class="carousel-item active"> 
		      			<!--가로--> 
		      			<img class="d-block" src="${contextPath}/download?imageFileName=slide1.jpg" alt="First slide" >
		      		</div> 
		      		<div class="carousel-item"> 
		      			<img class="d-block " src="${contextPath}/download?imageFileName=slide2.jpg" alt="Second slide" > 
		      		</div> 
		      		<div class="carousel-item"> 
		      			<img class="d-block " src="${contextPath}/download?imageFileName=slide3.jpg" alt="Third slide"> 
		      		</div> 
		      		<!-- / 슬라이드 쇼 끝 --> 
		      		<!-- 왼쪽 오른쪽 화살표 버튼 --> 
		      		<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
			      		<span class="carousel-control-prev-icon" aria-hidden="true">
			      		</span> <!-- <span>Previous</span> --> 
		      		</a> 
		      		<a class="carousel-control-next" href="#demo" data-slide="next"> 
		      			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
		      			<!-- <span>Next</span> --> 
		      		</a> 
		      		<!-- / 화살표 버튼 끝 --> 
		      		<!-- 인디케이터 --> 
		      		<ul class="carousel-indicators"> 
		      			<li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작--> 
		      			<li data-target="#demo" data-slide-to="1"></li> 
		      			<li data-target="#demo" data-slide-to="2"></li> 
		      		</ul> <!-- 인디케이터 끝 --> 
		      	</div>
		     </div>
			 </div>
	</section>

	<!-- 목록 -->
	<div style="margin-top: 20;">
		<div class="container">
			<div class="col">
				<!-- 신상품 목록 -->
				<div class="row">
					<h3 style="margin: 0; margin-right: 950px;">신상품</h3>
					<a href="${contextPath}/product/newProduct.do" style="float: right; margin: auto;">+ 더보기</a>
				</div>
				<hr width="100%">
				<div class="row">
					<c:forEach items="${newProductList}" var="item">
						<div class="product">
							<div class="bd-placeholder-img card-img-top">
								<a
									href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">
									<img
									src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"
									style="width: 50%; height: 225;" alt="상품 이미지" />
								</a>
							</div>
							<div class="card-body">
								<p style="font-size: 14px;">${item.p_name}</p>
								<p style="font-size: 14px;">
									<fmt:formatNumber value="${item.p_price}" pattern="###,###,###" />
									원
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

			<!-- 랭킹 목록 -->
			<div class="row">
				<h3 style="margin: 0; margin-right: 950px;">랭킹</h3>
				<a href="#" style="float: right; margin: auto;">+ 더보기</a>
			</div>
			<hr width="100%">
			<div class="row">
				<c:forEach items="${rankProductList}" var="item" varStatus="status">
					<div class="product">
						<div class="bd-placeholder-img card-img-top" style="position: relative;">
							<a
								href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">
								<img
								src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"
								style="width: 50%; height: 225;" alt="상품 이미지" />
							</a>
							<p class="rank">${status.count}</p>
						</div>
						<div class="card-body">
							<p style="font-size: 14px;">${item.p_name}</p>
							<p style="font-size: 14px;">
								<fmt:formatNumber value="${item.p_price}" pattern="###,###,###" />
								원
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
								<p style="color: red;">♥ ${item.p_loves}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		

		<!-- 브랜드 목록 -->
			<div class="row">
				<h3 style="margin: 0; margin-right: 950px;">브랜드</h3>
				<a href="#" style="float: right; margin: auto;">+ 더보기</a>
			</div>
			<hr width="100%">

			<div style="text-align: center;">
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='#';">
						<div class="bd-placeholder-img card-img-top">
							<img src="${contextPath}/download?imageFileName=ACANA.PNG"
								style="width: 100%; height: 250;" />
						</div>
					</div>
				</div>
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='#';">
						<div class="bd-placeholder-img card-img-top">
							<img src="${contextPath}/download?imageFileName=ORIGEN.PNG"
								style="width: 100%; height: 250;" />
						</div>
					</div>
				</div>
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='#';">
						<div class="bd-placeholder-img card-img-top">
							<img src="${contextPath}/download?imageFileName=ROYALCANIN.PNG"
								style="width: 100%; height: 250;" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>