<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>배송지 관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
		<h2>배송지 관리</h2>
		 
		<br>
		<table>
			<thead>
				<tr>
					<th align="center">배송지번호</th>
					<th align="center">수령인</th>
					<th align="center">연락처</th>
					<th align="center">주소1</th>
					<th align="center">주소2</th>
					<th align="center">주소3</th>
					<th align="center">수정</th>
					<th align="center">삭제</th>
				</tr>
			</thead>
			<tbody>
				<form method="POST" action="">
						
				<c:forEach items="${addressList}" var="addressVO">
					<tr>
						<td>${addressVO.address_num }</td>
						<td>${addressVO.address_recipent}</td>
						<td>${addressVO.address_phone}</td>
						<td>${addressVO.address_1}</td>
						<td>${addressVO.address_2}</td>
						<td>${addressVO.address_3}</td>
					
						<td>
							<button  type="button" class="btn btn-dark" onclick="location.href='${contextPath}/myPage/modAddress.do?address_num=${addressVO.address_num}'" >수정</button>
						</td>
						<td>
							<button  type="button" class="btn btn-dark" onclick="fn_delete(${addressVO.address_num});">삭제</button>
						</td>
					</tr>
				</c:forEach>
				</form>
			</tbody>	
		</table>
	</div>
	<div align="right" style="margin-right: 300px;">
		<button type="submit" class="btn btn-dark" onclick="location.href='${contextPath}/addressWrite.do' ">
			배송지<br>등록
		</button>
	</div>
	
</body>
</html>