<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Register</title>
<style>
	body {
		font-family: Arial, sans-serif;
		font-size: 16px;
		line-height: 0.5;
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
		font-size: 30px;
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
	
	.container {
		max-width: 400px;
		margin: 0 auto;
		padding: 20px;
		background-color: #f2f2f2;
		border-radius: 5px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.3);
	}
	
	h1 {
		font-size: 32px;
		margin-bottom: 30px;
		text-align: center;
	}
	
	form {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	label {
		display: block;
		margin-bottom: 10px;
		font-size: 20px;
		color: #333;
	}
	
	input[type="text"],
	input[type="email"],
	input[type="password"] {
		display: block;
		margin-bottom: 20px;
		padding: 10px;
		font-size: 16px;
		border-radius: 5px;
		border: none;
		box-shadow: 0 2px 5px rgba(0,0,0,0.3);
		width: 100%;
		box-sizing: border-box;
	}
	
	input[type="submit"] {
	    display: block;
	    margin-top: 20px;
	    font-size: 20px;
	    color: #fff;
	    background-color: #333;
	    border-radius: 5px;
	    padding: 10px 20px;
	    border: none;
	    box-shadow: 0 2px 5px rgba(0,0,0,0.3);
	    transition: all 0.3s ease-in-out;
	}
	
	input[type="submit"]:hover {
	    background-color: #f2f2f2;
	    box-shadow: 0 2px 10px rgba(0,0,0,0.5);
	    color: #333;
	    text-decoration: none;
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
				<li><a href="contactus.jsp">CONTACT US</a></li>
			</ul>
		</nav>
	</header>
<main> 
<div class="container">
       
        <h1>Add New Faculty</h1>
        <form action="FacultyAddServlet" method="post">
        
            <label for="name">Faculty Name</label>
            <input type="text" id="name" name="name" pattern="[A-Za-z ]+"  placeholder="Enter name" required>
            
            <label for="name">Faculty ID</label>
            <input type="text" id="facid" name="facid" pattern="[0-9A-Z]+"placeholder="Enter Faculty ID Number" required>
            
            
            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
            
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]+"placeholder="Enter phone number" required>
            
             <label for="name">Qualification</label>
            <input type="text" id="qualification" name="qualification" placeholder="Enter qualification" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password"  pattern="[A-za-z0-9!@#$%^&*]+" placeholder="Enter password" required>
          
            <input type="submit" value="Add New Faculty">
        </form>
    </div>
    </main>
    <footer>
		<p>&copy; 2023 College Management System. All rights reserved.</p>
	</footer>

</body>
</html>
