<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="bbs.BbsDAO" %>    
<%@ page import="bbs.Bbs" %>    
<%@ page import="java.util.ArrayList" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>HRD 학습관리 사이트</title>
<!--게시글 제목 스타일 변경 -->
<style type="text/css"> 
	a, a:hover {
	color: #000000;
	text-decoration: none;
	}
</style>
</head>
<body>
<image src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FvzfLZ%2FbtqFveYYKnD%2FVKlP0zP4T3y9SZCxYbf3JK%2Fimg.jpg">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID =(String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
    			<li class="active" ><a href="gobbs.bo">게시판</a></li>
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
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i =0; i< list.size(); i++){
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href= "goview.bo?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"	+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
				</tr>
				
				<%
					}
				
				%>
				
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
			 	<a href="gobbs.bo?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber +1)){
			%>
					<a href="gobbs.bo?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-right">다음</a>
			<%
				}
			%>
			<!-- 게시판은 로그인 해야 보이도록 -->
			<%
			if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'gologin.bo'");
			script.println("</script>");
			%>
			<%
			} else{
			%>
			<a href="gowrite.bo" class="btn btn-primary pull-right">글쓰기</a>
			<%
			}
			%>
		</div>
	</div>

	
		
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script> 
	<script src="js/bootstrap.js"></script> 
</body>
</html>