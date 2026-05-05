<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Package Details</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Playfair+Display&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Montserrat', sans-serif;
      background-color: #fefefe;
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: 50px auto;
      padding: 20px;
    }

    h1, h2 {
      font-family: 'Playfair Display', serif;
      color: #222;
    }

    .package-header {
      text-align: center;
      margin-bottom: 40px;
    }

    .price {
      font-size: 24px;
      font-weight: bold;
      margin-top: 10px;
      color: #d4af37;
    }

    .package-content {
      display: flex;
      flex-wrap: wrap;
      gap: 40px;
      align-items: flex-start;
      justify-content: center;
    }

    .package-image {
      width: 50%;
      max-width: 500px;
      height: 50%;
      border-radius: 8px;
    }

    .package-details {
      flex: 1;
      min-width: 280px;
    }

    .package-description, .package-includes {
      margin-bottom: 30px;
    }

    .package-includes ul {
      list-style: none;
      padding-left: 0;
    }

    .package-includes ul li::before {
      content: "✓";
      color: #d4af37;
      margin-right: 10px;
    }

    .btn-book {
      display: inline-block;
      margin-top: 30px;
      padding: 12px 24px;
      background-color: #d4af37;
      color: white;
      text-decoration: none;
      font-weight: bold;
      border-radius: 4px;
      transition: background 0.3s;
    }

    .btn-book:hover {
      background-color: #000000;
      color: #ffffff;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .package-content {
        flex-direction: column;
        align-items: center;
      }

     
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="package-header">
      <h1>Luxury Wedding Package</h1>
      <p class="price">$4,999</p>
    </div>

    <div class="package-content">
      <img src="images/we.jpg" alt="Luxury Wedding Package" class="package-image">

      <div class="package-details">
        <div class="package-description">
          <h2>Description</h2>
          <p>Our Luxury Wedding Package is designed for couples who desire a flawless, full-service wedding experience. From venue selection to décor, catering, and coordination—every detail is taken care of with elegance and professionalism.</p>
        </div>

        <div class="package-includes">
          <h2>Package Includes</h2>
          <ul>
            <li>Full-service wedding planner</li>
            <li>Venue coordination</li>
            <li>Custom floral arrangements</li>
            <li>Professional photographer</li>
            <li>Live music or DJ</li>
            <li>Luxury transportation</li>
          </ul>
        </div>

        <a href="#" class="btn-book">Book This Package</a>
      </div>
    </div>
  </div>

</body>
</html>
