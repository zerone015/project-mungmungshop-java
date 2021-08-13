<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>관리자 후기 관리 페이지</title>
</head>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		
		
		var url = "${contextPath}/manager/getReviewList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
		
}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/manager/getReviewList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${contextPath}/manager/getReviewList.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>
<script>
	function fn_reviewPass(index) {
		if(confirm("해당 후기를 검수 합격하시겠습니까?\n500포인트가 지급되며 후기가 노출됩니다.")){
			var form = document.reviewForm;
			
			var p_code;
			var member_nick;
			
			var length = form.p_code.length;
			
			 if(length>1) {
				 p_code = form.p_code[index];
				 member_nick = form.member_nick[index];
			 }else{
				 p_code = form.p_code;
				 member_nick = form.member_nick;
			 }
			 
			 p_code.disabled = false;
			 member_nick.disabled = false;
			 
			 form.action = "${contextPath}/manager/reviewPass.do";
			 form.submit();
			 
		}else{
			return false;
		}
	}
	
	function fn_reviewFail(index) {
		if(confirm("해당 후기를 불합격 처리하시겠습니까?")){
			var form = document.reviewForm;
			
			var review_num;
			
			var length = form.review_num.length;
			
			 if(length>1) {
				 review_num = form.review_num[index];
			 }else{
				 review_num = form.review_num;
			 }
			 
			 review_num.disabled = false;
			 
			 form.action = "${contextPath}/manager/reviewFail.do";
			 form.submit();
			 
		}else{
			return false;
		}
	}
	
	function fn_reviewRemove(index) {
		if(confirm("정말 해당 후기를 삭제하시겠습니까?")){
			var form = document.reviewForm;
			
			var review_num;
			
			var length = form.review_num.length;
			
			 if(length>1) {
				 review_num = form.review_num[index];
			 }else{
				 review_num = form.review_num;
			 }
			 
			 review_num.disabled = false;
			 
			 form.action = "${contextPath}/manager/reviewRemove.do";
			 form.submit();
			 
		}else{
			return false;
		}
	}
</script>
<body>
<form method="POST" name="reviewForm" action="#">
<h3>
<b>후기 관리</b>
</h3>
<br>
	<table class="table table-hover" style="margin-top: 10;">
		<thead>
			<tr>
				<th>상품</th>
				<th>닉네임</th>
				<th>후기 이미지</th>
				<th>내용</th>
				<th>평점</th>
				<th>상태</th>
				<th>변경</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="item" varStatus="status">
			<tr>
				<td>
					<img src="${contextPath}/thumbnail/download?imageFileName=${item.p_imageFileName}" alt="상품 이미지"><br>
					<a href="${contextPath}/product/getProduct.do?p_code=${item.p_code}"><b>${item.p_name}</b></a>
				</td>
				<td>
					${item.member_nick}
				</td>
				<td>
					<img src="${contextPath}/thumbnail/download?imageFileName=${item.review_imageFileName}" alt="후기 이미지"><br>
				</td>
				<td style="width: 20%;">
					<b>${item.review_title}</b><br>
					${item.review_content}
				</td>
				<td>
					${item.review_recommend}
				</td>
				<td>
					<c:if test="${item.review_test.equals('N')}">
						<font style="color: blue;">검수중</font>
					</c:if>
					<c:if test="${item.review_test.equals('Y')}">
						<font style="color: blue;">포인트 지급완료</font>
					</c:if>
					<c:if test="${item.review_test.equals('C')}">
						<font style="color: red;">불합격</font>
					</c:if>
				</td>
				<td>
					<button class="btn btn-success" style="width: 100%;" type="button" onClick="fn_reviewPass(${status.index});">합격</button><br>
					<button class="btn btn-warning" style="width: 100%;" type="button" onClick="fn_reviewFail(${status.index});">불합격</button><br>
					<button class="btn btn-danger" style="width: 100%;" type="button" onClick="fn_reviewRemove(${status.index});">삭제</button>
					<input type="hidden" name="p_code" value="${item.p_code}" disabled/>
					<input type="hidden" name="member_nick" value="${item.member_nick}" disabled/>
					<input type="hidden" name="review_num" value="${item.review_num}" disabled/>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
	<hr width="100%">
	
	<!-- pagination{s} -->
		<ul class="pagination" style="width: 0%; justify-content: center;">
			<c:if test="${pagination.prev}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
				</li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
				</li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
				</li>
			</c:if>
		</ul>
	<!-- pagination{e} -->
</body>
</html>