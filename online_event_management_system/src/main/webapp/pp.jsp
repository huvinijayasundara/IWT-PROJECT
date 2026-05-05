<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Luxury Wedding Package</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Open+Sans&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      background-color: #fdfaf5;
      font-family: 'Open Sans', sans-serif;
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: auto;
      padding: 100px 20px 60px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 60px;
      align-items: center;
    }

    .image-box img {
      width: 100%;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      transition: transform 0.3s ease;
    }

    .image-box img:hover {
      transform: scale(1.02);
    }

    .content-box h1 {
      font-family: 'Playfair Display', serif;
      font-size: 3rem;
      margin-bottom: 10px;
    }

    .price-tag {
      color: #C7A008;
      font-size: 1.5rem;
      margin-bottom: 30px;
    }

    .description {
      font-size: 1.05rem;
      line-height: 1.8;
      margin-bottom: 30px;
    }

    .features {
      margin-bottom: 40px;
    }

    .features h3 {
      font-family: 'Playfair Display', serif;
      font-size: 1.5rem;
      margin-bottom: 10px;
    }

    .features ul {
      list-style: none;
      padding: 0;
    }

    .features ul li {
      margin-bottom: 12px;
      position: relative;
      padding-left: 24px;
      color: #555;
    }

    .features ul li::before {
      content: '✓';
      position: absolute;
      left: 0;
      color: #C7A008;
      font-weight: bold;
    }

    .cta button {
      background-color: #C7A008;
      border: none;
      padding: 14px 36px;
      font-size: 16px;
      color: white;
      border-radius: 30px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .cta button:hover {
      background-color: #a88600;
    }

    @media screen and (max-width: 900px) {
      .container {
        grid-template-columns: 1fr;
        padding-top: 140px;
      }

      .content-box {
        order: 2;
      }

      .image-box {
        order: 1;
      }
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="image-box">
      <img src="images/wedding-sparklers.jpg" alt="Luxury Wedding Celebration">
    </div>

    <div class="content-box">
      <h1>Luxury Wedding Package</h1>
      <div class="price-tag">$4,999</div>
      <div class="description">
        Our Luxury Wedding Package is crafted for couples seeking an unforgettable and seamless celebration. From curated décor to exclusive venues and entertainment, every detail reflects sophistication and romance.
      </div>

      <div class="features">
        <h3>Package Includes</h3>
        <ul>
          <li>Dedicated wedding planner</li>
          <li>Venue selection & coordination</li>
          <li>Custom floral design</li>
          <li>Premium photography & videography</li>
          <li>Live entertainment (DJ or musicians)</li>
          <li>Luxury transportation for guests</li>
        </ul>
      </div>

      <div class="cta">
        <button onclick="window.location.href='booking.jsp'">Book This Package</button>
      </div>
    </div>
  </div>

</body>
</html>
