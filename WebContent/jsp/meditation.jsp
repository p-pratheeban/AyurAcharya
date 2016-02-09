<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<jsp:include page="header.jsp" />
<script type="text/javascript" src="../js/tock.js"></script>
<style>
#laptimes {
	border: 1px solid #ddd;
	padding: 10px;
	width: 200px;
}
</style>
<script>
	window.onload = function() {
		var starta = new Audio("../audio/3.mp3");
		var stop = new Audio("../audio/4.mp3");
		var timer = new Tock({
			callback : function() {
				$('#clockface').val(timer.msToTime(timer.lap()));
			}
		});

		$('#start').on('click', function() {
			timer.start($('#clockface').val());
			starta.play();
		});

		$('#pause').on('click', function() {
			timer.pause();
		});

		$('#stop').on('click', function() {
			timer.stop();
		});

		$('#reset').on('click', function() {
			timer.reset();
			$('#clockface').val('');

		});

	}
</script>


<div class="row text-center">
	<div class="col-lg-10">
		<img src="../images/meditation.jpg" width="300" height="300">
	</div>
</div>
<br />

<div class="form-group row">

	<div class="col-sm-offset-4 col-sm-2">
		<input id="clockface" placeholder="00:00:00">
	</div>
</div>
<div class="form-group row">
	<div class="col-sm-3">
	</div>
	<div class="col-sm-1">
		<button id="start" class="btn btn-success">Start</button>
	</div>
	<div class="col-sm-1">
		<button id="pause" class="btn btn-success">Pause</button>
	</div>
	<div class="col-sm-1">
		<button id="stop" class="btn  btn-success">Stop</button>
	</div>
	<div class="col-sm-1">
		<button id="reset" class="btn  btn-success">Reset</button>
	</div>
</div>

</body>
</html>