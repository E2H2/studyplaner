<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>오늘의 날씨</title>
</head>
<body>
<image src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FvzfLZ%2FbtqFveYYKnD%2FVKlP0zP4T3y9SZCxYbf3JK%2Fimg.jpg">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID =(String) session.getAttribute("userID");
		}
	%>
<nav class="navbar navbar-default">
		<div class ="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle = "collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> <!-- 화면 해상도 줄여도 메뉴 보이게 하기 -->
				</button>
				<a class="navbar-brand" href="gomain.bo">HRD 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
    			<li><a href="gomain.bo">메인</a></li>
    			<li><a href="gobbs.bo">게시판</a></li>
    			<li><a href="golunch.bo">식단표</a></li>
    			<li><a href="gochat.bo">채팅</a></li>
    			<li class="active"><a href="goweather.bo">날씨</a></li>
			</ul>
			<%
				if(userID == null){
			%>	
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gologin.bo">로그인</a></li>
						<li><a href="gojoin.bo">회원가입</a></li>
				</ul>
				</li>
			</ul>
			<%		
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gologoutAction.bo">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%							
				}
			%>			
		</div>
	</nav>
	<!-- 위에 내비게이션 바 표시해두는 곳 -->

			
<div class="vis-weather">
        <h2 class="vh_hide">날씨정보</h2>
        <p class="weather-date"></p>
        <ul>
            <li class="weather-temp"></li>
            <li id="RN1">시간당강수량 : ?</li>
            <li class="weather-state-text"></li>
        </ul>
    </div>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="jquery.xdomainajax.js"></script>
    <script src="weather.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script> 
</body>
</html>