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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="undefined" crossorigin="anonymous">
<script> 
function modReview(){ 
	if(confirm('후기를 수정하시겠습니까?'))window.close();
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
	      <div class="d-flex w-100 align-items-center justify-content-between">
	      	<div>
	      	  <img src="${contextPath}/download?imageFileName=${reviewVO.review_imageFileName}" style=" width: 60px; height: 60px; border: 1px solid #CCCCCC"/>
	      	</div>
	      	<div>
	          <strong class="mb-1">${reviewVO.review_title}</strong>
	        </div>
	        <div>
	          <font class="mb-1"><fmt:formatDate value="${reviewVO.review_date}" pattern="YYYY-MM-dd"/></font>
	        </div>
	        <div>
	          <button class="btn btn-outline-primary" onclick="javascript:modReview()">수정</button>
	          <button class="btn btn-outline-danger" onclick="javascript:delReview()">삭제</button>
	        </div>
	      </div>
	    </div>
	    </c:forEach>
    </div>
 </div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>