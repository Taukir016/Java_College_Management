<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Student Login</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}

		header {
			background-color: #333;
			color: #fff;
			padding: 10px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.logo {
			font-size: 24px;
			font-weight: bold;
			text-decoration: none;
		}

		nav ul {
			list-style: none;
			display: flex;
		}

		nav ul li a {
			color: #fff;
			margin-left: 20px;
			text-decoration: none;
			font-size: 18px;
		}

		main {
			padding: 20px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: calc(100vh - 60px);
		}

		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			max-width: 500px;
			width: 100%;
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		h2 {
			font-size: 24px;
			margin-bottom: 20px;
			text-align: center;
		}

		label {
			display: block;
			margin-bottom: 10px;
			font-size: 18px;
		}

		input[type="text"],
		input[type="password"] {
			width: 100%;
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			box-sizing: border-box;
			font-size: 18px;
			color: #555;
		}

		button[type="submit"],
		button[type="reset"] {
			border: none;
			background-color: #2ecc71;
			color: #fff;
			padding: 10px 20px;
			border-radius: 5px;
			margin-bottom: 20px;
			cursor: pointer;
			font-size: 18px;
		}

		button[type="submit"]:hover,
		button[type="reset"]:hover {
			background-color: #27ae60;
		}

		p {
			margin-top: 20px;
			font-size: 18px;
		}

		a {
			color: #2ecc71;
			text-decoration: none;
		}

		a:hover {
			text-decoration: underline;
		}
	</style>
</head>
<body>
<header>
	<a href="index.jsp" class="logo">College Management System</a>
	<nav>
	    <ul>
	        <li><a href="index.jsp">HOME</a></li>
	        <li><a href="contactus.jsp">CONTACT US</a></li>
	    </ul>
	</nav>
</header>
<main>
	<form action="StudLoginServlet" method="post">
	    <h2>Welcome to Student Login</h2>
	    <label for="email">Email:</label>
	    <input type="text" id="email" name="email" required>
	    <label for="password">Password:</label>
	    <input type="password" id="password" name="password" required>
	    <button type="submit">Login</button>
	    <p>New student? <a href="insertstud.jsp">Register here</a></p>
	    <p>Forgot your password? <a href="studentchangepassword.jsp">Reset it here</a></p>
	</form>
</main>
</body>
</html>
