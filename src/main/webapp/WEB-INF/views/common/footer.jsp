<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
</head>
<body>
<footer class="text-muted py-5">
	<div class="item-wrap" style="background-color:#f6efef; color: gray;">
      <div class="site-logo" style="text-align:left; display: inline-block; vertical-align:top;">
        <span>
           <br>
			<a href="#"><img width="200px"  height="80px" alt="뭉뭉샵 로고" src="${contextPath}/download?imageFileName=logo.png" style="align:left;" /></a>
		</span>
      </div>
      <div class="site-discription" style="text-align:right;  display: inline-block;">
        <span>
			 <strong>㈜뭉뭉샵</strong> <br>
			 대표이사: 5조 | 사업자등록번호 : 123-456-78910 <br>
			 개인정보보호최고책임자 : 5조<br>
			 주소 : 대전광역시 서구 둔산동 305호 <br>  
			 대전광역시 통신판매업신고번호 : 제 305호<br>
			 이메일:5whwwkd@google.co.kr <br>
			 대표전화 : 1234-5678 (발신자 부담전화)   팩스 : 0502-123-4567 (지역번호공통) <br>
			 COPYRIGHT(C) 뭉뭉샵 DOGGY CENTRE ALL RIGHTS RESERVED.
		</span>
      </div>
                   
	</div> 
</footer>
</body>
</html>