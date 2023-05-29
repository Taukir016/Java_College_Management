<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Faculty</title>

<style>
	.header {
		background-color: #333;
		color: #fff;
		padding: 10px;
	}

	.logo {
		float: left;
		font-size: 25px;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}

	nav ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
	}

	nav li {
		float: right;
	}

	nav li a {
		display: block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}

	form {
		margin-top: 50px;
		width:200px;
	}

	input[type="text"], input[type="password"], input[type="email"] {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}

	input[type="submit"] {
		width: 100%;
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	input[type="submit"]:hover {
		background-color: #45a049;
	}

	label {
		font-weight: bold;
		display: block;
		margin-bottom: 10px;
		border-radius:4px;
		width:100px;
	}
</style>

</head>
<body>
<header class="header">
	 <a href="index.jsp" class="logo">College Management System</a>
	<nav>
		 <ul>
			 <li><a href="index.jsp">HOME</a></li>
			 <li><a href="contactus.jsp">CONTACT US</a></li>
		 </ul>
	</nav>
</header>

<div class="container">
<center>
<h1> Delete Student Data </h1>
<form action="DeleteStudentServlet" method="post">
<label for="usn">USN:</label>
<input type="text" id="usn" name="usn"><br><br>
<input type="submit" value="DELETE ACCOUNT">
</form>
</center>
</div>

<footer>
</footer>

</body>
</html>
