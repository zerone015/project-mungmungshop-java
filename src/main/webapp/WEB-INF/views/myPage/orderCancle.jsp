<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>주문 취소 내역 조회 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script>

function fn_cancel_order(order_id){
	var answer=confirm("주문을 취소하시겠습니까?");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input"); 
	    
	    i_order_id.name="order_id";
	    i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
}

</script>
</head>
<body>
<H3>주문  취소 내역</H3>
	<form  method="post">
	<div>
<table align="center" class="list_view" width="80%" border="0" cellspacing="0" cellpadding="10px;">
		<tbody align=center >
			<tr>
				<td>상품정보</td>
				<td class="fixed" >주문 번호</td>
				<td class="fixed">주문 일자</td>
				<td>주문금액</td>
				<td>현황</td>
			</tr>
			<tr>
			 <td> <a onClick="location.href=''" style="cursor:pointer;">케이지</a></td>
			<td>123456</td>
			<td>2월30일</td>
			<td>20,000원</td>
			<td>주문취소
			
			  </td>
			</tr>
			
			<tr>
			 <td> <a onClick="location.href=''" style="cursor:pointer;">사료</a></td>
			<td>145456</td>
			<td>2월30일</td>
			<td>10,000원</td>
			<td>환불완료
			</td>
			</tr>
   					<c:choose>
					    <c:when test="${item.delivery_state=='cancel_order' }">
					       주문취소
					    </c:when>
					    <c:when test="${item.delivery_state=='returned' }">
					       환불완료
					    </c:when>
				  </c:choose>
				</td>
				<td>
			    
			    </td>
			</tr>
			<c:set  var="pre_order_id" value="${item.order_id }" />
		</tbody>
	</table>
     	
	</div>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>