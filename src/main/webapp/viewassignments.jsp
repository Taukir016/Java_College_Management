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
</head>
<body>
	<header class="header">
		<a href="index.jsp" class="logo">College Management System</a>
		<nav class="nav-items">
			<a href="aboutus.jsp">About us</a> <a href="contactus.jsp">Contact
				Us</a>
		</nav>
	</header>

	<table style="width: 100%" border="60">
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Description</th>
			<th>File</th>
		</tr>


		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from facassignments" );
			
			while (rs.next()) {
				{
		%>

		<tr style="text-align: center;">
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("title")%></td>
			<td><%=rs.getString("description")%></td>
			<td><%=rs.getString("file")%></td>
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

	<footer class="footer">
		<div class="copy">&copy; 2023 Tech Mahindra University. All
			rights reserved.</div>
	</footer>

</body>
</html>