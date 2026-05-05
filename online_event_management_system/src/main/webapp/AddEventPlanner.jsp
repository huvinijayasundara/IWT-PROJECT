<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String name = (String) session.getAttribute("name");
    String picture = (String) session.getAttribute("fileName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Event Planner</title>
    <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 font-sans">

    <!-- Wrapper -->
    <div class="flex h-screen">
        
        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            
            <!-- Top Bar -->
            <header class="bg-white shadow-md p-4 flex justify-between items-center">
                <h2 class="text-lg font-semibold">Manage Event Planers</h2>
                <div class="flex items-center space-x-4">
                    <img src="img/picture/<%= picture != null ? picture : "Andrew.png" %>" alt="Admin Profile" class="w-10 h-10 rounded-full">
                    <span class="text-gray-600"><%= name != null ? name : "Andrew" %></span>
                    <button class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
                            onclick="window.location.href='logoutServlet?action=logout';">
                        Logout
                    </button>
                </div>
            </header>

            <!-- Create Record Form -->
            <main class="flex-1 flex items-center justify-center p-6">
                <div class="bg-white shadow-md rounded-lg p-6 w-full max-w-md">
                    <h2 class="text-2xl font-semibold text-gray-700 text-center mb-6">Add New Event Planner</h2>

                    <form action="AdminServlet" method="POST" class="space-y-4">
                        <input type="hidden" name="action" value="create">

                        <!-- ID -->
                        <div>
                            <label for="id" class="block text-gray-600 font-medium">Event Planner ID:</label>
                            <input type="text" id="id" name="id" class="w-full border rounded px-3 py-2" required>
                        </div>

                        <!-- Name -->
                        <div>
                            <label for="name" class="block text-gray-600 font-medium">Name:</label>
                            <input type="text" id="name" name="name" class="w-full border rounded px-3 py-2" required>
                        </div>

                        <!-- Email -->
                        <div>
                            <label for="email" class="block text-gray-600 font-medium">Email:</label>
                            <input type="email" id="email" name="email" class="w-full border rounded px-3 py-2" required>
                        </div>

                        <!-- Phone Number -->
                        <div>
                            <label for="phone_no" class="block text-gray-600 font-medium">Phone Number:</label>
                            <input type="text" id="phone_no" name="phone_no" class="w-full border rounded px-3 py-2" required>
                        </div>

                        <!-- Password -->
                        <div>
                            <label for="password" class="block text-gray-600 font-medium">Password:</label>
                            <input type="password" id="password" name="password" class="w-full border rounded px-3 py-2" required>
                        </div>

                        <!-- Buttons -->
                        <div class="flex justify-between mt-4">
                            <a href="ManageEventPlanner.jsp" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500">Cancel</a>
                            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Submit</button>
                        </div>
                    </form>
                </div>
            </main>

        </div>
    </div>
</body>
</html>
