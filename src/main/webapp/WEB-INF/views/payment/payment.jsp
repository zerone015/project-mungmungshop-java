<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="final_total_products_qty" value="0"/>
<c:set var="final_total_addPoint" value="0" />
<c:set var="total_payment_price" value="0"/>
<c:set var="final_total_payment_price" value="0" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>주문결제 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
		margin-right: 450;
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
						document.getElementById('address_1').value = data.zonecode;
						document.getElementById("address_2").value = roadAddr;
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

function reset_all() {
	var address_recipent = document.getElementById("address_recipent");

	var address_phone = document.getElementById("address_phone");

	var address_1 = document.getElementById("address_1");
	var address_2 = document.getElementById("address_2");
	var address_3 = document.getElementById("address_3");
	
	var address_request = document.getElementById("address_request");

	address_recipent.value = "";
	
	address_phone.value = "";
	
	address_1.value = "";
	address_2.value = "";
	address_3.value = "";
	
	address_request.value = "";
}

function restore_all() {
	var address_recipent = document.getElementById("address_recipent");

	var address_phone = document.getElementById("address_phone");

	var address_1 = document.getElementById("address_1");
	var address_2 = document.getElementById("address_2");
	var address_3 = document.getElementById("address_3");
	
	var address_request = document.getElementById("address_request");

	var h_address_recipent = document.getElementById("h_address_recipent");

	var h_address_phone = document.getElementById("h_address_phone");

	var h_address_1 = document.getElementById("h_address_1");
	var h_address_2 = document.getElementById("h_address_2");
	var h_address_3 = document.getElementById("h_address_3");
	
	var h_address_request = document.getElementById("h_address_request");
	
	address_recipent.value = h_address_recipent.value;

	address_phone.value = h_address_phone.value;
	
	address_1.value = h_address_1.value;
	address_2.value = h_address_2.value;
	address_3.value = h_address_3.value;
	
	address_request.value = h_address_request.value;

}

function fn_pay(){
	var form = document.payForm;
	
	var a_phoneNumb = form.address_phone;
	var detailAds = form.address_3;
	var recipent = form.address_recipent;
	var post = form.address_1;
	var postRequest = form.paymentRequest;
	var email = form.member_email;
	var name = form.member_name;
	var m_phoneNumb = form.member_phone;
	
	var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;							//한글,영어만 사용 가능							
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //여
	
	var pay_card = document.getElementById("pay_card");
	var pay_transfer = document.getElementById("pay_transfer");
	var pay_products_name = document.getElementById("pay_products_name");
	var pay_final_total_price = document.getElementById("pay_final_total_price");
	var pay_member_name = document.getElementById("pay_member_name");
	var pay_member_email = document.getElementById("pay_member_email");
	var pay_pay_member_phone = document.getElementById("pay_member_phone");
	
	var order_addPoint = document.getElementById("order_addPoint");
	
	$("#order_addPoint").val(parseInt(order_addPoint.value));
	
	
	if (recipent.value == "") {
		alert("수령인을 입력해주세요.");
		recipent.focus();
		return false;
	} 
	
	else if (recipent.value.length < 2) {
		alert("수령인을 알맞게 다시 입력해주세요.")
		recipent.select();
		return false;
	}
	
	else if (!regExpName.test(recipent.value)) {
		alert("수령인은 한글,영문만 사용 가능합니다.");
		recipent.select();
		return false;
	
	}
	
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
	
	
	if (a_phoneNumb.value == "") {
		alert("수령인 휴대폰 번호를 입력해주세요.");
		a_phoneNumb.focus();
		return false;
	}
	
	else if (!regExpPhone.test(a_phoneNumb.value)) {
		alert("잘못된 휴대폰 번호 입니다. -를 포함한 숫자만 입력해주세요.");
		a_phoneNumb.select();
		return false;
	}
	
	if (m_phoneNumb.value == "") {
		alert("주문자 휴대폰 번호를 입력해주세요.");
		m_phoneNumb.focus();
		return false;
	}
	
	else if (!regExpPhone.test(m_phoneNumb.value)) {
		alert("잘못된 휴대폰 번호 입니다. -를 포함한 숫자만 입력해주세요.");
		m_phoneNumb.select();
		return false;
	}
	
	if (email.value == "") {
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	}

	else if (!regExpEmail.test(email.value)) {
		alert("이메일 형식이 잘못되었습니다. 다시 입력해주세요.");
		email.select();
		return false;
	}

	if (pay_card.checked) {
		fn_pay_card();	
	}
	
	else if (pay_transfer.checked) {
		fn_pay_transfer();
	}
	
}

