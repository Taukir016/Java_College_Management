
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8">
      <title>Add Notes</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* CSS for header */

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #0000ff;
	padding: 0px 0px;
}

.header .logo {
	font-size: 40px;
	font-weight: bold;
	font-style: italic;
	font-family: 'Sriracha', !important;
	color: #050;
	text-decoration: none;
	margin-left: 10px;
}



.nav-items a {
	text-decoration: blink;
	color: white;
	padding: 35px 20px;
}

/* CSS for main element */
.intro {
	margin: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 420px;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin: 0px 0px 0px 0px;
}

.intro h1 {
	font-family: sans-serif;
	font-size: 60px;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	margin: 0;
}

.intro h3 {
	font-family: sans-serif;
	font-size: 30px;
	color: black;
	font-weight: bold;
	text-transform: uppercase;
	margin: 0;
}

.intro button {
	background-color: white;
	color: #000;
	padding: 10px 25px;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.4)
}

header {
	background-color: #400;
	color: #ggg;
	display: flex;
	align-items: center;
	height: 50px;
	padding: 50px;
}

nav {
	margin-left: auto;
}

nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	align-items: center;
}

nav li {
	margin-left: 20px;
}

nav li:first-child {
	margin-left: 0;
}

nav a {
	color: #fff;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	transition: color 0.3s;
}

nav a:hover {
	color: #ddd;
}
/* Main content styles */
main {
	padding: 20px;
}

main p {
	font-size: 20px;
}
main button{
	margin-left: 10px;
}
.buttons{
	text-align: center;
}

.container {
	
	padding: 16px;
	margin: auto;
	max-width: 300px;
	margin-top: 25px;
	display: flex;
   flex-direction: column;
   align-items: flex-start;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgb(71, 240, 4);
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%,
		rgba(0, 0, 0, 0.5) 100%),
	
}
p {
	font-size: 25px;
}
.crud{
text-align: center;
}
form input, form textarea {
	display: inline-block; padding : 10px;
	border-radius: 5px;
	margin-bottom: 5px;
	margin-top: 25px; margin : 8px 0;
	font-size: 18px;
	padding: 10px; 
	border-radius : 5px; 
	margin-bottom : 5px;
	margin-top :25px;
	margin : 8px;
	font-size : 18px;
	width: 90%;
	margin: 8px 0;
}

form button {
	background-color: Grey;
	text-align:center;
	color : black;
	border: solid;
	padding: 10px 10px;
	border-radius: 10px;
	font-size: 18px;
	cursor: pointer;
	color: black;
	
}
/* CSS for footer */
footer {
	background-color : teal;
	color: black;
	padding: 0 10 0 10; 
	text-align: center;
	font-size: 25px;
	margin: 0 0 0 0;
}
</style>

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
      <div class="container">
                  <p>Add Notes</p>
            <form action="enotesInsert" method="post" enctype="multipart/form-data"> 
  						<label for="id">Id</label>
                        <input type="text" id="id" name="id" required>              
                        <label for="title">Title</label>
                        <input type="text" id="title" name="subject" required>
                        <label for="description">Description</label>
                        <textarea id="description" name="description" required></textarea>
                        <label for="file">File</label>
                        <input type="file" id="file" name="file" accept=".pdf,.doc,.docx,.jpg" required><br><br>
                  <button type="submit" class="btn">Add Notes</button>
            </form> 
</div> 
</main>       
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
</body>
</html>


