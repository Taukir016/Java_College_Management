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
	<header class="header" style="background-color: #333; color: white; padding: 10px;">
		<a href="index.jsp" class="logo" style="font-size: 24px; font-weight: bold; text-decoration: none; color: white;">College Management System</a>
		<nav class="nav-items" style="float: right;">
			<a href="aboutus.jsp" style="color: white; text-decoration: none; margin-left: 20px;">About us</a> 
			<a href="contactus.jsp" style="color: white; text-decoration: none; margin-left: 20px;">Contact Us</a>
		</nav>
	</header>
	<main>

	<table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
		<tr style="background-color: #333; color: white;">
			<th style="padding: 10px; border: 1px solid black;">Name</th>
			<th style="padding: 10px; border: 1px solid black;">USN</th>
			<th style="padding: 10px; border: 1px solid black;">Email</th>
			<th style="padding: 10px; border: 1px solid black;">Phone</th>
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
			<td style="padding: 10px; border: 1px solid black;"><%=rs.getString("name")%></td>
			<td style="padding: 10px; border: 1px solid black;"><%=rs.getString("usn")%></td>
			<td style="padding: 10px; border: 1px solid black;"><%=rs.getString("email")%></td>
			<td style="padding: 10px; border: 1px solid black;"><%=rs.getLong("phone")%></td>
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
	</main>
	<div style="margin-top: 20px;">
	
<form action="UpdateStudServlet" method="post">
      <label for="usn" style="font-weight: bold;">Enter USN to update:</label>
      <input type="text" id="usn" name="usn" style="margin-left: 20px; padding: 5px;"><br><br>
      <input type="submit" value="Submit" style="background-color: #333; color: white; padding: 10px; border-radius: 5px; cursor: pointer;">
    </form>
	</div>
	

	<footer class="footer" style="background-color: #333; color: white; padding: 10px; margin-top: 200px;">
		<div class="copy">&copy; 2023 College Management System. All
			rights reserved.</div>
	</footer>

</body>
</html>
