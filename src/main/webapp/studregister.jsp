<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>
 <link rel="stylesheet" href="ccs/style.css">
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
	<main> 
 <div class="container">
       
        <center><h1>Add New Student</h1></center>
        <form action="StudRegisterServlet" method="post">
        
            <label for="name">Student Name</label>
            <input type="text" id="name" name="name" pattern="[A-Za-z ]+" placeholder="Enter name" required>
            
            <label for="name">Student USN</label>
            <input type="text" id="usn" name="usn" pattern="[0-9A-Z]+" placeholder="Enter USN" required>
            
            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]+" placeholder="Enter phone number" required>
            
            
            <label for="password">Password([A-za-z/0-9/!@#$%^&*])</label>
            <input type="password" id="password" name="password"  pattern="[A-Z]+[a-z]+[!@#$%^&*]+[0-9]+"placeholder="Enter password" required>
            
            <center><input type="submit" value="Add New Student"></center>
        </form>
     <center> <p class>Already have an account? <a href="studlogin.jsp">Login here</a></p> </center>
    </div>
    </main>
    <footer>
		<p>&copy; 2023 Tech Mahindra University. All rights reserved.</p>
	</footer>
</body>
</html>