<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String name = (String) session.getAttribute("name");
    String picture = (String) session.getAttribute("fileName");
%>

<c:if test="${empty planners}">
    <c:redirect url="AdminServlet" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Event Planners</title>
        <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 font-sans">

<div class="flex h-screen">

    <!-- Main Content -->
    <div class="flex-1 flex flex-col">
        <!-- Top Bar -->
        <header class="bg-white shadow-md p-4 flex justify-between items-center">
            <h2 class="text-lg font-semibold">Manage Event Planners</h2>
            <div class="flex items-center space-x-4">
                <img src="img/picture/<%= picture != null ? picture : "Andrew.png" %>" alt="Admin Profile" class="w-10 h-10 rounded-full">
                 <span class="text-gray-600"><%= name != null ? name : "Andrew" %></span>
                <button class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
                        onclick="window.location.href='logoutServlet';">
                    Logout
                </button>
            </div>
        </header>

        <!-- Table Section -->
        <main class="p-6">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold">Event Planners List</h3>
                <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
                        onclick="window.location.href='AddEventPlanner.jsp';">
                    <i class="fas fa-plus"></i> Add New
                </button>
            </div>

            <div class="overflow-x-auto bg-white shadow-md rounded-lg p-4">
                <table class="w-full border-collapse border border-gray-200 text-center">
                    <thead class="bg-gray-100 text-gray-700">
                        <tr>
                            <th class="border p-3">ID</th>
                            <th class="border p-3">Name</th>
                            <th class="border p-3">Email</th>
                            <th class="border p-3">Phone No</th>
                            <th class="border p-3">Password</th>
                            <th class="border p-3">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="planner" items="${planners}">
                            <tr class="text-gray-600">
                                <td class="border p-3">${planner.id}</td>
                                <td class="border p-3">${planner.name}</td>
                                <td class="border p-3">${planner.email}</td>
                                <td class="border p-3">${planner.phone_no}</td>
                                <td class="border p-3">${planner.password}</td>
                                <td class="border p-3 space-x-1">
                                    <a href="AdminServlet?action=view&id=${planner.id}" class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                    <a href="AdminServlet?action=edit&id=${planner.id}" class="bg-yellow-500 text-white px-3 py-1 rounded hover:bg-yellow-600">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="AdminServlet?action=delete&id=${planner.id}" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                                       onclick="return confirm('Are you sure you want to delete this record?');">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

</body>
</html>
