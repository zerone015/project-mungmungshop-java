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
<script>
	function fn_modFaq(index) {											
		var form = document.faqForm;
	
		var length = form.faq_no.length;
	
		if(length>1){
			var faq_no = form.faq_no[index];
		}
		else{
			var faq_no = form.faq_no;
		}
			
		faq_no.disabled = false;
		
		form.action = "${contextPath}/board/faqMod.do";
		form.submit();
	
}
	
	function fn_removeFaq(index) {
		if(confirm('정말 삭제하시겠습니까?')){
			var form = document.faqForm;
			
			var length = form.faq_no.length;
		
			if(length>1){
				var faq_no = form.faq_no[index];
			}
			else{
				var faq_no = form.faq_no;
			}
				
			faq_no.disabled = false;
			
			form.action = "${contextPath}/board/faqRemove.do";
			form.submit();		
		}else{
			return false;
		}
}
</script>
<body>
<div class="container">
	<div>
		<h3 class="mb-3">자주 묻는 질문</h3>
		<c:choose>
			<c:when test="${manager == 1}">
				<button class="btn btn-outline-dark" onclick="location.href='${contextPath}/board/faqWrite.do'" style="float: right;margin-bottom: 20px;">FaQ 등록</button>
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
		<form name="faqForm" method="POST" action="#">
		 <div style="margin-top: 100;">
			 <c:forEach items="${faqList}" var="faqVO" varStatus="status">
			 	<input type="radio" name="accordion" id="answer${faqVO.faq_no}">
			 	<label for ="answer${faqVO.faq_no}">
			 		 ${faqVO.faq_title}
			 		 <c:if test="${manager ==1 }">
			 		   <div style="float: right; height: 30px; ">
			 		 	<button class="btn btn-primary" type="button" onClick="fn_modFaq(${status.index});">수정</button>	
			 		 	<button class="btn btn-danger" type="button" onClick="fn_removeFaq(${status.index});">삭제</button>
			 		   </div>
			 		 </c:if>
			 		 	<input type="hidden" name="faq_no" value="${faqVO.faq_no}" disabled/>
			 		<i class="fas fa angle-down"></i>
			 	</label>
				 <div>
				 	<p style="text-align: left;">${faqVO.faq_content}</p>
				 </div>
			</c:forEach>
		</div>	
		</form>	
	</div>

</div>
</body>
</html>