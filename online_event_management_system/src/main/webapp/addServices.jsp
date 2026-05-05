<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Event Service</title>
    <style>
        :root {
            --champagne: #F9DDA4;
            --velvet: #2D3142;
            --pearl: #ffffff;
            --marble: #F4F4F4;
            --gradient: linear-gradient(135deg, #F9DDA4, #e9e0c9, #F9DDA4);
            --radius: 18px;
            --shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Poppins', sans-serif;
        }

        body {
		    background: white;
		    min-height: 100vh;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    padding: 40px 15px;
		}


        .container {
            width: 100%;
            max-width: 850px;
        }

        .card {
            background-color: var(--pearl);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.6s ease-in-out;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background: white;
            background-size: 400% 400%;
            animation: gradientFlow 8s ease infinite;
            padding: 35px 30px;
            text-align: center;
            color: var(--velvet);
            border-radius:16px;
            border-bottom: 2px solid black; /* Only bottom border */
        }

        .card-header h1 {
            font-size: 32px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .card-header p {
            font-size: 16px;
            margin-top: 5px;
            opacity: 0.85;
        }

        .card-body {
            padding: 35px;
            animation: slideUp 0.8s ease forwards;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 15px;
            color: var(--velvet);
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #ccc;
            border-radius: 12px;
            font-size: 15px;
            background-color: #fefefe;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--champagne);
            box-shadow: 0 0 0 3px rgba(249, 221, 164, 0.3);
            outline: none;
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23666666' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 16px center;
            background-size: 16px;
        }

        .btn {
            width: 100%;
            padding: 16px;
            font-size: 16px;
            font-weight: bold;
            border: none;
           
            background-color: #E6A519;
            color: white;
            cursor: pointer;
            transition: var(--transition);
            box-shadow: 0 6px 20px rgba(249, 221, 164, 0.3);
        }

        .btn:hover {
            background-color: black;
            color: var(--pearl);
            box-shadow: 0 10px 30px rgba(45, 49, 66, 0.3);
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @media (max-width: 768px) {
            .card-body {
                padding: 25px;
            }

            .card-header h1 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h1>Add Event Service</h1>
            <p>Craft unforgettable moments with the perfect add-ons</p>
        </div>
        <div class="card-body">
            <form id="serviceForm" method="post" action="insertService" onsubmit="return showSuccess(event)">
                
                <div class="form-group">
                    <label for="title" class="form-label">Service Title</label>
                    <input type="text" id="title" class="form-control" name="title" required placeholder="e.g., Wedding Photography Package">
                </div>

                <div class="form-group">
                    <label for="category" class="form-label">Service Category</label>
                    <select id="category" class="form-control form-select" name="category" required>
                        <option value="">-- Select Category --</option>
                        <option value="Photography">📸 Photography</option>
                        <option value="Decorations">🎀 Decorations</option>
                        <option value="Entertainment">🎶 Entertainment</option>
                        <option value="Other">🧩 Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="price" class="form-label">Price ($)</label>
                    <input type="number" id="price" class="form-control" step="0.01" name="price" required placeholder="e.g., 25000.00">
                </div>

                <div class="form-group">
                    <label for="description" class="form-label">Description</label>
                    <textarea id="description" class="form-control form-textarea" name="description" placeholder="Brief description of the service..."></textarea>
                </div>

                <button type="submit" class="btn">Submit Service</button>
            </form>
        </div>
    </div>
</div>

<script>
    function showSuccess(event) {
        alert("Service added successfully!");
        return true;
    }
</script>

</body>
</html>