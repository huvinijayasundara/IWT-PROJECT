<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .dashboard-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .dashboard-button:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <p>You have successfully logged in.</p>
    <form action="getUserEventsServlet " method="get">
        <button type="submit" class="dashboard-button">Go to User Dashboard</button>
    </form>
        <form action="customizeEvent.jsp" method="get">
        <button type="submit" class="dashboard-button">Custom Event</button>
    </form>
    <p><a href="logoutServlet">Logout</a></p>
</body>
</html>