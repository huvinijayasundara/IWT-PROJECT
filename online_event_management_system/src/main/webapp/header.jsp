<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Magical Moments</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Playfair Display', serif;
    }

    .navbar {
    
      background-color: #000;
      color: white;
      padding: 0;
      height: 100px;
      position: fixed;
      top: 0;
      padding-top:0;
      width: 100%;
      z-index: 999;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .nav-section {
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      flex: 1;
    }

 /*     .nav-logo {
      display: flex;
      align-items: center;
      flex: 1;
      justify-content: center;
    } 
 */
    .nav-logo img {
      height: 115px; /* Increased logo size */
      width: 200px; /* Increased logo size */
      overflow:visible;
    }

    .nav-link, .login-btn {
      color: white;
      text-decoration: none;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .nav-link:hover, .login-btn:hover {
      color: #E6A519;
    }

    .login-btn {
      padding: 4px 16px;
      border: 1px solid #E6A519;
      border-radius: 2px;
    }

    .nav-login {
      flex: 1;
      display: flex;
      justify-content: space-evenly;
      align-items: center;
    }
  </style>
</head>
<body>

  <nav class="navbar">
    <div class="nav-section">
      <a href="eventhome.jsp" class="nav-link">Home</a>
      <a href="packagesPage.jsp" class="nav-link">Packages</a>
      <a href="addons.jsp" class="nav-link">Services</a>
    </div>

    <div class="nav-logo">
      <img src="images/log2.png" alt="Magical Moments Logo" />
    </div>

    <div class="nav-section nav-login">
      <a href="#testimonials" class="nav-link">Testimonials</a>
      <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
      <form action="" method="post">
      <a href="login.jsp" class="login-btn">Log In</a>
      </form>
    </div>
  </nav>

</body>
</html>