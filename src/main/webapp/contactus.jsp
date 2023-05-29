;<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
	<title>Contact Us | College Management System</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			font-size: 16px;
			line-height: 1.5;
			margin: 0;
			padding: 0;
		}

		.header {
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
			color: #fff;
		}

		nav ul {
			list-style: none;
			display: flex;
			margin: 0;
			padding: 0;
		}

		nav ul li a {
			color: #fff;
			margin-left: 20px;
			text-decoration: none;
		}

		main {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
		}

		h2 {
			font-size: 32px;
			margin-bottom: 30px;
		}

		form {
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}

		input[type="text"],
		input[type="email"],
		textarea {
			width: 100%;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
			margin-bottom: 20px;
			box-sizing: border-box;
			font-size: 16px;
		}

		textarea {
			height: 150px;
		}

		button[type="submit"] {
			background-color: #333;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}

		button[type="submit"]:hover {
			background-color: #444;
		}

		.container {
			max-width: 600px;
		}

		footer {
			background-color: #333;
			color: #fff;
			padding: 10px;
			text-align: center;
		}
	</style>
</head>
<body>
	<header class="header">
	 <a href="index.jsp" class="logo">College Management System</a>
	<nav>
		<ul>
			<li><a href="index.jsp">HOME</a></li>
			<li><a href="aboutus.jsp">ABOUT US</a></li>
		</ul>
	</nav>
	</header>
	
	<main>
		<center> <h2>Contact Us</h2> </center>
		<form method="post" action="ContactUsServlet">
			<div class="container">
				<label for="name">Name:</label>
				<input type="text" id="name" name="name" required>
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" required>
				<label for="subject">Subject:</label>
				<input type="text" id="subject" name="subject" required>
				<label for="message">Message:</label>
				<textarea id="message" name="message" required></textarea>
				<button type="submit">Submit</button>
			</div>
		</form>
	</main>
	
	<footer>
		<p>&copy; 2023 College Management System. All rights reserved.</p>
	</footer>
</body>
</html>
