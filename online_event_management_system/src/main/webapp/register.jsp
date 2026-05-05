<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap" rel="stylesheet">
<link href="./css/register.css" rel="stylesheet">
</head>
<body>
   <div class="form-container">
        <h2>Join Our Event Community</h2>
        <form id="registrationForm" action="registerServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="tel" id="phoneNumber" name="phone" pattern="[0-9]{10}" placeholder="07X XXXXXXX">
                <span class="error" id="phoneError">Please enter a valid 10-digit phone number.</span>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required minlength="3">
                <span class="error" id="passwordError">Password must be at least 8 characters long.</span>
            </div>
            <div class="form-group">
                <label for="rePassword">Re-enter Password</label>
                <input type="password" id="rePassword" name="rePassword" required>
                <span class="error" id="rePasswordError">Passwords do not match.</span>
            </div>
            <button type="submit">Register</button>
        </form>
    </div>
    
    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const rePassword = document.getElementById("rePassword").value;
            const phone = document.getElementById("phoneNumber").value;
            const passwordError = document.getElementById("passwordError");
            const rePasswordError = document.getElementById("rePasswordError");
            const phoneError = document.getElementById("phoneError");

            // Reset error messages
            passwordError.style.display = "none";
            rePasswordError.style.display = "none";
            phoneError.style.display = "none";

            // Password length validation
            if (password.length < 8) {
                passwordError.style.display = "block";
                return false;
            }

            // Password match validation
            if (password !== rePassword) {
                rePasswordError.style.display = "block";
                return false;
            }

            // Phone number validation (10 digits)
            if (phone && !/^[0-9]{10}$/.test(phone)) {
                phoneError.style.display = "block";
                return false;
            }

            return true;
        }
    </script>
</body>
</html>