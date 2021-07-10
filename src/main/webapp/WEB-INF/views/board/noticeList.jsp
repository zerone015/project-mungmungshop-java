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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>공지사항</title>
</head>
<body>
	<div class="col-md-7 col-lg-8" align="center">
		<h4 class="mb-3">공지사항</h4>
	</div>
	<div class="table-responsive">
		<table class="table table-sm table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>10</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이1</td>
					<td>2021-06-14</td>
					<td>10</td>
				</tr>
				<tr>
					<td>9</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이2</td>
					<td>2021-06-14</td>
					<td>8</td>
				</tr>
				<tr>
					<td>8</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이3</td>
					<td>2021-06-14</td>
					<td>1</td>
				</tr>
				<tr>
					<td>7</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이4</td>
					<td>2021-06-14</td>
					<td>2</td>
				</tr>
				<tr>
					<td>6</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이5</td>
					<td>2021-06-14</td>
					<td>1</td>
				</tr>
				<tr>
					<td>5</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이6</td>
					<td>2021-06-14</td>
					<td>322</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이7</td>
					<td>2021-06-14</td>
					<td>22</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이8</td>
					<td>2021-06-14</td>
					<td>77</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이9</td>
					<td>2021-06-14</td>
					<td>11</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#">공지사항 제목입니다.</a></td>
					<td>글쓴이10</td>
					<td>2021-06-14</td>
					<td>123</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>