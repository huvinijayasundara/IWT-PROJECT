<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suggestions</title>
<style>
    /* Basic styling for layout and textarea */
    .events-card {
        margin: 20px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .events-table {
        width: 100%;
        border-collapse: collapse;
    }
    .events-table th, .events-table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }
    .action-buttons button {
        padding: 5px 10px;
        cursor: pointer;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 3px;
    }
    .action-buttons button:hover {
        background-color: #0056b3;
    }
    .suggestion-section {
        margin-top: 20px;
        padding: 10px;
        border-top: 1px solid #ccc;
    }
    .suggestion-header {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .suggestion-textarea {
        width: 100%;
        height: 100px;
        resize: vertical;
        margin-bottom: 10px;
    }
    .submit-button {
        padding: 8px 15px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    .submit-button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
    <div class="stats-card">
        <h2><i class="fas fa-calendar-check"></i> Upcoming Events</h2>
        <div class="stats-container">
            <c:set var="totNum" value="${totEvents.size()}" />
            <div class="stats-number">${totNum}</div>
            <div class="stats-label">Total events scheduled</div>
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
                    <th><i class="fas fa-cogs"></i> Client Username</th>
                    <th><i class="fas fa-tools"></i> Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="te" items="${totEvents}">
                    <tr>
                        <td>${te.id}</td>
                        <td>${te.date}</td>
                        <td>${te.type}</td>
                        <td>${te.theme}</td>
                        <td>${te.location}</td>
                        <td>${te.guests}</td>
                        <td>${te.services}</td>
                        <td>${te.uname}</td>
                        <td class="action-buttons">
                            <button onclick="selectEvent('${te.id}')">Suggest</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Single Suggestion Textarea for All Events -->
        <div class="suggestion-section">
            <div class="suggestion-header" id="suggestion-header">Select an event to add suggestions</div>
            <form id="suggestion-form" action="addSuggestionsServlet" method="post">
                <input type="text" id="event-id" name="eventId" value="" readonly>
                <textarea class="suggestion-textarea" id="suggestion-textarea" name="suggestion" placeholder="Enter your recommendations for the selected event"></textarea>
                <button type="submit" class="submit-button" id="submit-button" disabled>Submit Suggestion</button>
            </form>
        </div>
    </div>

    <script>
        // Function to update the suggestion section when an event is selected
        function selectEvent(eventId) {
            // Update the header with the selected event ID
            document.getElementById('suggestion-header').textContent = `Suggestions for Event ID: eventId`;
            // Update the hidden input with the event ID
            document.getElementById('event-id').value = eventId;
            // Clear the textarea for new input
            document.getElementById('suggestion-textarea').value = '';
            // Focus the textarea
            document.getElementById('suggestion-textarea').focus();
            // Enable the submit button
            document.getElementById('submit-button').disabled = false;
        }
    </script>
</body>
</html>