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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">

<link rel="stylesheet" href="${contextPath}/resources/css/reviewList.css">
<script> 

function fn_reviewMod(url,title,width,height,top,left) {
	window.name = "reviewList";
	
	window.open(url,title,"width="+width+",height="+height+",top="+top+",left="+left);
}



function delReview(){ 
	if(confirm('후기를 삭제하시겠습니까?'))window.close();
}

</script>

</head>
<body>
<div class="container">
  <div>
  	<h3>상품 후기</h3>
	<hr>
	<!-- 후기 목록 -->
	<div style="margin-top: 10; ">
		<c:forEach items="${reviewList}" var="reviewVO">		
		<div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex align-items-center justify-content-between">
	      	<div class="imageDiv">
	      	  <img class="reviewImage"src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}"/>
	      	</div>
	      	<div class="titleDiv">
	          <strong>${reviewVO.review_title}</strong>
	        </div>
	        <div class="dateDiv">
	          <font><fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></font>
	        </div>
	        <div class="btnDiv">
	          <button class="btn btn-outline-primary modBtn" onclick="javascript:fn_reviewMod('${contextPath}/reviewModForm.do?review_num=${reviewVO.review_num}','reviewModForm',460,700,50,50)">수정</button><br>
	        </div>
	      </div>
	    </div>
	    </c:forEach>
    </div>
 </div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</body>
</html>