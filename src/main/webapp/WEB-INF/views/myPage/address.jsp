<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>배송지 관리</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<style>
th, td {
	padding: 15px;
}
</style>
<script>
	function modAddress() {
		if (confirm('배송지를 수정하시겠습니까?'))
			window.close();
	}

	function delAddress() {
		if (confirm('배송지를 삭제하시겠습니까?'))
			window.close();
	}
</script>
<body>
	<div align="center">
		<h2>배송지 관리</h2>
		<br>
		<form>
			<table>
				<thead>
					<tr>
						<th><center>배송지</center></th>
						<th><center>주소</center></th>
						<th><center>연락처</center></th>
					</tr>
					<tr>
						<th>홍길동</th>
						<th>대전 서구 둔산로 12345678</th>
						<th>010-1234-5678</th>
						<th>
							<button a href="#" type="button" class="btn btn-dark"
								onclick="modAddress()">수정</button>
						</th>
						<th><button a href="#" onclick="delAddress()" type="button"
								class="btn btn-dark">삭제</button></th>
					</tr>
				</thead>

				<%-- TODO: 스크립트릿을 사용해서 datas에 있는 모든 주소록 데이터를 출력하기 --%>

			</table>
		</form>
	</div>
	<div align="right" style="margin-right: 300px;">
		<button onclick="addressWrite.jsp" type="button" class="btn btn-dark">
			배송지<br>등록
		</button>
	</div>

</body>
</html>