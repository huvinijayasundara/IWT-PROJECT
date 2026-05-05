<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Packages</title>
      <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      
      
    }

    body {
      background-color: #FAFAFA;
      font-family: 'Segoe UI', sans-serif;
      line-height: 1.6;
        font-family: 'Montserrat', sans-serif; 
      
    }

    /* Hero Section */
    .hero {
      background: url('images/pk1.jpg') no-repeat center center/cover;
      height: 80vh;
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

    /* Section Title */
    .section-title {
      text-align: center;
      margin: 50px 0 30px;
      font-size:36px;
      font-weight: 400;
       font-family: 'Playfair Display', serif;
       color:#E6A519;
    }
    
    .header  {
    font-size: 15px;
     color: rgb(42, 42, 42);
     margin-bottom:20px;
}

    /* Container & Grid */
    .container {
      width: 90%;
      max-width: 1200px;
      margin: 0 auto 60px auto;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 30px;
    }

    /* Card Styling */
    .card {
      background: #fff;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      border-radius: 8px;
      height:500px;
      width:400px;
      overflow: hidden;
      transition: transform 0.3s ease;
     
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100%;
      height: 65%;
      display: block;
    }

    .card-body {
      padding: 20px;
    }

    .card-title {
      font-size: 1.2rem;
      color: #3F51B5;
      margin-bottom: 10px;
        text-decoration: none;
    }

    .card-text {
      font-size: 0.95rem;
      color: #444;
        text-decoration: none;
    }
    
    .card-link {
  text-decoration: none;
  color: inherit;
  display: block;
}
    .btn {
    display: inline-block;
    background-color: #E6A519;
    color: #ffffff;
    padding: 8px 20px;
    text-decoration: none;
    border: none;
    border-radius: 2px;
    font-family: 'Montserrat', sans-serif;
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: all 0.3s ease;
    font-weight: 600;
    align-items:center;
    margin-top:20px;
}

.btn:hover {
    background-color: #000000;
    color: #ffffff;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
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

  <!-- Cards Section -->
 <div class="container">
  <h2 class="section-title">Our Packages</h2>

  <p class="header">
    We plan every detail of your wedding day to perfection, creating a celebration that's a true reflection of your love story and personal style.
  </p>

  <div class="grid">

    <!-- Card 1 -->
    <div class="card">
      <img src="images/wed2.webp" alt="Service 1">
      <div class="card-body">
        <h5 class="card-title">Wedding Planning</h5>
        <p class="card-text">Craft unforgettable weddings with our expert coordination and design services.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

    <!-- Card 2 -->
    <div class="card">
      <img src="images/coop.jpg" alt="Service 2">
      <div class="card-body">
        <h5 class="card-title">Corporate Events</h5>
        <p class="card-text">Seamless execution for meetings, launches, and business celebrations.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

    <!-- Card 3 -->
    <div class="card">
      <img src="images/pvtparty.jpg" alt="Service 3">
      <div class="card-body">
        <h5 class="card-title">Private Parties</h5>
        <p class="card-text">From birthdays to anniversaries, we handle every detail for you.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

    <!-- Card 4 -->
    <div class="card">
      <img src="images/venue.jpg" alt="Service 4">
      <div class="card-body">
        <h5 class="card-title">Venue Booking</h5>
        <p class="card-text">Find the perfect venue for any occasion—indoors or outdoors.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

    <!-- Card 5 -->
    <div class="card">
      <img src="images/catering.jpg" alt="Service 5">
      <div class="card-body">
        <h5 class="card-title">Catering & Decor</h5>
        <p class="card-text">Delicious food and stunning themes customized to your event style.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

    <!-- Card 6 -->
    <div class="card">
      <img src="images/promo.jpg" alt="Service 6">
      <div class="card-body">
        <h5 class="card-title">Event Promotion</h5>
        <p class="card-text">Reach the right audience and make your event stand out online.</p>
        <a href="packDetail1.jsp" class="btn">Learn More</a>
      </div>
    </div>

  </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>