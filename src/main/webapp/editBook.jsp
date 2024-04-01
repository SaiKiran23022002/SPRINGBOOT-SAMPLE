<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="editBook.css">
    <style>
		.container{
		  	width: 40%;
		}
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
		</style>
	<title>Edit</title>
</head>
<body>
	<header>
		<form action="Logout" class="logout" method="post">
			<label class="col-9"
				style="text-align: center; font-size: 30px; font-weight: 500; padding-left: 15%; font-family: monospace;'"></label><label class="col-3"
				style="font-weight: 500; color: #008080; font-size: 20px; padding-left: 10%;">
				<span>Hi ${userId} <span><input type="submit"
						value="Logout" class="button">
			</label>
		</form>
	</header>
    <br></br>
    <center><h3 style="font-family: monospace;">Edit Book Details</h3></center>
    <div class="container">
    <%
	  String bookId = request.getParameter("bookId");
	%>
        <form action="editBook" method="post">
            <table class="table table-borderless">
                <tr>
                    <td><label for="Bookcode">Book code:</label></td>
                    <td><input type="text" name="bookCode" class="form-control" value="<%= bookId %>"></td>
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
    <footer></footer>
</body>
</html>