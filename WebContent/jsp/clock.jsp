<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<div class="containner">
	<div class="row text-center">
		<div class="col-sm-offset-3 col-sm-2">
			<br><br><br><br>
			
			<canvas id="canvas" width="200" height="200">
			</canvas>
		</div>
		<div class="col-sm-3">
		<h3 class="text-center">Reminder</h3>
			<table class="table table-striped">
				<tr>
					<td>Wake up</td>
					<td>6 A.M</td>
				</tr>
				<tr>
					<td>Morning Meditation</td>
					<td>7 A.M</td>
				</tr>
				<tr>
					<td>Breakfast</td>
					<td>8 A.M</td>
				</tr>
				<tr>
					<td>Lunch</td>
					<td>12:30 P.M</td>
				</tr>
				<tr>
					<td>Evening Meditation</td>
					<td>4 P.M</td>
				</tr>
				<tr>
					<td>Dinner</td>
					<td>7 p.M</td>
				</tr>
				<tr>
					<td>Sleep</td>
					<td>9:30 p.M</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-offset-1 col-sm-2">
		<button id="stop"  class="btn btn-success" style="display:none;">stop</button>
		</div>
	</div>
</div>

<script>
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
var radius = canvas.height / 2;
ctx.translate(radius, radius);
radius = radius * 0.90
setInterval(drawClock, 1000);

function drawClock() {
  drawFace(ctx, radius);
  drawNumbers(ctx, radius);
  drawTime(ctx, radius);
}

function drawFace(ctx, radius) {
  var grad;
  ctx.beginPath();
  ctx.arc(0, 0, radius, 0, 2*Math.PI);
  ctx.fillStyle = 'white';
  ctx.fill();
  grad = ctx.createRadialGradient(0,0,radius*0.95, 0,0,radius*1.05);
  grad.addColorStop(0, '#333');
  grad.addColorStop(0.5, 'white');
  grad.addColorStop(1, '#333');
  ctx.strokeStyle = grad;
  ctx.lineWidth = radius*0.1;
  ctx.stroke();
  ctx.beginPath();
  ctx.arc(0, 0, radius*0.1, 0, 2*Math.PI);
  ctx.fillStyle = '#333';
  ctx.fill();
}

function drawNumbers(ctx, radius) {
  var ang;
  var num;
  ctx.font = radius*0.15 + "px arial";
  ctx.textBaseline="middle";
  ctx.textAlign="center";
  for(num = 1; num < 13; num++){
    ang = num * Math.PI / 6;
    ctx.rotate(ang);
    ctx.translate(0, -radius*0.85);
    ctx.rotate(-ang);
    ctx.fillText(num.toString(), 0, 0);
    ctx.rotate(ang);
    ctx.translate(0, radius*0.85);
    ctx.rotate(-ang);
  }
}

function drawTime(ctx, radius){
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    //hour
    hour=hour%12;
    hour=(hour*Math.PI/6)+
    (minute*Math.PI/(6*60))+
    (second*Math.PI/(360*60));
    drawHand(ctx, hour, radius*0.5, radius*0.07);
    //minute
    minute=(minute*Math.PI/30)+(second*Math.PI/(30*60));
    drawHand(ctx, minute, radius*0.8, radius*0.07);
    // second
    second=(second*Math.PI/30);
    drawHand(ctx, second, radius*0.9, radius*0.02);
}

function drawHand(ctx, pos, length, width) {
    ctx.beginPath();
    ctx.lineWidth = width;
    ctx.lineCap = "round";
    ctx.moveTo(0,0);
    ctx.rotate(pos);
    ctx.lineTo(0, -length);
    ctx.stroke();
    ctx.rotate(-pos);
}
</script>

<script>
var myAudio = new Audio("../audio/wakeup.mp3");
//myAudio.play();
var d = new Date();
var m = d.getMinutes();
var h = d.getHours();

var delay = 10000; // in milliseconds, check every minute
var intervalId = setInterval("playWhenReady()", delay);
$("#stop").click(function(){
	myAudio.stop();
});
function playWhenReady()
{
    var d = new Date();
    var h = d.getHours();
    var m = d.getMinutes(); 

    if (h === 6 && m === 0)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    if (h === 7 && m === 0)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    if (h === 8 && m === 0)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    if (h === 12 && m === 30)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    
    if (h === 16 && m === 00)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    if (h === 19 && m === 0)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
    if (h === 21 && m === 30)
    {
    	myAudio.play();
    	$("#stop").show();
        clearInterval(intervalId);              
    }
}
</script>

</body>
</html>