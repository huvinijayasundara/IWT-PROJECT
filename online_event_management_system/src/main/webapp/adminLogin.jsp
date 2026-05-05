<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: #fff;
            width: 400px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-top: 3px solid #FFD700;
        }

        h2 {
            color: #000;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            color: #333;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #FFD700;
        }

        .error {
            color: #ff3b30;
            font-size: 12px;
            display: none;
            margin-top: 5px;
        }

        button {
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 20px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        button:hover {
            background-color:#E6A519;
        }

        .header {
            background-color: #000;
            color: #fff;
            padding: 15px 0;
            border-bottom: 3px solid #FFD700;
            text-align: center;
            border-radius: 10px 10px 0 0;
            margin: -40px -40px 30px -40px;
        }

        .logo {
            font-size: 20px;
            font-weight: bold;
            color: #FFD700;
        }
    </style>
</head>
<body>
    <div class="form-container">
        
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="role">Role</label>
                <select name="role" id="role">
                    <option value="admin">Admin</option>
                    <option value="supplier">Supplier</option>
                    <option value="eventPlanner">Event Planner</option>
                </select>
            </div>
            <div class="form-group">
                <label for="uid">User Name</label>
                <input type="text" name="uid" id="uid" required>
            </div>
            <div class="form-group">
                <label for="pwd">Password</label>
                <input type="password" name="pwd" id="pwd" required>
            </div>
            <button type="submit" name="submit">Login</button>
        </form>
    </div>
</body>
</html>