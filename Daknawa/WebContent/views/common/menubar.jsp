<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
<%
	
	String contextPath = request.getContextPath(); // "/jsp"
	
	Member loginUser = (Member)session.getAttribute("loginUser"); // 로그인한 유저의 정보
	
	String alertMsg = (String)session.getAttribute("alertMsg"); // alert 메세지
	
%>
<!DOCTYPE html>
<html lang="english">
<head>
<title>exported project</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />
<meta property="twitter:card" content="summary_large_image" />
<!-- 스타일을 위한 연동 구문 (외부 스타일 방식) -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- 기본 동적인 효과를 위한 연동 구문 (외부 js 방식) => 순서 주의!! -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- 온라인 방식 -->
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
	<!-- 기본 동적인 효과를 위한 연동 구문 (외부 js 방식) => 순서 주의!! -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- 온라인 방식 -->
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style data-tag="reset-style-sheet">
html {
	line-height: 1.15;
}

body {
	margin: 0;
}

* {
	box-sizing: border-box;
	border-width: 0;
	border-style: solid;
}

p, li, ul, pre, div, h1, h2, h3, h4, h5, h6, figure, blockquote,
	figcaption {
	margin: 0;
	padding: 0;
}

button {
	background-color: transparent;
}

button, input, optgroup, select, textarea {
	font-family: inherit;
	font-size: 100%;
	line-height: 1.15;
	margin: 0;
}

button, select {
	text-transform: none;
}

button, [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
}

button::-moz-focus-inner, [type="button"]::-moz-focus-inner, [type="reset"]::-moz-focus-inner,
	[type="submit"]::-moz-focus-inner {
	border-style: none;
	padding: 0;
}

button:-moz-focus, [type="button"]:-moz-focus, [type="reset"]:-moz-focus,
	[type="submit"]:-moz-focus {
	outline: 1px dotted ButtonText;
}

a {
	color: inherit;
	text-decoration: inherit;
}

input {
	padding: 2px 4px;
}

img {
	display: block;
}

html {
	scroll-behavior: smooth;
}
</style>
<style data-tag="default-style-sheet">
html {
	font-family: Inter;
	font-size: 16px;
}

body {
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	text-transform: none;
	letter-spacing: normal;
	line-height: 1.15;
	color: var(- -dl-color-gray-black);
	background-color: var(- -dl-color-gray-white);
}

.dropdown-box1 {
	background-color: #f9f9f9;
	min-width: 160px;
	z-index: 1;
	height: 80px;
	border: 1px solid #f9f9f9;
}

div {
	box-sizing: border-box;
}
/* navigator 에 대한 작업용 임시스타일 */
#navigator {
	width: 1000px;
	height: 40px;
}

/* 전체를 감사는 navi */
#navi {
	list-style: none;
	/*
            p 태그와 마찬가지로 ul 태그 또한 위, 아래로 기본 margin 이 잡혀있음
            또한 ul 태그는 padding이 왼쪽에 기본적으로 존재함
            => margin : 0px; 과 padding : 0px; 으로 margin과 padding을 없애기
        */
	margin: 0px;
	padding: 0px; /* padding 값 조정으로 메뉴 가운데 배치 가능 */
	height: 100%;
}

/* 메인 메뉴 나타내는 li 태그들 */
#navi>li {
	float: left;
	width: 15%;
	height: 100%;
}

/* 메뉴 문구를 나타내는 a 태그들 */
#navi a {
	text-decoration: none;
	color: lightcoral;
	font-size: 13px;
	font-weight: 900;
	/*
                a 태그는 인라인요소이기 때문에
                width, height 속성이 적용되지 않음
                => display : block;으로 블럭요소화 시켜줄것임
            */
	width: 100%;
	height: 100%;
	display: block;
	text-align: center;
	/*vertical-align : middle;*/ /* verical-align 은 블럭요소에서 적용되지 않음 */
	line-height: 35px;
	/*
                line_height 속성은 블럭요소에 대한 장편조절 속성
                보통은 블럭요소의 세로길이만큼 주면 알아서 가운데로 옴
            */
}
/* 메뉴에 마우스가 올라갔을 때 추가적인 속성 */
#navi a:hover {
	color: crimson;
	font-size: 15px;
}

/* 서브메뉴에 해당되는 ul에 대한 스타일 */
#navi>li>ul {
	list-style-type: none;
	padding: 0px;
	display: none; /* 평소에는 안보여지게끔 숨김 처리 */
}
/* 메인 메뉴에 마우스가 올라가는 순간 서브메뉴가 보여지게끔 스타일 부여*/
#navi>li:hover>ul {
	display: block;
}

/* 혹시 몰라서 서브메뉴 자체에도 효과 부여 */
#navi>li>ul:hover {
	display: block;
}

/* 추가적으로 글씨 크기조정, 스타일, ... */
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet" href="./style.css" />
<link href="resources/css/navbar11.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/ba6f730a41.js" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<div class="navbar11-navbar1">
			<div class="navbar11-container1">
				<img onclick="location.href='<%= contextPath %>'" style="cursor: pointer"
					src="resources/css/logoimg+logoname.png" alt="logoI204"
					class="navbar11-logo" />
				<div class="navbar11-column1">
					<div class="navbar11-column2">
						<span 
							class="navbar11-text TextRegularNormal" style="cursor: pointer">
							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle"
									style="background-color: rgba(64, 81, 59, 1); border: 0px; border-radius: 0px;"
									type="button" id="dropdownMenuButton1"
									data-bs-toggle="dropdown" aria-expanded="false">게시판</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
									<li><a class="dropdown-item" href="<%= contextPath %>/plist.bo?currentPage=1">자유 게시판</a></li>
									<li><a class="dropdown-item" href="<%= contextPath %>/review.bo?currentPage=1">사진 게시판1</a></li>
								</ul>
							</div>
						</span>
						<div class="dropdown">
							<button class="btn btn-secondary"
								onclick="location.href='<%= contextPath %>/menu.mn'"
								style="background-color: rgba(64, 81, 59, 1); border: 0px; border-radius: 0px;"
								type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false">메뉴 정보</button>

						</div>
						<div class="dropdown">
							<button class="btn btn-secondary"
								onclick="location.href='<%= contextPath %>/list.st?currentPage=1'"
								style="background-color: rgba(64, 81, 59, 1); border: 0px; border-radius: 0px;"
								type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false">매장 정보</button>
						</div>

						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle"
								style="background-color: rgba(64, 81, 59, 1); border: 0px; border-radius: 0px;"
								type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false">더보기</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item" href="<%= contextPath %>/myPage.me">마이 페이지</a></li>
								<li><a class="dropdown-item" href="#">문의 하기</a></li>

							</ul>
						</div>
					</div>
					<% if(loginUser == null) { // 로그인 하기 전  %>
						<div class="navbar11-column3">
							<button onclick="location.href='<%= contextPath %>/loginPage.me'"
								class="navbar11-button" style="cursor: pointer">
								<span class="navbar11-text08 TextRegularNormal"> <span>로그인</span>
								</span>
							</button>
						</div>
					<% } else { // 로그인 한 후 %>
						<div class="navbar11-column3">
							<button onclick="location.href='<%= contextPath %>/logout.me'"
								class="navbar11-button" style="cursor: pointer">
								<span class="navbar11-text08 TextRegularNormal"> <span>로그아웃</span>
								</span>
							</button>
						</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	
	<!-- alert 스크립트 -->
	<script>
		let msg = "<%= alertMsg %>";
		
		if(msg != "null") {
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
		
</body>
</html>
