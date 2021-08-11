<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.*"%>
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
<title>1:1 문의글 답변 작성</title>

<style> 
	input:focus, textarea:focus {     
		outline: none; 
	} 
	input {
		width:100%; border: 0;
	}
	
	textarea {
		width:100%; border: 0; 
		resize: none;
	}
	th {
		background: #e6e6e6;
	}
</style>

<%
	Timestamp nowTime = new Timestamp(System.currentTimeMillis());
%>
<script type="text/javascript">
function checkBoard() {
	var form=document.qnaReply;		

	var title = form.qna_title;
	var content = form.qna_content;
	
	if (title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}
	if (content.value == "") {
		alert("내용을 입력해주세요.");
		content.focus();
		return false;
	}
	form.submit();
}


</script>
</head>
<body>
<div class="container">
	<form action="${contextPath}/qnaReply.do" method="POST" name="qnaReply" >
		
		<input type="hidden" name="qna_no" value="${qnaVO.qna_no}"/>
		<input type="hidden" id = "qna_originNo" name = "qna_originNo" value="${qnaVO.qna_originNo}" />
		<input type="hidden" id = "qna_groupOrd" name = "qna_groupOrd" value="${qnaVO.qna_groupOrd + 1}" />
		<input type="hidden" id = "qna_groupLayer" name = "qna_groupLayer" value="${qnaVO.qna_groupLayer + 1}" />
		<input type="hidden" name="qna_secret" value="${qnaVO.qna_secret}"/>
		
		<table class="table table-sm table-bordered" border="1" >
			<tr>
				<th style="background: #e6e6e6;">제목</th>
				<td colspan="3">
					<input type="text" id="qna_title" name="qna_title" maxlength = "45" placeholder="제목을 작성하세요."/>
				</td>
			</tr>
			<tr>
				<th style="background: #e6e6e6;">작성자</th>
				<td>
					<c:if test="${isLogOn == true  && member != null}">
						<input type="text" id = "qna_writer" name = "qna_writer" value="${member.member_nick}" readonly/>
					</c:if>
					</td>
				<th style="background: #e6e6e6;">날짜</th>
				<td>
					<input type="text" id = "qna_date" name = "qna_date" value="<%=nowTime%>" readonly>
				</td>
			</tr>
		</table>
		
		<hr width="100%">
		<textarea name="qna_content" rows="10" id="qna_content" name="qna_content" placeholder="내용을 작성하세요."></textarea>
		
		<div class="bd-example" align="right">
			<button type="reset" class="btn btn-outline-dark">다시쓰기</button>
			<button type="button" class="btn btn-outline-primary" onclick="checkBoard()">작성</button>
		</div>
		
		

	</form>
	
	<hr width="100%">
	
</div>	
</body>
</html>