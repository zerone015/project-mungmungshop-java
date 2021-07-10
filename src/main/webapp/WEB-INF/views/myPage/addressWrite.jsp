<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>로그인창</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }    
</script>
<script type="text/javascript">
function checkAddress() {
	var form=document.userInfo;
	
	var regExpName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/; 				//한글,영어만 사용 가능
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;		//휴대폰 번호
	
	var id = form.id;
	var recipent = form.recipent;
	var phoneNumb = form.PhoneNum;
	var address = form.addressNumb;
	var detailAddress = form.detailAddress;
	
	
	if (id.value == "") {
		alert("배송지 명칭을 입력해주세요.");
		id.focus();
		return false;
	} 
	
	if (recipent.value == "") {
		alert("수령인을 입력해주세요.");
		recipent.focus();
		return false;
	}
	
	else if (!regExpName.test(recipent.value)) {
		alert("수령인은 한글,영문만 사용 가능합니다. 다시 입력해주세요.");
		recipent.select();
		return false;
	}
	
	if (phoneNumb.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		phoneNumb.focus();
		return false;
	}
	
	else if (!regExpPhone.test(phoneNumb.value)) {
		alert("잘못된 휴대폰 번호 입니다. -를 포함한 숫자만 입력해주세요.");
		phoneNumb.select();
		return false;
	}
	
	if (address.value == "") {
		alert("주소를 입력해주세요.");
		return false;
	}
	
	if (detailAddress.value == "") {
		alert("상세 주소를 입력해주세요.");
		detailAddress.focus();
		return false;
	}
	
	form.submit();
}
</script>
</head>
<body>
<div class="addressWrite">
<h2> 배송지 입력 </h2><br>
<form method="GET" action="#" name="userInfo">
	<div style="margin-left:300px;">
            <table>
                <tr>
               <td id="title">배송지 명칭&nbsp;</td>
                    <td>
                        <input type="text" name="id" maxlength="20" style="width:200px;" placeholder="배송지 명칭을 입력해주세요.">
                    </td>
                </tr>                        
                <tr>
                    <td id="title">수령인</td>
                    <td>
                        <input type="text" name="recipent" maxlength="45" style="width:200px;" placeholder="수령인을 입력해주세요.">
                    </td>
                </tr>                
                <tr>
                    <td id="title">휴대폰 번호</td>
                    <td>
                        <input type="text" name="PhoneNum" maxlength="50" placeholder="-없이 번호만 입력해주세요" style="width:200px;">
                    </td>
                </tr>
                <tr>                 
 					<td id=address" style="vertical-align:top"/">배송지 주소</td>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호" readonly name="addressNumb">
						<input type="button" onclick="sample4_execDaumPostcode()" value="검색" class="btn btn-dark"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="30" readonly><br>
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="30">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="30" name="detailAddress" maxlength="50" ><br>
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="30">
						<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="30" ><br>
					</td>
               </table>
	</div>          
	<button type="button" onclick="checkAddress()" class="btn btn-dark">확인</button>
	&nbsp;
	<button type="button" onclick="cancle()" class="btn btn-dark">취소</button>
</form>
	</div>
  	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>