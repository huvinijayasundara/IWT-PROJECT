<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
    <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="./css/login.css" rel="stylesheet">
</head>
<body>
         <div class="form-container">
        <h2>Welcome Back</h2>
        <form id="loginForm" action="loginServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                <span class="error" id="usernameError">Please enter your username.</span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                <span class="error" id="passwordError">Please enter your password.</span>
            </div>
            <button type="submit">Login</button>
        </form>
        <p class="signup-text">New user? Create an account below.</p>
        <button onclick="window.location.href='register.jsp'" class="signup-button">Sign Up</button>
        
        <button onclick="window.location.href='adminLogin.jsp'" class="signup-button">Admin Login</button>
        
    </div>
    
</body>
</html>