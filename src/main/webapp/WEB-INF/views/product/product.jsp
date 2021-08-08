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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/product.css">
<script src="${contextPath}/resources/js/product.js"></script>
<script src="${contextPath}/resources/js/graph.js"></script>

<style>

.graphBody{
	padding: 50px;
}
.graph {
	height: 40px; 
	background: #ccc; 
	border-radius: 40px;
}
.graph font {
	display: block;
	width : 75%;
	height: 40px;
	padding: 0 10px;
	line-height: 40px;
	text-align: right;
	background: violet;
	border-radius: 40px;
	box-sizing: border-box;
	color: #fff;
	animation: stack 2s 1;
	margin: 0;
}

@keyframes stack{
	0% {
		width: 0;
		color: rgba(255,255,255,0);
	}
	40% {
		color: rgba(255,255,255,1);
	}
	100% {
		width: 75%;;
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
<form method="GET" action="${contextPath}/payment/getPaymentPage.do">
  <div class="row" style="text-align: center">
	<div class="col-md-5" style="display: inline-block;">
	  <div class="card mb-4 shadow-sm" style="cursor: pointer;">
	    	<img class="productImage" src="${contextPath}/download?imageFileName=${product.p_imageFileName}" style=" width: 80%; height: 80%;"/>
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
 </form> 
  <hr>
  
  ${product.p_description}
  
  <hr>
  <div>
		<h3 style="text-align: left; margin-bottom: 20;">후기</h3>
	  	
	  	<div class="graphBody">
			<div class="graph">
				<font>75%</font>
			</div>
		</div>
	  	
	  	<!-- 후기 목록 -->
	  	<c:forEach items="${reviewList}" var="reviewVO">
	  	<div class="row" style="align-items: center;">
			<img class="reviewRecommend" src="${contextPath}/download?imageFileName=${reviewVO.review_recommend}.png" />
					<c:if test="${reviewVO.review_recommend eq 'good'}">
						<font>적극 추천!</font>
					</c:if>
					
					<c:if test="${reviewVO.review_recommend eq 'notBad'}">
						<font>보통이에요.</font>
					</c:if>
					
					<c:if test="${reviewVO.review_recommend eq 'bad'}">
						<font>별로에요.</font>
					</c:if>
			<details>
			    <summary>
			    	${reviewVO.review_title}
			    </summary>
				<div class="" style="padding: 5;">
					<div id="wrap">
					  <a href="javascript:openModal('reviewImage');" class="button modal-open">
					  	<img class="reviewImg" src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}" />
					  </a>
					</div>
					
					<div id="modal"></div>
					<div class="modal-con reviewImage">
						 <a href="javascript:;" class="close">X</a>
						 <div class="con">
							<img class="popImage" src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}" />
						 </div>
					</div>
					<p> ${reviewVO.review_content}</p>
			    </div>
			    <p style="color: graytext;">${reviewVO.memberNick} | <fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></p>
			</details>
		</div>
			<hr>
		</c:forEach>
  </div>
  
  
  

	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/download?imageFileName=close.png" id="close" />
			</a>  <br /> <font style="font-size: 20px; font-weight: bold;" id="contents">장바구니에 담았습니다.</font><br> 
			<form   action='${contextPath}/cart/myCartList.do'  >				
					<input class="btn btn-info" style="margin-top: 60px;" type="submit" value="장바구니 보기">
			</form>
		</div>
	</div>	
	

	

</div>	


</body>
</html>