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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
ul{
   list-style:none;
   }
</style>
<body>
	<div class="container">
           <ul  class="sideMenu">
           	<hr style=" width:120px; margin: auto; margin-top: 20; margin-bottom: 5;">
           	<h3><p>주요 기능</p></h3><br>
            <li><h5><a href="${contextPath}/manager/managerProduct.do">상품 관리</a></h5><li>
            <li><h5><a href="#">주문 관리</a></h5><li>
            <li><h5><a href="#">회원 관리</a></h5><li>
            <li><h5><a href="#">배송 관리</a></h5><li>
            <li><h5><a href="#">후기 관리</a></h5><li>
            <li><h5><a href="#">게시판 관리</a></h5><li>
           </ul>
	</div>
		

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</body>
</html>