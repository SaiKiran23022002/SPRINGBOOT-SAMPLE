<%@page import="com.nagarro.entities.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
header, footer {
	background-color: rgb(122, 203, 236);
	font-size: 30px;
	width: 100%;
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

.button {
	transition: all .5s ease;
	border-radius: 30px;
	color: #008080;
	font-weight: 600;
	background-color: #fff;
	border: 1px solid #008080;
	margin-left: 5%;
}

.button:hover, .button:focus {
	background-color: #008080;
	color: #fff;
}
#edit,#delete{
	width:70px;
}
</style>
<title>Book Listing</title>
</head>
<body>
	<header style="margin-bottom: 10px">
		<form action="Logout" class="logout" method="post">
			<label class="col-9"
				style="text-align: center; font-size: 30px; font-weight: 500; padding-left: 15%; font-family: monospace;'">Book
				Listing</label><label class="col-3"
				style="font-weight: 500; color: #008080; font-size: 20px; padding-left: 10%;">
				<span>HI ${userId} <span><input type="submit"
						value="Logout" class="button">
			</label>
		</form>
	</header>
	<form action="addBook" method="post">
		<button class="btn btn-primary"
			style="float: right; margin-bottom: 10px;" onclick="">Add a
			book</button>
		&nbsp;
	</form>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>Book Code</td>
					<td>Book Name</td>
					<td>Author</td>
					<td>Date Added</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${booksList}">
					<tr>
						<td>${book.id}</td>
						<td>${book.name}</td>
						<td>${book.author}</td>
						<td>${book.date}</td>
						<td>
							<form action="editBook.jsp" method="post">
								<button id="edit" class="btn btn-primary" name="bookId" value="${book.id}">Edit</button>
							</form>
							&nbsp;
							<form action="deleteBook" method="delete">
								<button id="delete" class="btn btn-danger" name="id" value="${book.id}">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer></footer>
</body>
</html>