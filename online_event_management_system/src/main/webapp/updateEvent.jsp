<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Back</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<style>
       * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
   
    body {
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 130vh;
        margin: 0;
    }
    .form-container {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border: 2px solid #ffd700;
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    .form-container h2 {
        margin-bottom: 20px;
    }
    .form-container label {
        display: block;
        text-align: left;
        margin: 10px 0 5px;
        color: #333;
        font-weight: bold;
    }
    .form-container input[type="text"],
    .form-container input[type="password"],
    .form-container input[type="date"],
    .form-container input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    .form-container input[type="submit"],
    .form-container input[type="button"] {
        width: 100%;
        padding: 10px;
        background-color: #ffd700;
        border: none;
        border-radius: 5px;
        color: black;
        font-weight: bold;
        cursor: pointer;
    }
    .form-container input[type="submit"]:hover,
    .form-container input[type="button"]:hover {
        background-color: #e6c200;
    }
    .form-container p {
        margin: 10px 0;
        color: #666;
    }
    .form-container input[readonly] {
        background-color: #f0f0f0;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Event</h2>
        <%
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            String date = request.getParameter("date");
            int guests = Integer.parseInt(request.getParameter("guests"));
            String location = request.getParameter("location");
            String theme = request.getParameter("theme");
            String services = request.getParameter("services");
        %>
        <form action="updateEventServlet" method="post">
            <label for="id">Event ID:</label>
            <input type="text" id="id" name="id" value="<%=id %>" readonly><br><br>
            <label for="type">Event Type:</label>
            <input type="text" id="type" name="type" value="<%=type %>" required><br><br>
            <label for="date">Event Date:</label>
            <input type="date" id="date" name="date" value="<%=date %>" required><br><br>
            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" value="<%=guests %>" min="10" required><br><br>
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="<%=location %>" required><br><br>
            <label for="theme">Theme:</label>
            <input type="text" id="theme" name="theme" value="<%=theme %>"><br><br>
            <label for="services">Additional Services:</label>
            <input type="text" id="services" name="services" value="<%=services %>"><br><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>