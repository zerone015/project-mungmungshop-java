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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style> 
	.carousel {
		width: 1080;
		margin-bottom: 100;
	}
	
	.slideImg {
		width: 1080;
		height: 600;
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
	<script>
		$('.carousel').carousel({ 
			interval: 2000 //기본 5초 
		}) 
	</script>
	<div id="demo" class="carousel slide" data-ride="carousel"> 
		<div class="carousel-inner"> 
		<!-- 슬라이드 쇼 --> 
			<div class="carousel-item active"> 
				<!--가로--> 
				<img class="d-block slideImg" src="${contextPath}/download?imageFileName=slide2.jpg" alt="First slide"> 
			</div> 
			<div class="carousel-item"> 
				<img class="d-block slideImg" src="${contextPath}/download?imageFileName=slide4.png" alt="Second slide"> 
			</div> 
			<div class="carousel-item"> 
				<img class="d-block slideImg" src="${contextPath}/download?imageFileName=slide5.jpeg" alt="Third slide"> 
			</div> 
			<!-- / 슬라이드 쇼 끝 --> 
			<!-- 왼쪽 오른쪽 화살표 버튼 --> 
			<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<!-- <span>Previous</span> --> 
			</a> 
			<a class="carousel-control-next" href="#demo" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<!-- <span>Next</span> --> 
			</a> 
			<!-- / 화살표 버튼 끝 --> 
			<!-- 인디케이터 --> 
			<ul class="carousel-indicators"> 
				<li data-target="#demo" data-slide-to="0" class="active"></li> 
				<!--0번부터시작--> 
				<li data-target="#demo" data-slide-to="1"></li> 
				<li data-target="#demo" data-slide-to="2"></li> 
			</ul> <!-- 인디케이터 끝 --> 
		</div>
	</div>
	<!-- 목록 -->
	<div style="margin-top: 20;">
		<div class="container">
			<div class="col">
				<!-- 신상품 목록 -->
				<div class="row title" >
					<div style="margin-right: 880;">
						<font style="font-size: 30px; ">신상품</font>
					</div>
					<div>
						<a href="${contextPath}/product/newProduct.do">+ 더보기</a>
					</div>
				</div>
				<div class="row" >
					<c:forEach items="${newProductList}" var="item">
						<div class="product">
							<div class="bd-placeholder-img card-img-top" style="position: relative;">
								<a
									href="${contextPath}/product/getProduct.do?p_code=${item.p_code}">
									<img
									src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"
									style="width: 50%; height: 225;" alt="상품 이미지" />
								</a>
							</div>
							<div class="card-body">
								<p style="font-size: 14px;"><font class="badge badge-danger" style="font-size: 14px;">new </font>&nbsp;&nbsp;${item.p_name}</p>
								<div class="productInfo">
									<div>
									<p style="font-size: 14px;">
										<fmt:formatNumber value="${item.p_price}" pattern="###,###,###" />
										원 
									</p>
								</div>
									<div>
									<font style="color: red;">♥ ${item.p_loves}</font>
									</div>
								</div>
								
									

							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="col">
			<!-- 랭킹 목록 -->
				<div class="row title" >
					<div style="margin-right: 880;">
						<font style="font-size: 30px; ">랭킹</font>
					</div>
					<div>
						<a href="${contextPath}/product/getRankProducts.do">+ 더보기</a>
					</div>
				</div>
				
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
							</div>
							<div class="card-body">
								<img
									src="${contextPath}/download?imageFileName=ranking${status.count}.png"
									style="width: 30px; height: 25px;" alt="랭킹 왕관" /><p style="font-size: 14px;">${item.p_name}</p>
								<div class="productInfo">
										<div>
										<p style="font-size: 14px;">
											<fmt:formatNumber value="${item.p_price}" pattern="###,###,###" />
											원 
										</p>
									</div>
										<div>
										<font style="color: red;">♥ ${item.p_loves}</font>
										</div>
									</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 브랜드 목록 -->
			<div class="row title" >
				<div style="margin-right: 880;">
					<font style="font-size: 30px; ">브랜드</font>
				</div>
				<div>
					<a href="${contextPath}/brandList.do">+ 더보기</a>
				</div>
			</div>
			

			<div style="text-align: center;">
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='${contextPath}/product/brandProducts.do?brandName=아카나';">
						<div class="bd-placeholder-img card-img-top">
							<img src="${contextPath}/download?imageFileName=ACANA.PNG"
								style="width: 100%; height: 250;" />
						</div>
					</div>
				</div>
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='${contextPath}/product/brandProducts.do?brandName=오리젠';">
						<div class="bd-placeholder-img card-img-top">
							<img src="${contextPath}/download?imageFileName=ORIGEN.PNG"
								style="width: 100%; height: 250;" />
						</div>
					</div>
				</div>
				<div class="col-md-4" style="display: inline-block; float: left;">
					<div class="card mb-4 shadow-sm" style="cursor: pointer;"
						onclick="location.href='${contextPath}/product/brandProducts.do?brandName=로얄캐닌';">
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