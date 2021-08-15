<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
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
            <li class="sideMenu2"><a href="${contextPath}/manager/managerProduct.do"><font <c:if test="${products != null}">class="active"</c:if> style="color: B2B2B2;">상품 관리</font></a><li>
            <li class="sideMenu2"><a href="${contextPath}/manager/getOrderList.do"><font <c:if test="${orderList != null || refundList != null}">class="active"</c:if> style="color: B2B2B2;">주문 관리</font></a><li>
            <li class="sideMenu2"><a href="${contextPath}/manager/getMembersList.do"><font <c:if test="${members != null || memberVO != null}">class="active"</c:if> style="color: B2B2B2;">회원 관리</font></a><li>
            <li class="sideMenu2"><a href="${contextPath}/manager/getReviewList.do"><font <c:if test="${reviewList != null}">class="active"</c:if> style="color: B2B2B2;">후기 관리</font></a><li>
           </ul>
		</div>
	</div>
</body>
</html>