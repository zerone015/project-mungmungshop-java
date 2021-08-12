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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkReview() {
	
	var form=document.reviewModForm;
	
	if (form.review_title.value.length > 45) {
		alert("제목은 45자까지만 입력 가능합니다.");
		form.review_title.focus();
		return false;
	} 
	
	if (form.review_content.value == "") {
		alert("내용을 입력해주세요");
		form.review_content.focus();
		return false;
	} 	
	
	if (form.review_content.value.length < 20) {
		alert("후기를 20자 이상 작성해주세요.");
		form.review_content.focus();
		return false;
	}
	
	
	
	var formm = $('#reviewModForm');
 	var formData = new FormData(formm[0]);
 	var review_num = form.review_num.value;
	$.ajax({
		url : "${contextPath}/reviewMod.do?review_num="+review_num,
		type : "POST",
	 	enctype: 'multipart/form-data',
	 	dataType:'json',
	    processData:false,
	    contentType:false,
	    cache:false,
		data : formData,
		success: function(jdata){
			var p_code = '${product.p_code}';
			window.opener.name="reviewList"; 
			document.reviewModForm.target="reviewList"; 
			self.close(); 
			window.opener.location.href="${contextPath}/myPage/reviewList.do";  
		} 
		
	});
	
}

function fn_cancle() {
	if (confirm("정말 취소하시겠습니까? \n작성 내용은 저장되지 않습니다.") == true) {    //확인
	    self.close();
	}
	else {   //취소
	     return false;
	}
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
  <form name="reviewModForm" id="reviewModForm" method="POST" 
  			action="${contextPath}/reviewMod.do?review_num=${reviewVO.review_num}" enctype="multipart/form-data">
	<div class="row g-3">
      <div class="col-12">
      	<!-- 리뷰 번호, 상퓸 번호 -->
      	<input type="hidden" class="form-control" name="p_code" value="${reviewVO.p_code}" readonly>
      	<input type="hidden" class="form-control" name="review_num" value="${reviewVO.review_num}" readonly>
      	
      	<p class="subscript" > 상품명</p>
      	<input type="text" class="form-control" name="p_name" value="${productVO.p_name}" readonly>
      	
      	<p class="subscript" > 닉네임</p>
      	<input type="text" class="form-control" name="member_nick" value="${reviewVO.memberNick}" readonly>
      	
      	<p class="subscript" > 제목</p>
      	<input type="text" class="form-control" id="review_title" name="review_title" value="${reviewVO.review_title}" >
      	
      	<p class="subscript" > 만족도</p>
      	<select name="review_recommend" class="form-control">
		    <option value="5">5점</option>
		    <option value="4">4점</option>
		    <option value="3">3점</option>
		    <option value="2">2점</option>
		    <option value="1">1점</option>
		</select>
      	
      	<input type="hidden" id = "review_date" name = "review_date" value="${reviewVO.review_date}" >
		
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
        <textarea name="review_content" id="review_content" class="form-control" style="height:150; resize:none;"> ${reviewVO.review_content} </textarea>
       	
       
        <div style="margin-top: 5; ">

        	<button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; float: right;" onclick="checkReview();">수정</button>
        	<button type="button" class="btn btn-danger" style="width: 100px; height: 50px; float: right;  margin-right: 10;" onclick="fn_cancle();">취소</button>
        </div>
      </div>
	</div>
	</form>
</div>

</body>
</html>