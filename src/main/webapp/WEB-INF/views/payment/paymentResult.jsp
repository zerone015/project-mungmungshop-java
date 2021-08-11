<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="order_code" value="${param.order_code }" />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>구매 완료 화면</title>
</head>
<body>
<div class="px-4 py-5 my-5 text-center">
	  <div>
      	 <p style="color: #808080; font-size: 20px;">상품번호 ${order_code}</p>
      </div>
      <div>
     	 <h1>주문과 결제가 정상적으로 완료되었습니다.</h1><br>  
      <p style="font-size: 20px;">업체(브랜드)의 주문 확인 후 발송됩니다.</p>
      <div>
         <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/main.do'">메인 화면으로</button>
         <button type="button" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/myPage/getOrderList.do'">주문 내역 조회하기</button>
      </div>
    </div>
  </div>
</body>
</html>