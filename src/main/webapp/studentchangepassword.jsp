<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change student password</title>
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

	h1 {
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

	input[type="oldpassword"],
	input[type="newpassword"] {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
        box-sizing: border-box;
        font-size: 16px;
    }

	input[type="submit"] {
		background-color: #333;
		color: #fff;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}

	input[type="submit"]:hover {
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
		<li><a href="contactus.jsp">CONTACT US</a></li>
	</ul>
</nav>
</header>
<main>
	
    <div class="container">

        <h1>Change Password</h1>

        <form action="StudentChangePassword" method="post">
            <label for="oldpassword">Enter USN</label>
            <input type="oldpassword" id="id" name="usn" placeholder="Enter Student USN" required><br><br>
            <label for="newpassword">New password</label>
            <input type="newpassword" id="newpassword" name="newpassword" placeholder="Enter new password" required><br><br>

            <center><br><input type="submit" value="submit"></center>
        </form>  
    </div>
</main>
<%
    String message = (String) request.getAttribute("success");
    if (message != null) {
%>
<script>
        alert("<%= message %>");
</script>
<%
    }
%> 
<footer>
	<p>&copy; 2023 Tech Mahindra University. All rights reserved.</p>
</footer>
</body>
</html>
