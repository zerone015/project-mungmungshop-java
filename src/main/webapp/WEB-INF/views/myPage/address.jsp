<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="result" value="${param.result }" />
<c:if test="${result=='addFailed' }">
		<script>
			window.onload = function() {
				alert("배송지 등록은 최대 10개까지 가능합니다.");
			}
		</script>
</c:if>
<html>
<head>
<meta charset="utf-8">
<title>배송지 관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
function fn_delete(address_num) {
	if(confirm("정말로 삭제하시겠습니까?")){
		window.location.href = "${contextPath}/myPage/removeAddress.do?address_num="+address_num;
	}
	else {
		return false;
	}
}	
</script>
<body>
	<div align="center">
		<h4><b>배송지 관리</b></h4>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">수령인</th>
					<th align="center">연락처</th>
					<th align="center">주소</th>
					<th align="center">요청사항</th>
					<th align="center">변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${addressList}" var="addressVO">
					<tr>
						<td>${addressVO.address_recipent}</td>
						<td>${addressVO.address_phone}</td>
						<td>${addressVO.address_1} ${addressVO.address_2} ${addressVO.address_3}</td>
						<td>${addressVO.address_request}</td>
						<td>
							<button  type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPage/modAddress.do?address_num=${addressVO.address_num}'" >수정</button>
							<button  type="button" class="btn btn-danger" onclick="fn_delete(${addressVO.address_num});">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>			
	</div>
	<div align="center">
		<button type="submit" style="margin-top: 50px;" class="btn btn-outline-dark btn-lg" onclick="location.href='${contextPath}/addressWrite.do' ">
			배송지 등록
		</button>
	</div>
	
</body>
</html>