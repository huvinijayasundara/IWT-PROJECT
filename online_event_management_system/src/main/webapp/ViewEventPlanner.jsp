<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Event Planner</title>
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
        <h2 class="text-2xl font-bold text-center mb-6">View Event Planner Details</h2>

        <div class="space-y-4 text-gray-700">
            <p><strong>ID:</strong> ${planner.id}</p>
            <p><strong>Name:</strong> ${planner.name}</p>
            <p><strong>Email:</strong> ${planner.email}</p>
            <p><strong>Phone Number:</strong> ${planner.phone_no}</p>
            <p><strong>Password:</strong> ${planner.password}</p>
        </div>

        <div class="mt-6 text-center flex justify-center gap-4 flex-wrap">
            <a href="ManageEventPlanner.jsp" 
               class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Back to List
            </a>

            <a href="AdminServlet?action=edit&id=${planner.id}" 
               class="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">
                 Edit
            </a>

            <a href="AdminServlet?action=delete&id=${planner.id}" 
               class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
               onclick="return confirm('Are you sure you want to delete this record?');">
                 Delete
            </a>
        </div>
    </div>

</body>
</html>
