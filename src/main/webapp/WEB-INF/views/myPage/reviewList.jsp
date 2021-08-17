<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/reviewList.css">
<script> 
function fn_reviewMod(url,title,width,height,top,left) {
	window.name = "reviewList";
	
	window.open(url,title,"width="+width+",height="+height+",top="+top+",left="+left);
}

function fn_reviewRemove(review_num){ 
	if(confirm('후기를 삭제하시겠습니까?')){
		location.href="${contextPath}/myPage/removeReview.do?review_num=" + review_num; 
	}else{
		return false;
	}
}


</script>

</head>
<body>
<div class="container">
  <div>
  	<h4><b>상품 후기</b></h4>
	<hr>
	<!-- 후기 목록 -->
	<c:if test="${reviewList.size() == 0 }">
		<div style="margin-top: 300px;">
			<h3>작성한 후기가 없습니다.</h3>
		</div>	
	</c:if>
	<div style="margin-top: 10; ">
		<c:forEach items="${reviewList}" var="reviewVO">		
		<div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	       <div class="d-flex align-items-center justify-content-between">
	      	<div class="titleDiv">
	      	  <img class="reviewImage"src="${contextPath}/download?imageFileName=${reviewVO.p_imageFileName}"/><br>
	      	  <a href="${contextPath}/product/getProduct.do?p_code=${reviewVO.p_code}"><font style="color: #828282;">${reviewVO.p_name}</font></a>
	      	</div>
	      	<div class="imageDiv">
	      	  <img class="reviewImage"src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}"/>
	      	</div>
	      	<div class="titleDiv">
	          <strong>${reviewVO.review_title}</strong><br>
	          ${reviewVO.review_content}
	        </div>
	        <div class="dateDiv">
	          <font><fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></font>
	        </div>
	        
	         <div class="dateDiv">
	         	<c:choose>
	         		<c:when test="${reviewVO.review_test.equals('Y')}">
	         			<font style="color: #008000; font-weight: bold;">승인</font>
	         		</c:when>
	         		<c:when test="${reviewVO.review_test.equals('C')}">
	         			<font style="color: red; font-weight: bold;">취소</font><br>
	         			<font style="color: #B2B2B2;">(리뷰를<br>수정해주세요.)</font>
	         		</c:when>
	         		<c:otherwise>
	         			<font style="color: blue; font-weight: bold;">검수중</font><br>
	         			<font style="color: #B2B2B2;">(승인되면<br>포인트가<br>지급됩니다.)</font>
	         		</c:otherwise>
	         	</c:choose>
	        </div>
	        <div class="btnDiv">
	        <c:if test="${reviewVO.review_test.equals('N') || reviewVO.review_test.equals('C')}">
	          	<button class="btn btn-outline-primary modBtn" onclick="javascript:fn_reviewMod('${contextPath}/reviewModForm.do?review_num=${reviewVO.review_num}','reviewModForm',460,700,50,50)">수정</button>
	          	<button class="btn btn-danger modBtn" onclick="javascript:fn_reviewRemove(${reviewVO.review_num})">삭제</button>
	        </c:if>
	        </div>
	      </div>
	    </div>
	    </c:forEach>
    </div>
 </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</body>
</html>