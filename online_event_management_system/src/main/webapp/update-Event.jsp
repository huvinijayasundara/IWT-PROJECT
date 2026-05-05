<%@ page import="service.EventServices" %>

<%@ page import="model.Event" %>

<% Event evv = EventServices.getEventById(request.getParameter("eventId")); %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Event</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container py-5">
  <div class="col-md-6 mx-auto">
    <div class="card">
      <div class="card-header bg-dark text-white">Update Event Details</div>
      <div class="card-body">
        <form action="updateEvent" method="post">
        
          <div class="mb-2">
            <label class="form-label">Event ID</label>
            <input type="text" name="eventId" class="form-control" value="<%= evv.getEventId() %>" readonly />
          </div>

          <div class="mb-2">
            <label class="form-label">Event Name</label>
            <input type="text" name="eventName" class="form-control" value="<%= evv.getEventName() %>" required />
          </div>

          <div class="mb-2">
            <label class="form-label">Event Type</label>
            <input type="text" name="eventType" class="form-control" value="<%= evv.getEventType() %>" required />
          </div>

          <div class="mb-2">
            <label class="form-label">Client Name</label>
            <input type="text" name="clientName" class="form-control" value="<%= evv.getClientName() %>" required />
          </div>

          <div class="mb-2">
            <label class="form-label">Email</label>
            <input type="text" name="email" class="form-control" value="<%= evv.getEmail()%>" required />
          </div>
          <div class="mb-2">
            <label class="form-label">Phone number</label>
            <input type="tel" name="phone" class="form-control" value="<%= evv.getPhone()%>" required />
          </div>
          
           <div class="mb-2">
             <label class="form-label">Event Date</label>
             <input type="date" id="eventDate" name="eventDate" value="<%= evv.getEventdate()%>"   required />
           </div>

          <div class="mb-2">
            <label class="form-label">Selected Package</label>
            <select name="package" class="form-select">
              <option value="Basic" <%= "Basic".equals(evv.getSelPackage()) ? "selected" : "" %>>Basic</option>
              <option value="Premium" <%= "Premium".equals(evv.getSelPackage()) ? "selected" : "" %>>Premium</option>
              <option value="VIP" <%= "VIP".equals(evv.getSelPackage()) ? "selected" : "" %>>VIP</option>
            </select>
          </div>

          <div class="mb-2">
			  <label class="form-label">Services</label><br>
			  <%
			    String services = evv.getSelServices(); // e.g., "Catering,Photography"
			  %>
			  <input type="checkbox" name="services" value="Catering" <%= services != null && services.contains("Catering") ? "checked" : "" %>> Catering
			  <input type="checkbox" name="services" value="Photography" <%= services != null && services.contains("Photography") ? "checked" : "" %>> Photography
			  <input type="checkbox" name="services" value="Decorations" <%= services != null && services.contains("Decorations") ? "checked" : "" %>> Decorations
			  <input type="checkbox" name="services" value="Entertainment" <%= services != null && services.contains("Entertainment") ? "checked" : "" %>> Entertainment
			</div>


          <div class="mb-2">
            <label class="form-label">Notes</label>
            <textarea name="notes" class="form-control"><%= evv.getText() %></textarea>
          </div>

 <div class="mb-2">
	       <label for="status" class="form-label">Status</label>
         <select id="status" name="status">
    <option value="confirmed" <%= "upcoming".equals(evv.getStatus()) ? "selected" : "" %>>Confirmed</option>
    <option value="completed" <%= "completed".equals(evv.getStatus()) ? "selected" : "" %>>Completed</option>
       </select>
       </div>
          <div class="text-center">
            <button type="submit" class="btn btn-primary">Update Event</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
