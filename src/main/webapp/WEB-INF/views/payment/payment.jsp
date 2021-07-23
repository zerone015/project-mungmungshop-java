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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
h3 {
	text-align: left;
}

h4 {
	text-align: left;
}

h5 {
	text-align: left;
}

h6 {
	text-align: left;
}

ul {
	list-style: none;
	padding-left: 0px;
}

ul {
	display: -webkit-box; /* OLD - iOS 6-, Safari 3.1-6 */
	display: -moz-box; /* OLD - Firefox 19- (거의 대부분 동작) */
	display: -ms-flexbox; /* TWEENER - IE 10 */
	display: -webkit-flex; /* NEW - Chrome */
	display: flex; /* NEW, Spec - Opera 12.1, Firefox 20+ */
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	
	var phoneNumb=form.paymentPhoneNumb;
	var detailAds=form.paymentDetailAds;
	var name=form.paymentName;
	var post=form.paymentPost;
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
	<div class="container">

		<div
			style="width: 450px; height: 500px; float: left; margin-top: 10px; margin-right: 30px; margin-left: 30px">
			<h3>주문결제</h3>
			<hr width="100%" size="3">
			<form method="GET" action="#" name="payment">
				<h5 style="margin-left: 9px;">배송지 선택</h5>
				<input style="margin-left: 110px;" type="radio" name="selectBy" value="old" checked> 기본 배송지
				<input style="margin-left: 15px;" type="radio" name="selectBy" value="new"> 신규 배송지
				<div style="width: 400px; height: 250px; border: 1px solid black; margin-left: 10px;">
					<h6 style="margin-bottom: 20px;">
						<br>수령인 <input type="text" name="paymentName" maxlength="20" value="${paymentVO.address_recipent}">
					</h6>
					<div style="float: left;">
						&nbsp;&nbsp;주소&nbsp; <input type="text"
							id="sample4_postcode" placeholder="우편번호" name="paymentPost" value="${paymentVO.address_1}" readonly> <input
							type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text"
							id="sample4_roadAddress" placeholder="도로명주소" size="30" name="paymentAds" value="${paymentVO.address_2}" readonly><br>
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"
							size="30"> <span id="guide"
							style="color: #999; display: none"></span> <input type="text"
							id="sample4_detailAddress" placeholder="상세주소" size="30" name="paymentDetailAds" maxlength="50" value="${paymentVO.address_3}"><br>
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"
							size="30"> <input type="hidden" id="sample4_engAddress"
							placeholder="영문주소" size="30"><br>
					</div>
					<div style="float: left;">
						&nbsp;휴대폰 번호&nbsp;<input type="text" name="paymentPhoneNumb" placeholder="-을 포함한 휴대폰 번호" value="${paymentVO.address_phone}">
					</div>	
				<!-- 여기까지 새로운 배송지시 배송지 선택! -->
		</div>
		<br>
		<select id="shipmentmessage" name="shipmentmessage" size="1"
						style="float: left; margin-left: 20px;">

						<option value="">배송시요청사항(선택사항)</option>
						<option value="beforeshipment">배송전 연락바랍니다</option>
						<option value="absentcall">부재시 연락바랍니다.</option>
						<option value="guardroom">부재시 경비실에 맡겨주세요</option>
						<option value="frontdoor">직접 입력</option>
					</select>
						&nbsp;
				<div>
				 <br>&nbsp;<br> <input name="paymentRequest" type="text" title="배송시 요청사항 기재"
						style="float: left; margin-left: 20px;" maxlength="30" > <br> <br>
				</div>
				</div>
		</form>
			<h6>주문상품정보</h6>
		<table>
			<tr>
				<th>브랜드</th>
				<th>상품명</th>
				<th>수량</th>
				<th>적립금</th>
				<th>포인트 할인</th>
				<th>주문 금액</th>
			</tr>
			<c:forEach items="${orderPrdList}" var="items">
				<tr>
					<td>${items.p_brand}</td>
					<td>${items.p_name}</td>
					<td>${items.cart_quantity}</td>
					<td><fmt:formatNumber value="${items.p_price*items.cart_quantity/80}" pattern="###,###,###" />원</td>
					<td>&nbsp;</td>
					<td><fmt:formatNumber value="${items.p_price*items.cart_quantity}" pattern="###,###,###" />원
				</tr>
			</c:forEach>
		</table>
		
		<div
			style="width: 450px; height: 400px; float: right; margin-top: 40px; margin-right: 30px;">


			<!-- 최종결제 정보창 -->
			<h6>최종결제 정보</h6>
			<div
				style="width: 440px; height: 310px; border: 1px solid black; float: right; margin-top: 5px; margin-right: 5px; margin-left: 20px;">
				&nbsp;
				<h4>&nbsp;상품금액</h4>
				<span style="float: right; margin-right: 30px;">insert price
					원</span> &nbsp;
				<h4>&nbsp;배송비</h4>
				<span style="float: right; margin-right: 30px;">insert price
					원</span> &nbsp;
				<hr width="100%" size="3">

				<h4>&nbsp;결제금액</h4>
				<span style="float: right; margin-right: 30px;">insert price
					원</span> <br> <br> <input type="button" class="btn btn-dark"
					style="width: 100%; height: 50px;" onclick="checkPayment()" value="결제하기">
			</div>
		</div>
	<!-- 결제방식 출력 창 -->
		<div
			style="width: 450px; height: 150px; float: left; margin-top: 30px; margin-left: 30px;">
			<h5>결제방식</h5>

			<div
				style="width: 300px; border: 1px solid black; margin-top: 20px; margin-left: 80px;">

				<input type="checkbox" data-toggle="checkbox" name="nobank"
					value="Id" checked="checked" disabled id="cb1"> 신한
				123-12312-12312
			</div>
		</div>
	</div>
</body>
</html>