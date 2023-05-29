<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Main</title>
<style>
	body {
		margin: 0;
		padding: 0;
		font-family: Arial, sans-serif;
		background-color: #f2f2f2;
		background-image: url("https://cdn.pixabay.com/photo/2013/01/20/04/53/college-75535_1280.jpg");
        background-repeat: no-repeat;
        background-size: cover;
	}

	header {
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
	}

	nav .nav-items {
		list-style: none;
		display: flex;
	}

	nav .nav-items a {
		color: #fff;
		margin-left: 20px;
		text-decoration: none;
		font-size: 18px;
	}

	main {
		padding: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
		height: calc(100vh - 180px);
	}

	h2 {
		font-size: 36px;
		margin-bottom: 20px;
		text-align: center;
        color: #500;
	}

	a {
		color: #2ecc71;
		text-decoration: none;
	    font-size: 24px;
	    margin-bottom: 10px;
	    transition: all 0.3s ease-in-out;
	    border-bottom: 2px solid transparent;
	}

	a:hover {
	    border-bottom-color: #333;
	    color: #333;
	}

	.success-message {
		background-color: #2ecc71;
		color: #fff;
		padding: 10px;
		border-radius: 5px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		max-width: 500px;
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 20px;
	}

	.success-message p {
	    font-size: 24px;
	    margin: 0;
	    text-align: center;
	}

	.footer {
		background-color: #333;
		color: #fff;
		padding: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 18px;
	}

	.copy {
	    font-size: 18px;
	    margin-right: 10px;
	}
	button{
	margin:10px;
	border:2px solid black;
	border-radius:50px;
	background-color:yellow;
	
	}
</style>
</head>
<body>
<header>
	<a href="index.jsp" class="logo">Faculty Home Page</a>
	<nav>
	    <ul class="nav-items">
	        <li><a href="aboutus.jsp">About us</a></li>
	        <li><a href="contactus.jsp">Contact Us</a></li>
	        <!--<li><a href="index.jsp">Logout</a></li>-->
	    </ul>
	</nav>
</header>
<main enctype="multipart/form-data" method = "post">
	<h2>Welcome!...</h2>
	<button><a href = "viewfacfac.jsp"> View Faculty</a><br></button>
	<button><a href = "viewstudfac.jsp"> View Students</a><br></button>
	<button><a href = "complaints.jsp"> Complaints</a><br></button>
	<button><a href = "viewcomplaintsfac.jsp">View Complaints</a><br></button>
	<button><a href = "addassignment.jsp"> Add Assignments</a><br></button>
	<button><a href = "FacultyStudentAssignmentDisplay">Student Uploaded Assignments</a><br></button>
	<button><a href = "addnotes.jsp"> Add Notes</a><br></button>
	<button><a href = "enotesDisplay"> View/Delete Notes</a><br></button>
	
	<%
    String message = (String) request.getAttribute("success");
    if (message != null) {
%>
    <div class="success-message">
        <p><%= message %></p>
    </div>
<%
    }
%>
</main>
</body>
</html>