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
function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes 
    = document.querySelectorAll('input[name="love"]');
  // 선택된 체크박스
  const checked 
    = document.querySelectorAll('input[name="love"]:checked');
  // select all 체크박스
  const selectAll 
    = document.querySelector('input[name="animal"]');
  
  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('love');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

function cartMoveCheck() {
	var check=document.loveForm.love;
	var num=0;
	
	for(var i=0; i<check.length; i++) {
		if (check[i].checked) {
			num++;
		}
	}
	if(!num){
		alert("장바구니로 이동할 상품을 선택해주세요.")
		return false;
		}
}

function delLoveCheck() {
	var check=document.loveForm.love;
	var num=0;
	
	for(var i=0; i<check.length; i++) {
		if (check[i].checked) {
			num++;
		}
	}
	if(!num){
		alert("삭제하려는 상품을 선택해주세요.")
		return false;
		}
}
</script>


</head>
<body>
<div class="container">
  <div>
  	<h3>찜 리스트</h3>
	<hr>
	<form name="loveForm" method="GET" action="">
	<!-- 후기 목록 -->
	<div style="margin-top: 10; ">
		<div style="text-align: left;">
			<label><input class="checkBox" type='checkbox' name='animal' value='selectall' onclick='selectAll(this)'/>전체 선택</label>
		</div>
		<div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	      	<div>
	      		<input class="checkBox" type="checkbox" name="love" onclick='checkSelectAll(this)'/>
	      	<img class="productImg" src="resources/image/네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg.jpg" style=" width: 60px; height: 60px;"/>

	        <strong class="mb-1" style="margin: 10;">네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg</strong>
	        </div>
	      </div>
	    </div>
	    <div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	      	<div>
	      		<input class="checkBox" type="checkbox" name="love" onclick='checkSelectAll(this)'  />

	      	<img class="productImg" src="resources/image/네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg.jpg" style=" width: 60px; height: 60px;"/>

	        <strong class="mb-1" style="margin: 10;">네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg</strong>
	        </div>
	      </div>
	    </div>
	    <div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	      	<div>
	      		<input class="checkBox" type="checkbox" name="love" onclick='checkSelectAll(this)' />

	      	<img class="productImg" src="resources/image/네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg.jpg" style=" width: 60px; height: 60px;"/>

	        <strong class="mb-1" style="margin: 10;">네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg</strong>
	        </div>
	      </div>
	    </div>
	    <div class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
	      <div class="d-flex w-100 align-items-center justify-content-between">
	      	<div>
	      		<input class="checkBox" type="checkbox" name="love" onclick='checkSelectAll(this)'  />

	      	<img class="productImg" src="resources/image/네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg.jpg" style=" width: 60px; height: 60px;"/>

	        <strong class="mb-1" style="margin: 10;">네츄럴코어 홀리스틱 베네 M32 멀티프로테인 6kg</strong>
	        </div>
	      </div>
	    </div>
    </div>
    <div style="text-align: right; margin-top: 20;">
    	<input type="button" value="삭제" class="btn btn-outline-danger" onclick="delLoveCheck()">
	    <input type="button" value="장바구니" class="btn btn-outline-primary" onclick="cartMoveCheck()">
    </div>
    </form>
 </div>
</div>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>