function fn_pay_card() {
	var form = document.payForm;
	
	var pay_products_name = document.getElementById("pay_products_name");
	var pay_final_total_price = document.getElementById("pay_final_total_price");
	var pay_member_name = document.getElementById("pay_member_name");
	var pay_member_email = document.getElementById("pay_member_email");
	var pay_pay_member_phone = document.getElementById("pay_member_phone");
	
	IMP.init('imp27822683');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	    pg : 'kcp',
	    /*
	    'kakao':카카오페이,
	    html5_inicis':이니시스(웹표준결제)
	    'nice':나이스페이
	    'jtnet':제이티넷
	    'uplus':LG유플러스
	    'danal':다날
	    'payco':페이코
	    'syrup':시럽페이
	    'paypal':페이팔
	    */
	    pay_method : 'card',
	    /*
	    'samsung':삼성페이,
	    'card':신용카드,
	    'trans':실시간계좌이체,
	    'vbank':가상계좌,
	    'phone':휴대폰소액결제
	    */
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    /*
	    merchant_uid에 경우
	    https://docs.iamport.kr/implementation/payment
	    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	    참고하세요.
	    */
	    name : pay_products_name.value, //결제창에서 보여질 이름
	    amount : pay_final_total_price.value, //실제 결제되는 가격
	    buyer_email : pay_member_email.value,
	    buyer_name : pay_member_name.value,
	    buyer_tel : pay_pay_member_phone.value,
	    /*
	    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	    	
	   		모바일 결제시,
	    	결제가 끝나고 랜딩되는 URL을 지정
	    	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	    	*/

	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다. \n';
	        msg += '고유ID : ' + rsp.imp_uid + "\n";
	        msg += '상점 거래ID : ' + rsp.merchant_uid + "\n";
	        msg += '결제 금액 : ' + rsp.paid_amount + "원\n";
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        alert(msg);
	        
	        form.method = "post";
			form.action = "${contextPath}/payment/addPayment.do"
			
			form.submit();
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	         alert(msg);
	    }
	});
}

function fn_pay_transfer() {
	var form = document.payForm;
	
	var pay_products_name = document.getElementById("pay_products_name");
	var pay_final_total_price = document.getElementById("pay_final_total_price");
	var pay_member_name = document.getElementById("pay_member_name");
	var pay_member_email = document.getElementById("pay_member_email");
	var pay_pay_member_phone = document.getElementById("pay_member_phone");
	
	IMP.init('imp27822683');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'trans',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : pay_products_name.value, //결제창에서 보여질 이름
	    amount : pay_final_total_price.value, //실제 결제되는 가격
	    buyer_email : pay_member_email.value,
	    buyer_name : pay_member_name.value,
	    buyer_tel : pay_pay_member_phone.value,
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다. \n';
	        msg += '고유ID : ' + rsp.imp_uid + "\n";
	        msg += '상점 거래ID : ' + rsp.merchant_uid + "\n";
	        msg += '결제 금액 : ' + rsp.paid_amount + "원\n";
	        alert(msg);
	        
	        form.method = "post";
			form.action = "${contextPath}/payment/addPayment.do"
			
			form.submit();
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	         alert(msg);
	    }
	});
}


