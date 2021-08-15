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
	
	.active{
		color: black !important;
		font-weight: bold;	
	}
</style>

<body>
	<div class="container">
		<div class="col" style="text-align: left;">
	           <ul  class="sideMenu">
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getOrderList.do"><font <c:if test="${orderList != null}">class="active"</c:if> style="color: #B2B2B2;">주문 내역 조회</font></a><li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getPointHistory.do"><font <c:if test="${phList != null}">class="active"</c:if> style="color: #B2B2B2;">포인트 내역</font></a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/getLoveList.do"><font <c:if test="${loveList != null}">class="active"</c:if> style="color: #B2B2B2;">찜 리스트</font></a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/reviewList.do"><font <c:if test="${reviewList != null}">class="active"</c:if> style="color: #B2B2B2;">나의 리뷰</font></a></li>
	            <li class="sideMenu2"><a href="${contextPath}/myPage/quickProducts.do"><font <c:if test="${quickClick == true}">class="active"</c:if> style="color: #B2B2B2;">최근 본 상품</font></a><li>
	            <li class="sideMenu2"><a href="${contextPath}/address/addressList.do"><font <c:if test="${addressList != null}">class="active"</c:if> style="color: #B2B2B2;">배송지 관리</font></a></li>
	            <li class="sideMenu2"><a  href="${contextPath}/board/qnaList.do"><font style="color: #B2B2B2;">1:1 문의</font></a></li>
		        <c:if test="${member.member_type != '네이버' && member.member_type != '카카오'}">
	            	<li class="sideMenu2"><a href="${contextPath}/myPage/infoCertify.do"><font <c:if test="${infoClick == true}">class="active"</c:if> style="color: #B2B2B2;">회원 정보 수정</font></a></li>
	            	<li class="sideMenu2"><a href="${contextPath}/myPage/pwCertify.do"><font <c:if test="${pwClick == true}">class="active"</c:if> style="color: #B2B2B2;">비밀번호 변경</font></a></li>
		        </c:if>
	        </ul>
        </div>
	</div>
</body>
</html>