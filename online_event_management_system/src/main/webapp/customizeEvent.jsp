<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Event Planning</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 15px;
    }
    
    .main {
        max-width: 1000px;
        width: 100%;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        border: 2px solid #ffd700;
        padding: 30px;
        transition: transform 0.2s ease;
    }
    
    .main:hover {
        transform: translateY(-2px);
    }
    
    .section-title {
        font-size: 28px;
        color: #333;
        text-align: center;
        margin-bottom: 25px;
        font-weight: 500;
        letter-spacing: 0.5px;
    }
    
    .custom-event {
        width: 100%;
    }
    
    .category-heading {
        font-size: 20px;
        color: #333;
        padding-bottom: 12px;
        margin-bottom: 20px;
        border-bottom: 2px solid #ffd700;
        font-weight: 500;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group label {
        display: block;
        text-align: left;
        margin: 12px 0 6px;
        color: #333;
        font-weight: 500;
        font-size: 15px;
    }
    
    .form-group select,
    .form-group input[type="date"],
    .form-group input[type="number"],
    .form-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 14px;
        background-color: #fafafa;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    
    .form-group select:focus,
    .form-group input[type="date"]:focus,
    .form-group input[type="number"]:focus,
    .form-group textarea:focus {
        border-color: #ffd700;
        box-shadow: 0 0 8px rgba(255, 215, 0, 0.2);
        outline: none;
    }
    
    .form-group textarea {
        resize: vertical;
    }
    
    .reference-note {
        color: #666;
        font-size: 14px;
        margin-bottom: 20px;
        font-style: italic;
    }
    
    .tabs {
        display: flex;
        gap: 12px;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }
    
    .tab-btn {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        background-color: #f5f5f5;
        color: #333;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    }
    
    .tab-btn:hover {
        background-color: #e0e0e0;
        transform: translateY(-2px);
    }
    
    .tab-btn.active {
        background-color: #ffd700;
        color: black;
        transform: translateY(-2px);
    }
    
    .tab-content {
        display: none;
    }
    
    .tab-content.active {
        display: block;
    }
    
    .extras-container {
        background-color: #f5f5f5;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #eee;
    }
    
    .pricing-cards {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 20px;
    }
    
    .price-card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        padding: 15px;
        text-align: center;
        border: 1px solid #eee;
        transition: transform 0.2s ease, box-shadow 0.3s ease;
    }
    
    .price-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .price-card-header {
        font-size: 16px;
        font-weight: 500;
        color: #333;
        margin-bottom: 12px;
        border-bottom: 1px solid #eee;
        padding-bottom: 8px;
    }
    
    .price-card-body {
        font-size: 14px;
    }
    
    .price-card-description {
        color: #666;
        margin-bottom: 12px;
        line-height: 1.4;
    }
    
    .price-card-price {
        font-weight: 500;
        color: #333;
        background-color: #fff9e6;
        padding: 5px 10px;
        border-radius: 4px;
        display: inline-block;
    }
    
    .btn-gold {
        background-color: #ffd700;
        color: black;
        border: none;
        padding: 12px 30px;
        border-radius: 6px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        font-size: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    .btn-gold:hover {
        background-color: #e6c200;
        transform: translateY(-2px);
    }
    
    @media (max-width: 768px) {
        .main {
            padding: 15px;
        }
        
        .pricing-cards {
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
        }
    }
</style>
</head>
<body>
    <main class="main">
        <h1 class="section-title">Custom Event Planning</h1>
        
        <form class="custom-event" action="createCustomEventServlet" method="post">
            <h2 class="category-heading">Basic Event Information</h2>
            
            <div class="form-group">
                <label for="event-type">Event Type</label>
                <select id="event-type" name="type" required>
                    <option value="">Select Event Type</option>
                    <option value="wedding">Wedding</option>
                    <option value="corporate">Corporate Event</option>
                    <option value="birthday">Birthday Party</option>
                    <option value="anniversary">Anniversary</option>
                    <option value="graduation">Graduation Party</option>
                    <option value="baby-shower">Baby Shower</option>
                    <option value="other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="event-date">Event Date</label>
                <input type="date" id="event-date" name="date" required>
            </div>
            
            <div class="form-group">
                <label for="guests">Number of Guests</label>
                <input type="number" id="guests" name="guests" min="10" max="500" required>
            </div>
            
            <div class="form-group">
                <label for="event-location">Event Location</label>
                <select id="event-location" name="location" required>
                    <option value="">Select Location</option>
                    <option value="Grand Ballroom">Grand Ballroom</option>
                    <option value="Garden Terrace">Garden Terrace</option>
                    <option value="Urban Loft Space">Urban Loft Space</option>
                    <option value="Beach Resort">Beach Resort</option>
                    <option value="custom">Other</option>
                </select>
            </div>
            
            <h2 class="category-heading">Customize Your Event</h2>
            
            <div class="form-group">
                <label>Decoration Theme</label>
                <select id="decoration-theme" name="theme">
                    <option value="">Select a Theme</option>
                    <option value="classic">Classic Elegance</option>
                    <option value="modern">Modern Chic</option>
                    <option value="rustic">Rustic Charm</option>
                    <option value="bohemian">Bohemian</option>
                    <option value="minimalist">Minimalist</option>
                    <option value="glamorous">Glamorous</option>
                    <option value="themed">Custom Theme (specify below)</option>
                </select>
            </div>
            
            <h2 class="category-heading">Service Options</h2>
            
            <p class="reference-note">Browse through our service options below to see what's available for your event.</p>
            
            <div class="tabs">
                <button type="button" class="tab-btn active" data-tab="decoration">Decoration</button>
                <button type="button" class="tab-btn" data-tab="entertainment">Entertainment</button>
                <button type="button" class="tab-btn" data-tab="catering">Catering</button>
                <button type="button" class="tab-btn" data-tab="photography">Photography</button>
            </div>
            
            <div class="extras-container">
                <div id="decoration" class="tab-content active">
                    <div class="pricing-cards">
                        <div class="price-card">
                            <div class="price-card-header">Premium Florals</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Luxury floral arrangements for tables and venue entrance</div>
                                <div class="price-card-price">$350</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Backdrop Installation</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Custom designed backdrop for photo opportunities</div>
                                <div class="price-card-price">$500</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Balloon Arch</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Elegant balloon decoration in your chosen colors</div>
                                <div class="price-card-price">$300</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Chair Covers & Sashes</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Elegant covers and sashes for all chairs</div>
                                <div class="price-card-price">$8/chair</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Premium Linens</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Luxury table linens in your selected colors</div>
                                <div class="price-card-price">$25/table</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Lighting Package</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional ambient lighting to enhance the space</div>
                                <div class="price-card-price">$650</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Centerpieces</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Custom centerpieces for each table</div>
                                <div class="price-card-price">$75/table</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Entrance Decor</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Special decoration for the entrance area</div>
                                <div class="price-card-price">$400</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="entertainment" class="tab-content">
                    <div class="pricing-cards">
                        <div class="price-card">
                            <div class="price-card-header">Live Band (4 hours)</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional live band with customizable playlist</div>
                                <div class="price-card-price">$1,500</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">DJ Service (4 hours)</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional DJ with lighting equipment</div>
                                <div class="price-card-price">$600</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Photo Booth (3 hours)</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Interactive photo booth with props and unlimited prints</div>
                                <div class="price-card-price">$450</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">String Quartet (2 hours)</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Elegant background music for reception or dinner</div>
                                <div class="price-card-price">$800</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Dance Floor</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional dance floor setup with optional lighting</div>
                                <div class="price-card-price">$750</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Live Performer</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Specialty performer (magician, dancer, etc.)</div>
                                <div class="price-card-price">$600</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">MC/Host</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional master of ceremonies</div>
                                <div class="price-card-price">$500</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Audio Equipment Rental</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Sound system with microphones</div>
                                <div class="price-card-price">$350</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="catering" class="tab-content">
                    <div class="pricing-cards">
                        <div class="price-card">
                            <div class="price-card-header">Premium Open Bar (4 hours)</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Full-service open bar with premium spirits</div>
                                <div class="price-card-price">$2,500</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Dessert Station</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Gourmet dessert buffet with assorted sweets</div>
                                <div class="price-card-price">$600</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Late Night Snacks</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Selection of crowd-pleasing snacks for late evening</div>
                                <div class="price-card-price">$450</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Champagne Toast</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Champagne service for all guests for toasting</div>
                                <div class="price-card-price">$12/person</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Specialty Cocktail</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Custom signature cocktail for your event</div>
                                <div class="price-card-price">$400</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Food Station</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Interactive food station with chef (pasta, carving, etc.)</div>
                                <div class="price-card-price">$800</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Premium Menu Upgrade</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Upgrade from standard to premium menu options</div>
                                <div class="price-card-price">$18/person</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Custom Cake</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Custom designed cake for your event</div>
                                <div class="price-card-price">Starting at $350</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="photography" class="tab-content">
                    <div class="pricing-cards">
                        <div class="price-card">
                            <div class="price-card-header">Professional Photography</div>
                            <div class="price-card-body">
                                <div class="price-card-description">6 hours of professional photography coverage</div>
                                <div class="price-card-price">$1,200</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Videography Package</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional video coverage with edited highlight reel</div>
                                <div class="price-card-price">$1,800</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Drone Coverage</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Aerial photography and video of venue and event</div>
                                <div class="price-card-price">$500</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Live Streaming</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional live streaming for remote guests</div>
                                <div class="price-card-price">$600</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Photo Album</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Professional photo album with 40 images</div>
                                <div class="price-card-price">$350</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Additional Hour</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Extra hour of photography coverage</div>
                                <div class="price-card-price">$200/hour</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Second Photographer</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Additional photographer for comprehensive coverage</div>
                                <div class="price-card-price">$600</div>
                            </div>
                        </div>
                        
                        <div class="price-card">
                            <div class="price-card-header">Same-Day Edit</div>
                            <div class="price-card-body">
                                <div class="price-card-description">Photo slideshow ready to view at your event</div>
                                <div class="price-card-price">$500</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-group" style="margin-top: 2rem;">
                <label for="additional-requests">Enter services you need from above</label>
                <textarea id="additional-requests" rows="4" name="services" placeholder="Please list any services from above you'd like to include and any additional requests or requirements for your event...
                                                           Premium Florals, Balloon Arch etc.."></textarea>
            </div>
            
            <div style="margin-top: 2rem; text-align: center;">
                <button type="submit" class="btn-gold">Submit Event Request</button>
            </div>
        </form>
    </main>
    
    <script>
        // Tab functionality
        const tabBtns = document.querySelectorAll('.tab-btn');
        const tabContents = document.querySelectorAll('.tab-content');
        
        tabBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const target = btn.dataset.tab;
                
                // Remove active class from all buttons and content
                tabBtns.forEach(b => b.classList.remove('active'));
                tabContents.forEach(c => c.classList.remove('active'));
                
                // Add active class to clicked button and corresponding content
                btn.classList.add('active');
                document.getElementById(target).classList.add('active');
            });
        });
    </script>
</body>
</html>