<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>자주 묻는 질문 목록</title>

<script type="text/javascript">
	$('div.title').hide();
	$("div.content").click(function() {
	  $(this).next().slideToggle(1000);
	});

</script>

<style>
	.title:hover{
		cursor: pointer;
	}
 	.content {
		display: none;
	}  
</style>
</head> 

<body>
<div class="container">
	<div>
		<h3 class="mb-3">자주 묻는 질문</h3>
		<c:choose>
			<c:when test="${manager == 1}">
				<a href="${contextPath }/board/faqWrite.do">
					<button class="btn btn-outline-dark" style="float: right;margin-bottom: 20px;">FaQ 등록</button>
				</a> 
			</c:when>
			<c:otherwise>
			<a href="#">
				<button class="btn btn-outline-dark" style="float: right;margin-bottom: 20px;margin-left: 10;">1:1 문의내역</button>
			</a>
			<a href="${contextPath }/board/qnaWrite.do">
				<button class="btn btn-outline-dark" style="float: right;margin-bottom: 20px;">1:1 문의하기</button>
			</a>
			</c:otherwise>
		</c:choose>
	

		 
		 <div style="margin-top: 100;">
			 <c:forEach items="${faqList}" var="faqVO">
			 	<input type="radio" name="accordion" id="answer${faqVO.faq_no}">
			 	<label for ="answer${faqVO.faq_no}">
			 		 ${faqVO.faq_title}
			 		<i class="fas fa angle-down"></i>
			 	</label>
				 <div>
				 	<p style="text-align: left;">${faqVO.faq_content}</p>
				 </div>
			</c:forEach>
		</div>
		
	</div>
</div>
</body>
</html>