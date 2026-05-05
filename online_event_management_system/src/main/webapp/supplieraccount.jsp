<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Supplier Dash-board</title>
    <link href="https://cdn-icons-png.flaticon.com/512/3470/3470522.png" rel="icon">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            background-color: #fff;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 22px;
            color: #6a11cb;
        }

        .header img {
            height: 40px;
        }

        .content {
            display: flex;
            flex-grow: 1;
        }

        .sidebar {
            width: 320px;
            background-color: #ffffffee;
            padding: 30px;
            box-shadow: 4px 0 12px rgba(0, 0, 0, 0.1);
        }
			        .btn {
			    display: inline-block;
			    background-color: #E6A519;
			    color: #ffffff;
			    padding: 12px 30px;
			    text-decoration: none;
			    border: none;
			    border-radius: 2px;
			    font-family: 'Montserrat', sans-serif;
			    font-size: 14px;
			    letter-spacing: 1px;
			    text-transform: uppercase;
			    transition: all 0.3s ease;
			    font-weight: 600;
			}
			
			.btn:hover {
			    background-color: #000000;
			    color: #ffffff;
			    transform: translateY(-3px);
			    box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
			}

        .profile-icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            display: block;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            font-weight: bold;
            color: #444;
            margin-bottom: 6px;
        }

        .field .value {
            background-color: #f3f4f6;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            color: #333;
        }

        .main-content {
            flex-grow: 1;
            padding: 40px;
            color: white;
            display: flex;
            flex-direction: column;
            height: 100%;
            overflow-y: auto;
        }

        .main-content h2 {
            margin-top: 0;
        }

        .cards-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            margin-top: 30px;
            margin-bottom: 40px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 36px 24px;
            color: #333;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 80px;
            height: 80px;
            margin-bottom: 24px;
        }

        .card h3 {
            margin: 0 0 16px 0;
            color: #6a11cb;
            font-size: 22px;
        }

        .card p {
            margin: 0;
            font-size: 16px;
            color: #666;
            line-height: 1.5;
            max-width: 240px;
        }

        .card-wrapper {
            position: relative;
        }

        .notification-badge {
            background-color: #ff4757;
            color: white;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
            position: absolute;
            top: -10px;
            right: -10px;
        }

        .recent-activity {
            background-color: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            padding: 24px;
            backdrop-filter: blur(10px);
            margin-top: auto;
        }

        .recent-activity h3 {
            color: white;
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            padding-bottom: 10px;
        }

        .activity-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .activity-item {
            display: flex;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 16px;
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        .activity-item:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
        }

        .activity-icon img {
            width: 24px;
            height: 24px;
            opacity: 0.9;
        }

        .activity-content {
            flex-grow: 1;
        }

        .activity-title {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 4px;
        }

        .activity-details {
            font-size: 14px;
            opacity: 0.8;
            margin-bottom: 6px;
        }

        .activity-time {
            font-size: 12px;
            opacity: 0.6;
        }

        .activity-status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .pending { background-color: rgba(255, 193, 7, 0.2); color: #ffc107; }
        .completed { background-color: rgba(76, 175, 80, 0.2); color: #4caf50; }
        .info { background-color: rgba(33, 150, 243, 0.2); color: #2196f3; }

        .footer {
            background-color: #ffffffdd;
            padding: 15px 30px;
            text-align: center;
            font-size: 14px;
            color: #444;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Magical Moments</h1>
    <img src="https://cdn-icons-png.flaticon.com/512/3470/3470522.png" alt="Logo">
</div>

<div class="content">
    <c:forEach var="sup" items="${supDetails}">
        <div class="sidebar">
            <img class="profile-icon" src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Supplier Profile">

            <div class="field"><label>Supplier ID</label><div class="value">${sup.supId}</div></div>
            <div class="field"><label>Name</label><div class="value">${sup.name}</div></div>
            <div class="field"><label>Address</label><div class="value">${sup.address}</div></div>
            <div class="field"><label>Phone</label><div class="value">${sup.phone}</div></div>
            <div class="field"><label>Email</label><div class="value">${sup.email}</div></div>
            <div class="field"><label>Username</label><div class="value">${sup.userName}</div></div>
            <div class="field"><label>Password</label><div class="value">${sup.password}</div></div>
            
            <a href="login.jsp" class="btn">Logout</a>
        </div>

        <div class="main-content">
            <h2>Welcome, ${sup.name}!</h2>
            <p>This is your supplier dashboard. Access and manage your services, inventory, and notifications using the cards below.</p>

            <div class="cards-container">
                <div class="card-wrapper">
                    <a href="manageService.jsp" style="text-decoration: none;">
                        <div class="card">
                            <img src="https://cdn-icons-png.flaticon.com/512/2897/2897785.png" alt="Manage Services">
                            <h3>Manage Services</h3>
                            <p>Add, update, or remove the services you offer for events</p>
                        </div>
                    </a>
                </div>

                <div class="card-wrapper">
                    <div class="notification-badge">5</div>
                    <div class="card" onclick="window.location.href='notifications.jsp'">
                        <img src="https://cdn-icons-png.flaticon.com/512/3602/3602123.png" alt="Notifications">
                        <h3>Notifications</h3>
                        <p>View requests, updates, and important messages</p>
                    </div>
                </div>

                <div class="card-wrapper">
                    <div class="card" onclick="window.location.href='manageInventory.jsp'">
                        <img src="https://cdn-icons-png.flaticon.com/512/2972/2972151.png" alt="Inventory">
                        <h3>Inventory Management</h3>
                        <p>Track and update your available resources and stock levels</p>
                    </div>
                </div>
            </div>

            <div class="recent-activity">
                <h3>Recent Activity</h3>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon"><img src="https://cdn-icons-png.flaticon.com/512/2991/2991178.png" alt="Order"></div>
                        <div class="activity-content">
                            <div class="activity-title">New Order Request</div>
                            <div class="activity-details">Wedding decoration for Johnson-Smith event on June 15</div>
                            <div class="activity-time">Today, 10:25 AM</div>
                        </div>
                        <div class="activity-status pending">Pending</div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon"><img src="https://cdn-icons-png.flaticon.com/512/1484/1484584.png" alt="Payment"></div>
                        <div class="activity-content">
                            <div class="activity-title">Payment Received</div>
                            <div class="activity-details">$1,250 for Corporate Event at Tech Solutions Inc.</div>
                            <div class="activity-time">Yesterday, 3:42 PM</div>
                        </div>
                        <div class="activity-status completed">Completed</div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon"><img src="https://cdn-icons-png.flaticon.com/512/1828/1828743.png" alt="Update"></div>
                        <div class="activity-content">
                            <div class="activity-title">Service Update</div>
                            <div class="activity-details">You updated pricing for "Premium Floral Arrangements"</div>
                            <div class="activity-time">May 2, 2025</div>
                        </div>
                        <div class="activity-status info">Info</div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="footer">
    © 2025 Event Planning System — All Rights Reserved
</div>

</body>
</html>