<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Feedback</title>
<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: white;
    color: #333;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 20px;
}

.container {
    width: 100%;
    max-width: 500px;
}

.feedback-card {
    background-color: rgba(255, 255, 255, 0.85);
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    padding: 40px;
    backdrop-filter: blur(10px);
    animation: fadeIn 0.6s ease-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.header {
    text-align: center;
    margin-bottom: 30px;
}

.header h1 {
    margin: 0;
    color: #6a11cb;
    font-size: 28px;
    font-weight: 600;
}

.header p {
    margin-top: 10px;
    color: #666;
    font-size: 16px;
}

.feedback-form {
    display: flex;
    flex-direction: column;
}

.form-group {
    margin-bottom: 24px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: #444;
    font-size: 16px;
}

.rating-container {
    display: flex;
    flex-direction: row-reverse;
    justify-content: flex-end;
    margin-bottom: 8px;
}

.rating-container input {
    display: none;
}

.rating-container label {
    cursor: pointer;
    font-size: 30px;
    color: #ddd;
    margin: 0 5px;
    transition: color 0.3s ease;
}

.rating-container label:hover,
.rating-container label:hover ~ label,
.rating-container input:checked ~ label {
    color: #FFD700;
}

textarea {
    width: 100%;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-family: inherit;
    font-size: 16px;
    resize: vertical;
    min-height: 120px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    box-sizing: border-box;
}

textarea:focus {
    outline: none;
    border-color: #6a11cb;
    box-shadow: 0 0 0 2px rgba(106, 17, 203, 0.2);
}

.submit-btn {
    background: linear-gradient(to right, #6a11cb, #2575fc);
    color: white;
    border: none;
    border-radius: 8px;
    padding: 16px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    margin-top: 10px;
}

.submit-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
}

.submit-btn:active {
    transform: translateY(0);
}

.logo {
    width: 50px;
    height: 50px;
    margin: 0 auto 15px;
    display: block;
}

.thank-you {
    display: none;
    text-align: center;
    padding: 20px;
}

.thank-you h2 {
    color: #6a11cb;
}

.thank-you p {
    margin-bottom: 20px;
}

.back-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #6a11cb;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: 500;
}
</style>
</head>
<body>
<div class="container">
    <div class="feedback-card">
        <div class="header">
            <img src="https://cdn-icons-png.flaticon.com/512/3470/3470522.png" alt="Logo" class="logo">
            <h1>Event Feedback</h1>
            <p>We value your opinion! Please share your thoughts about the event.</p>
        </div>
        
        <form action="SubmitFeedbackServlet" method="post" class="feedback-form" id="feedbackForm">
            <input type="hidden" name="eventId" value="${eventId}">
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            
            <div class="form-group">
                <label for="rating">How would you rate your experience?</label>
                <div class="rating-container">
                    <input type="radio" id="star5" name="rating" value="5" required>
                    <label for="star5">★</label>
                    <input type="radio" id="star4" name="rating" value="4">
                    <label for="star4">★</label>
                    <input type="radio" id="star3" name="rating" value="3">
                    <label for="star3">★</label>
                    <input type="radio" id="star2" name="rating" value="2">
                    <label for="star2">★</label>
                    <input type="radio" id="star1" name="rating" value="1">
                    <label for="star1">★</label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="comment">Please share your thoughts:</label>
                <textarea name="comment" id="comment" placeholder="Tell us what you liked and any suggestions for improvement..." required></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Submit Feedback</button>
        </form>
        
        <div class="thank-you" id="thankYou">
            <h2>Thank You!</h2>
            <p>Your feedback has been submitted successfully. We appreciate your input!</p>
            
            <!-- change it to user account -->
            <a href="dashboard.jsp" class="back-btn">Return to Dashboard</a>
        </div>
    </div>
</div>

<script>
document.getElementById('feedbackForm').addEventListener('submit', function(e) {
    e.preventDefault();
    // In a real implementation, you would submit the form data via AJAX here
    // For demo purposes, we'll just show the thank you message
    setTimeout(function() {
        document.getElementById('feedbackForm').style.display = 'none';
        document.getElementById('thankYou').style.display = 'block';
    }, 500);
});
</script>
</body>
</html>