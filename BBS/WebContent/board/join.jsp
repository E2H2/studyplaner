
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>HRD 게시판 웹사이트</title>

</head>

<body>
<image src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FvzfLZ%2FbtqFveYYKnD%2FVKlP0zP4T3y9SZCxYbf3JK%2Fimg.jpg">
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="gomain.bo">HRD 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="gomain.bo">메인</a></li>
				<li><a href="gobbs.bo">게시판</a></li>
				<li><a href="golunch.bo">식단표</a></li>
    			<li><a href="gochat.bo">채팅</a></li>
    			<li><a href="goweather.bo">날씨</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gologin.bo">로그인</a></li>
						<li class="active"><a href="gojoin.bo">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- 로긴폼 -->
	<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-5">
			<!-- 점보트론 -->
	<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="gojoinAction.bo">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" minlength ="4" maxlength="12">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"	name="userPassword"  minlength ="4" maxlength="12">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" minlength ="1" maxlength="20">
					</div>
						<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-danger"> 
							<input type="radio" name="userTeam" autocomplete="off" value="1조" >1조
							</label> 
							<label class="btn btn-danger"> 
							<input type="radio" name="userTeam" autocomplete="off" value="2조" >2조
							</label> 
							<label class="btn btn-danger"> 
							<input type="radio"	name="userTeam" autocomplete="off" value="3조" >3조
							</label>
							<label class="btn btn-danger"> 
							<input type="radio" name="userTeam" autocomplete="off" value="4조" >4조
							</label> 
							<label class="btn btn-danger"> 
							<input type="radio"	name="userTeam" autocomplete="off" value="5조" >5조
							</label>
						</div>
						</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
					</div>
					<div class="row" style="text-align:center;" >
						<input type="submit" class= "btn btn-danger" value="회원가입">
						<input type="reset" class= "btn btn-danger" value="다시입력">						
					</div>		
				</form>
	</div>
	</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>
