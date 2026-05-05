<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Footer | Magical Moments</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Playfair Display', serif;
        }

        .footer {
            background-color: #000;
            color: white;
            padding: 60px 0 40px;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .footer-section {
            flex: 1;
            min-width: 200px;
            margin: 20px 15px;
        }

        .footer-section h5 {
            font-size: 20px;
            color: #E6A519;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .footer-section p, .footer-section a {
            font-size: 16px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: #E6A519;
        }

        .footer-logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .footer-logo img {
            height: 115px;
            width: 200px;
        }

        .footer-contact p i {
            margin-right: 10px;
            color: #E6A519;
        }

        .footer-divider {
            border-top: 1px solid #E6A519;
            margin: 30px 0;
        }

        .footer-bottom {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            padding: 0 15px;
        }

        .footer-bottom p {
            font-size: 16px;
            color: white;
            margin: 0;
        }

        .footer-social a {
            color: white;
            font-size: 20px;
            margin-left: 20px;
            transition: color 0.3s ease;
        }

        .footer-social a:hover {
            color: #E6A519;
        }

        @media (max-width: 768px) {
            .footer-container {
                flex-direction: column;
                text-align: center;
            }

            .footer-section {
                margin: 20px 0;
            }

            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }

            .footer-social {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-section">
                <div class="footer-logo">
                    <img src="images/log2.png" alt="Magical Moments Logo" />
                </div>
                <p>Your trusted partner for creating unforgettable events and celebrations.</p>
            </div>
            <div class="footer-section">
                <h5>Quick Links</h5>
                <p><a href="eventhome.jsp">Home</a></p>
                <p><a href="packagesPage.jsp">Packages</a></p>
                <p><a href="#">Services</a></p>
                <p><a href="#">Testimonials</a></p>
            </div>
            <div class="footer-section">
                <h5>Useful Links</h5>
                <p><a href="userDashboard.jsp">Your Account</a></p>
                <p><a href="#">Register</a></p>
                <p><a href="#">Login</a></p>
                <p><a href="#">Privacy Policy</a></p>
            </div>
            <div class="footer-section footer-contact">
                <h5>Contact</h5>
                <p><i class="fas fa-home"></i> Colombo, Sri Lanka</p>
                <p><i class="fas fa-envelope"></i> <a href="mailto:info@magicalmoments.com">info@magicalmoments.com</a></p>
                <p><i class="fas fa-phone"></i> +94 71 234 5678</p>
                <p><i class="fas fa-print"></i> +94 11 234 5678</p>
            </div>
        </div>
        <hr class="footer-divider">
        <div class="footer-bottom">
            <p>© 2025 Magical Moments. All Rights Reserved.</p>
            <div class="footer-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>