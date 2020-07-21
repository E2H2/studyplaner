<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "list.ListDAO" %>
<%@ page import = "user.UserDAO" %>


<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:useBean id="list" class="list.List" scope="page"/>
<jsp:setProperty name="list" property="date"/>
<jsp:setProperty name="list" property="list"/>
<jsp:setProperty name="list" property="checked"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRD 학습관리 사이트</title>
</head>
<body>
	<%
	//String time = "300";
	//String date = "2020-07-20";
	
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}

	ListDAO listDAO =new ListDAO();
	int result = listDAO.savelist(list);
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");	
		script.println("alert('저장되었습니다.')");
		script.println("location.href = 'gomain.bo'");
		script.println("</script>");
	}	
	
		
	%>

</body>
</html>