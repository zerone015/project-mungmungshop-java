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
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: white;
	border: 3px solid #787878;
}

#close {
	z-index: 4;
	float: right;
	width: 30px;
	height: 20px;
}
</style>
<script type="text/javascript">
function checkWrite() {
	var form=document.review;
	if (form.reviewWrite.value == "") {
		alert("내용을 입력해주세요.");
		form.reviewWrite.focus();
		return false;
	}
	
    if (form.reviewWrite.value.length < 20) {
		alert("내용을 20자 이상 입력해주세요.");
		form.id.select();
		return false;
	}
	form.submit();
}

function fn_addCart(p_code) {
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/cart/addProductsInCart.do",
		data : {
			p_code : p_code,
			cart_quantity : $("#quantity").val()
				},
		success : function(data, textStatus) {
			if(data.trim()=='add_success') {
				imagePopup('open', '.layer01');
			} else if(data.trim()=='already_existed') {
				alert("이미 장바구니에 등록된 상품입니다.");
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		}
	});
}

function imagePopup(type) {
	if (type == 'open') {
		// 팝업창을 연다.
		jQuery('#layer').attr('style', 'visibility:visible');

		// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
		jQuery('#layer').height(jQuery(document).height());
	}

	else if (type == 'close') {

		// 팝업창을 닫는다.
		jQuery('#layer').attr('style', 'visibility:hidden');
	}
}
</script>
</head>
<body>
<div class="container">
  <div class="row" style="text-align: center">
	<div class="col-md-6" style="display: inline-block;">
	  <div class="card mb-4 shadow-sm" style="cursor: pointer;">
	    	<img class="productImg" src="${contextPath}/resources/image/category/${product.p_imageFileName}" style=" width: 80%; height: 80%;"/>
	    </div>
	  </div>
	<div class="col-md-5" >
		<b>${product.p_name}</b>
		<hr>
		<div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">판 매 가</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;"><b><fmt:formatNumber value="${product.p_price }" pattern="###,###,###"/></b>원</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">브 랜 드</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">${product.p_brand}</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">원 산 지</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">${product.p_origin}</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">재 고 수</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">${product.p_stock}</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">주문 수량</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <input type="number" style="text-align: center; width: 60%; float: right; margin-right: 0px!important;" class="form-control mr-sm-3" id="quantity" min='1' max='99' value="1"  />
			</div>
		</div>
	  </div>
	  <div  style="margin-top: 50;">
	  	<p><button type="button" class="btn btn-outline-danger btn-block" style="height: 50px;">찜</button></p>
	  	<p><button type="button" class="btn btn-outline-primary btn-block" style="height: 50px;" onclick="javascript:fn_addCart('${product.p_code}')">장바구니 담기</button></p>
	  	<p><button type="button" class="btn btn-danger btn-block" style="height: 50px;">바로 구매하기</button></p>
	  </div>
	</div>
  </div>
  
  <hr>
  
  ${product.p_description}
  
  <hr>
  <div>
  	<h3 style="text-align: left;">후기</h3>
	
	<!-- 후기 목록 -->
	<div style="margin-top: 10; ">
		<a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	        <strong class="mb-1">후기 제목</strong>
	        <small class="text-muted">날짜</small>
	      </div>
	      <div class="col-10 mb-1 small">=== 후 기 내 용 들어갈 곳 ===</div>
	    </a>
	    <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	        <strong class="mb-1">후기 제목</strong>
	        <small class="text-muted">날짜</small>
	      </div>
	      <div class="col-10 mb-1 small">=== 후 기 내 용 들어갈 곳 ===</div>
	    </a>
	    <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	        <strong class="mb-1">후기 제목</strong>
	        <small class="text-muted">날짜</small>
	      </div>
	      <div class="col-10 mb-1 small">=== 후 기 내 용 들어갈 곳 ===</div>
	    </a>
	    <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	        <strong class="mb-1">후기 제목</strong>
	        <small class="text-muted">날짜</small>
	      </div>
	      <div class="col-10 mb-1 small">=== 후 기 내 용 들어갈 곳 ===</div>
	    </a>
	    <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	        <strong class="mb-1">후기 제목</strong>
	        <small class="text-muted">날짜</small>
	      </div>
	      <div class="col-10 mb-1 small">=== 후 기 내 용 들어갈 곳 ===</div>
	    </a>
    </div>
    
    <hr>
    <!-- 후기 작성 -->
    <form name="review" method="GET" action="">
	    <div class="row g-3">
	      <div class="col-12">
	        <textarea class="form-control" style="height:150; resize:none;" id="" placeholder="후기를 작성해주세요." name="reviewWrite"></textarea>
	        <div style="margin-top: 5; ">
	        	<p><button type="button" class="btn btn-outline-primary" style="height: 50px; float: right;" onclick="checkWrite()">작성하기</button></p>
	        </div>
	      </div>
		</div>
	</form>
  </div>
 </div>
<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/resources/image/close.png" id="close" />
			</a>  <br /> <font style="font-size: 20px; font-weight: bold;" id="contents">장바구니에 담았습니다.</font><br> 
<form   action='${contextPath}/cart/myCartList.do'  >				
		<input class="btn btn-info" style="margin-top: 60px;" type="submit" value="장바구니 보기">
</form>
</div>
</div>			
</body>
</html>