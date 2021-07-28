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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>브랜드 목록</title>
</head>
<body>
<div align="left">
<h2 class="display-5 fw-bold"><b>인기 브랜드</b></h2>
</div>
<hr width="100%">
<div class="row">
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=ACANA.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=Hills.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=NaturalBalance.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
</div>
<hr width="100%">
<div class="row">
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=NOW.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=ORIGEN.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=purinaProplan.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>


</div>
<hr width="100%">
<div class="row">
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=RAWZ.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=ROYALCANIN.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>
<div class="col-md-4" style="display: inline-block; float: left;">
<div class="bd-placeholder-img card-img-top">
            	<a href="#"><img src="${contextPath}/download?imageFileName=ZIWIPEAK.PNG" style=" width: 100%;  height: 225;"/></a>
</div>
</div>


</div>
</body>
</html>