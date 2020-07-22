<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "timer.TimerDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>.

<!DOCTYPE html>
<html lang="ko">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">

google.charts.load('current', {'packages':['corechart', 'bar']});
google.charts.setOnLoadCallback(drawStuff);

function drawStuff() {
  var chartDiv = document.getElementById('chart_div');

  var data = google.visualization.arrayToDataTable([
    ['공부 시간', '지난 주 공부 시간', '이번 주 공부 시간'],
    ['월', 8.6, 3.3],
    ['화', 5.5, 8.5],
    ['수', 7.6, 4.3],
    ['목', 5.9, 6.9],
    ['금', 6.4, 7.1],
    ['토', 9.7, 6.1],
    ['일', 5.6, 4.1]
  ]);

  var materialOptions = {
    width: 500,
    chart: {
      title: '공부 시간 통계',
    },
    series: {
      0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
      1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
    },
    axes: {
      y: {
        distance: {label: '시간'}, // Left y-axis.
      }
    }
  };

  function drawMaterialChart() {
    var materialChart = new google.charts.Bar(chartDiv);
    materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
    button.innerText = 'Change to Classic';
    button.onclick = drawClassicChart;
  }

  function drawClassicChart() {
    var classicChart = new google.visualization.ColumnChart(chartDiv);
    classicChart.draw(data, classicOptions);
    button.innerText = 'Change to Material';
    button.onclick = drawMaterialChart;
  }

  drawMaterialChart();
}
<!-- 두 번째 통계 그래프-->
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLogScales);

