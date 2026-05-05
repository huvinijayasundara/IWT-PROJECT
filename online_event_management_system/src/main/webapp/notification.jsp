<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notification - Pending Orders</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f5f5;
        padding: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #302b63;
        color: white;
    }

    .btn {
        background-color: #28a745;
        color: white;
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #218838;
    }

    h2 {
        margin-bottom: 20px;
    }
</style>
</head>
<body>

<h2>Pending Services</h2>

<c:if test="${empty pendingOrders}">
    <p>No pending orders found.</p>
</c:if>

<c:if test="${not empty pendingOrders}">
    <table>
        <thead>
            <tr>
                <th>Item Title</th>
                <th>User Name</th>
                <th>NIC</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${pendingOrders}">
                <tr>
                    <td>${order.itemTitle}</td>
                    <td>${order.userName}</td>
                    <td>${order.email}</td>
                    <td>${order.phone}</td>
                    <td>
                        <form action="UpdateStatusServlet" method="post">
                            <input type="hidden" name="addserviceId" value="${order.addserviceId}" />
                            <button type="submit" class="btn">Mark as Success</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>