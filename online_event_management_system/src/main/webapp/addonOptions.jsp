<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${category} Options | Magical Moment</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
        }

        .header {
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            color: white;
            padding: 60px 0 100px;
            text-align: center;
            position: relative;
        }

        .header h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.2rem;
        }

        .main-container {
            max-width: 1200px;
            margin: -60px auto 50px;
            padding: 0 20px;
        }

        .back-button {
            margin: 20px 0;
            display: inline-block;
            background-color: #ddd;
            padding: 10px 20px;
            border-radius: 30px;
            text-decoration: none;
            color: #333;
            font-weight: 600;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        .service-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            overflow: hidden;
            transition: 0.3s;
            display: flex;
            flex-direction: column;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .service-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .service-title {
            font-size: 1.4rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .service-description {
            flex-grow: 1;
            color: #666;
            font-size: 0.95rem;
            line-height: 1.5;
            margin-bottom: 15px;
        }

        .service-price {
            font-weight: bold;
            color: #0f0c29;
            font-size: 1.1rem;
        }

        .no-data {
            text-align: center;
            font-size: 1.2rem;
            margin-top: 40px;
            color: #777;
        }

        footer {
            background-color: #222;
            color: #999;
            text-align: center;
            padding: 20px 0;
            margin-top: 60px;
        }
        
        .btn {
		    background-color: #302b63;
		    color: white;
		    padding: 10px;
		    border: none;
		    border-radius: 25px;
		    cursor: pointer;
		    font-weight: bold;
		    transition: background-color 0.3s;
		    margin-top: 10px;
		}
		
		.btn:hover {
		    background-color: #5040a5;
		}
    </style>
</head>
<body>

    <div class="header">
        <h1>${category} Services</h1>
        <p>Select from available add-on packages tailored for this category</p>
    </div>

    <main class="main-container">
        <a href="addons.jsp" class="back-button"><i class="fas fa-arrow-left"></i> Back to Add-ons</a>

        <c:if test="${empty addonDetails}">
            <div class="no-data">🚫 No services found for the selected category.</div>
        </c:if>

        <div class="services-grid">
            <c:forEach items="${addonDetails}" var="service">
                <div class="service-card">
                    <div class="service-content">
                        <div class="service-title">${service.title}</div>
                        <div class="service-description">${service.description}</div>
                        <div class="service-price">$${service.price}</div>
                        
                        <!--add service button-->
                        <form action="addAddOnsServlet" method="post">
                        
						    <input type="hidden" name="serviceId" value="${service.id}" />
						    <button type="submit" class="btn">Buy Service</button>
						    
						</form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

</body>
</html>