function drawLogScales() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'X');
      data.addColumn('number', '지난 주 성취율');
      data.addColumn('number', '이번 주 성취율');

      data.addRows([
        ['월', 0.8, 0.5],    ['화', 0.8, 0.65],   ['수', 0.75, 0.15],  ['목', 0.71, 0.90],   ['금', 0.8, 0.6],  ['토', 0.9, 0.5], ['일', 0.81, 0.38]
      ]);

      var options = {
        hAxis: {
          title: '요일',
          logScale: true
        },
        vAxis: {
          title: '성취율',
          logScale: false
        },
        colors: ['#a52714', '#097138']
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
      chart.draw(data, options);
    }

   var time = 0;
   var starFlag = true;
   $(document).ready(function(){
     buttonEvt();
   });

   //초기설정 00:00:00 출력
   function init(){
   document.getElementById("time").innerHTML = "00:00:00";
   document.getElementById("set_time").innerHTML = "/00:00:00";
   }

   //각종 버튼에 대한 함수
   function buttonEvt(){
   var hour = 0;
   var min = 0;
   var sec = 0;
   var timer;
   var set_th = 0;
   var set_tm = 0;
   var set_ts = 0;
   var set_total = 0;
   var set_th1 = 0;
   var set_tm1 = 0;
   var set_ts1 = 0;

   // set btn - 공부 시간 설정 버튼 클릭 시 동작
   $("#set_button").click(function(){
     set_th = parseInt(document.getElementById("time_th").value);//공부시간설정에서 받은 시간 정보를 int형으로 변환 후 변수 set_th에 저장
     set_tm = parseInt(document.getElementById("time_tm").value);//공부시간설정에서 받은 분 정보를 int형으로 변환 후 변수 set_tm에 저장
     set_ts = parseInt(document.getElementById("time_ts").value);//공부시간설정에서 받은 초 정보를 int형으로 변환 후 변수 set_ts에 저장
     if(!(0 <= set_th && set_th <= 24))//입력한 분 정보가 0에서 24시간 범위가 아닐 때 얼랏 출력
       alert("0에서 24시간사이의 값을 입력하세요.");
     else if(!(0 <= set_tm && set_tm <= 59))//입력한 분 정보가 0에서 59분 범위가 아닐 때 얼랏 출력
       alert("0에서 59분사이의 값을 입력하세요.");
     else if(!(0 <= set_ts && set_ts <= 59))//입력한 초 정보가 0에서 59초 범위가 아닐 때 얼랏 출력
       alert("0에서 59초사이의 값을 입력하세요.");
     //조건 만족 시 빈칸 출력 및 설정되었다는 얼랏
     else {
       alert("설정되었습니다.");
       set_total = set_th*3600 + set_tm*60 + set_ts;//입력받은 변수를 초 단위로 변환하여 변수 set_total에 저장
     }
   });

   // start btn - 스타트 버튼 클릭 시 동작
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
       //설정 시간과 공부 시간의 차가 5분일 때 알림창
       if(set_total - time == 300){
         alert("5분 남았습니다.");
       }
       //설정 시간과 공부 시간의 차가 일치할 때 완료 알림창
       if(set_total - time == 0){
         alert("오늘 하루 수고하셨습니다!");
       }

   //공부시간 출력 박스에 표시하기 위한 변수 설정
       min = Math.floor(time/60);
       hour = Math.floor(min/60);
       sec = time%60;
       min = min%60;

       var th = hour;
       var tm = min;
       var ts = sec;

   //각 시간 정보가 1의 자리이면 십의 자리에 "0"텍스트 추가
       if(th<10){
       th = "0" + hour;
       }
       if(tm < 10){
       tm = "0" + min;
       }
       if(ts < 10){
       ts = "0" + sec;
       }
       document.getElementById("time").value = th + ":" + tm + ":" + ts;

   //남은시간 출력 박스에 표시하기 위한 변수 설정
       set_tm1 = Math.floor(set_total/60);
       set_th1 = Math.floor(set_tm1/60);
       set_ts1 = set_total%60;
       set_tm1 = set_tm1%60;

   //각 남은시간 정보가 1의 자리이면 십의 자리에 "0"텍스트 추가
       if(set_th1 < 10){
       set_th1 = "0" + set_th1;
       }
       if(set_tm1 < 10){
       set_tm1 = "0" + set_tm1;
       }
       if(set_ts1 < 10){
       set_ts1 = "0" + set_ts1;
       }

   //시간 출력 박스에 해당 시간 정보 텍스트 출력
       document.getElementById("flowtime").innerHTML = th + ":" + tm + ":" + ts;
       document.getElementById("set_time").innerHTML = "/" + set_th1 + ":" + set_tm1 + ":" + set_ts1;
     }, 1000);

   }

   });
   // pause btn - 퍼즈 버튼 클릭 시 동작
   $("#pausebtn").click(function(){
   if(time != 0){
     $(".fa").css("color","#FAED7D")
     this.style.color = "#4C4C4C";
     clearInterval(timer);
     starFlag = true;
   }
   });

   // stop btn - 스탑 버튼 클릭 시 동작
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



   // plusset btn - 라디오 버튼 밑 '추가' 버튼 클릭 시 동작
   $("#plusset_button").click(function(){
     var selected = document.getElementsByName("plus_time");
     for (var i = 0; i < selected.length; i++) {
       var value = selected[i].value;
       if (selected[i].checked) {
         //5분 라디오 버튼 체크
         if (value === 'plus_fivemin') {
           set_total = set_total + 300;
           alert("5분 추가되었습니다.");
         }
         //10분 라디오 버튼 체크
         else if (value === 'plus_tenmin'){
           set_total = set_total + 600;
           alert("10분 추가되었습니다.");
         }
         //30분 라디오 버튼 체크
         else if (value === 'plus_thirtymin'){
           set_total = set_total + 1800;
           alert("30분 추가되었습니다.");
         }
         //1시간 라디오 버튼 체크
         else if (value === 'plus_onehour'){
           set_total = set_total + 3600;
           alert("1시간 추가되었습니다.");
         }
       }
     }
   });

   /*$("#flowtime_btn").click(function(){
     document.getElementById("flowtime1").value = th + ":" + tm + ":" + ts;
     alert("시간 추가되었습니다.");
   });*/

   }
   function agree() {
      var chkbox = document.getElementsByName('agree');
      var chk = 0;
      for(var i=0 ; i<chkbox.length ; i++) {
         if(chkbox[i].checked) {
            chk += 1;
         }
      }
      document.getElementById("checked").value = chk;
      alert(chk + "입니다");
   }


   </script>


