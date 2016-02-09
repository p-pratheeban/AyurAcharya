<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<style>
#container {
	min-width: 200px;
	width: expression(document.body.clientWidth < 500 ? "200px" : "auto");
}
</style>
<div class="containner">
	<a href="getDailyRoutine.jsp">View Daily Routines</a>
	<h3>Daily Activity Record</h3>
	<form class="form-horizontal" action="../SaveDaily" method="POST">
		<div class="form-group">
			<label for="date1" class="col-sm-2 control-label">Date</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="date1" name="date">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Wake up Time</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="wakeup" value="6">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Breakfast Time</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="breakfast" value="7">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Breakfast Meal</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="breakfastm" value="Light">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Lunch Time</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="lunch" value="12.30">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Lunch Meal</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="lunchm" value="Heavy">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">Dinner Time</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="dinner" value="19">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Dinner Meal</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="dinnerm" value="Light">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Sleep Time</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="sleep" value="21">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">No of times meditation</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="meditation" value="2">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-2">
				<button type="submit" class="btn btn-default">Save</button>
			</div>
		</div>

	</form>

</div>

</body>
</html>