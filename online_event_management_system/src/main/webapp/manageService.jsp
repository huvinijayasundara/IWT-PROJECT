<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Services | Dream Events</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            overflow-x: hidden;
        }

        /* Hero Section */
        .hero {
            background: url('images/serv2.jpg') no-repeat center center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
        }

        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.5);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: 400;
            font-family: 'Playfair Display', serif;
        }

        .hero p {
            font-size: 1.2rem;
            margin-top: 15px;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .section-title {
            text-align: center;
            margin: 50px 0 30px;
            font-size: 36px;
            font-weight: 400;
            font-family: 'Playfair Display', serif;
            color: #E6A519;
        }

        .form-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 30px;
            margin-bottom: 60px;
            transition: all 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .form-container::before {
            content: '';
            display: block;
            height: 5px;
            background: linear-gradient(90deg, #E6A519 0%, #ffe066 100%);
            border-radius: 15px 15px 0 0;
        }

        .form-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-icon {
            height: 50px;
            width: 50px;
            font-size: 24px;
            background-color: #fff;
            color: #E6A519;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-right: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .form-title h2 {
            font-size: 1.8rem;
            font-family: 'Playfair Display', serif;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        select, input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            color: #333;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        select:focus, input:focus, textarea:focus {
            outline: none;
            border-color: #E6A519;
            box-shadow: 0 0 5px rgba(230, 165, 25, 0.3);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            text-align: center;
            background-color: #E6A519;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
            min-width: 180px;
            display: inline-block;
        }

        .btn:hover {
            background-color: black;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .delete-btn {
            background-color: #e53935;
        }

        .delete-btn:hover {
            background-color: #c62828;
        }

        .error-message {
            color: #e53935;
            font-size: 0.875rem;
            margin-top: 5px;
            display: none;
        }

        .services-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 30px;
            margin-bottom: 60px;
            transition: all 0.3s ease;
        }

        .services-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .services-container::before {
            content: '';
            display: block;
            height: 5px;
            background: linear-gradient(90deg, #E6A519 0%, #ffe066 100%);
            border-radius: 15px 15px 0 0;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }

            .form-container, .services-container {
                padding: 20px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Manage Your Services</h1>
            <p>Effortlessly update and organize your event services.</p>
        </div>
    </section>

	<!-- Back Button -->
    <div class="back-button-container">
        <a href="SupplierAccountServlet" class="nav-button">← Back</a>
    </div>
    
    <div class="main-container">
        <h2 class="section-title">Service Management</h2>

        <!-- Add Service Form -->
        <div class="form-container">
            <div class="form-header">
                <div class="form-icon"><i class="fas fa-plus"></i></div>
                <div class="form-title">
                    <h2>Add New Service</h2>
                </div>
            </div>
            <form action="addServices.jsp" method="post">
                <div class="form-group">
                    <button type="submit" class="btn">Add Service</button>
                </div>
            </form>
        </div>

        <!-- Select Category Form -->
        <div class="form-container">
            <div class="form-header">
                <div class="form-icon"><i class="fas fa-list"></i></div>
                <div class="form-title">
                    <h2>Choose a Category</h2>
                </div>
            </div>
            <form action="ManageServicesServlet" method="post">
                <div class="form-group">
                    <label for="cat">Service Category</label>
                    <select id="cat" name="category" required>
                        <option value="" disabled selected>-- Select a Category --</option>
                        <option value="Photography">Photography</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Decorations">Decorations</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Submit</button>
                </div>
            </form>
        </div>

        <!-- Services List Display -->
        <c:if test="${not empty serviceList}">
            <div class="services-container">
                <div class="form-header">
                    <div class="form-icon"><i class="fas fa-concierge-bell"></i></div>
                    <div class="form-title">
                        <h2>Services in '${param.category}'</h2>
                    </div>
                </div>
                <form action="ManageServicesServlet" method="post">
                    <div class="form-group">
                        <label for="serviceId">Select a Service</label>
                        <select name="serviceId" id="serviceId" required>
                            <c:forEach var="service" items="${serviceList}">
                                <option value="${service.id}">${service.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="hidden" name="category" value="${param.category}">
                    <div class="form-group">
                        <button type="submit" class="btn">View Details</button>
                    </div>
                </form>
            </div>
        </c:if>

        <!-- Service Details and Update Form -->
        <c:if test="${not empty serviceData}">
            <div class="services-container">
                <div class="form-header">
                    <div class="form-icon"><i class="fas fa-edit"></i></div>
                    <div class="form-title">
                        <h2>Edit Service Details</h2>
                    </div>
                </div>
                <form action="UpdateServiceServlet" method="post" onsubmit="return validateForm()">
                    <input type="hidden" name="serviceId" value="${serviceData.id}">
                    <div class="form-group">
                        <label>Title:</label>
                        <input type="text" name="title" value="${serviceData.title}" required>
                        <div class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label>Category:</label>
                        <input type="text" name="category" value="${serviceData.category}" required>
                    </div>
                    <div class="form-group">
                        <label>Price:</label>
                        <input type="number" name="price" value="${serviceData.price}" step="0.01" required>
                        <div class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description" rows="4" required>${serviceData.description}</textarea>
                        <div class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn">Update</button>
                    </div>
                </form>

                <!-- Delete Service Form -->
                <form action="DeleteServiceServlet" method="post">
                    <input type="hidden" name="serviceId" value="${serviceData.id}">
                    <div class="form-group">
                        <button type="submit" class="btn delete-btn">Delete</button>
                    </div>
                </form>
            </div>
        </c:if>
    </div>

    <script>
        function validateForm() {
            const title = document.querySelector('input[name="title"]');
            const price = document.querySelector('input[name="price"]');
            const description = document.querySelector('textarea[name="description"]');
            let isValid = true;

            document.querySelectorAll(".error-message").forEach(el => el.style.display = "none");

            if (title.value.trim() === "") {
                showError(title, "Title cannot be empty.");
                isValid = false;
            }

            if (price.value <= 0) {
                showError(price, "Price must be greater than 0.");
                isValid = false;
            }

            if (description.value.trim().length < 10) {
                showError(description, "Description should be at least 10 characters.");
                isValid = false;
            }

            return isValid;
        }

        function showError(input, message) {
            const errorElement = input.nextElementSibling;
            errorElement.textContent = message;
            errorElement.style.display = "block";
        }

        document.addEventListener('DOMContentLoaded', function () {
            const containers = document.querySelectorAll('.form-container, .services-container');
            containers.forEach((box, index) => {
                box.style.opacity = '0';
                box.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    box.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    box.style.opacity = '1';
                    box.style.transform = 'translateY(0)';
                }, 100 * index);
            });
        });
    </script>
</body>
</html>