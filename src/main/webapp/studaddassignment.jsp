<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add assignments</title>
<link rel="stylesheet" href="ccs/style.css">
</head>
<body>
	<header class="header">
		<a href="index.jsp" class="logo">Tech Mahindra University</a>
		<nav class="nav-items">
			<a href="aboutus.jsp">About us</a> <a href="contactus.jsp">Contact
				Us</a>
		</nav>
	</header>

	<div class="container">
		<div>
			<h1>Add Assignments</h1>
		</div>
		<form  action="AddAssignmentServlet" method="post">
			<label for="title">Title:</label> <input type="text" id="title"
				name="title" required><br> <label for="description">Description:</label>
			<textarea id="description" name="description" required></textarea>
			<br> <label for="file">File:</label> <input type="file"
				id="file" name="file"><br>
			<br> <input type="submit" class="btn" value="Upload Assignment">
		</form>
		<div class="error-message">
			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
			<p>
				<%=errorMessage%>
			</p>
			<%
			}
			%>
		</div>
		<%
		String message = (String) request.getAttribute("success");
		if (message != null) {
		%>
		<script>
        alert("<%=message%>
			");
		</script>
		<%
		}
		%>
	</div>
	<footer class="footer">
		<div class="copy">&copy; 2023 Tech Mahindra University. All
			rights reserved.</div>
	</footer>
</body>

</body>
</html>