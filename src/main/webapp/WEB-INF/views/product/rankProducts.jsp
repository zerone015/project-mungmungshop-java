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
<div align="left">
<h2 class="display-5 fw-bold">랭킹</h2>
</div>
<hr width="100%">
<div class="row">
	<c:forEach items="${rankList}" var="item" varStatus="status">
        <div class="col-md-4" style="display: inline-block; float: left;">
        <h3><span class="badge rounded-pill bg-warning text-dark">${status.count}위</span></h3>
          <div class="card mb-4 shadow-sm" style="cursor: pointer;" onclick="location.href='${contextPath}/product/getProduct.do?p_code=${item.p_code}';">
            <div class="bd-placeholder-img card-img-top">
            	<img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}"/>
            </div>
            <div class="card-body">
              <p style="font-size: 14px;">${item.p_name}</p>
              <p style="font-size: 14px;"><fmt:formatNumber value="${item.p_price}" pattern="###,###,###"/></p>
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
</body>
</html>