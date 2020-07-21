<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>�Ĵ�ǥ</title>
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
				<span class="icon-bar"></span> <!-- ȭ�� �ػ� �ٿ��� �޴� ���̰� �ϱ� -->
				</button>
				<a class="navbar-brand" href="gomain.bo">HRD �Խ���</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
    			<li><a href="gomain.bo">����</a></li>
    			<li><a href="gobbs.bo">�Խ���</a></li>
    			<li><a href="golunch.bo">�Ĵ�ǥ</a></li>
    			<li class="active"><a href="gochat.bo">ä��</a></li>
    			<li><a href="goweather.bo">����</a></li>
			</ul>
			</li>
			</ul>
			<%
				if(userID == null){
			%>	
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gologin.bo">�α���</a></li>
						<li><a href="gojoin.bo">ȸ������</a></li>
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
						aria-expanded="false">ȸ������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gologoutAction.bo">�α׾ƿ�</a></li>
					</ul>
				</li>
			</ul>
			<%							
				}
			%>
			
		</div>
	</nav>


ä��â �ߴ� ��


	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script> 
	<script src="js/bootstrap.js"></script> 
</body>
</html>