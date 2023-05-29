<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Management System</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-image: url("https://cdn.pixabay.com/photo/2012/03/04/00/55/academic-22143_960_720.jpg");
        background-repeat: no-repeat;
        background-size: cover;
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
        color:red;
      }

      .nav-items {
        display: flex;
      }

      .nav-items a {
        color: #fff;
        margin-left: 20px;
        text-decoration: none;
        font-size: 18px;
      }

      main {
        padding: 20px;
      }

      .intro {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: calc(100vh - 80px);
      }

      h3 {
        font-size: 36px;
        margin-bottom: 290px;
      }

      button {
        border: none;
        background-color: Blue;
        color: #fff;
        padding: 10px 30px;
        border-radius: 5px;
        margin-bottom: 20px;
        cursor: pointer;
      }

      button a {
        color: #fff;
        text-decoration: none;
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
      <div class="intro">
        <h3>Welcome to your CMS.</h3>
        <button><a href="studlogin.jsp">Student Login</a></button>
        <button><a href="faclogin.jsp">Faculty Login</a></button>
      </div>
    </main>
  </body>
</html>
