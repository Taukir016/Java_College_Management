<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	.header {
        background-color: #333;
        color: #fff;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

	.logo {
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
		display: flex;
		align-items: center;
	}

	nav li {
		margin-right: 20px;
	}

	nav a {
		color: white;
		text-decoration: none;
		font-size: 18px;
	}

	main {
		margin-top: 50px;
	}

	form {
		max-width: 500px;
		margin: auto;
		padding: 20px;
		border: 1px solid #ddd;
		border-radius: 5px;
	}

	form h2 {
		text-align: center;
		margin-bottom: 20px;
	}

	form label {
		display: block;
		margin-bottom: 5px;
	}

	form input[type="text"] {
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		border-radius: 5px;
		border: 1px solid #ddd;
	}

	form input[type="submit"] {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
        display: block;
        margin: auto;
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
        transition-duration: 0.4s;
        text-align: center;
    }
    label{
    text-align:center
    }

	form input[type="submit"]:hover {
        background-color: #45a049;
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
<form action="ComplaintDelete">
<div class="container">
<h2>Delete the complaint</h2>
<label for="userid">Enter the ID you need to delete<br> </label>
<input type="text" id="compid" name="compid"><br>
<input type="submit" value="Submit"> 
</div>
</form>
</main>

</body>
</html>
