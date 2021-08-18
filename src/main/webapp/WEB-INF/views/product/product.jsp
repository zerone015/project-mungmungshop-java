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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/product.css">
<script src="${contextPath}/resources/js/product.js"></script>
<script src="${contextPath}/resources/js/graph.js"></script>
<style type="text/css">

.row {
	align-items: center;
}
.row.graphText {
	float: right;
	margin-bottom: 10;
}
.row.graphText i {
	font-weight: 900;
	color: F2BE24;
}
.graphBody{
	padding: 30px;
	width: 50%;
	height: 300;
}
.graphBody span {
	vertical-align:middle;
	margin: 0;
	
}
.graph {
	height: 30px; 
	background: #ccc; 
	border-radius: 40px;
	margin: 0 0 0 10;
	width: 300px;
}
.graph font {
	display: block;
	height: 30px;
	padding: 0 10px;
	line-height: 30px;
	text-align: right;
	background: #F2BE24;
	border-radius: 40px;
	box-sizing: border-box;
	color: #fff;
	margin: 0;
}

.btn-outline-danger:hover {
    background-color:#fff!important;
    color:red !important;
} 

.btn.focus, .btn:focus {
	box-shadow : none!important;	
}

.subNav {
	margin: 20 0 20 0;
	border-top: solid 1px #D7D8C9;
	border-bottom: solid 1px #D7D8C9;
	position:-webkit-sticky;position:sticky; top:0;
	background-color: white;
	z-index: 1;
}
[class*="subMenu"] {
	width: 25%;
	font-size: 20px;
	height: 60px;
	line-height: 60px;
}
[class*="subMenu"]:hover {
	cursor: pointer;
	font-weight: bold;
}
[class*="subMenu"] font{
	vertical-align:middle;
	margin: 0;
}
.inner-star::before{color: F2BE24;}
.outer-star {position: relative;display: inline-block;color: #CCCCCC;}
.inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
.outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
.RatingStar {font-size: 50px;}
.graph.stack1 font {animation: stack1 2s 1;}
.graph.stack2 font {animation: stack2 2s 1;}
.graph.stack3 font {animation: stack3 2s 1;}
@keyframes stack1{
	0% {width: 0; color: rgba(255,255,255,0);}
	40% {color: rgba(255,255,255,1);}
	100% {width: ${goodReviewPercent}%;}
	
@keyframes stack2{
	0% {width: 0; color: rgba(255,255,255,0);}
	40% {color: rgba(255,255,255,1);}
	100% {width: ${notBadReviewPercent}%;}
	
@keyframes stack3{
	0% {width: 0; color: rgba(255,255,255,0);}
	40% {color: rgba(255,255,255,1);}
	100% {width: ${badReviewPercent}%;}
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

function fn_modLove() {
	$.ajax({
		type : "post",
		url : "${contextPath}/love/modLove.do",
		data : {p_code : '${product.p_code}'},
		beforeSend : function(xmlHttpRequest) { xmlHttpRequest.setRequestHeader("AJAX", "true");},
		success : function(result, textStatus) {
			fn_getProductLoves(result);
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

function fn_getProductLoves(result) {
	$.ajax({
		type : "post",
		url : "${contextPath}/love/getProductLoves.do",
		data : {p_code : '${product.p_code}'},
		success : function(data, textStatus) {
			if(result == 0){
				$("#love_btn").attr('class', 'btn btn-danger'); 
				$("#love_btn").css('width', '100%');
				$("#icon_heart").css('color', 'white');
				$("#love_count").css('color', 'white');
				$("#love_count").html(data);		
				
			}
			else{
				$("#love_btn").attr('class', 'btn btn-outline-danger btn-block ');
				$("#icon_heart").css('color', 'red');
				$("#love_count").css('color', 'red');
				$("#love_count").html(data);
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
	  <c:choose>
	  	<c:when test="${loveCnt == 1}">
	  		<p><button type="button" id="love_btn" class="btn btn-danger" style="height: 60px; width:100%;" onclick="fn_modLove();"><i id="icon_heart" class="far fa-heart" style="font-size: 22px; color: white;"></i><br><font id="love_count" style="color: white;">${product.p_loves}</font></button></p>
	  	</c:when>
	  	<c:otherwise> 
	  		<p><button type="button" id="love_btn" class="btn btn-outline-danger btn-block" style="height: 60px;" onclick="fn_modLove();"><i id="icon_heart" class="far fa-heart" style="font-size: 22px;"></i><br><font id="love_count">${product.p_loves}</font></button></p>
	  	</c:otherwise>
	  </c:choose>
	  	<p><button type="button" class="btn btn-outline-primary btn-block" style="height: 50px;" onclick="javascript:fn_addCart('${product.p_code}')">장바구니 담기</button></p>
	  	<input type="hidden" name="p_code" value="${product.p_code}"/>
	  	<p><input type="submit" class="btn btn-danger btn-block" style="height: 50px;" value="바로 구매하기"></p>
	  </div>
	</div>
  </div>
 </form> 
 </div>  
<script >
	
</script>
	<nav class="subNav" >
		<div class="container">
			<div class="row">
				<div class="subMenu1" onclick="location.href='#section1';">
					<font>상세 설명</font>
				</div>
				<div class="subMenu2" onclick="location.href='#section2';">
					<font>후기</font>
				</div>
				<div class="subMenu3">
					<font>QnA</font>
				</div>
				<div class="subMenu4">
					<font>취소/교환</font>
				</div>
			</div>
		</div>
	  	</nav>

<div class="container">
  	<div id="section1" style="padding: 100 0 100 0; border-bottom: 1px solid #CCCCCC ">
	  	<div>
	  		<img src="${contextPath}/download?imageFileName=${product.p_imageFileName2}"/>
	  	</div>
  		${product.p_description}
  	</div>

  <div id="section2" style="padding-top: 50px;" >

	  	<div class="row">
	  		<h2>평 점</h2>
	  		<script type="text/javascript">
				ratings = {RatingScore: ${((5 * fiveCnt) + (4 * fourCnt) + (3 * threeCnt) + (2 * twoCnt) + oneCnt) / listCnt};}				
				totalRating = 5;
				table = document.querySelector('.RatingStar');
				function rateIt() {
					for (rating in ratings) {
						ratingPercentage = ratings[rating] / totalRating * 100;
						ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
						star = table.querySelector('${rating} .inner-star');
						numberRating = table.querySelector('${rating} .numberRating');
						star.style.width = ratingRounded;
						numberRating.innerText = ratings[rating];
						}
					} rateIt()
			</script>
			<c:if test="${listCnt != 0}">
		  		<div class="RatingStar">
			      <div class="RatingScore">
			        <div class="outer-star"><div class="inner-star" style="width: ${star}%"></div></div>
			      </div>
			    </div>
	
				(<fmt:formatNumber value="${totalAve}" pattern=".00"/>점)
			</c:if>
			
			<c:if test="${listCnt == 0}">
		  		<div class="RatingStar">
			      <div class="RatingScore">
			        <div class="outer-star"><div class="inner-star" style="width: 0%;"></div></div>
			      </div>
			    </div>
	
				(리뷰 없음)
			</c:if>
			
			  	<div class="graphBody">
			  		<div class="row graphText" >
			  			<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						
						(<fmt:formatNumber value="${fiveCnt}" pattern="###"/>)
						<div class="graph stack1">
							<font style="width : ${fiveAve}%;"><fmt:formatNumber value="${fiveAve}" pattern="###"/>% </font>
						</div>
					</div>
					<div class="row graphText" >
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						(<fmt:formatNumber value="${fourCnt}" pattern="###"/>)
						<div class="graph stack2">
							<font style="width : ${fourAve}%;"><fmt:formatNumber value="${fourAve}" pattern="###"/>% </font>
						</div>
					</div>
					<div class="row graphText" >
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						(<fmt:formatNumber value="${threeCnt}" pattern="###"/>)
						<div class="graph stack3">
							<font style="width : ${threeAve}%;"><fmt:formatNumber value="${threeAve}" pattern="###"/>% </font>
						</div>
					</div>
					<div class="row graphText" >
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						(<fmt:formatNumber value="${twoCnt}" pattern="###"/>)
						<div class="graph stack3">
							<font style="width : ${twoAve}%;"> <fmt:formatNumber value="${twoAve}" pattern="###"/>% </font>
						</div>
					</div>
					<div class="row graphText" >
						<i class="far fa-star"></i>
						(<fmt:formatNumber value="${oneCnt}" pattern="###"/>)
						<div class="graph stack3">
							<font style="width : ${oneAve}%;"> <fmt:formatNumber value="${oneAve}" pattern="###"/>% </font>
						</div>
					</div>
				</div>
			
	  	</div>
	  	<!-- 후기 목록 -->
	  	<c:forEach items="${reviewList}" var="reviewVO">
	  		<c:if test="${reviewVO.review_test.equals('Y')}">
	  		<div class="row" style="align-items: center;">
				<img class="reviewRecommend" src="${contextPath}/download?imageFileName=${reviewVO.review_recommend}.png" />
						<c:if test="${reviewVO.review_recommend eq '5'}">
							<font>적극 추천!</font>
						</c:if>
						<c:if test="${reviewVO.review_recommend eq '4'}">
							<font>추천!</font>
						</c:if>
						<c:if test="${reviewVO.review_recommend eq '3'}">
							<font>보통이에요.</font>
						</c:if>
						<c:if test="${reviewVO.review_recommend eq '2'}">
							<font>그냥 그래요.</font>
						</c:if>
						<c:if test="${reviewVO.review_recommend eq '1'}">
							<font>별로에요.</font>
						</c:if>
				<details>
			    	<summary>
			    		${reviewVO.review_title}
			   		</summary>
					<div class="" style="padding: 5;">
						<div id="wrap">
					  	<a href="javascript:openModal('reviewImg');" class="button modal-open">
					  		<img class="reviewImg" src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}" style="width: 200px;"/>
					  	</a>
					  	<div id="modal"></div>
							<div class="modal-con reviewImg">
								 <a href="javascript:;" class="close">X</a>
								 <div class="con">
									<img class="popImage" src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}" />
								 </div>
							</div>
						</div>
						<p> ${reviewVO.review_content}</p>
			    	</div>
			    	<p style="color: graytext;">${reviewVO.memberNick} | <fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></p>
				</details>
			</div>
				<hr>
		</c:if>
		</c:forEach>
  </div>
  
  
  <div style=" height: 300px"></div>

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
