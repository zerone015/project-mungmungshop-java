<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>사이드 메뉴</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<style>
	.sideMenu2 {
		font-size: 14;
		margin: 5;
	}
	.sideMenu2 > a:hover {
		font-weight: 700;
	}
</style>
<body>
	<div class="container">
		<hr style=" width:120px; margin: auto; margin-top: 75; margin-bottom: 5;">
		<p style="font-size: 16;">나의 쇼핑 활동</p>
           <ul  class="sideMenu">
            <li class="sideMenu2"><a href="#">주문 내역 조회</a><li>
            <li class="sideMenu2"><a href="#">주문 취소 내역</a></li>
            <li class="sideMenu2"><a href="#">찜 리스트</a></li>
            <li class="sideMenu2"><a href="#">배송지 관리</a></li>
            <li class="sideMenu2"><a href="#">1:1 문의</a></li>
           </ul>
    	 <hr style=" width:120px; margin: auto; margin-top: 20; margin-bottom: 5;">
		<p style="font-size: 16;">나의 쇼핑 활동</p>       
           <ul class="sideMenu">
            <li class="sideMenu2"><a href="#">비밀번호 변경</a></li>
            <li class="sideMenu2"><a href="#">회원 정보 수정</a></li>
           </ul>
	</div>
		

	
</body>
</html>