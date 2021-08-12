<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>랭킹순 목록</title>
</head>
<body>
<div class="container">
<div align="left">
<h2 class="display-5 fw-bold">랭킹</h2>
</div>
<hr width="100%">

<div class="row">
	<c:forEach items="${rankList}" var="item" varStatus="status">
        <div class="col-md-4" style="display: inline-block; float: left;">
        <c:choose>
        	<c:when test="${status.count == 1 }">
        		<h3><span class="badge rounded-pill bg-warning text-dark" style="background-color: #ffd700 !important;"><font style="font-size:18px; color: white !important;">${status.count}</font><font style="font-size:14px; color: white !important;">위</font></span></h3>
        	</c:when>
        	<c:when test="${status.count == 2 }">
        		<h3><span class="badge rounded-pill bg-warning text-dark" style="background-color: #c0c0c0 !important;"><font style="font-size:18px; color: white !important;">${status.count}</font><font style="font-size:14px; color: white !important;">위</font></span></h3>
        	</c:when>
        	<c:when test="${status.count == 3 }">
        		<h3><span class="badge rounded-pill bg-warning text-dark" style="background-color: #c68a12 !important;"><font style="font-size:18px; color: white !important;">${status.count}</font><font style="font-size:14px; color: white !important;">위</font></span></h3>
        	</c:when>
        	<c:otherwise>
        		<font style="font-size:18px; font-weight: bold;">${status.count}</font><font style="font-size:14px;">위</font>
        	</c:otherwise>
        </c:choose>
          <div class="card mb-4 shadow-sm" style="cursor: pointer;" onclick="location.href='${contextPath}/product/getProduct.do?p_code=${item.p_code}';">
            <div class="bd-placeholder-img card-img-top">
            	<img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"/>
            </div>
            <div class="card-body">
              <p style="font-size: 14px;">${item.p_name}</p>
              <p style="font-size: 14px;"><b><fmt:formatNumber value="${item.p_price}" pattern="###,###,###"/></b>원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                 
                </div>
                <p style="color: red;">♥ ${item.p_loves}</p>
              </div>
            </div>
          </div>
        </div>
    </c:forEach>
	  </div>
</div>
</body>
</html>