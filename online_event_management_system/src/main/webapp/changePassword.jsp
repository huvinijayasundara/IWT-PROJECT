<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Change Password</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', 'Arial', sans-serif;
    }
    
    body {
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 15px;
    }
    
    .change-password-form {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        border: 2px solid #ffd700;
        width: 350px;
        text-align: center;
    }
    
    .change-password-form h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        font-weight: 500;
    }
    
    .change-password-form input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 14px;
        background-color: #fafafa;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    
    .change-password-form input[type="password"]:focus {
        border-color: #ffd700;
        box-shadow: 0 0 8px rgba(255, 215, 0, 0.2);
        outline: none;
    }
    
    .change-password-form input[type="submit"] {
        width: 100%;
        padding: 12px 30px;
        margin: 20px 0 0;
        border: none;
        border-radius: 6px;
        background-color: #ffd700;
        color: black;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        font-size: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    .change-password-form input[type="submit"]:hover {
        background-color: #e6c200;
        transform: translateY(-2px);
    }
    
    .error-message {
        color: #ff0000;
        font-size: 14px;
        text-align: center;
        margin-top: 10px;
        min-height: 18px;
    }
  </style>
</head>
<body>
  <form class="change-password-form" onsubmit="return validatePasswords()" action="changePasswordServlet" method="POST">
    <h2>Change Password</h2>
    <input type="password" name="current_password" placeholder="Current Password" required>
    <input type="password" id="new_password" name="new_password" placeholder="New Password" required>
    <input type="password" id="confirm_password" name="confirm_password" placeholder="Re-enter New Password" required>
    <div id="error" class="error-message"></div>
    <input type="submit" value="Change Password">
  </form>

  <script>
    function validatePasswords() {
      var newPassword = document.getElementById("new_password").value;
      var confirmPassword = document.getElementById("confirm_password").value;
      var errorDiv = document.getElementById("error");

      if (newPassword !== confirmPassword) {
        errorDiv.textContent = "New passwords do not match!";
        return false;
      }

      errorDiv.textContent = "";
      return true;
    }
  </script>
</body>
</html>