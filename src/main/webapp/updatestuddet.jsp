<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }
    
    header {
        background-color: #333;
        color: white;
        padding: 10px;
    }
    
    header a.logo {
        font-size: 24px;
        font-weight: bold;
        text-decoration: none;
        color: white;
    }
    
    header nav {
        float: right;
    }
    
    header nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    
    header nav li {
        float: left;
    }
    
    header nav li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }
    
    header nav li a:hover {
        background-color: #111;
    }
    
    main {
        margin-top: 20px;
    }
    
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
        width: 50%;
        margin: auto;
    }
    
    .container h1 {
        text-align: center;
        margin-bottom: 20px;
    }
    
    form label {
        display: block;
        margin-bottom: 5px;
    }
    
    form input[type="text"], form input[type="email"], form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: none;
        box-shadow: 0 0 5px rgba(0,0,0,0.3);
    }
    
    form input[type="submit"] {
        background-color: #333;
        color: white;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
        border: none;
    }
    
    form input[type="submit"]:hover {
        background-color: #111;
    }
    
    footer {
        background-color: #333;
        color: white;
        padding: 10px;
        margin-top: 20px;
        text-align: center;
    }
</style>
</head>
<body>
<header>
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
       
        <h1>Update Student</h1>
        <form action="UpdateStudDetServlet" method="post">
        
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
            
            <center><input type="submit" value="Update Student Details"></center>
        </form>
    </div>
    </main>
    <footer>
		<p>&copy; 2023 Tech Mahindra University. All rights reserved.</p>
	</footer>
	</body>
	</html>
