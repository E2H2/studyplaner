<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>HRD 학습관리 사이트</title>
</head>
<body>
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
				<span class="icon-bar"></span> <!-- 화면 해상도 줄어들어도 메뉴 보이게 하기 -->
				</button>
				<a class="navbar-brand" href="/BBS/gomain.bo">HRD 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
    			<li class="active" ><a href="/BBS/gomain.bo">메인</a></li>
    			<li><a href="gobbs.bo">게시판</a></li>
    			<li><a href="golunch.bo">식단표</a></li>
    			<li><a href="gochat.bo">채팅</a></li>
    			<li><a href="goweather.bo">날씨</a></li>
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
	
타이머와 할일리스트 보이는 곳+통계그래프		
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script> 
	<script src="js/bootstrap.js"></script> 
</body>
</html>