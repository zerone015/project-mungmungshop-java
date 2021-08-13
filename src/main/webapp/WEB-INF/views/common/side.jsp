<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>사이드 메뉴</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
	.sideMenu2 {
		font-size: 16;
		margin-top: 20px;
	}
	.sideMenu2 > a:hover {
		font-weight: 700;
	}
	
	.sideMenu {
		padding: 10px;
	}
	
	#sideLink {
		font-weight: 900;
	}
</style>

<body>
	<div class="container">
		<div class="col" style="text-align: left;">
	           <ul  class="sideMenu">
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getOrderList.do">주문 내역 조회</a><li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getPointHistory.do">포인트 내역</a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getLoveList.do">찜 리스트</a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/reviewList.do">나의 리뷰</a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/quickProducts.do">최근 본 상품</a><li>
	            <li class="sideMenu2"><a href="${contextPath}/address/addressList.do">배송지 관리</a></li>
	            <li class="sideMenu2"><a  href="${contextPath}/board/qnaList.do">1:1 문의</a></li>
		        <c:if test="${member.member_type != '네이버' && member.member_type != '카카오'}">
	            	<li class="sideMenu2"><a href="${contextPath}/myPage/infoCertify.do">회원 정보 수정</a></li>
	            	<li class="sideMenu2"><a href="${contextPath}/myPage/pwCertify.do">비밀번호 변경</a></li>
		        </c:if>
	        </ul>
        </div>
	</div>
		

	
</body>
</html>