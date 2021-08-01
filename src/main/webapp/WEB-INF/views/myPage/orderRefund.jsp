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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<title>주문 상품 환불</title>

</head>
<body>
<div class="container">
<div align="left">
	<h4 style="margin-bottom: 30px;"><b>환불 상품</b></h4>
</div>	
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th>&nbsp;</th>
				<th>상품 정보</th>
				<th>포인트 할인</th>
				<th>적립 포인트</th>
				<th>주문 금액(수량)</th>
				<th>배송 정보</th>
				<th>주문 상태</th>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td>이미지임</td>
				<td>상품정보임</td>
				<td>-9999원</td>
				<td>+235원<br>적립</td>
				<td>32000원<br>1개</td>
				<td>뭉뭉샵<br>본사배송<br>평균배송일 2일</td>
				<td>배송 완료</td>
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
				<select name="">
					<option value="">환불 사유를 선택하세요</option>
					<option value="">단순 변심</option>
					<option value="">수량을 잘못 선택함</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td>판매자 책임사유</td>
				<td>
				<select name="">
					<option value="">환불 사유를 선택하세요</option>
					<option value="">판매자로 부터 품절 안내 받음</option>
					<option value="">상품 불량</option>
					<option value="">주문과 다른 상품이 배송됨</option>
					<option value="">주문과 다른 색상이 배송됨</option>
					<option value="">주문과 다른 디자인이 배송됨</option>
					<option value="">배송사고 안내 받음</option>
					<option value="">주문과 실측이 다름</option>
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
				<td><input type="radio" name="" value=""/> 회수해 주세요 <font style="font-size: 8px">뭉뭉샵 자동 회수 서비스입니다. 환불 요청 후 회수지 주소로 택배 기사님이 방문하여 회수합니다.</font></td>
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
				<td>손영원</td>
			</tr>
			<tr align="center">
				<td>휴대전화</td>
				<td>010-1234-1234</td>
			</tr>
			<tr align="center">
				<td>회수지 주소</td>
				<td>(34589) 대전 동구 성남동 31-16 옥수빌라 A동 402호</td>
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
				<td>0원</td>
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
				<td>32,900원(배송비 포함)</td>
			</tr>
			<tr align="center">
				<td>포인트 사용</td>
				<td>-0원</td>
			</tr>
			<tr align="center">
				<td>포인트 적립</td>
				<td>+123원</td>
			</tr>
			<tr align="center">
				<td>환불 금액</td>
				<td>25556원</td>
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
		<button type="button" onClick="">반품 배송비 결제</button>
	</div>
</div>
</body>
</html>
