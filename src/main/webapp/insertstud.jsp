<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>
<style>
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;

	padding: 0px 0px;
}

.header .logo {
	font-size: 30px;
	font-weight: bold;
	font-style: italic;
	font-family: 'Sriracha', !important;
	color: Red;
	text-decoration: none;
	margin-left: 30px;
}

header {
	background-color: #333;
	color: #fff;
	display: flex;
	align-items: center;
	height: 70px;
	padding: 20px;
}


nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	align-items: center;
}

nav li {
	margin-left: 30px;
}
	
nav a {
	color: #fff;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	transition: color 0.3s;
}

nav a:hover {
	color: #ddd;
}
/* Main content styles */
main {
	padding: 20px;
}

main h2 {
	font-size: 24px;
	margin-bottom: 10px;
}

main a {
	font-size: 30px;
}

main a {
	color: blue;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
}

main p {
	font-size: 20px;
}
main button{
	margin-left: 10px;
}
.buttons{
	text-align: center;
}


.container {
	
	padding: 16px;
	margin: auto;
	max-width: 350px;
	margin-top: 25px;
	display: flex;
   flex-direction: column;
   align-items: flex-start;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgb(71, 240, 4);
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%,
		rgba(0, 0, 0, 0.5) 100%),
	
}
form label {
	text-align:center;
	margin-bottom: 10px;
	text-decoration: none;
	font-size: 18px;
}
form input, form textarea {
	display: inline-block; padding : 10px;
	border-radius: 5px;
	margin-bottom: 5px;
	margin-top: 25px; margin : 8px 0;
	font-size: 18px;
	padding: 10px; 
	border-radius : 5px; 
	margin-bottom : 5px;
	margin-top :25px;
	margin : 8px;
	font-size : 18px;
	width: 90%;
	margin: 8px 0;
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
<main> 
<div class="container">
   
    <center><h1>Insert New Student</h1></center>
    <form action="StudentAddServlet" method="post">

        <label for="name">Student Name</label>
        <input type="text" id="name" name="name" pattern="[A-Za-z ]+" placeholder="Enter name" required>

        <label for="name">Student USN</label>
        <input type="text" id="usn" name="usn" pattern="[0-9A-Z]+" placeholder="Enter USN" required>

        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" placeholder="Enter email" required>

        <label for="phone">Phone Number</label>
        <input type="text" id="phone" name="phone" pattern="[0-9]+" placeholder="Enter phone number" required>


        <label for="password">Password([A-za-z/!@#$%^&amp;*/0-9])</label>
        <input type="password" id="password" name="password"  pattern="[A-Z]+[a-z]+[!@#$%^&amp;*]+[0-9]+"placeholder="Enter password" required>

        <center><input type="submit" value="Add New Student"></center>
    </form>
</div>
</main>
</body>
</html>
