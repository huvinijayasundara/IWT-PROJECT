<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Magical Moments | Luxury Event Management</title>
      <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/eventhome.css" />

  <!-- Font Awesome + Google Fonts -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
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


<!-- Hero Section with Bootstrap Carousel -->
<section class="hero">
  <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">

      <div class="carousel-item active" style="background-image: url('images/wed2.webp'); background-size: cover; background-position: center;">
        <div class="carousel-content d-flex flex-column align-items-center justify-content-center text-white text-center h-100 bg-dark bg-opacity-50">
          <h1>Exquisite Wedding Planning</h1>
          <p>Luxury event planning for life's most cherished celebrations. We transform your vision into an extraordinary reality.</p>
          <a href="#contact" class="btn">Plan Your Event</a>
        </div>
      </div>

      <div class="carousel-item" style="background-image: url('images/home2.jpg'); background-size: cover; background-position: center;">
        <div class="carousel-content d-flex flex-column align-items-center justify-content-center text-white text-center h-100 bg-dark bg-opacity-50">
          <h1>Co-operate Event Planning</h1>
          <p>From intimate ceremonies to grand celebrations, we craft weddings that reflect your unique love story.</p>
          <a href="#packages" class="btn">View Our Packages</a>
        </div>
      </div>

      <div class="carousel-item" style="background-image: url('images/home3.jpg'); background-size: cover; background-position: center;">
        <div class="carousel-content d-flex flex-column align-items-center justify-content-center text-white text-center h-100 bg-dark bg-opacity-50">
          <h1>Memorable Celebrations</h1>
          <p>Every detail meticulously planned to create an event that exceeds your expectations.</p>
          <a href="#specializations" class="btn">Explore Services</a>
        </div>
      </div>

    </div>

    <!-- Controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>

    <!-- Indicators -->
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
  </div>
</section>

  <!-- About Section -->
    <section class="about" id="about">
        <div class="container">
            <h2 class="section-title">About Us</h2>
            <div class="about-content">
                <div class="about-text">
                    <h3>Creating Elegant Memories Since 2015</h3>
                    <p>At Elegance Events, we believe that every celebration should be as unique as the individuals hosting it. We are passionate about transforming your vision into an unforgettable experience that exceeds your expectations.</p>
    
                    <p>We pride ourselves on our personalized apprith each client to understand their preferences, style, and budget. Our commitment to excellence has made us a trusted name in luxury event planning.</p>
                    <a href="#contact" class="btn">Get in Touch</a>
                </div>
              <!--   <div class="about-image">
                    <img src="images/wed1.jpg" alt="Elegant event setting">
                </div> -->
            </div>
        </div>
    </section>
<!-- Specializations Section -->
    <section class="specializations" id="specializations">
        <div class="container">
            <h2 class="section-title">Why Us</h2>
               <p id="sp">At Elegance Events, we believe that every celebration should be as unique as the individuals hosting it. We are passionate about transforming your vision into an unforgettable experience that exceeds your expectations.</p>
                    <p id="sp">We pride ourselves on our personalized apprith each client to understand their preferences, style, and budget. Our commitment to excellence has made us a trusted name in luxury event planning.</p>
            <div class="specializations-grid">
                <div class="specialization-item">
                    <div class="specialization-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Weddings</h3>
                    <p>We plan every detail of your wedding day to perfection, creating a celebration that's a true reflection of your love story and personal style.</p>
                </div>
                <div class="specialization-item">
                    <div class="specialization-icon">
                        <i class="fas fa-glass-cheers"></i>
                    </div>
                    <h3>Private Parties</h3>
                    <p>From milestone birthdays to anniversary celebrations, we design sophisticated and memorable private events for any occasion.</p>
                </div>
                <div class="specialization-item">
                    <div class="specialization-icon">
                        <i class="fas fa-ring"></i>
                    </div>
                    <h3>Proposal Events</h3>
                    <p>We create magical moments for your perfect proposal, handling all the details so you can focus on the big question.</p>
                </div>
                <div class="specialization-item">
                    <div class="specialization-icon">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <h3>Corporate Functions</h3>
                    <p>Elevate your corporate events with our professional planning services, from sophisticated galas to team-building retreats.</p>
                </div>
               
                
            </div>
        </div>
    </section>

    <!-- Packages Section -->
   <section class="specializations" id="specializations">
        <div class="container">
            <h2 class="section-title">Our Packages</h2>
               <p id="sp">At Elegance Events, we believe that every celebration should be as unique as the individuals hosting it. We are passionate about transforming your vision into an unforgettable experience that exceeds your expectations.</p>
	                    <p id="sp">We pride ourselves on our personalized apprith each client to understand their preferences, style, and budget. Our commitment to excellence has made us a trusted name in luxury event planning.</p>
			 
			  <!-- Rectangle Section -->
			<section class="vertical-rectangle-container">
			  <div class="vertical-subpart">
			    <img src="images/wed1.jpg" alt="Floating Cabana">
			    <h3>Wedding</h3>
			  </div>
			  <div class="vertical-subpart">
			    <img src="images/wed2.webp" alt="Floating Green House">
			    <h3>Birthday Party</h3>
			  </div>
			  <div class="vertical-subpart">
			    <img src="images/wed3.webp" alt="Floating Pool">
			    <h3>Proposal Surprises</h3>
			  </div>
			  <div class="vertical-subpart">
			    <img src="images/wed4.webp" alt="Floating Restaurant">
			    <h3>Co-operate Events</h3>
			  </div>
			</section>

         </div>
     </section>  

    <!-- Testimonials Section -->
    <section class="testimonials" id="testimonials">
        <div class="container">
            <h2 class="section-title">Client Testimonials</h2>
            <p id="sp">At Elegance Events, we believe that every celebration should be as unique as the individuals hosting it. We are passionate about transforming your vision into an unforgettable experience that exceeds your expectations.</p>
                    <p id="sp">We pride ourselves on our personalized apprith each client to understand their preferences, style, and budget. Our commitment to excellence has made us a trusted name in luxury event planning.</p>
            <div class="testimonials-slider">
                <div class="testimonial-item active">
                    <div class="testimonial-content">
                        <p>"Elegance Events transformed our wedding vision into a reality beyond our wildest dreams. Their attention to detail, creativity, and flawless execution made our special day absolutely perfect. We couldn't have asked for a better team to plan the most important day of our lives."</p>
                    </div>
                    <div class="testimonial-author">
                        <img src="images/we.jpg" alt="Sarah & Michael">
                        <h4>Sarah & Michael Thompson</h4>
                        <p>Wedding, May 2024</p>
                    </div>
                </div>
                <div class="testimonial-item">
                    <div class="testimonial-content">
                        <p>"Working with Elegance Events for our company's annual gala was the best decision we made. Their professionalism, innovative ideas, and ability to manage every detail allowed us to focus on our guests while they handled all the logistics. The event was sophisticated, seamless, and received rave reviews."</p>
                    </div>
                    <div class="testimonial-author">
                        <img src="/api/placeholder/80/80" alt="Robert Anderson">
                        <h4>Robert Anderson</h4>
                        <p>Corporate Gala, March 2024</p>
                    </div>
                </div>
                <div class="testimonial-item">
                    <div class="testimonial-content">
                        <p>"I enlisted Elegance Events to help plan my proposal, and they created a moment straight out of a fairytale. Every detail was perfect, from the flowers to the photographer they arranged to capture the moment. My fiancée was completely surprised and overjoyed. We'll definitely be using them for our wedding planning!"</p>
                    </div>
</section>
<!-- Bootstrap JS (required for carousel) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="footer.jsp" />


</body>
</html>