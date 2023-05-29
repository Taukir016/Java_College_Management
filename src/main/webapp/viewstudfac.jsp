<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Students</title>
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
    display: flex;
  }

  .nav-items a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
  }

  /* Style the main content with a centered text alignment and margin */
  main {
    max-width: 800px;
    margin: auto;
    text-align: center;
    margin-top: 50px;
  }

  /* Style the table with a centered text alignment, margin, and border */
  table {
    margin-top: 20px;
    margin-bottom: 20px;
    border-collapse: collapse;
    width: 100%;
  }

  table th, table td {
    padding: 10px;
    border: 1px solid black;
  }

  table th {
    background-color: #333;
    color: white;
  }

  /* Style the form with a centered text alignment and margin */
  .crud {
    margin-top: 20px;
    text-align: center;
  }

  .crud input[type=submit] {
    padding: 10px;
    border-radius: 5px;
    border: none;
    margin-top: 10px;
    background-color: #333;
    color: white;
    cursor: pointer;
  }

  /* Style the footer with a centered text alignment and margin */
  .footer {
    text-align: center;
    margin-top: 50px;
    padding: 20px;
    background-color: #333;
    color: white;
  }
</style>
<link rel="stylesheet" href="ccs/style.css">
</head>
<body>
	<header class="header">
		<a href="index.jsp" class="logo">College Management System</a>
		<nav class="nav-items">
			<a href="aboutus.jsp">About us</a> <a href="contactus.jsp">Contact
				Us</a>
		</nav>
	</header>
	<main>

	<table>
		<tr>
			<th>Name</th>
			<th>USN</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>


		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from student" );
			
			while (rs.next()) {
				{
		%>

		<tr style="text-align: center;">
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("usn")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getLong("phone")%></td>
		</tr>

		<%
		 
				}
				}

		 } 
		catch (Exception e) {

		  System.out.println("There is an Error::..........");
		 }
		  %>
	</table>
	<div class="crud">
	
	<form  action="CrudOperationServletStudent" method="post">
	<input type="submit" value="Insert" name="action"/>
	<input type="submit" value="Update" name="action"/>
	<input type="submit" value="Delete" name="action"/>
	</form>
	
	</div> </main> <% String message = (String) request.getAttribute("success"); if (message != null) { %> <script> alert("<%= message %>"); </script> <% } %>
	<footer class="footer">
	<div class="copy">&copy; 2023 College Management System. All
		rights reserved.</div>
</footer>
	</body> </html>
