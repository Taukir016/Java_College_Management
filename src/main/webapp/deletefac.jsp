<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Faculty</title>
<style>
  /* Set a background color and font family for the entire page */
  body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
  }

  /* Style the header with a background color, text color, and padding */
  .header {
    background-color: #333;
    color: white;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* Style the logo with a larger font size and remove underlines */
  .logo {
    font-size: 2rem;
    font-weight: bold;
    text-decoration: none;
    color: white;
  }

  /* Style the navigation links with a margin and remove underlines */
  .header ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
  }

  .header li {
    margin-left: 20px;
  }

  .header a {
    color: white;
    text-decoration: none;
  }

  /* Style the container with a centered text alignment and margin */
  .container {
    max-width: 600px;
    margin: auto;
    text-align: center;
  }

  /* Style the form with a centered text alignment and margin */
  .container form {
    margin-top: 50px;
    text-align: center;
  }

  /* Style the input fields with padding, border radius, and margin */
  .container form input[type=text] {
    padding: 10px;
    border-radius: 5px;
    border: none;
    margin-top: 5px;
    
  }

  /* Style the submit button with padding, border radius, and colors */
  .container form input[type=submit] {
    padding: 10px;
    border-radius: 5px;
    border: none;
    margin-top: 10px;
    background-color: #333;
    color: white;
    cursor: pointer;
  }

  /* Style the footer with a centered text alignment and margin */
  footer {
    text-align: center;
    margin-top: 300px;
    padding: 5px;
    background-color: #333;
    color: white;
  }
</style>
</head>
<body>
<header class="header">
	 <a href="index.jsp" class="logo">Tech Mahindra University</a>
		<nav>
			<ul>
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="contactus.jsp">CONTACT US</a></li>
			</ul>
		</nav>
	</header>
<div class="container">
<h1> Delete an Employee Data </h1>
<center>
	<form action="DeleteFacultyServlet" method="post">
		 ID : <input type="text" name="id"><br>
		 
		 <br>
		 
		 <input type="submit" value="DELETE ACCOUNT">
		</center>
</form>
</div>
<footer>
		<p>&copy; 2023 College Management System. All rights reserved.</p>
</footer>

</body>
</html> 
