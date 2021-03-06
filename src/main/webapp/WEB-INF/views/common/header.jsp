<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>상단부</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css" >
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function enterSearch() {
	    if(event.keyCode == 13){				//keyCode == 13 (엔터가 입력되면)
	        myFunction();  // 실행할 이벤트
	    }
	}
	function myFunction() {
	    var x = document.getElementById("text").value;				//getElementById() = 주어진 문자열과 일치하는 id를 가진 속성을 찾아서 반환
	    window.location.href = "http://cybertramp.net/search/"+x;  // 검색창에 입력한 값을 주소창 뒤에 붙여서 페이지 넘어감. 
	}


</script>
<script type="text/javascript">
	var loopSearch=true;
	
	function keywordSearch(){
		if(loopSearch==false){
			return;
		}
		 var value=document.frmSearch.searchWord.value;
			$.ajax({
				type : "get",
				async : true, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/product/keywordSearch.do",
				data : {keyword:value},
				success : function(data, textStatus) {
			    	var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
				
				}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<li><a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a></li>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
<style>
	
</style>
<div id="header">

<header class="blog-header py-3">
	<div class="container">
		<div class="row flex-nowrap justify-content-around align-items-center" style="width: 1080px; margin: 0 auto;">
			<!-- 상단 로고 -->
			<div style="margin : 0;">
				<a class="blog-header-logo text-dark" href="${contextPath}/main.do"><img src="${contextPath}/download?imageFileName=logo.png" style="width: 200; height: 80;" alt="이미지"></a>
			</div>
			
			<!-- 검색창 -->
			<div class="row search">
			<form name="frmSearch" action="${contextPath}/product/searchProducts.do">
				<div class="searchForm">
					<input class="form-control searchBar" name="searchWord" type="text" onKeyUp="keywordSearch()" placeholder="Search" aria-label="Search"/>
					<button class="btn btn-outline-success searchBtn" type="submit"  ><i class="fa fa-search" aria-hidden="true"></i></button>
				</div>
				<div id="suggest">
			      	<div id="suggestList"></div>
				</div>
			</form>
			</div>
		      
		     <!-- 상단 오른쪽 -->
		     
		
		  	
			<div class="col-4 d-flex justify-content-end align-items-center" style="text-align: center; margin:0;">
				<div class="col" style="padding: 0px;">
					<div style="text-align: center; margin-bottom: 5;">
						<c:if test="${isLogOn == true && member != null}">
							<font style="color: graytext;"><b>${member.member_nick}</b>님 환영합니다 ! 포인트 : <fmt:formatNumber value="${member.member_point}" pattern="###,###,###"/>원</font>
						</c:if>
					</div>
					<div style="display: flex; ">
						<c:if test="${member.getMember_manager() == 1}">
							<a class="rightMenu" href="${contextPath}/managerMain.do"><font style="color: #0078FF;">관리자</font></a> 
							<font class="divider">|</font>
						</c:if>
						<a class="rightMenu" href="${contextPath}/cart/myCartList.do" style="">장바구니</a><font class="divider">|</font>
						<c:choose>
							<c:when test="${isLogOn == true && member != null}">
								<a class="rightMenu" href="${contextPath}/member/logout.do" >로그아웃</a> 
								<font class="divider">|</font>
							</c:when>
							<c:otherwise>
								<a class="rightMenu" href="${contextPath}/login.do">로그인</a> 
								<font class="divider">|</font>
							</c:otherwise>
						</c:choose>
						<a class="rightMenu" href="${contextPath}/myPage/getOrderList.do">마이페이지</a>
					</div>
				</div>
			</div>
		</div>
	</div>

<nav>
<div id="menu" style="position:relative; z-index: 99; background-color: white;">
    <ul class="main1" style=" padding-left: 0px;">
        <li style="border: none;"><a href="#"><b style="font-size: 20px;"><span style="font-size: 20px;">≡</span> 카테고리</b></a>
            <ul class="main2">
                <li><a href="#">사료</a>
					<ul class="main3">
						<li><a href="${contextPath}/product/productList.do?p_cl1=사료&p_cl2=전체">전체</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=사료&p_cl2=퍼피">퍼피</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=사료&p_cl2=어덜트">어덜트</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=사료&p_cl2=시니어">시니어</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=사료&p_cl2=전연령">전연령</a></li>
					</ul>
				</li>
                <li><a href="#">간식</a>
                    <ul class="main3">
                        <li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=전체">전체</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=사사미">사사미</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=껌">껌</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=건조">건조</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=비스킷">비스킷</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=수제">수제</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=간식&p_cl2=캔">캔</a></li>
                    </ul>
                </li>
                <li><a href="#">리빙</a>
                    <ul class="main3">
                        <li><a href="${contextPath}/product/productList.do?p_cl1=리빙&p_cl2=전체">전체</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=리빙&p_cl2=하우스/방석">하우스/방석</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=리빙&p_cl2=급식기/급수기">급식기/급수기</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=리빙&p_cl2=울타리/안전문">울타리/안전문</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=리빙&p_cl2=계단">계단</a></li>
                    </ul>
                </li>
				<li><a href="#">케어</a>
                    <ul class="main3">
                        <li><a href="${contextPath}/product/productList.do?p_cl1=케어&p_cl2=전체">전체</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=케어&p_cl2=배변">배변</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=케어&p_cl2=영양제">영양제</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=케어&p_cl2=미용">미용</a></li>
                    </ul>
                </li>
				<li><a href="#">외출</a>
                    <ul class="main3">
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=전체">전체</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=이동 가방">이동 가방</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=유모차">유모차</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=차량용 이동장">차량용 이동장</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=목줄">목줄</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=이름표/인식표">이름표/인식표</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=가슴줄">가슴줄</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=외출&p_cl2=리드줄">리드줄</a></li>
                    </ul>
                </li>
				<li><a href="#">패션</a>
                    <ul class="main3">
						<li><a href="${contextPath}/product/productList.do?p_cl1=패션&p_cl2=전체">전체</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=패션&p_cl2=의류">의류</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=패션&p_cl2=액세서리">액세서리</a></li>
						<li><a href="${contextPath}/product/productList.do?p_cl1=패션&p_cl2=디자인/소품">디자인/소품</a></li>
                    </ul>
                </li>
				<li><a href="#">장난감</a>
                    <ul class="main3">
						<li><a href="${contextPath}/product/productList.do?p_cl1=장난감&p_cl2=전체">전체</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=장난감&p_cl2=노즈워크">노즈워크</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=장난감&p_cl2=훈련">훈련</a></li>
                        <li><a href="${contextPath}/product/productList.do?p_cl1=장난감&p_cl2=장난감/토이">장난감/토이</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="${contextPath}/board/eventList.do">Event</a></li>
        <li><a href="${contextPath}/product/newProduct.do">신상품</a></li>
        <li><a href="${contextPath}/brandList.do">브랜드</a></li>
		<li><a href="${contextPath}/product/getRankProducts.do">랭킹</a></li>
		<li><a href="#">할인</a></li>
		<li style="border: none;"><a href="#">고객센터</a>
            <ul class="main2" style="width:110%">
				<li><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
				<li><a href="${contextPath}/board/faqList.do">자주 묻는 질문</a></li>
				<li><a href="${contextPath}/board/qnaList.do">1:1 문의</a></li>
			</ul>
		</li>
    </ul>
</div>
</nav>
<hr>

</header>

</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    
</html>