function point_apply() {
	var own_point = document.getElementById("own_point");
	var total_payment_price = document.getElementById("total_payment_price");
	var sale_point = document.getElementById("sale_point");
	var point_availability = document.getElementById("point_availability");
	var point_check = document.getElementById("point_check");
	var sale_point_apply = document.getElementById("sale_point_apply");
	var font_final_total_price = document.getElementById("font_final_total_price");
	var pay_final_total_price = document.getElementById("pay_final_total_price");
	
	var sale_point_val = parseInt(sale_point.value);
	
	var sale_point_comma = numberWithCommas(parseInt(sale_point.value));
	
	if (own_point.value < sale_point_val) {
		point_check.disabled = true;
		$("#point_availability").html("포인트 부족");
		$("#order_usePoint").val(0);
	}
	
	else if (own_point.value >= sale_point_val && point_check.checked) {
		var sum = total_payment_price.value - sale_point_val;
		sum = numberWithCommas(parseInt(sum));
		$("#point_availability").html("적용 가능");
		$("#sale_point_apply").html(sale_point_comma);
		$("#font_final_total_price").html(sum+"원");
		$("#order_totalPrice").val(parseInt(total_payment_price.value - sale_point_val));
		$("#pay_final_total_price").val(parseInt(total_payment_price.value - sale_point_val));
		$("#order_usePoint").val(parseInt(total_payment_price.value / 10));
	}
	
	else {
		var sum = numberWithCommas(parseInt(total_payment_price.value));
		$("#point_availability").html("적용 가능");
		$("#sale_point_apply").html(0);
		$("#font_final_total_price").html(sum+"원");
		$("#order_totalPrice").val(parseInt(total_payment_price.value));
		$("#pay_final_total_price").val(parseInt(total_payment_price.value));
		$("#order_usePoint").val(0);
	}
	
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</head>
<body>
<form name="payForm" method="POST" action="">
<div class="container" style="max-width: 1400px;">
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
			<input type="radio" name="selectBy" value="old" onClick="restore_all()" checked> 최근 배송지
			<input type="radio" style="margin-left: 30px;" name="selectBy" value="new" onClick="reset_all()"> 신규 배송지
		</div>
		<div>
			수령인 <input type="text" style="margin-left: 55px;" placeholder="받으실 분 성함을 입력해주세요." id="address_recipent" name="address_recipent" class="form-control" value="${addressVO.address_recipent}">
			<input type="hidden" id="h_address_recipent" name="h_address_recipent" value="${addressVO.address_recipent}">
		</div>
		<div class="address2">
			핸드폰 <input type="text" placeholder="받으실 분의 휴대폰 번호를 입력해주세요." id="address_phone" name="address_phone" class="form-control" value="${addressVO.address_phone}">
			<input type="hidden" id="h_address_phone" name="h_address_phone" value="${addressVO.address_phone}">
		</div>
		<div class="address2">
			배송지주소 <span style="margin-right: 15px;"><input type="text" style="width: 355px;" placeholder="우편번호" id="address_1" name="address_1" class="form-control" value="${addressVO.address_1}" readonly>
			<input type="button" class="btn btn-outline-dark" style="height: 50px; margin-bottom: 5px;" onclick="sample4_execDaumPostcode()" value="우편번호"></span><br>
			<input type="hidden" id="h_address_1" name="h_address_1" value="${addressVO.address_1}">
		</div>
		<div class="address2">
			<input type="text" style="width: 450px; margin-left: 110px;" class="form-control" placeholder="도로명주소" size="30" id="address_2" name="address_2" value="${addressVO.address_2}" readonly><br>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="30"> 
			<span id="guide" style="color: #999; display: none"></span>
			<input type="hidden" id="h_address_2" name="h_address_2" value="${addressVO.address_2}">
		</div>
		<div class="address2">
			 <input type="text" style="width: 450px; margin-left: 110px;" class="form-control" placeholder="상세주소" size="30" id="address_3" name="address_3" maxlength="50" value="${addressVO.address_3}"><br>
			 <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="30"> 
			 <input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="30">
			 <input type="hidden" id="h_address_3" name="h_address_3" value="${addressVO.address_3}"><br>
		</div>
		<div class="address2">
			배송 요청사항 <input id="address_request" name="address_request" type="text" size="50" class="form-control" style="width: 450px; margin-right: 31px;" placeholder="배송 기사님께 요청할 메세지를 입력해주세요." value="${addressVO.address_request}" >
			<input type="hidden" id="h_address_request" name="h_address_request" value="${addressVO.address_request}">
		</div>
	</div>
</div>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>주문고객</b></h5>
	</div>
	<hr class="paymentHr">

	<div class="um">
	<div class="address2">
		이름 <input type="text" class="form-control" name="member_name" value="${memberVO.member_name}"/>
	</div>
	<div class="address2">
		핸드폰 <input type="text" class="form-control" name="member_phone" value="${memberVO.member_phone}"/>
	</div>
	<div class="address2">
		이메일 <input type="text" class="form-control" name="member_email" value="${memberVO.member_email}"/>
	</div>
	</div>
	<input type="hidden" name="member_num" value="${memberVO.member_num}"/>
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
				<th>배송비</th>
				<th>적립 포인트</th>
				<th>결제 금액</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${paymentPrdList != null}">
				<c:forEach items="${paymentPrdList}" var="item">
					<tr>
						<td class="td_prd"><img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"/></td>
						<td class="td_prd">${item.p_brand}</td>
						<td class="td_prd">${item.p_name}</td>
						<td class="td_prd">${item.cart_quantity}</td>
						<td class="td_prd">0원</td>
						<td class="td_prd"><fmt:formatNumber value="${item.p_price * item.cart_quantity / 60}" pattern="###,###,###"/>원</td>
						<td class="td_prd" style="font-size: 20px;"><b><fmt:formatNumber value="${item.p_price * item.cart_quantity}" pattern="###,###,###"/>원</b></td>
					</tr>
					<input type="hidden" name="p_code" value="${item.p_code}"/>
					<input type="hidden" name="p_price" value="${item.p_price}"/>
					<input type="hidden" name="order_quantity" value="${item.cart_quantity}"/>
					<input type="hidden" name="p_name" value="${item.p_name}"/>
					<input type="hidden" name="p_imageFileName" value="${item.p_imageFileName}"/>
					<c:set var="final_total_products_qty" value="${final_total_products_qty + item.cart_quantity}"/>
					<c:set var="final_total_addPoint" value="${final_total_addPoint + item.p_price * item.cart_quantity / 60}" />
					<c:set var="total_payment_price" value="${total_payment_price + item.p_price * item.cart_quantity}"/>
					<c:set var="final_total_payment_price" value="${final_total_payment_price + item.p_price * item.cart_quantity}" />
				</c:forEach>
				<input type="hidden" id="order_totalPrice" name="order_totalPrice" value="${final_total_payment_price}"/>
			</c:when>
			<c:otherwise>
				<tr>
					<td class="td_prd"><img src="${contextPath}/thumbnail/download?imageFileName=${paymentVO.p_imageFileName}"/></td>
					<td class="td_prd">${paymentVO.p_brand}</td>
					<td class="td_prd">${paymentVO.p_name}</td>
					<td class="td_prd">${paymentVO.order_quantity}</td>
					<td class="td_prd">0원</td>
					<td class="td_prd"><fmt:formatNumber value="${paymentVO.p_price * paymentVO.order_quantity / 60}" pattern="###,###,###"/>원</td>
					<td class="td_prd" style="font-size: 20px;"><b><fmt:formatNumber value="${paymentVO.p_price * paymentVO.order_quantity}" pattern="###,###,###"/>원</b></td>
				</tr>
				<input type="hidden" name="p_code" value="${paymentVO.p_code}"/>
				<input type="hidden" name="p_price" value="${paymentVO.p_price}"/>
				<input type="hidden" name="order_quantity" value="${paymentVO.order_quantity}"/>
				<input type="hidden" name="p_name" value="${paymentVO.p_name}"/>
				<input type="hidden" name="p_imageFileName" value="${paymentVO.p_imageFileName}"/>
				<input type="hidden" id="order_totalPrice" name="order_totalPrice" value="${final_total_payment_price}"/>
				<c:set var="final_total_products_qty" value="${final_total_products_qty + paymentVO.order_quantity}"/>
				<c:set var="final_total_addPoint" value="${final_total_addPoint + paymentVO.p_price * paymentVO.order_quantity / 60}" />
				<c:set var="total_payment_price" value="${total_payment_price + paymentVO.p_price * paymentVO.order_quantity}"/>
				<c:set var="final_total_payment_price" value="${final_total_payment_price + paymentVO.p_price * paymentVO.order_quantity}" />
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>결제방법</b></h5>
	</div>
	<hr class="paymentHr">
	<div style="float: left;">
		<input type="radio" name="order_method" id="pay_card" value="신용카드" checked/> 신용카드
	</div><br><br>
	<div style="float: left;">
		<input type="radio" name="order_method" id="pay_transfer" value="계좌이체"/> 계좌이체
	</div>
<br><hr><br>
	<div style="text-align: left;">
		<h5><b>최종 결제금액</b></h5>
	</div>
	<hr class="paymentHr">
	<table class="table table-sm table-bordered">
		<tr>
			<td class="td_payment">총 상품 금액</td>
			<td class="td_payment2"><fmt:formatNumber value="${total_payment_price}" pattern="###,###,###"/>원</td>
		</tr>
		<tr>
			<td class="td_payment">총 상품 수량</td>
			<td class="td_payment2">${final_total_products_qty}개</td>
		</tr>
		<tr>
			<td class="td_payment">포인트 할인</td>
			<td class="td_payment2"><input type="checkbox" id="point_check" name="sale_check" value="checked" onClick="point_apply();"/>-<font id="sale_point_apply">0</font>원 (보유 포인트:${memberVO.member_point}) <font id="point_availability" style="color: red;"></font></td>
			<input type="hidden" id="own_point" value="${memberVO.member_point}"/>
			<input type="hidden" id="total_payment_price" value="${total_payment_price}"/>
			<input type="hidden" id="sale_point" value="${total_payment_price / 10}"/>
		</tr>
		<tr>
			<td class="td_payment">총 적립금</td>
			<td class="td_payment2"><fmt:formatNumber value="${final_total_addPoint}" pattern="###,###,###"/>원</td>
		</tr>
		<tr>
			<td class="td_payment" style="font-size: 20px;"><b>총 결제 금액</b></td>
			<td class="td_payment2" style="font-size: 20px;"><b id="font_final_total_price"><fmt:formatNumber value="${final_total_payment_price}" pattern="###,###,###"/>원</b></td>
		</tr>
	</table>
</div>
<br>
<p style="font-size: 20px; font-weight: bold;">위 주문 내용을 확인하였으며 결제에 동의합니다.</p>
<br>
<button type="button" style="width: 400px;" class="btn btn-danger btn-lg" onClick="fn_pay();">결제하기</button>
</div>
<input type="hidden" id="pay_member_name" value="${memberVO.member_name}"/>
<input type="hidden" id="pay_member_email" value="${memberVO.member_email}"/>
<input type="hidden" id="pay_member_phone" value="${memberVO.member_phone}"/>
<input type="hidden" id="pay_products_name" value="${p_name}"/>
<input type="hidden" id="order_addPoint" name="order_addPoint" value="${final_total_addPoint}"/>
<input type="hidden" id="order_usePoint" name="order_usePoint" value="${total_payment_price / 10}"/>
<input type="hidden" name="order_totalQuantity" value="${final_total_products_qty}"/>
<input type="hidden" id="pay_final_total_price" value="${final_total_payment_price}"/>
</form>
</body>
</html>