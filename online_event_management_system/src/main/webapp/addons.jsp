<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Premium Event Add-ons | Dream Events</title>
    <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
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

        .addons-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
            margin-bottom: 60px;
        }

        .addon-box {
            background-color: white;
             border-radius: 15px; 
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width:600px;
            height:400px;
            overflow: hidden;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .addon-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .addon-box::before {
            content: '';
            height: 5px;
            background: linear-gradient(90deg, var(--accent-color) 0%, var(--accent-lighter) 100%);
        }

       .addon-box:nth-child(1) {
    --accent-color: #000000;
            --accent-lighter: #000000;
        }


        .addon-box:nth-child(2) {
           --accent-color: #fab005;
            --accent-lighter: #ffe066;
        }

        .addon-box:nth-child(3) {
            --accent-color: #fab005;
            --accent-lighter: #ffe066;
        }

        .addon-box:nth-child(4) {
            --accent-color: #000000;
            --accent-lighter: #000000;
        } 

        .addon-box-header {
            padding: 30px 30px 20px;
            display: flex;
            align-items: center;
        }

        .addon-icon {
            height: 70px;
            width: 70px;
            font-size: 28px;
            background-color: #0000;
            color: #E6A519;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-right: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .addon-title h2 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }

	
	     .header  {
    font-size: 20px;
     color: rgb(42, 42, 42);
     margin-bottom:30px;
     text-align:center;
     padding:20px;
     font-family: 'Playfair Display', serif;
}

  /* Section Title */
    .section-title {
      text-align: center;
      margin: 50px 0 30px;
      font-size:36px;
      font-weight: 400;
       font-family: 'Playfair Display', serif;
       color:#E6A519;
    }


        .addon-content {
            padding: 25px 30px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .addon-features ul {
            list-style-type: none;
            margin-top: 15px;
        }

        .addon-features li {
            position: relative;
            padding-left: 25px;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .addon-features li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: var(--accent-color);
            font-weight: bold;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            text-align: center;
            background-color: #E6A519;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            min-width: 180px;
        }

        .btn:hover {
            background-color: black;
            color:white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        footer {
            background-color: #222;
            color: #999;
            padding: 40px 0;
            text-align: center;
        }

        @media (max-width: 992px) {
            .addons-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
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

     <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>Plan Events Effortlessly</h1>
      <p>Streamline your event planning with ease and confidence.</p>
    </div>
  </section>


<h2 class="section-title">Our Services</h2>
  <p class="header">
    We plan every detail of your wedding day to perfection, creating a celebration that's a true reflection of your love story and personal style.
   We plan every detail of your wedding day to perfection, creating a celebration that's a true  
   We plan every detail of your wedding day to perfection, creating a celebration that's a true</p>
   
  
<div class="container">
  
    <main class="main-container">
        <div class="addons-container">

            <div class="addon-box">
                <div class="addon-box-header">
                    <div class="addon-icon"><i class="fas fa-camera"></i></div>
                    <div class="addon-title">
                        <h2>Photography & VideoGraphy</h2>
                    </div>
                </div>
                <div class="addon-content">
                    <div class="addon-features">
                        <p>Capture your most memorable moments with elegance and style.</p>
                        <ul>
                            <li>Professional photographers</li>
                            <li>High-quality photo & video</li>
                            <li>Photo albums & prints</li>
                        </ul>
                    </div>
                    <div class="action-buttons">
                        <a href="ServicesServlet?category=Photography" class="btn">Explore Options</a>
                    </div>
                </div>
            </div>

            <div class="addon-box">
                <div class="addon-box-header">
                    <div class="addon-icon"><i class="fas fa-music"></i></div>
                    <div class="addon-title">
                        <h2>Entertainment</h2>
                    </div>
                </div>
                <div class="addon-content">
                    <div class="addon-features">
                        <p>Delight your guests with unforgettable live performances.</p>
                        <ul>
                            <li>DJs and live bands</li>
                            <li>Magicians and dancers</li>
                            <li>Magicians and dancers</li>
                        </ul>
                    </div>
                    <div class="action-buttons">
                        <a href="ServicesServlet?category=Entertainment" class="btn">Explore Options</a>
                    </div>
                </div>
            </div>

            <div class="addon-box">
                <div class="addon-box-header">
                    <div class="addon-icon"><i class="fas fa-paint-brush"></i></div>
                    <div class="addon-title">
                        <h2>Decorations</h2>
                    </div>
                </div>
                <div class="addon-content">
                    <div class="addon-features">
                        <p>Transform your venue with stunning decor that matches your theme.</p>
                        <ul>
                            <li>Floral and lighting setups</li>
                            <li>Custom designs</li>
                            <li>Magicians and dancers</li>
                        </ul>
                    </div>
                    <div class="action-buttons">
                        <a href="ServicesServlet?category=Decorations" class="btn">Explore Options</a>
                    </div>
                </div>
            </div>

            <div class="addon-box">
                <div class="addon-box-header">
                    <div class="addon-icon"><i class="fas fa-star"></i></div>
                    <div class="addon-title">
                        <h2>Other Services</h2>
                    </div>
                </div>
                <div class="addon-content">
                    <div class="addon-features">
                        <p>Make your event smoother with add-on comforts and services.</p>
                        <ul>
                            <li>Valet parking</li>
                            <li>Event coordinators</li>
                            <li>Magicians and dancers</li>
                        </ul>
                    </div>
                    <div class="action-buttons">
                        <a href="ServicesServlet?category=Other" class="btn">Explore Options</a>
                    </div>
                </div>
            </div>

        </div>
    </main>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const addonBoxes = document.querySelectorAll('.addon-box');
            addonBoxes.forEach((box, index) => {
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
    <jsp:include page="footer.jsp" />
</body>
</html>