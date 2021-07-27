<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
.productImage { height: 70%; object-fit: contain; vertical-align:middle; margin-top: 15%;}

	
	
#table {display: table; width: 100%;}
#row {display: table-row;}
.cell {display: table-cell; vertical-align:middle; padding: 10px; border-bottom: 1px solid #DDD; }
.col1 {width: 10%;}
.col2 {width: 50%; text-align: left;}
.col3 {width: 20%;}
.col4 {width: 20%;}

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
		beforeSend : function(xmlHttpRequest) { xmlHttpRequest.setRequestHeader("AJAX", "true");},
		success : function(data, textStatus) {
			if(data.trim()=='add_success') {
				imagePopup('open', '.layer01');
			} else if(data.trim()=='already_existed') {
				alert("이미 장바구니에 등록된 상품입니다.");
			}
		},
		error : function(data, textStatus) {
			if(data.status==400) {
			     location.href='${contextPath}/login.do';

			}
			else{
				alert("에러가 발생했습니다."+data);
			}
		}
	});
}
</script>

<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${contextPath}/product/getProduct.do?p_code=${products.p_code}";
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/product/getProduct.do?p_code=${products.p_code}";
		url = url + "&page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${contextPath}/product/getProduct.do?p_code=${products.p_code}";
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>
</head>
<body>
<form method="GET" action="${contextPath}/payment/getPaymentPage.do">
<div class="container">
  <div class="row" style="text-align: center">
	<div class="col-md-6 card" style="display: inline-block; cursor: pointer;">
	    	<img class="productImage" src="${contextPath}/resources/image/category/${product.p_imageFileName}" />
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
			  <input type="number" style="text-align: center; width: 60%; float: right; margin-right: 0px!important;" class="form-control mr-sm-3" id="quantity" name="order_quantity" min='1' max='${product.p_stock}' value="1"  />
			</div>
		</div>
	  </div>
	  <div  style="margin-top: 50;">
	  	<p><button type="button" class="btn btn-outline-danger btn-block" style="height: 50px;">찜</button></p>
	  	<p><button type="button" class="btn btn-outline-primary btn-block" style="height: 50px;" onclick="javascript:fn_addCart('${product.p_code}')">장바구니 담기</button></p>
	  	<input type="hidden" name="p_code" value="${product.p_code}"/>
	  	<p><input type="submit" class="btn btn-danger btn-block" style="height: 50px;" value="바로 구매하기"></p>
	  </div>
	</div>
  </div>
 </div>
 </form> 
  <hr>
  
  ${product.p_description}
  
  <hr>
  <div class="container">
  	<h3 style="text-align: left; margin-top: 30;">후기 ${pagination.prev}</h3>
		
	<!-- 후기 목록 -->
	<div class="table-responsive" style="margin-top:30;">
		<div id="table">
			<div id="row">
				<span class="cell col1">번호</span>
				<span class="cell col2" style="text-align: center;">내용</span>
				<span class="cell col3">닉네임</span>
				<span class="cell col4">날짜</span>
			</div>
			
			<c:forEach items="${reviewList}" var="reviewVO">
				<div id="row">
					<span class="cell col1">${reviewVO.review_num}</span>
					<span class="cell col2">${reviewVO.review_content}</span>
					<span class="cell col3">${reviewVO.memberNick}</span>
					<span class="cell col4"><fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></span>
				</div>
			</c:forEach>
		</div>
	${pagination.startPage}
		<!-- pagination{s} -->
		<div style="margin-top: 30;">
			<ul class="pagination" style="width: 0%; justify-content:center;">
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
</div>	

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