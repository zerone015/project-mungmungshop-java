<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<title>주문 상품 환불</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }    
</script>
<script>
	function refund_check() {
		var form = document.refundForm;
		var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/; 				//한글,영어만 사용 가능
		var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
		
		var recipent = form.refund_name;
		var phoneNumb = form.refund_tel;
		var address = form.refund_address1;
		var detailAddress = form.refund_address3;
		
		if (form.buyer_reason.value == "unselected" && form.seller_reason.value == "unselected") {
			alert("환불 사유를 선택해주세요.");
			return false;
		}
		
				
		if (recipent.value == "") {
			alert("수령인을 입력해주세요.");
			recipent.focus();
			return false;
		}
		
		else if (!regExpName.test(recipent.value)) {
			alert("수령인은 한글,영문만 사용 가능합니다. 다시 입력해주세요.");
			recipent.select();
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
		
		if (address.value == "") {
			alert("주소를 입력해주세요.");
			return false;
		}
		
		if (detailAddress.value == "") {
			alert("상세 주소를 입력해주세요.");
			detailAddress.focus();
			return false;
		}
		
		
		form.submit();
	}
</script>
<body>
<form name="refundForm" method="post" action="${contextPath}/myPage/addOrderRefund.do">
<div class="container">
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>환불 상품</b></h4>
</div>	
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th>&nbsp;</th>
				<th>상품명</th>
				<th>포인트 할인</th>
				<th>주문 금액(수량)</th>
				<th>적립 포인트</th>
				<th>배송 정보</th>
				<th>주문 상태</th>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td><img src="${contextPath}/thumbnail/download?imageFileName=${combineVO.p_imageFileName}"/></td>
				<td>${combineVO.p_name}</td>
				<c:choose>
					<c:when test="${order_usePoint != 0}">
						<td>-<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity / 10}" pattern="###,###,###"/>원<br></td>
						<td><fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10}" pattern="###,###,###"/>원<br>${combineVO.order_quantity}개</td>
					</c:when>
					<c:otherwise>
						<td>-0원</td>
						<td><fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity}" pattern="###,###,###"/>원<br>${combineVO.order_quantity}개</td>
					</c:otherwise>
				</c:choose>
				<td>+<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity / 60}" pattern="###,###,###"/>원<br>적립</td>
				<td>뭉뭉샵<br>본사배송<br>평균배송일 2일</td>
				<td>${combineVO.order_status}</td>
			</tr>
		</tbody>
	</table>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>환불 사유</b></h4>
</div>	
		<table class="table table-hover">
		<tbody>
			<tr align="center">
				<td>구매자 책임사유</td>
				<td>
				<select name="buyer_reason">
					<option value="unselected">환불 사유를 선택하세요</option>
					<option value="단순 변심">단순 변심</option>
					<option value="수량을 잘못 선택함">수량을 잘못 선택함</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td>판매자 책임사유</td>
				<td>
				<select name="seller_reason">
					<option value="unselected">환불 사유를 선택하세요</option>
					<option value="판매자로 부터 품절 안내 받음">판매자로 부터 품절 안내 받음</option>
					<option value="상품 불량">상품 불량</option>
					<option value="주문과 다른 상품이 배송됨">주문과 다른 상품이 배송됨</option>
					<option value="주문과 다른 색상이 배송됨">주문과 다른 색상이 배송됨</option>
					<option value="주문과 다른 디자인이 배송됨">주문과 다른 디자인이 배송됨</option>
					<option value="배송사고 안내 받음">배송사고 안내 받음</option>
					<option value="주문과 실측이 다름">주문과 실측이 다름</option>
				</select>
				</td>
		</tbody>
	</table>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>반품 방법 선택</b></h4>
</div>	
	<table class="table table-hover">
		<tbody>
			<tr align="center">
				<td>반품 방법</td>
				<td><input type="radio" name="" value="" checked/> 회수해 주세요 <font style="font-size: 8px">뭉뭉샵 자동 회수 서비스입니다. 환불 요청 후 회수지 주소로 택배 기사님이 방문하여 회수합니다.</font></td>
			</tr>
		</tbody>
	</table>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>회수지 정보</b></h4>
</div>	
<table class="table table-hover">
		<tbody>
			<tr align="center">
				<td>이름</td>
				<td><input class="form-control" type="text" name="refund_name" maxlength="20" placeholder="이름을 입력해주세요." value="${combineVO.address_recipent}"></td>
			</tr>
			<tr align="center">
				<td>휴대전화</td>
				<td><input class="form-control" type="text" name="refund_tel" maxlength="13" placeholder="-없이 번호만 입력해주세요" value="${combineVO.address_phone}"></td>
			</tr>
			<tr align="center">
				<td>회수지 주소</td>
				<td>
					<input type="text" class="form-control" style="display: inline-block; width: 80%;" id="sample4_postcode" placeholder="우편번호" maxlength="10" name="refund_address1" value="${combineVO.address_1}" readonly>
					<input type="button" onclick="sample4_execDaumPostcode()" value="검색" class="btn btn-outline-secondary"><br><br>
					<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명,지번주소" maxlength="30" size="30" name="refund_address2" value="${combineVO.address_2}" readonly><br>
                    <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="30">
					<span id="guide" style="color:#999; display:none;"></span>
					<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소"  size="30" name="refund_address3" maxlength="40" value="${combineVO.address_3}" ><br>
                    <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="30">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="30" ><br>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">＊접수 후 1~3일(영업일 기준) 내로 택배 기사님이 직접 연락드린 후 방문합니다.</td>
			</tr>
		</tbody>
	</table>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>회수 예정 택배사</b></h4>
