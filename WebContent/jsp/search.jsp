<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<div class="containner">
	<div class="col-sm-offset-3">
	<img src="../images/a.jpg" alt="Mountain View" style="width:304px;height:228px;">
	</div>
	<form class="form-horizontal" action="../upload" method="POST" enctype="multipart/form-data">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">File</label>
			<div class="col-sm-3">
				<input type="file" name="file" class="form-control" id="inputEmail3">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-default">Upload</button>
			</div>
		</div>
	
	</form>
	<form class="form-horizontal" action="../Search" method="POST">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Search</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputEmail3"
					name="keyword">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-default">search</button>
			</div>
		</div>
		
	</form>
	<div class="col-sm-offset-2 col-sm-5">
		<table class="table table-striped">
		<c:forEach var="row" items="${filepaths}">
			<tr>
				<td><c:out value="${row}"/></td>
			</tr>
		</c:forEach>
		</table>
		</div>

</div>

</body>
</html>