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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>관리자 상품 등록 페이지</title>
</head>
<script type="text/javascript">
	// 카테고리 1차 분류 선택에 따른 2차 분류
	function categoryChange(e) {
		var good_a = [ "퍼피", "어덜트", "시니어", "전연령" ];
		var good_b = [ "사사미", "껌", "건조", "비스킷", "수제", "캔" ];
		var good_c = [ "하우스/방석", "급식기/급수기", "울타리/안전문", "계단" ];
		var good_d = [ "배변", "영양제", "미용" ]
		var good_e = [ "이동 가방", "유모차", "차량용 이동장", "목줄", "이름표/인식표", "가슴줄",
				"리드줄" ]
		var good_f = [ "의류", "액세서리", "디자인/소품" ]
		var good_g = [ "노즈워크", "훈련", "장난감/토이" ]
		var target = document.getElementById("country");

		if (e.value == "사료")
			var d = good_a;
		else if (e.value == "간식")
			var d = good_b;
		else if (e.value == "리빙")
			var d = good_c;
		else if (e.value == "케어")
			var d = good_d;
		else if (e.value == "외출")
			var d = good_e;
		else if (e.value == "패션")
			var d = good_f;
		else if (e.value == "장난감")
			var d = good_g;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
<script>
	function checkProductAdd() {
		var form = document.productAdd;
		
		var regExpInt = /^[0-9]*$/;		//숫자만 입력 가능
		
		var str = document.getElementById("textarea").value; 		//textarea 엔터 자동 </br> 치환
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("textarea").value = str;			

		if (form.p_name.value == "") {
			alert("상품명을 입력해주세요.");
			form.p_name.focus();
			return false;
		}

		if (form.p_price.value == "") {
			alert("판매가를 입력해주세요.");
			form.p_price.focus();
			return false;
		}
		else if (!regExpInt.test(form.p_price.value)) {
			alert("판매가는 숫자만 입력 가능합니다.");
			form.p_price.select();
			return false;
		}

		if (form.p_brand.value == "") {
			alert("브랜드명을 입력해주세요.");
			form.p_brand.focus();
			return false;
		}

		if (form.p_origin.value == "") {
			alert("원산지를 입력해주세요.");
			form.p_origin.focus();
			return false;
		}

		if (form.p_stock.value == "") {
			alert("남은 재고 수량을 입력해주세요.");
			form.p_stock.focus();
			return false;
		}
		else if (!regExpInt.test(form.p_stock.value)) {
			alert("재고 수량은 숫자만 입력 가능합니다.");
			form.p_stock.select();
			return false;
		}

		if (form.p_description.value == "") {
			alert("상품 소개를 입력해주세요.");
			form.p_description.focus();
			return false;
		}

		if (form.p_imageFileName.value == "") {
			alert("상품 이미지를 첨부해주세요.");
			return false;
		}

		if (form.p_cl1.value == "") {
			alert("1차 분류를 선택해주세요.");
			return false;
		}

		if (form.p_cl2.value == "전체") {
			alert("2차 분류를 선택해주세요.");
			return false;
		}

		form.submit();
	}
</script>
<body>
	<div class="col-md-5" style="float: center;">
		<h1>
			<b>상품 등록</b>
		</h1>
	</div>
	<br>
	<br>
	<form name="productAdd" method="POST" action="${contextPath}/manager/addProduct.do" enctype="multipart/form-data">
		<span>1차 분류</span>&nbsp; <span><select class="form-select"
			onchange="categoryChange(this)" name="p_cl1">
				<option value=""> </option>
				<option value="사료">사료</option>
				<option value="간식">간식</option>
				<option value="리빙">리빙</option>
				<option value="케어">케어</option>
				<option value="외출">외출</option>
				<option value="패션">패션</option>
				<option value="장난감">장난감</option>
		</select></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>2차 분류</span>&nbsp; <span><select
			class="form-select" id="country" name="p_cl2">
				<option value=""> </option>
		</select></span> <br>
		<br>
		<p>
			상품명 <input type="text" name="p_name" maxlength="50">
		</p>
		<p>
			판매가 <input type="text" name="p_price">
		</p>
		<p>
			브랜드명 <input type="text" name="p_brand" maxlength="20">
		</p>
		<p>
			원산지 <input type="text" name="p_origin" maxlength="56">
		</p>
		<p>
			재고 수 <input type="text" name="p_stock">
		</p>
		<p>
			상품 소개
			<textarea id="textarea" name="p_description" cols="60" rows="6"></textarea>
		</p>
		<input type="file" id="imgUp" name="p_imageFileName" />
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
		<br> <br>
		<div align="center">
			<button type="button" class="btn btn-outline-dark"
				onclick="checkProductAdd()">등록</button>
			<button type="button" class="btn btn-dark" onclick="javascript: history.back();">취소</button>
		</div>
	</form>
</body>
</html>