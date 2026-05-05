<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #e8e8e8;
            color: #333;
            padding: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }
        
        .dashboard-container {
            max-width: 1300px;
            width: 100%;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid #ffd700;
            padding: 15px;
        }
        
        .dashboard-header {
            background-color: transparent;
            color: black;
            padding: 15px 0;
            border-radius: 8px 8px 0 0;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .dashboard-header h2 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .dashboard-header p {
            color: #666;
        }
        
        .header-buttons {
            display: flex;
            gap: 10px;
        }
        
        .header-btn {
            background-color: #ffd700;
            color: black;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .header-btn:hover {
            background-color: #e6c200;
        }
        
        .logout-btn {
            background-color: #ff0000;
            color: white;
        }
        
        .logout-btn:hover {
            background-color: #cc0000;
        }
        
        .header-date {
            font-size: 20px;
            font-weight: 500;
            color: #333;
            text-align: center;
            flex: 1;
        }
        
        /* Top row with profile, stats, and suggestions cards */
        .top-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }
        
        .profile-card, .stats-card, .suggestions-card {
            flex: 1;
            min-width: 280px;
            background: #f5f5f5;
            border-radius: 8px;
            padding: 15px;
        }
        
        .profile-card h2, .stats-card h2, .suggestions-card h2, .events-card h2 {
            font-size: 18px;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        
        .profile-item {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .profile-item i {
            color: #ffd700;
        }
        
        .profile-item span {
            font-weight: bold;
            color: #333;
            display: inline-block;
            width: 80px;
        }
        
        .update-btn {
            background-color: #ffd700;
            color: black;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 10px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
        }
        
        .update-btn:hover {
            background-color: #e6c200;
        }
        
        /* Stats card for right side */
        .stats-card {
            text-align: center;
        }
        
        .stats-container {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-left: 4px solid #ffd700;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 150px;
        }
        
        .stats-number {
            font-size: 48px;
            font-weight: bold;
            color: #ffd700;
            margin-bottom: 10px;
        }
        
        .stats-label {
            font-size: 16px;
            color: #555;
        }
        
        /* Suggestions card */
        .suggestions-card {
            display: flex;
            flex-direction: column;
        }
        
        .suggestions-list {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        
        .suggestion-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .suggestion-item i {
            color: #ffd700;
        }
        
        .suggestion-item:last-child {
            border-bottom: none;
        }
        
        .suggestion-text {
            color: #333;
        }
        
        .no-suggestions {
            color: #666;
            font-style: italic;
        }
        
        .events-card {
            flex: 1;
            min-width: 100%;
            background: #f5f5f5;
            border-radius: 8px;
            padding: 15px;
        }
        
        .events-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .events-table th, .events-table td {
            text-align: left;
            padding: 10px 12px;
            border-bottom: 1px solid #eee;
        }
        
        .events-table th {
            background-color: #f8f9fa;
            color: #555;
            font-weight: 600;
        }
        
        .events-table th i {
            margin-right: 5px;
            color: #ffd700;
        }
        
        .events-table tr:hover {
            background-color: #f5f5f5;
        }
        
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        
        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.3s;
            font-weight: bold;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .update-event-btn {
            background-color: #ffd700;
            color: black;
        }
        
        .update-event-btn:hover {
            background-color: #e6c200;
        }
        
        .delete-btn {
            background-color: #ff0000;
            color: white;
            border: none;
        }
        
        .delete-btn:hover {
            background-color: #cc0000;
        }
        
        @media (max-width: 768px) {
            .top-cards {
                flex-direction: column;
            }
            
            .profile-card, .stats-card, .suggestions-card, .events-card {
                width: 100%;
                min-width: 100%;
            }
            
            .events-table {
                overflow-x: auto;
                display: block;
            }
            
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .header-date {
                width: 100%;
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="dashboard-header">
            <div>
                <h2>Hello, <%= session.getAttribute("username") %>!</h2>
                <p>Welcome back to dashboard</p>
            </div>
            <div class="header-date">
                <%
                    LocalDate today = LocalDate.now();
                    String day = today.getDayOfMonth() + (today.getDayOfMonth() % 10 == 1 && today.getDayOfMonth() != 11 ? "st" : 
                                  today.getDayOfMonth() % 10 == 2 && today.getDayOfMonth() != 12 ? "nd" : 
                                  today.getDayOfMonth() % 10 == 3 && today.getDayOfMonth() != 13 ? "rd" : "th");
                    String month = today.getMonth().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                    String year = String.valueOf(today.getYear());
                    String formattedDate = "Today is "+day + " of " + month + " " + year;
                %>
                <%= formattedDate %>
            </div>
            <div class="header-buttons">
                <a href="customizeEvent.jsp" class="header-btn"><i class="fas fa-plus"></i> Create Event</a>
                <a href="logoutServlet" class="header-btn logout-btn">
                   <i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
        
        <!-- Top Row with Profile, Stats, and Suggestions Cards -->
        <div class="top-cards">
            <!-- Profile Card -->
            <div class="profile-card">
                <h2>User Profile</h2>
                <div class="profile-item">
                    <i class="fas fa-user"></i>
                    <span>Username:</span>  ${user.username}
                </div>
                <div class="profile-item">
                    <i class="fas fa-id-card"></i>
                    <span>Name:</span> ${user.name}
                </div>
                <div class="profile-item">
                    <i class="fas fa-envelope"></i>
                    <span>Email:</span> ${user.email}
                </div>
                <div class="profile-item">
                    <i class="fas fa-phone"></i>
                    <span>Phone:</span> ${user.phone}
                </div>
                <div class="profile-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Address:</span> ${user.address}
                </div>
                
                <a href="updateProfile.jsp?username=${user.username}&name=${user.name}&email=${user.email}&phone=${user.phone}&address=${user.address}" class="update-btn">
                    <i class="fas fa-edit"></i> Update Profile
                </a>
            </div>
            
            <!-- Stats Card -->
            <div class="stats-card">
                <h2><i class="fas fa-calendar-check"></i> Upcoming Events</h2>
                <div class="stats-container">
                    <c:set var="eventCount" value="${allEvents.size()}" />
                    <div class="stats-number">${eventCount}</div>
                    <div class="stats-label">Total events scheduled</div>
                </div>
            </div>
            
            <!-- Suggestions Card -->
            <div class="suggestions-card">
                <h2><i class="fas fa-lightbulb"></i> Planner Suggestions</h2>
                <ul class="suggestions-list">
                    <c:choose>
                        <c:when test="${empty suggestions}">
                            <li class="suggestion-item no-suggestions"><i class="fas fa-info-circle"></i> No suggestions available</li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="suggestion" items="${suggestions}">
                                <li class="suggestion-item">
                                    <i class="fas fa-comment"></i>
                                    <span class="suggestion-text">${suggestion.suggestion}</span>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        
        <!-- Events Card - Bottom Row -->
        <div class="events-card">
            <h2><i class="fas fa-calendar-alt"></i> My Events</h2>
            <table class="events-table">
                <thead>
                    <tr>
                        <th><i class="fas fa-id-badge"></i> ID</th>
                        <th><i class="fas fa-calendar"></i> Date</th>
                        <th><i class="fas fa-tag"></i> Type</th>
                        <th><i class="fas fa-paint-brush"></i> Theme</th>
                        <th><i class="fas fa-map-pin"></i> Location</th>
                        <th><i class="fas fa-users"></i> Guests</th>
                        <th><i class="fas fa-cogs"></i> Services</th>
                        <th><i class="fas fa-tools"></i> Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ue" items="${allEvents}">
                        <tr>
                            <td>${ue.id}</td>
                            <td>${ue.date}</td>
                            <td>${ue.type}</td>
                            <td>${ue.theme}</td>
                            <td>${ue.location}</td>
                            <td>${ue.guests}</td>
                            <td>${ue.services}</td>
                            <td class="action-buttons">
                                <a href="updateEvent.jsp?id=${ue.id}&date=${ue.date}&type=${ue.type}&theme=${ue.theme}&location=${ue.location}&guests=${ue.guests}&services=${ue.services}">
                                    <button class="action-btn update-event-btn"><i class="fas fa-edit"></i> Update</button>
                                </a>
                                <form action="deleteEventServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${ue.id}">
                                    <button class="action-btn delete-btn"><i class="fas fa-trash"></i> Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>