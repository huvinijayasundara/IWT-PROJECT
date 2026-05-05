<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    
    body {
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }
    
    .form-container {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border: 2px solid #ffd700;
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    
    .form-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-group label {
        display: block;
        text-align: left;
        margin: 10px 0 5px;
        color: #333;
        font-weight: bold;
    }
    
    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="tel"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    .form-group input[type="submit"],
    .form-group button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .form-group input[type="submit"] {
        background-color: #ffd700;
        color: black;
    }
    
    .form-group input[type="submit"]:hover {
        background-color: #e6c200;
    }
    
    .form-group button {
        background-color: #ffd700;
        color: black;
    }
    
    .form-group button:hover {
        background-color: #e6c200;
    }
    
    .form-group .delete-btn {
        background-color: #ff0000;
        color: white;
    }
    
    .form-group .delete-btn:hover {
        background-color: #cc0000;
    }
    
    .form-group input[readonly] {
        background-color: #f0f0f0;
    }
</style>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
    %>
    
    <div class="form-container">
        <h2>User Information Form</h2>
        <form action="updateProfileServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%=username%>" readonly>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%=name%>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%=email%>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="<%=phone%>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%=address%>" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>
        
        <form action="changePassword.jsp" method="post">
            <div class="form-group">
                <input type="hidden" name="password" />
                <button>Change Password</button>
            </div>
        </form>
        
        <form action="deleteUserServlet" method="post">
            <div class="form-group">
                <input type="hidden" name="username" value="<%=username%>" />
                <button class="delete-btn">Delete Account</button>
            </div>
        </form>
    </div>
</body>
</html>