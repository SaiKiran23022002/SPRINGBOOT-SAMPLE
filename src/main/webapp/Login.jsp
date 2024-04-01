<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />

<style>
.header {
	margin-top: 40px;
	padding-top: 20px;
	background-color: #EBF1F7;
	border-color: rgb(130, 153, 173);
	border-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
}

.footer {
	margin-top: 30px;
	padding-top: 20px;
	padding-bottom: 10px;
	background-color: #EBF1F7;
	border-color: rgb(130, 153, 173);
	border-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
}
</style>
<meta charset="ISO-8859-1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<div class="table row header" style="background-color: grey;">
				
			</div>
	<div class="container" style="background-color: #F5F8FB;">
		<form action="Login" method="post">
			<div class="form-group row header">
				<h4 style="color: rgb(45, 45, 97); margin-left: 10px">Login</h4>
			</div>

			<div class="form-group row" style="margin-top: 50px">
				<label for="username" class="col-sm-2 col-form-label">Username</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" placeholder="Username"
						required="required" name="userId" />
				</div>
			</div>
			<div class="form-group row">
				<label for="Password" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" placeholder="Password"
						required="required" name="password" /> <br>
				</div>

			</div>
			<div>
				<button type="submit" value="Login"
					style="margin-left: 555px; display: inline-block; margin-bottom:10px;">Login</button>

				</div>

			
			<div class="form-group row footer">

				

			</div>



		</form>

	</div>
	<div class="error">
		<%
		String error = (String) request.getAttribute("error");
		if (error != null) {
		%>
		<h4 style="color: red; text-align: center;font-family:monospace;"><%=error%></h4>
		<br>
		<h6 style="color: red; text-align: center;font-family:monospace;">Try logging again
			with your credentials</h6>
		<%
		}
		%>
	</div>
</body>
</html>