<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Create Assignment</title>
    <style>
        .header {
        background-color: #333;
        color: #fff;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }


        .logo {
            font-size: 25px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        nav li {
            margin-right: 20px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        main {
            margin-top: 50px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        form input[type="file"] {
            margin-bottom: 10px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: auto;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            transition-duration: 0.4s;
            text-align: center;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .copy {
            font-size: 14px;
        }
    </style>
</head>
<body>
<header class="header">
    
    <nav>
        <ul>
            <li><a href="index.jsp">HOME</a></li>
            <li><a href="contactus.jsp">CONTACT US</a></li>
        </ul>
    </nav>
</header>

<main>
    <div class="container">
        <h1>Add Assignments</h1>
        <form method="post" action="AssignmentInsert" enctype="multipart/form-data">
            <label for="id">Id:</label>
            <input type="text" id="id" name="id" required><br><br>
            
            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required><br>
            
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br>
            
            <label for="file">File:</label>
            <input type="file" id="file" name="file" accept=".pdf,.doc,.docx,.jpg" required><br>
            
            <input type="submit" class="btn" value="Upload Assignment">
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

<footer class="footer">
    <div class="copy">&copy; 2023 College Management System. All rights reserved.</div>
</footer>

</body>
