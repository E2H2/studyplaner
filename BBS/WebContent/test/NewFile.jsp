<!DOCTYPE html>
<style>
   *{
      margin: 0px;
      padding: 0px;
   }
     body{
      height: 100vh;
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
    }
    .box{
      width: 200px;
      height: 200px;
   }
   .timerBox{
      width: 200px;
      outline: 2px solid black;
   }
   .timerBox .time{
      font-size: 30pt;
      color: #4C4C4C;
      text-align: center;
      font-family: sans-serif;
   }
   .btnBox{
      margin: 20px auto;
      text-align: center;
   }
   .btnBox .fa{
      margin: 0px 5px;
      font-size: 30pt;
      color: #FAED7D;
      cursor: pointer;
   }

</style>
<meta charset="UTF-8">
<title>StopWatch</title>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">


function five_alert(){
  alert("5분 남았습니다.");
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
if((set_th - hour) == 0 && (set_tm - min) == 5 && (set_ts - sec) == 0){
	  five_alert();
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

function set(){
  alert("설정되었습니다.");
  var set_th;
  var set_tm;
  var set_ts;
  set_th = document.getElementById("time_th").value;
  set_tm = document.getElementById("time_tm").value;
  set_ts = document.getElementById("time_ts").value;
  if(!(0 <= set_tm && set_tm <= 59))
  document.getElementById("output_tm").innerHTML = "0분에서 59분사이의 값을 입력하세요.";
  else {
    document.getElementById("output_tm").innerHTML = " ";
  }
  if(!(0 <= set_ts && set_ts <= 59))
  document.getElementById("output_ts").innerHTML = "0초에서 59초사이의 값을 입력하세요.";
  else {
    document.getElementById("output_ts").innerHTML = " ";
  }
}

</script>
</head>
<body>
   <div id='box' class="box">
      <div id='timerBox' class="timerBox">
         <div id="time" class="time">00:00:00</div>
      </div>
      <div class="btnBox">
         <i id="startbtn" class="fa fa-play" aria-hidden="true"></i>
         <i id="pausebtn" class="fa fa-pause" aria-hidden="true"></i>
         <i id="stopbtn" class="fa fa-stop" aria-hidden="true"></i>
      </div>
      <div>
      <b>공부 시간 설정</b><br>
      <input id="time_th" style= "width: 34px">시
      <input id="time_tm" style= "width: 34px">분
      <input id="time_ts" style= "width: 34px">초
      <button type="button" onclick="set()"> 설정 </button>
      <p id="output_tm"></p>
      <p id="output_ts"></p>

    </div>
   </div>
</body>
</html>