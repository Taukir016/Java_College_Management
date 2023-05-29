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
    table {
		border-collapse: collapse;
		width: 60%;
	}

	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}

	tr:hover {
		background-color: #f5f5f5;
		cursor: pointer;
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
	  table { 
	  	border-collapse: collapse; 
	  	margin-top: 60px; 
	  	margin-bottom: 50px; 
	  	margin-left:200px;
	  	width: 60%; 
	  	background-color:#f5f5f5; 
	  	text-align:center; 
	  	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	  }
	  
	  th { 
	  	background-color:#333; 
	  	color:white; 
	  	text-align:center; 
	  	padding-top:10px; 
	  	padding-bottom:10px; 
	  }
	  
	  td { 
	  	background-color:#fff; 
	  	padding-top:5px; 
	  	padding-bottom:5px; 
	  	text-align:center; 
	  	border-bottom: 1px solid #ddd; 
	  }
	  
	  tr:hover { 
	  	background-color:#f5f5f5; 
	  	cursor:pointer; 
	  }
	  
	  .header { 
	  	background-color:#333; 
	  	color:#fff; 
	  	padding:10px; 
	  	display:flex; 
	  	justify-content:space-between; 
	  	align-items:center;
	  }
	  
	  .logo { 
	  	font-size:24px; 
	  	font-weight:bold; 
	  	text-decoration:none; 
	  	color:#fff; 
	  }
	  
	  .nav-items { 
	  	list-style:none; 
	  	display:flex; 
	  	margin:0; 
	  	padding:0;
	  }
	  
	  .nav-items a { 
	  	color:#fff; 
	  	margin-left:20px; 
	  	text-decoration:none; 
	  }
	  
	  .footer { 
	  	background-color:#333; 
	  	color:#fff; 
	  	padding:10px; 
	  	display:flex; 
	  	align-items:center; 
	  	margin-top:300px;
	  	justify-content:center;
	  }
	  
	  .copy { 
	  	font-size:18px; 
	  	margin-right:10px;
	  }
	  
</style>
</head>
<body>
	<header class="header">
		<a href="index.jsp" class="logo">College Management System</a>
		<nav class="nav-items">
			<a href="aboutus.jsp">About us</a> <a href="contactus.jsp">Contact
				Us</a>
		</nav>
	</header>

	<table>
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
				{
		%>

		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("complaintOn")%></td>
			<td><%=rs.getString("complaintDetails")%></td>
		</tr>

		<%
		 
			}
		}

	}catch (Exception e) {
		System.out.println("There is an Error::..........");
		}
		 %>
	</table>
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
