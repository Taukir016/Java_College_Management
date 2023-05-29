<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<html>
<head>
    <title>Upload Assignment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            margin: 0;
            padding: 0;
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

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="file"] {
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px;
            width: 100%;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            border-radius: 5px;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
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
            <h1>Upload Assignments</h1>
            <form method="post" action="StudentAssignmentInsert" enctype="multipart/form-data">
                <label for="id">Id:</label>
                <input type="text" id="id" name="id" required><br><br>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required><br>
                <label for="file">File:</label>
                <input type="file" id="file" name="file" accept=".pdf,.doc,.docx,.jpg" required><br>
                <input type="submit" value="Upload Assignment">
            </form>	
        </div>
    </main>
    <% String message = (String) request.getAttribute("success");
    if (message != null) {
    %>
    <script>
        alert("<%= message %>");
    </script>
    <% } %>
</body>
</html>
