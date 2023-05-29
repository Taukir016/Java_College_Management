<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update faculty details</title>
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
.nav-items {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.nav-items li {
  margin-left: 20px;
}

.nav-items a {
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
.container form input[type=text],
.container form input[type=email],
.container form input[type=password],
.container form input[type=number] {
  padding: 10px;
  border-radius: 5px;
  border: none;
  margin-top: 5px;
}

/* Style the submit and reset buttons with padding, border radius, and colors */
.container form input[type=submit],
.container form input[type=reset] {
  padding: 10px;
  border-radius: 5px;
  border: none;
  margin-top: 10px;
  background-color: #333;
  color: white;
}

</style>
</head>
<body>
<header class="header">
    <a href="index.jsp" class="logo">College Management System</a>
    <nav class="nav-items">
      <a href="aboutus.jsp">About us</a>
      <a href="contactus.jsp">Contact Us</a>
    </nav>
</header>

<div class="container">
<h1> Please Update the Details </h1>
<form action="UpdateFacDetails" method="post">
	Name : <input type="text" name="name"> <br>
	Faculty ID: <input type="text" name="id"><br>
    Email : <input type="text" name="email"><br>
	Phone : <input type="text" name="phone"> <br>
	Qualification : <input type="text" name="quali"><br>
	Password : <input type="text" name="pass"><br>
	<input type="submit" value="Update Faculty Details">
	<input type="reset" value="Reset">
</form>
</div>

</body>
</html> 
