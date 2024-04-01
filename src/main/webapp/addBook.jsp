<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
header, footer {
	background-color: rgb(122, 203, 236);
	height: 50px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: right;
}

footer {
	position: fixed;
	height: 40px;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: rgb(122, 203, 236);
	color: white;
	text-align: center;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="addBook.css">
<title>Add Books</title>
</head>
<body>
	<header>
		<h6>HI ${userId}</h6>
		&nbsp;&nbsp;
		<form action="Logout" method="post">
			<button class="btn btn-primary">Logout</button>
		</form>
		&nbsp;
	</header>
	<br></br>
	<center>
		<h3 style="font-family: monospace;">Add Book Details</h3>
	</center>
	<div class="container" style="width: 40%">
		<form id="form" action="addBooks" method="post">
			<table class="table table-borderless">
				<tr>
					<td><label for="Bookcode">Book code:</label></td>
					<td><input type="text" name="bookCode" class="form-control"></td>
				</tr>
				<tr>
					<td><label for="Bookname">Book Name:</label></td>
					<td><input type="text" name="bookName" class="form-control"></td>
				</tr>
				<tr>
					<td><label for="author">Author :</label></td>
					<td>
						<select name="author" id="books">
							<option class="dropdown-item"  value="Vivek Shukla">Vivek Shukla</option>
							<option class="dropdown-item"  value="Anuj Tiwari">Anuj Tiwari</option>
							<option class="dropdown-item"  value="Chetan Bhagat">Chetan Bhagat</option>
							<option class="dropdown-item"  value="saikiran">saikiran</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="Added on">Added on :</label></td>
					<td><input type="text" name="addedon" class="form-control"></td>
				</tr>
			</table>
			<button class="btn btn-primary" type="submit">submit</button>
		</form>
	</div>
	<div class="error">
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h4 style="color: red; text-align: center; font-family: monospace;"><%=message%></h4>
		<br>
		<%
		}
		%>
	</div>
	<footer></footer>
</body>
</html>