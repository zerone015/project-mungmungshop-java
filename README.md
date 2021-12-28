# 뭉뭉샵
- 뭉뭉샵 프로젝트는 반려견 양육 시 필요한 다양한 물품들을 구입할 수 있는 애완용품 쇼핑몰입니다.
- 반려견을 가족으로 여기는 라이프스타일 변화, 저출산 및 고령화등 반려견을 기르는 사람이 늘고 있는 추세에 맞춰 개발하게 되었습니다.

### 개발 팀 정보
- 팀장 : 최다영
- 팀원 : 손영원, 유미성, 조은수

### 개발 환경
<img width="1008" alt="스크린샷 2021-12-28 오후 9 40 11" src="https://user-images.githubusercontent.com/84886265/147568313-f4861ec1-02e9-4e64-8a39-070e3f83d798.png">

### ER다이어그램
<img width="1008" alt="스크린샷 2021-12-28 오후 9 41 17" src="https://user-images.githubusercontent.com/84886265/147569156-e515cea0-2f61-41bd-bb4d-b08e08410676.png">

### 서비스 개요
<img width="1008" alt="스크린샷 2021-12-28 오후 9 37 30" src="https://user-images.githubusercontent.com/84886265/147569430-06e9296e-cb70-43ed-88ba-26261c966e0f.png">

<img width="1008" alt="스크린샷 2021-12-28 오후 9 38 54" src="https://user-images.githubusercontent.com/84886265/147569498-cb1d8a1b-b8fd-4ae7-8618-48f1848aaa9a.png">

### 주요 기능 및 적용 기술
- 상품 검색 및 Ajax를 이용한 검색어 자동 완성
- OAuth를 이용한 로그인 기능(네이버, 카카오)
- 로그인이 필요한 메뉴 접근 시 Interceptor를 이용하여 로그인 체크 하므로써 효율적인 유지보수 및 세션 관리가 가능하도록 구현
- Java Mail Api를 이용한 회원가입, 비밀번호 찾기 시 본인 인증 기능
- Ajax를 이용한 회원가입 아이디, 닉네임 중복 검사 기능
- 스프링 시큐리티를 이용하여 회원가입 시 비밀번호를 암호화하여 DB에 저장함
- Session을 활용한 최근 본 상품 저장 및 Cookie를 활용한 로그인 시 아이디 기억하기 기능
- 장바구니에서 여러개의 상품을 한번에 주문,삭제할 수 있고 Ajax를 활용하여 장바구니에서 상품 수량을 조절할 수 있게 하였음 
- 아임포트 API를 이용한 신용카드, 계좌이체 결제 기능
- Scheduler를 이용하여 구매한지 7일이 지난 배송완료 주문 건을 자동으로 구매확정 처리하고 1년 넘게 로그인 하지 않은 회원 탈퇴 처리하도록 구현
- Trigger를 활용한 주문 -> 배송 시스템 구축
- Procedure를 활용한 상품 구매확정 -> 포인트 지급과 같은 일괄 처리 기능
- ACID 특성을 보장하기 위한 트랜잭션 기능
- 관리자 모드 상품관리, 회원관리, 주문관리, 리뷰관리
- javascript, jquery를 이용하여 submit하기 전 html 속성 컨트롤 및 입력값 검사 
- 기타 상품 정렬, 파일 업로드, 페이징 처리, 주문 취소 및 환불, 리뷰, 게시판, 1:1 문의, 배송지 관리, 회원 정보 변경 및 회원 탈퇴 기능 등등

### 기대효과 및 활용 분야
- 소비자는 상품비교 및 간편결제를 통해 개인의 시간과 부담을 절감 할 수 있음
- 판매자는 찜하기 기능과 리뷰를 통해 소비자들의 트렌드를 한 눈에 파악할 수 있으며 판매자의 니즈를 충족시킬 수 있다.
- 펫코노미 시장 활성화

