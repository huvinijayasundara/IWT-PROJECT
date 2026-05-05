<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="shortcut icon" href="images/fav.png" type="image/x-icon">
    <link rel="stylesheet" href="css/contact.css">
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    
    if (username != null && !username.isEmpty()) {
%>
    <jsp:include page="loginHeader.jsp" />
<%
    } else {
%>
    <jsp:include page="header.jsp" />
<%
    }
%>

<!-- Main Container with Left and Right Sections -->
<div class="contact-container">

    <!-- Left Section: Contact Information and Map -->
    <div class="contact-left">
        <div class="contact-info">
            <h2>Contact Us</h2>
            <p>We'd love to hear from you! Please fill out the form, and we'll get back to you as soon as possible.</p>
            <div class="info-box">
                <p><strong>Email:</strong> support@eventhub.com</p>
                <p><strong>Phone:</strong> +112 712 345678</p>
                <p><strong>Address:</strong> Colombo, Sri Lanka</p>
            </div>
        </div>

        <!-- Map Placeholder Section -->
        <div class="map-container">
            <h3>Our Location</h3>
            <img src="img/googlemap.png" alt="Map Placeholder" class="map-image">
            <p><em>Find us at the location above in Sri Lanka.</em></p>
        </div>
    </div>

    <!-- Right Side: Floating Contact Form -->
    <div class="floating-form">
        <h3>Send Us a Message</h3>
        <form onsubmit="return validateForm()">
            <div class="input-group">
                <input type="text" id="name" required>
                <label for="name">Full Name</label>
            </div>
            <div class="input-group">
                <input type="email" id="email" required>
                <label for="email">Email</label>
            </div>
            <div class="input-group">
                <textarea id="message" rows="5" required></textarea>
                <label for="message">Message</label>
            </div>
            <button type="submit">Send Message</button>
        </form>
    </div>

</div>

<script>
    function validateForm() {
        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("email").value.trim();
        const message = document.getElementById("message").value.trim();

        if (!name || !email || !message) {
            alert("Please fill in all fields.");
            return false;
        }

        alert("Message sent successfully!");
        return true;
    }
</script>

</body>
</html>