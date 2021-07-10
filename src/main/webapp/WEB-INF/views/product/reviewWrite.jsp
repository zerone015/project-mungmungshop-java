<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="undefined" crossorigin="anonymous">
<script type="text/javascript">
function checkReview() {
	var form=document.review;
	if (form.reviewWrite.value == "") {
		alert("내용을 입력해주세요");
		form.reviewWrite.focus();
		return false;
	} 
	
	if (form.reviewWrite.value.length < 20) {
		alert("후기를 20자 이상 작성해주세요.");
		form.reviewWrite.select();
		return false;
	}
	
	form.submit();
}
</script>

</head>
<body>
<div class="container">
<h3>상품 후기</h3>
<hr>
  <!-- 후기 작성 -->
  <form name="review" method="GET" action="">
	<div class="row g-3">
      <div class="col-12">
      	<p style="color: gray; font-size: 12px; text-align: left; margin: auto;">상품에 대한 평가를 20자 이상 작성해 주세요</p>
      	<p style="color: gray; font-size: 12px; text-align: left;">500 포인트가 적립됩니다.</p>
        <textarea name="reviewWrite" class="form-control" style="height:150; resize:none;" id="" placeholder="후기를 작성해주세요."></textarea>
        <div style="margin-top: 5; ">
        	<p><button type="button" class="btn btn-danger" style="width: 100px; height: 50px; float: right; ">취소</button></p>
        	<p><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; float: right; margin-right: 10;" onclick="checkReview()">등록</button></p>
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