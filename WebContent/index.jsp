<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="utf-8">
	<title>AyurAcharaya Application</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/ayur.css">
	<style>
	.screen-only

{

display: block;

}

.mobile-only

{

display: none;

}



@media screen and (max-width: 480px)

{

.screen-only

{

display: none;

}



.mobile-only

{

display: block;

}

}
	
	</style>
</head>
<body>
<div class="containner">
	<!-- header -->
	<div class="row home">
		<div class="col-lg-6 center">	
		<h1><strong>AYURACHARAYA </strong></h1>		
		</div>
		<div class="col-lg-6">
			<form method="POST" action="Login">
				
				<div class="form-group col-lg-5">
					<label for="user" class="control-label">Username</label><br/>
			        <input type="text" class="form-control" id="user" name="user" placeholder="Username" required>    
				</div>

				<div class="form-group col-lg-5">
					<label for="pass" class="control-label">Password</label><br/>
					<input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required>	
				</div>
				<div class="form-group col-lg-2">
					<button type="submit" class="btn btn-success loginbtn">Login</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Sign Up -->
	<div class="row homecontent">
		<div class="col-lg-8 center">
			<img src="images/ayur.png">
		</div>
		<div class="col-lg-4">
		<form method="POST" action="Login">
			<h2><strong>Sign Up</strong></h2>
			<div class="form-group col-lg-6">
			
	  			<label for="email">Username</label>
	   			<input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
	  		</div>
	  		<div class="form-group col-lg-6 clear">
			    <label for="newpassword">Password</label>
			    <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New password" required>
			</div>
	  		<div class="form-group col-lg-6 clear">
	  			<label for="email">Email address</label>
	   			<input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
	  		</div>
	  		<div class="form-group col-lg-6 clear">		
	  		<button type="submit" class="btn btn-success">Sign Up</button>
			</form>
			</div>
			
		</div>
	</div>
	
</div>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>


</body>
</html>