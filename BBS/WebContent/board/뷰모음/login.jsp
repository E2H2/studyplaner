<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>HRD 학습관리 사이트</title>
</head>
<body>
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
    			<li><a href="goweather.bo">날씨</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="gologin.bo">로그인</a></li>
						<li><a href="gojoin.bo">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top: 20px;">
		<!-- 로그인 정보를 숨기면서 전송post -->
			<form method="post" action="gologinAction.bo">
				<h3 style="text-align: center;"> 로그인화면 </h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>  
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인"> 
			</form>
		</div>
	</div>
	 <div class="col-lg-4"></div>
</div>
	
		
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script> 
	<script src="js/bootstrap.js"></script> 
</body>
</html>