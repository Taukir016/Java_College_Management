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
<title>Update Faculty</title>
<style>
	header {
		background-color: #333;
		color: white;
		padding: 20px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.logo {
		font-size: 30px;
		font-weight: bold;
		text-decoration: none;
		color: white;
	}

	.nav-items {
		list-style-type: none;
		margin: 0;
		padding: 0;
		display: flex;
	}

	.nav-items a {
		color: white;
		text-decoration: none;
		margin-right: 20px;
	}

	table {
		width: 100%;
		border: 60px solid;
		border-collapse: collapse;
	}

	th, td {
		padding: 15px;
		text-align: center;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	form {
		display: flex;
		flex-direction: column;
	}

	label {
		margin-top: 10px;
	}

	input[type=text], input[type=email], input[type=password], input[type=number] {
		padding: 10px;
		border-radius: 5px;
		border: none;
		margin-top: 5px;
	}

	input[type=submit] {
		padding: 10px;
		border-radius: 5px;
		border: none;
		margin-top: 10px;
		background-color: #333;
		color: white;
	}

	footer {
		text-align:center;
	}
</style>
</head>
<body>

<header class="header">
	<a href="index.jsp" class="logo">College Management System</a>
	<nav class="nav-items">
		<a href="aboutus.jsp">About us</a> <a href="contactus.jsp">Contact Us</a>
	</nav>
</header>

<table>
	<tr>
		<th>Name</th>
		<th>Faculty ID</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Qualification</th>
	</tr>

<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");

	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("Select * from faculty" );

	while (rs.next()) {
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getLong("phone")%></td>
<td><%=rs.getString("qualification")%></td>
</tr>

<%
}
}
catch (Exception e) {
	System.out.println("There is an Error::..........");
}
%>

</table>

<div>
<form action="UpdateServletFaculty" method="post">
<label for="faculty-id">Enter Faculty ID to update:</label>
<input type="text" id="faculty-id" name="id">
<input type="submit" value="Submit">
</form>
</div>

<footer>
<div>&copy; 2023 College Management System. All rights reserved.</div>
</footer>

</body>
</html> 
