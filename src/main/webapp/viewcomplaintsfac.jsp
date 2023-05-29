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
<title>View Complaints</title>

<style>
	.header {
		background-color: #333;
		color: #fff;
		padding: 10px;
		display: flex;
		align-items: center;
	}

	.logo {
		font-size: 25px;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}

	nav.nav-items {
		margin-left: auto;
	}

	nav.nav-items a {
		display: inline-block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}

	main {
		margin-top: 50px;
	
	}

	th, td {
		padding: 10px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	form {
		margin-top: 50px;
	}

	input[type="submit"] {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin-right: 10px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	input[type="submit"]:hover {
		background-color: #45a049;
	}


	.footer {
		background-color: #333;
		color: #fff;
		padding: 10px;
		text-align: center;
		margin-top:150px;
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
<table style="width: 100%" border="60">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Complaint On</th>
		<th>Complaint Details</th>
	</tr>

<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");

	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("Select * from complaints" );

	while (rs.next()) {
%>

<tr style="text-align: center;">
	<td><%=rs.getString("id")%></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("complaintOn")%></td>
	<td><%=rs.getString("complaintDetails")%></td>
</tr>

<%
	 
}
}catch (Exception e) {
	System.out.println("There is an Error::..........");
}
 %>
</table>
</main>

<center>	
<form action="CrudOpComplaintServlet" method="post">
<input type="submit" value="Add" name="action"/>
<input type="submit" value="Delete" name="action"/>
</form>
</center>

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

<footer class="footer">
<div class="copy">&copy; 2023 College Management System. All rights reserved.</div>
</footer>

</body>
</html>