<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale ="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>HRD 학습관리 사이트</title>
</head>

<body background-color: #fff;>

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
<table border="0" align="center" width="1200" height="600">
<tr><td> 

  <div id='box' class="box">
     &nbsp;<h1><b>공부시간</b></h1>
      <h4><div id='timerBox' class="timerBox"></h4>
         <h1><div id="flowtime" class="time">&nbsp;00:00:00</div></h1>
         <h1><div id="set_time" class="set_time">/00:00:00</div></h1>
      </div>
      <div class="btnBox">
         <i id="startbtn" class="fa fa-play fa-3x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;
         <i id="pausebtn" class="fa fa-pause fa-3x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;
         <i id="stopbtn" class="fa fa-stop fa-3x" aria-hidden="true"></i>
      </div>
      <div>
      <h4><b>공부 시간 설정</b></h4>
      <input id="time_th" style= "width: 47.5px">시
      <input id="time_tm" style= "width: 47.5px">분
      <input id="time_ts" style= "width: 47px">초
      <button id="set_button" type="button"> 설정 </button>
      <br><br>
      <h4><b>추가 공부</b></h4>
      <input type="radio" name="plus_time" value="plus_fivemin">5분
      <input type="radio" name="plus_time" value="plus_tenmin">10분
      <input type="radio" name="plus_time" value="plus_thirtymin">30분
      <input type="radio" name="plus_time" value="plus_onehour">1시간
       &nbsp;<button id="plusset_button" type="button"> 추가 </button><br><br>
    </div>
    <form method="post" action="gotimerAction.bo">
    <input type="text" id="time" name="time" >
    <input type="submit" value="저장하기">
    </form>
   </div>
</td>
<td>
<div id="chart_div" style="width: 700px; height: 300px;"></div> 
<form action="golistAction.bo" method="post" onsubmit="return Check()">
</form>
</td>
  <tr><td>
    <table border="1">
    <h4><b>오늘 할일 리스트</b></h4>
	  <th>할일갯수</th>
	  <th>할일종류</th>
	  <th>성취여부</th>
   <tr><!-- 첫번째 줄 시작 -->
       <td>할일 1 :</td>
       <td><input type='text' id='row_id' size='10' value=''/></td>
       <td><input type='checkbox' name="agree" id='row_id1'/></td>
   </tr><!-- 첫번째 줄 끝 -->
   <tr><!-- 두번째 줄 시작 -->
      <td>할일 2 :</td>
      <td><input type='text' id='row_id' size='10' value=''/></td>
      <td><input type='checkbox' name="agree" id='row_id2' /></td>
  </tr><!-- 두번째 줄 끝 -->
  <tr><!-- 세번째 줄 시작 -->
      <td>할일 3 :</td>
      <td><input type='text' id='row_id' size='10' value=''/></td>
       <td><input type='checkbox' name="agree" id='row_id3'/></td>
   </tr><!-- 3번째 줄 끝 -->
  <tr><!-- 4번째 줄 시작 -->
      <td>할일 4 :</td>
      <td><input type='text' id='row_id' size='10' value=''/></td>
       <td><input type='checkbox' name="agree" id='row_id4'/></td>
   </tr><!-- 4번째 줄 끝 -->
  <tr><!-- 5번째 줄 시작 -->
      <td>할일 5 :</td>
      <td><input type='text' id='row_id' size='10' value=''/></td>
       <td><input type='checkbox' name="agree" id='row_id5'/></td>
   </tr><!-- 5번째 줄 끝 -->
    </table>
    <br>
    <input type="submit" id="saveBtn" name="saveBtn" value="입력">
    <input type="reset" id="resetBtn" name="saveBtn" value="다시입력">
    <input type="text" id="chk" style="display:none;">
</td>
<td>
<div id="chart_div2" style="width: 500px; height: 300px;"></div>
</td></tr>
</table>
</body>
</html>