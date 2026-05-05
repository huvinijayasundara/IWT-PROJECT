<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Event Planner Dashboard</title>
  <link rel="shortcut icon" href="images/log3.png" type="image/x-icon">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: #fdf7f2;
      color: #333;
    }

    .container-fluid {
      width: 100%;
      display: flex;
      flex-wrap: nowrap;
    }

    .row {
      display: flex;
      flex-wrap: nowrap;
      width: 100%;
      margin: 0;
    }


    .sidebar {
      width: 16.6667%;
      background-color: #fff;
      height: 100vh;
      border-right: 1px solid #eee;
      padding: 2rem 1rem;
      display: flex;
      flex-direction: column;
    }

    .sidebar a {
      text-decoration: none;
      color: #333;
      margin: 1rem 0;
      display: flex;
      align-items: center;
    }

    .sidebar a.active {
      font-weight: bold;
    }

    .sidebar .profile-icon {
      width: 100px;
      height: 100px;
      border-radius : 50px;
      margin-bottom: 1rem;
    }

    .sidebar .field {
      margin-bottom: 0.5rem;
    }

    .sidebar .field label {
      font-weight: bold;
      display: block;
      margin-bottom: 0.2rem;
    }

    .sidebar .field .value {
      font-size: 0.9rem;
    }
	    .btn1 {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background-color: rgb(151, 43, 33);
	  color: #ffffff;
	  padding: 12px 0; /* Vertical padding only */
	  width: 100%; /* or a fixed width if needed */
	  text-align: center;
	  text-decoration: none;
	  border: none;
	  border-radius: 2px;
	  font-family: 'Montserrat', sans-serif;
	  font-size: 14px;
	  letter-spacing: 1px;
	  text-transform: uppercase;
	  transition: all 0.3s ease;
	  font-weight: 600;
	}
		
	   .btn1:hover {
		    background-color: #000000;
		    color: #ffffff;
		    transform: translateY(-3px);
		    box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
		}

    .main-content {
      width: 66.6667%;
      padding: 1.5rem;
    }

    .right-sidebar {
      width: 16.6667%;
      background: #fff;
      height: 100vh;
      border-left: 1px solid #eee;
      padding: 1.5rem;
    }

    .project-card {
      border-radius: 20px;
      padding: 1rem;
      color: white;
      min-height: 160px;
      margin-bottom: 1rem;
    }

    .purple { background-color: #6A0DAD; }
    .teal { background-color: #70c9c9; }
    .orange { background-color: #FF6F3C; }

    .project-card h6 {
      margin: 0 0 0.5rem;
      font-size: 1rem;
    }

    .project-card p {
      margin: 0;
      font-size: 0.75rem;
    }

.black-card-link {
  background-color: #000;
  color: #fff;
  text-decoration: none;
  border-radius: 20px;
  padding: 1rem;
  min-height: 160px;
  display: block;
  text-align: center;
  transition: transform 0.2s ease, background-color 0.2s ease;
}

.black-card-link:hover {
  background-color: #111;
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

    .task-box {
      background-color: #fff;
      border-radius: 15px;
      padding: 1rem;
      margin-bottom: 1rem;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .task-box strong {
      font-size: 0.9rem;
    }

    .task-box small {
      font-size: 0.75rem;
      color: #6c757d;
    }

    .calendar-box {
      background: #fff;
      border-radius: 15px;
      padding: 1rem;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .stat-box {
      background: #fff;
      border-radius: 15px;
      padding: 1.2rem;
      text-align: center;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .stat-box h5 {
      margin: 0;
      font-size: 1.25rem;
      font-weight: bold;
    }

    .stat-box small {
      font-size: 0.75rem;
      color: #6c757d;
    }

    .avatar {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 0.5rem;
    }

    .calendar-event {
      margin-bottom: 1rem;
      font-size: 14px;
    }

    .calendar-event span {
      display: block;
      font-weight: bold;
      margin-bottom: 0.2rem;
    }

    .calendar-event .text-muted {
      color: #6c757d;
      font-size: 0.85rem;
    }

    .price-box {
      background: #fff;
      padding: 1rem;
      border-radius: 15px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
      text-align: center;
    }
    
    .price-box:hover{
     background-color:	#010f26;
      transform: translateY(-2px);
     box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
     color:white;
    }

    .price-box h6 {
      margin: 0 0 0.5rem;
      font-size: 1rem;
    }

    .price-box p {
      margin: 0 0 0.25rem;
      font-size: 0.9rem;
    }

    .price-box small {
      font-size: 0.75rem;
      color: #6c757d;
    }

    .row.g-3 {
      display: flex;
      flex-wrap: wrap;
      margin-left: -0.5rem;
      margin-right: -0.5rem;
    }

    .row.g-3 > * {
      padding-left: 0.5rem;
      padding-right: 0.5rem;
    }

    .col-4 {
      width: 33.3333%;
    }

    .col-md-4 {
      width: 33.3333%;
    }

    .col-md-6 {
      width: 50%;
    }

    .d-flex {
      display: flex;
    }

    .flex-column {
      flex-direction: column;
    }

    .justify-content-between {
      justify-content: space-between;
    }

    .align-items-center {
      align-items: center;
    }

    .mb-0 { margin-bottom: 0; }
    .mb-1 { margin-bottom: 0.25rem; }
    .mb-2 { margin-bottom: 0.5rem; }
    .mb-3 { margin-bottom: 1rem; }
    .mb-4 { margin-bottom: 1.5rem; }
    .mt-4 { margin-top: 1.5rem; }

    .text-muted {
      color: #6c757d;
    }

    .text-center {
      text-align: center;
    }

    .btn {
      display: inline-block;
      padding: 0.5rem 1rem;
      font-size: 0.875rem;
      font-weight: 500;
      text-align: center;
      text-decoration: none;
      border-radius: 0.25rem;
      cursor: pointer;
    }

    .btn-dark {
      background-color: #212529;
      color: #fff;
      border: 1px solid #212529;
    }

    .btn-dark:hover {
      background-color: #343a40;
      border-color: #343a40;
    }

    h4 {
      font-size: 1.5rem;
      font-weight: 500;
      margin: 0 0 0.5rem;
    }

    h5 {
      font-size: 50px;
      font-weight: 500;
      margin: 0;
      text-align:center;
    }

    h6 {
    text-align:center;
      font-size: 1rem;
      font-weight: 500;
      margin: 0 0 0.5rem;
    }

    p {
      margin: 0 0 1rem;
      font-size: 0.875rem;
    }

    small {
      font-size: 0.75rem;
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <div class="sidebar d-flex flex-column">
      <c:forEach var="pln" items="${plnDetails}">
        <div class="sidebar">
            <img class="profile-icon" src="images/logIcon.png" alt="Supplier Profile">
             <div class="field"><label>Your Details</label></div>
            <div class="field"><label> Planner ID</label><div class="value">${pln.supId}</div></div>
            <div class="field"><label>Name</label><div class="value">${pln.name}</div></div>
            <div class="field"><label>Address</label><div class="value">${pln.address}</div></div>
            <div class="field"><label>Phone</label><div class="value">${pln.phone}</div></div>
            <div class="field"><label>Email</label><div class="value">${pln.email}</div></div>
            <div class="field"><label>Username</label><div class="value">${pln.userName}</div></div>
            <div class="field"><label>Password</label><div class="value">${pln.password}</div></div>
            
            
        </div>
      </c:forEach>
    </div>


    <!-- Main Dashboard -->
    <div class="main-content">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
         <h4>Hello,  <%= session.getAttribute("uName") %></h4>
         
         <div class="header-date">
                <%
                    LocalDate today = LocalDate.now();
                    String day = today.getDayOfMonth() + (today.getDayOfMonth() % 10 == 1 && today.getDayOfMonth() != 11 ? "st" : 
                                  today.getDayOfMonth() % 10 == 2 && today.getDayOfMonth() != 12 ? "nd" : 
                                  today.getDayOfMonth() % 10 == 3 && today.getDayOfMonth() != 13 ? "rd" : "th");
                    String month = today.getMonth().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                    String year = String.valueOf(today.getYear());
                    String formattedDate = "Today is "+day + " of " + month + " " + year;
                %>
                <%= formattedDate %>
            </div>
        
        </div>
       
      </div>
      

      <!-- Project Cards -->
      <div class="row g-3 mb-4">
        <div class="col-md-4">
          <div class="project-card purple">
           <h5>07</h5>
            <h6>Upcoming Events</h6>
           
          </div>
        </div>
        <div class="col-md-4">
          <div class="project-card teal">
            <h5>03</h5>
            <h6>Completed Events</h6>
          
          </div>
        </div>
        
		      <div class="col-md-4">
		  <a href="showEvent" class="project-card black-card-link">
		    <h5>+</h5>
		    <h6>Add New Event</h6>
		  </a>
		</div>

      </div>

      <!-- Task + Stats -->
      <div class="row g-3">
        <!-- Task List -->
        <div class="col-md-6">
          <h6>Tasks for Today</h6>
          <div class="task-box">
            <strong>Client Call - Johnson</strong><br>
            <small>10:00 AM</small>
          </div>
          <div class="task-box">
            <strong>Vendor Site Visit</strong><br>
            <small>1:00 PM</small>
          </div>
          <div class="task-box">
            <strong>Confirm Catering</strong><br>
            <small>3:30 PM</small>
          </div>
        </div>

        <!-- Statistics -->
        <div class="col-md-6">
          <h6>Statistics</h6>
          <div class="row g-3">
            <div class="col-4">
              <div class="stat-box">
                <h5>Message</h5>
                <small>Admin</small>
              </div>
            </div>
            <div class="col-4">
              <div class="stat-box">
                <h5>12</h5>
                <small>Suppliers Available</small>
              </div>
            </div>
            <div class="col-4">
              <div class="stat-box">
                <h5>New</h5>
                <small>Package</small>
              </div>
            </div>
          </div>

<div class="mt-4 price-box text-center">
  <form action="showAllEventsServlet" method="post" style="all: unset;">
    <button type="submit" style="all: unset; cursor: pointer; width: 100%;">
      <h6>Submitted events</h6>
      <p class="mb-1">Send suggestions to client submited requests</p>
      <small>See more</small>
    </button>
  </form>
</div>

     


        </div>
      </div>
    </div>

 <!-- Right Calendar Panel -->
<div class="right-sidebar">
  <h6 class="mb-3">Calendar</h6>

  <div class="calendar-event">
    <span>May 25, 2025</span>
    <div class="text-muted">10:00 AM  Venue Booking with Client</div>
    <div class="text-muted">2:00 PM  Decor Team Meeting</div>
  </div>

  <div class="calendar-event">
    <span>May 27, 2025</span>
    <div class="text-muted">11:00 AM  Catering Finalization</div>
    <div class="text-muted">3:00 PM Bridal Walkthrough</div>
  </div>

  <div class="calendar-event">
    <span>May 30, 2025</span>
    <div class="text-muted">9:00 AM  Sound & Lighting Setup</div>
    <div class="text-muted">1:30 PM  Stage Rehearsal</div>
  </div>

  <div class="calendar-event">
    <span>June 1, 2025</span>
    <div class="text-muted">10:00 AM  Guest List Confirmation</div>
    <div class="text-muted">4:00 PM  Photographer Briefing</div>
  </div>

  <div class="calendar-event">
    <span>June 3, 2025</span>
    <div class="text-muted">12:00 PM  Final Dress Fitting</div>
    <div class="text-muted">3:30 PM  Transportation Arrangements</div>
  </div>
  
    <div class="calendar-event">
    <span>June 17, 2025</span>
    <div class="text-muted">11:00 AM  Guest List Confirmation</div>
    <div class="text-muted">4:45 PM  Photographer Briefing</div>
  </div>

  <div class="calendar-event">
    <span>June 28, 2025</span>
    <div class="text-muted">12:00 PM  Final Dress Fitting</div>
    <div class="text-muted">3:30 PM  Transportation Arrangements</div>
  </div>
  
  <a href="login.jsp" class="btn1">Logout</a>
</div>

    
  </div>
</div>

</body>
</html>