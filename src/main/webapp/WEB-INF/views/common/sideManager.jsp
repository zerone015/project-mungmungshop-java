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
ul{
   list-style:none;
   }
</style>
<body>
	<div class="container">
           <ul  class="sideMenu">
           	<h3><p>주요 기능</p></h3><br>
            <li><h5><a href="${contextPath}/manager/managerProduct.do">상품 관리</a></h5><li>
            <li><h5><a href="${contextPath}/manager/getOrderList.do">주문 관리</a></h5><li>
            <li><h5><a href="${contextPath}/manager/getMembersList.do">회원 관리</a></h5><li>
            <li><h5><a href="#">배송 관리</a></h5><li>
            <li><h5><a href="#">후기 관리</a></h5><li>
            <li><h5><a href="#">게시판 관리</a></h5><li>
           </ul>
	</div>
</body>
</html>