<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>        
<!DOCTYPE html>
<html>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
   <script src="js/bootstrap.js"></script> 

<script type="text/javascript">
function rowAdd() {
    var objRow;
    objRow = document.all["tblShow"].insertRow();

    //팀 or 개인
    var objCell_Id = objRow.insertCell();
    objCell_Id.innerHTML = "<input type='text' id='row_id' size='10' value=''/>";

    //조
    var objCell_Nm = objRow.insertCell();
    objCell_Nm.innerHTML = "<input type='text' id='row_nm' size='10' value=''/>";


    //할일
    var objCell_Tel = objRow.insertCell();
    objCell_Tel.innerHTML = "<input type='text' id='row_tel' size='10' value=''/>";


    //성취여부
    var objCell_adr = objRow.insertCell();
    objCell_adr.innerHTML = "<input type='checkbox' id='row_tel'/>";

}

var time = 0;
var starFlag = true;
$(document).ready(function(){
  buttonEvt();
});

function init(){
document.getElementById("time").innerHTML = "00:00:00";
}

function buttonEvt(){
var hour = 0;
var min = 0;
var sec = 0;
var timer;

// start btn
$("#startbtn").click(function(){

if(starFlag){
  $(".fa").css("color","#FAED7D")
  this.style.color = "#4C4C4C";
  starFlag = false;

  if(time == 0){
    init();
  }

  timer = setInterval(function(){
    time++;

    min = Math.floor(time/60);
    hour = Math.floor(min/60);
    sec = time%60;
    min = min%60;

    var th = hour;
    var tm = min;
    var ts = sec;
    if(th<10){
    th = "0" + hour;
    }
    if(tm < 10){
    tm = "0" + min;
    }
    if(ts < 10){
    ts = "0" + sec;
    }

    document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;
  }, 1000);
}
});

// pause btn
$("#pausebtn").click(function(){
if(time != 0){
  $(".fa").css("color","#FAED7D")
  this.style.color = "#4C4C4C";
  clearInterval(timer);
  starFlag = true;
}
});

// stop btn
$("#stopbtn").click(function(){
if(time != 0){
  $(".fa").css("color","#FAED7D")
  this.style.color = "#4C4C4C";
  clearInterval(timer);
  starFlag = true;
  time = 0;
  init();
}
});
}
</script>

<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>HRD 학습관리 사이트</title>
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
   </image>
   
   <table border="0" width="100px"><!--전체 윤곽 테이블 시작-->
    <td colspan="1"><!--첫째줄 td 시작 colspan 을 빼 먹지 마세요!!-->
     <table border="0" width="380" height="50" >

     </table>
     <div id='box' class="box">
      <div id='timerBox' class="timerBox">
         <div id="time" class="time">00:00:00</div>
      </div>
      <div class="btnBox">
         <i id="startbtn" class="fa fa-play" aria-hidden="true"></i>
         <i id="pausebtn" class="fa fa-pause" aria-hidden="true"></i>
         <i id="stopbtn" class="fa fa-stop" aria-hidden="true"></i>
      </div>
   </div>
   <br>
<input type="button" id="addBtn" name"addBtn" value="해야할 일 추가" onclick="rowAdd()">
<input type="button" id="saveBtn" name"saveBtn" value="저장" onclick="">
<br>
<table border="1">
    <tr>
        <td>팀 or 개인</td>
        <td>조</td>
        <td>할 일</td>
        <td>성취여부</td>
    </tr>
    <tbody id="tblShow"></tbody>
</table>


</table>
</body>

</html>