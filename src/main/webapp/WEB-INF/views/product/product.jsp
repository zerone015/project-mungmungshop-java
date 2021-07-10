<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뭉뭉샵</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="undefined" crossorigin="anonymous">

<script>
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
</script>
</head>
<body>
<div class="container">
  <div class="row" style="text-align: center">
	<div class="col-md-6" style="display: inline-block;">
	  <div class="card mb-4 shadow-sm" style="cursor: pointer;" onclick="location.href='#';">
	    	<img class="productImg" src="resources/image/네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg.jpg" style=" width: 100%; height: 100%;"/>
	    </div>
	  </div>
	<div class="col-md-5" >
		<b>네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg</b>
		<hr>
		<div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">판 매 가</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;"><b>32,500</b></p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">제 조 사</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">제 조 사</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">원 산 지</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">원 산 지</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">재 고 수</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <p style="float: right;">재 고 수</p>
			</div>
		</div>
		<div class = "row">
			<div style="width: 30%; float: left;">
			  <p style="float: center;">주문 수량</p>
			</div>
			<div style = "width: 30%; float:right;">
			  <input type="number" style="text-align: center; width: 60%; float: right; margin-right: 0px!important;" class="form-control mr-sm-3" min='1' max='99' value="1"  />
			</div>
		</div>
	  </div>
	  <div  style="margin-top: 50;">
	  	<p><button type="button" class="btn btn-outline-danger btn-block" style="height: 50px;">찜</button></p>
	  	<p><button type="button" class="btn btn-outline-primary btn-block" style="height: 50px;">장바구니 담기</button></p>
	  	<p><button type="button" class="btn btn-danger btn-block" style="height: 50px;">바로 구매하기</button></p>
	  </div>
	</div>
  </div>
  
  <hr>
  
  상세정보 들어가는 곳
  
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

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>