</div>	
<table class="table table-hover">
		<tbody>
			<tr align="center">
				<td>택배사</td>
				<td>CJ대한통운</td>
			</tr>
			<tr align="center">
				<td>반품 배송비</td>
				<c:choose>
					<c:when test="${combineVO.order_status.equals('결제완료') || combineVO.order_status.equals('배송준비중')}">
						<td>0원</td>
					</c:when>
					<c:otherwise>
						<td>5,000원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr align="center">
				<td colspan="2">
					*현금을 동봉하여 반송하실 필요가 없습니다.<br>
					*판매자 안내 등에 따라 임의 동봉한 반품 배송비 분실이나 자동회수 당시 발생한 상품 분실은 뭉뭉샵에서 책임지지 않습니다.<br>
					*동일 업체의 여러 상품을 한꺼번에 환불 요청하여 "한 번만" 배송비 결제를 한 경우, 반드시 하나의 박스로 묶음 포장해야 합니다.<br>
					*이미 사용했거나, 제품 박스 테이핑 등의 상품 훼손, 주문제작 상품인 경우 환불이 불가능합니다.<br>
					*최초에 동봉된 사은품이 있었다면 미사용 상태의 사은품까지 함께 반품하여야 환불이 가능합니다.<br>
				</td>
			</tr>
		</tbody>
	</table>
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>환불 금액</b></h4>
</div>
<table class="table table-hover">
		<tbody>
			<tr align="center">
				<td>상품 합계</td>
				<c:choose>
					<c:when test="${order_usePoint != 0}">
						<td><fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10}" pattern="###,###,###"/>원<br>${combineVO.order_quantity}개</td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity}" pattern="###,###,###"/>원<br>${combineVO.order_quantity}개</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr align="center">
				<td>포인트 사용</td>
				<c:choose>
					<c:when test="${order_usePoint != 0}">
						<td>-<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity / 10}" pattern="###,###,###"/>원<br></td>
					</c:when>
					<c:otherwise>
						<td>-0원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr align="center">
				<td>포인트 적립</td>
				<td>+<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity / 60}" pattern="###,###,###"/>원</td>
			</tr>
			<tr align="center">
				<td>환불 금액</td>
				<c:choose>
					<c:when test="${combineVO.order_status.equals('결제완료') || combineVO.order_status.equals('배송준비중') && order_usePoint != 0}">
						<td>
							<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10}" pattern="###,###,###"/>원
							<fmt:parseNumber var="i" integerOnly="true" value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10}" />
							<input type="hidden" name="refund_price" value="${i}"/>
						</td>
					</c:when>
					<c:when test="${combineVO.order_status.equals('결제완료') || combineVO.order_status.equals('배송준비중') && order_usePoint == 0}">
						<td>
							<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity}" pattern="###,###,###"/>원
							<fmt:parseNumber var="i" integerOnly="true" value="${combineVO.p_price * combineVO.order_quantity}" />
							<input type="hidden" name="refund_price" value="${i}"/>
						</td>
					</c:when>
					<c:when test="${!combineVO.order_status.equals('결제완료') && !combineVO.order_status.equals('배송준비중') && order_usePoint != 0}">
						<td>
							<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10 - 5000}" pattern="###,###,###"/>원
							<fmt:parseNumber var="i" integerOnly="true" value="${combineVO.p_price * combineVO.order_quantity - combineVO.p_price * combineVO.order_quantity / 10 - 5000}" />
							<input type="hidden" name="refund_price" value="${i}"/>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<fmt:formatNumber value="${combineVO.p_price * combineVO.order_quantity - 5000}" pattern="###,###,###"/>원
							<fmt:parseNumber var="i" integerOnly="true" value="${combineVO.p_price * combineVO.order_quantity - 5000}" />
							<input type="hidden" name="refund_price" value="${i}"/>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr align="center">
				<td colspan="2">
					*환불 완료 시 사용한 포인트는 즉시 반환됩니다.<br>
					*부분 환불 시 사용하신 포인트는 사용한 비율만큼 각 상품에 적용되어 반환됩니다.
				</td>
			</tr>
		</tbody>
	</table>
	<div align="center">
		<button class="btn btn-primary btn-lg" type="button" onClick="refund_check();">환불 요청</button>
	</div>
	<input type="hidden" name="order_code" value="${combineVO.order_code}"/>
	<input type="hidden" name="order_detailCode" value="${combineVO.order_detailCode}"/>
	<input type="hidden" name="order_quantity" value="${combineVO.order_quantity}"/>
	<input type="hidden" name="order_status" value="${combineVO.order_status}"/>
	<input type="hidden" name="order_usePoint" value="${combineVO.order_usePoint}"/>
	<input type="hidden" name="p_code" value="${combineVO.p_code}"/>
</div>
</form>
</body>
</html>
