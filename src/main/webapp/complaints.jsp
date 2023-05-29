<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complaints</title>
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

    .nav-items {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    .nav-items a {
        color: #fff;
        margin-left: 20px;
        text-decoration: none;
    }

    main {
        padding: 20px;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
    }

    h1 {
        font-size: 36px;
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 10px;
    }

    input[type="text"], select, textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
    }

    input[type="submit"] {
        background-color: #333;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #666;
    }

    .footer {
        background-color: #333;
        color: #fff;
        padding: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .copy {
        font-size: 18px;
        margin-right: 10px;
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
  <main> 
<div class="container">
	<center><h1>Complaints</h1></center>
	<form action="ComplaintServlet" method="post">
		<b><label for="id">ID:</label></b>
		<input type="text" id="id" name="id" required><br><br>
		<b><label for="complainant">Name:</label></b>
		<input type="text" id="name" name="name" required><br><br>
		<b><label for="complaintOn">Complaint On:</label></b>
		<select id="complaintOn" name="complaintOn">
		<option value="Faculty">Faculty</option>
		<option value="Student">Student</option>
		</select><br><br>	
		<b><label for="complaintDetails">Complaint Details:</label></b>
		<textarea id="complaintDetails" name="complaintDetails" rows="5" cols="50" required></textarea><br><br>		
		<center><input type="submit" value="Submit"></center>
	</form>
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
	</div>
	</main>
<footer class="footer">
  <div class="copy">&copy; 2023 College Management System. All rights reserved.</div>
  </footer>
</body>
</html>
