<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
function checkReview() {
	var form=document.reviewForm;
	if (form.review_content.value == "") {
		alert("내용을 입력해주세요");
		form.reviewWrite.focus();
		return false;
	} 
	
	if (form.review_content.value.length < 20) {
		alert("후기를 20자 이상 작성해주세요.");
		form.reviewWrite.select();
		return false;
	}
	
	form.submit();
}


<%
Timestamp nowTime = new Timestamp(System.currentTimeMillis());
%>

function fn_cancle() {
	if (confirm("정말 취소하시겠습니까? \n작성 내용은 저장되지 않습니다.") == true) {    //확인
	    self.close();
	}
	else {   //취소
	     return false;
	}
}

function fn_reviewClose(form) {
	window.opener.name="order"; 
	document.reviewForm.target="order";
	self.close();
	document.reviewForm.submit();
	document.reviewForm.action="${contextPath}/myPage/reviewList.do";	
}	
</script>

<style>
	input {
		margin-bottom: 5;
	}
	
	.subscript {
		color: gray; font-size: 12px; text-align: left; margin: auto; margin-bottom: 5;
	}
</style>
</head>
<body>
<div class="container">
<h3>상품 후기</h3>
<hr>
  <!-- 후기 작성 -->
  <form name="reviewForm" method="POST" action="${contextPath}/reviewWrite.do" enctype="multipart/form-data">
	<div class="row g-3">
      <div class="col-12">
      	<!-- 상품코드 -->
      	<input type="hidden" class="form-control" name="p_code" value="${product.p_code}" readonly>
      	
      	<p class="subscript" > 상품명</p>
      	<input type="text" class="form-control" name="p_name" value="${product.p_name}" readonly>
      	
      	<p class="subscript" > 닉네임</p>
      	<input type="text" class="form-control" name="member_nick" value="${member_nick}" readonly>
      	
      	
      	<input type="hidden" id = "review_date" name = "review_date" value="<%=nowTime%>" readonly>
		
		<p class="subscript" > 이미지 첨부</p>
		<input type="file" id="imgUp" class="form-control-file" name = "review_imageFileName" >
      	
      	<div class="select_img">
			<img src="" />
		</div>

		<script>
			$("#imgUp").change(
					function() {
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src",
										data.target.result).width(200);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
		</script>
      	
      	<p class="subscript" > 후기 내용</p>
        <textarea name="review_content" class="form-control" style="height:150; resize:none;" id="" placeholder="후기를 작성해주세요."></textarea>
       	
       
        <div style="margin-top: 5; ">
	        <p class="subscript">상품에 대한 평가를 20자 이상 작성해 주세요</p>
	      	<p class="subscript" style="margin: none">500 포인트가 적립됩니다.</p>
        	<br>
        	<button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; float: right;" onclick="checkReview();fn_reviewClose();">등록</button>
        	<button type="button" class="btn btn-danger" style="width: 100px; height: 50px; float: right;  margin-right: 10;" onclick="fn_cancle();">취소</button>
        </div>
      </div>
	</div>
	</form>
</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>