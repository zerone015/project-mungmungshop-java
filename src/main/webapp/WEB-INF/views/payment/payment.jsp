<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>주문결제 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.form-control {
		display:inline-block;
		width: 450px;
		height: 50px;
		margin-left: 40px;
	}
	.main {
		border: 1px solid rgba(235, 235, 235, 1);
		padding: 30px 116px 50px;
	}
	.um {
		margin-right: 600px;
		width: 57%;
	}
	
	.paymentHr {
		border:solid 1px gray;
	}
	
	.address {
		margin-right: 30px;
	}
	
	.address2 {
		margin-top: 20px;
	}
	.td_payment {
		background-color: F4F4F5;
		height: 60px;
		line-height: 60px;
		width: 300px;
	}
	.td_payment2 {
		line-height: 60px;
	}
	.td_prd {
		height: 90px;
		line-height: 90px;
	}
	.table_dcdcdc{
		background-color: F4F4F5;
	}
</style>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						document.getElementById("sample4_engAddress").value = data.addressEnglish;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<script type="text/javascript">
function checkPayment() {
		
	var form=document.payment;
	
	var phoneNumb=form.address_phone;
	var detailAds=form.address_3;
	var name=form.address_recipent;
	var post=form.address_1;
	var postRequest=form.paymentRequest;
	
	var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;							//한글,영어만 사용 가능							
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
	
	if (name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	} 
	
	else if (name.value.length < 2) {
		alert("이름을 알맞게 다시 입력해주세요.")
		name.select();
		return false;
	}
	
	else if (!regExpName.test(name.value)) {
		alert("이름은 한글,영문만 사용 가능합니다.");
		name.select();
		return false;
	
	}
	
	if (post.value == "") {
		alert("우편번호를 입력해주세요.");
		post.focus();
		return false;
	}
	
	if (detailAds.value == "") {
		alert("상세 주소를 입력해주세요.");
		detailAds.focus();
		return false;
	}
	
	
	if (phoneNumb.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		phoneNumb.focus();
		return false;
	}
	
	else if (!regExpPhone.test(phoneNumb.value)) {
		alert("잘못된 휴대폰 번호 입니다. -를 포함한 숫자만 입력해주세요.");
		phoneNumb.select();
		return false;
	}

	
	form.submit();
}
</script>
</head>
<body>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>주문결제</b></h4>
</div>
<div class="main">
	<div style="text-align: left;">
		<h5><b>배송정보</b></h5>
	</div>
	<hr class="paymentHr">
	<div class="um">
		<div class="address">
		<div style="margin-left: 250px; margin-bottom: 15px;">
			<input type="radio" name="selectBy" value="old" checked> 기본 배송지
			<input type="radio" style="margin-left: 30px;" name="selectBy" value="new"> 신규 배송지
		</div>
		<div>
			수령인 <input type="text" style="margin-left: 55px;" name="address_recipent" class="form-control">
		</div>
		<div class="address2">
			휴대전화 <input type="text" name="address_phone" class="form-control">
		</div>
		<div class="address2">
			배송지주소 <span style="margin-right: 15px;"><input type="text" style="width: 355px;" id="sample4_postcode" placeholder="우편번호" name="address_1" class="form-control" value="${paymentVO.address_1}" readonly>
			<input type="button" class="btn btn-outline-dark" style="height: 50px; margin-bottom: 5px;" onclick="sample4_execDaumPostcode()" value="우편번호"></span><br>
		</div>
		<div class="address2">
			<input type="text" style="width: 450px; margin-left: 110px;" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" size="30" name="address_2" value="${paymentVO.address_2}" readonly><br>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="30"> 
			<span id="guide" style="color: #999; display: none"></span> 
		</div>
		<div class="address2">
			 <input type="text" style="width: 450px; margin-left: 110px;" class="form-control" id="sample4_detailAddress" placeholder="상세주소" size="30" name="address_3" maxlength="50" value="${paymentVO.address_3}"><br>
			 <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="30"> 
			 <input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="30"><br>
		</div>
		<div class="address2">
			배송 요청사항 <select class="form-control" style="width: 450px; margin-right: 31px;">
				<option>배송 전 연락바랍니다.</option>
				<option>부재시 휴대전화로 연락해주세요.</option>
				<option>부재시 경비실에 맡겨주세요.</option>
				<option>부재시 문앞에 놓아주세요.</option>
				<option>직접 입력</option>
			</select>
		</div>
	</div>
</div>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>주문상품</b></h5>
	</div>
	<hr class="paymentHr">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>상품 이미지</th>
				<th>브랜드</th>
				<th>상품명</th>
				<th>수량</th>
			 	<th>적립금</th>
			 	<th>포인트 적용</th>
				<th>결제 금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="td_prd"><img src="${contextPath}/resources/image/category/acana_adult_smallbrid_2kg.PNG"/></td>
				<td class="td_prd">아카나</td>
				<td class="td_prd">상품명이다 ㅁㅇㄻㄴㅇㄹ</td>
				<td class="td_prd">6</td>
				<td class="td_prd">300</td>
				<td class="td_prd">-300</td>
				<td class="td_prd" style="font-size: 20px;"><b>14124원</b></td>
			</tr>
		</tbody>
	</table>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>최종 결제금액</b></h5>
	</div>
	<hr class="paymentHr">
	<table class="table table-sm table-bordered">
		<tr>
			<td class="td_payment">총 상품 금액</td>
			<td class="td_payment2">12313원</td>
		</tr>
		<tr>
			<td class="td_payment">포인트 할인</td>
			<td class="td_payment2">123 원</td>
		</tr>
		<tr>
			<td class="td_payment">총 적립금</td>
			<td class="td_payment2">1231원</td>
		</tr>
		<tr>
			<td class="td_payment" style="font-size: 20px;"><b>총 결제 금액</b></td>
			<td class="td_payment2" style="font-size: 20px;"><b>123123원</b></td>
		</tr>
	</table>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>결제방법</b></h5>
	</div>
	<hr class="paymentHr">
	<div style="width: 300px; border: 1px solid black; float: left;">
		무통장 입금 <input type="checkbox" data-toggle="checkbox" name="nobank" value="Id" checked="checked" disabled id="cb1"> 신한
		123-12312-12312
	</div>
	<span> 48시간 이내에 해당 계좌로 입금해주세요.</span>
</div>
<br>
<p style="font-size: 14px; font-weight: bold;">위 주문 내용을 확인하였으며 결제에 동의합니다.</p>
<br>
<input type="submit" style="width: 400px;" class="btn btn-danger btn-lg" value="결제하기">
</body>
</html>