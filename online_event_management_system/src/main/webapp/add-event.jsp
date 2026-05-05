<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Event</title>
  <script src="js/eventValidation.js"></script>
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      margin: 0;
      padding: 0;
    }

    body {
      background: #ffffff;
      min-height: 100vh;
      color: #1a1a1a;
    }

    .container {
      max-width: 100%;
      margin: 0 auto;
      padding: 2rem 2rem;
    }

    .row {
      display: flex;
      flex-wrap: wrap;
      margin-bottom: 2rem;
      gap: 1.5rem;
    }

    .justify-content-between { justify-content: space-between; }
    .justify-content-center { justify-content: center; }
    .align-items-center { align-items: center; }
    .text-center { text-align: center; }
    .text-end { text-align: right; }

    h2 {
      font-size: 2.25rem;
      font-weight: 700;
      color: #1a1a1a;
      margin-bottom: 2rem;
      text-align: center;
      letter-spacing: -0.025em;
      width: 100%;
    }

    .btn {
      padding: 0.75rem 1.5rem;
      font-size: 0.875rem;
      font-weight: 500;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background: linear-gradient(45deg, #d4af37, #f0c14b);
      color: #1a1a1a;
    }

    .btn-primary:hover {
      background: linear-gradient(45deg, #b8860b, #d4af37);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(216, 175, 55, 0.3);
    }

    .btn-outline-secondary {
      background: transparent;
      border: 2px solid #1a1a1a;
      color: #1a1a1a;
    }

    .btn-outline-secondary:hover {
      background: #1a1a1a;
      color: #ffffff;
      transform: translateY(-2px);
    }

    .btn-outline-primary {
      background: transparent;
      border: 2px solid #d4af37;
      color: #d4af37;
    }

    .btn-outline-primary:hover {
      background: #d4af37;
      color: #1a1a1a;
      transform: translateY(-2px);
    }

    .btn-outline-danger {
      background: transparent;
      border: 2px solid #a71d2a;
      color: #a71d2a;
    }

    .btn-outline-danger:hover {
      background: #a71d2a;
      color: #ffffff;
      transform: translateY(-2px);
    }

    .card {
      background: #ffffff;
      border: none;
      border-radius: 12px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
      margin-bottom: 2rem;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    }

    .card-header {
      padding: 1rem 2rem;
      font-size: 1.25rem;
      font-weight: 600;
      border-bottom: none;
    }

    .bg-dark {
      background: linear-gradient(90deg, #1a1a1a, #333333);
      color: #ffffff;
    }

    .bg-secondary {
      background: linear-gradient(90deg, #4a4a4a, #666666);
      color: #ffffff;
    }

    .card-body {
      padding: 2.5rem;
    }

    .form-label {
      font-weight: 600;
      font-size: 0.875rem;
      color: #1a1a1a;
      margin-bottom: 0.5rem;
      display: block;
    }

    input[type="text"],
    input[type="date"],
    textarea,
    select {
      width: 100%;
      padding: 0.75rem;
      font-size: 0.875rem;
      border: 1px solid #d1d5db;
      border-radius: 8px;
      background: #f9f9f9;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input:focus,
    textarea:focus,
    select:focus {
      outline: none;
      border-color: #d4af37;
      box-shadow: 0 0 0 3px rgba(216, 175, 55, 0.1);
    }

    .form-check {
      margin-right: 1.5rem;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
    }

    .form-check-input {
      width: 1.25rem;
      height: 1.25rem;
      accent-color: #d4af37;
    }

    .form-select {
      width: 100%;
    }

    .table-responsive {
      overflow-x: auto;
      border-radius: 8px;
    }

    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      font-size: 0.875rem;
    }

    th, td {
      padding: 1rem;
      border-bottom: 1px solid #e5e7eb;
      text-align: left;
    }

    th {
      background: #f3f4f6;
      font-weight: 600;
      color: #1a1a1a;
    }

    tr:hover {
      background: #f9f9f9;
    }

    .mb-1 { margin-bottom: 0.5rem; }
    .mb-2 { margin-bottom: 1rem; }
    .mb-4 { margin-bottom: 2rem; }
    .mb-5 { margin-bottom: 3rem; }
    .mt-3 { margin-top: 1.5rem; }

    .d-flex {
      display: flex;
      gap: 0.5rem;
    }

    .btn-sm {
      padding: 0.5rem 1rem;
      font-size: 0.75rem;
    }

    .form-row {
      display: flex;
      flex-wrap: wrap;
      gap: 2.5rem;
      margin-bottom: 1.5rem;
    }

    .form-col {
      flex: 1;
      min-width: 0;
    }

    @media (max-width: 768px) {
      .container {
        padding: 1.5rem 1rem;
      }

      h2 {
        font-size: 1.5rem;
      }

      .card-body {
        padding: 1.5rem;
      }

      .btn {
        padding: 0.5rem 1rem;
      }

      .form-row {
        flex-direction: column;
        gap: 0.5rem;
      }
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-between align-items-center mb-4">
    <div class="col-md-6">
      <div class="row mb-4">
        <div class="col-md-3 text-end">
          <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
        </div>
        <div class="col-12 text-center">
          <h2>Add New Event Package</h2>
        </div>
      </div>
    </div>
  </div>

  <!-- Form Section -->
  <div class="row justify-content-center mb-5">
    <div class="col-12">
      <div class="card">
        <div class="card-header bg-dark text-white">
          Add New Package
        </div>
        <div class="card-body">
          <form action="addEvent" method="post">
            <div class="form-row">
              <div class="form-col">
                <label for="eventId" class="form-label">Event ID</label>
                <input type="text" id="eventId" name="eventId" required />
              </div>
              <div class="form-col">
                <label for="eventName" class="form-label">Event Name</label>
                <input type="text" id="eventName" name="eventName" required />
              </div>
            </div>
            <div class="form-row">
              <div class="form-col">
                <label for="eventType" class="form-label">Type</label>
                <input type="text" id="eventType" name="eventType" required />
              </div>
              <div class="form-col">
                <label for="clientName" class="form-label">Client Name</label>
                <input type="text" id="clientName" name="clientName" required />
              </div>
                <div class="form-col">
                <label for="clientName" class="form-label">Email</label>
                <input type="text" id="email" name="email" required />
              </div>
                <div class="form-col">
                <label for="clientName" class="form-label">Phone Number</label>
                <input type="tel" id="phone" name="phone" required />
              </div>
            </div>
            <div class="form-row">
              <div class="form-col">
                <label for="eventDate" class="form-label">Event Date</label>
                <input type="date" id="eventDate" name="eventDate" required />
              </div>
              <div class="form-col">
                <label for="package" class="form-label">Selected Package</label>
                <select id="package" name="package">
                  <option value="Basic">Basic</option>
                  <option value="Premium">Premium</option>
                  <option value="VIP">VIP</option>
                </select>
              </div>
            </div>
            <div class="mb-1 mt-3">
              <label class="form-label">Services Needed</label>
              <div class="form-row">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="catering" name="services" value="Catering">
                  <label class="form-check-label" for="catering">Catering</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="photography" name="services" value="Photography">
                  <label class="form-check-label" for="photography">Photography</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="decor" name="services" value="Decorations">
                  <label class="form-check-label" for="decor">Decorations</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="enter" name="services" value="Entertainment">
                  <label class="form-check-label" for="enter">Entertainment</label>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-col">
                <label for="notes" class="form-label">Notes / Special Requests</label>
                <textarea id="notes" name="notes" rows="2"></textarea>
              </div>
              <div class="form-col">
                <label for="status" class="form-label">Status</label>
                <select id="status" name="status">
                  <option value="upcoming">Confirmed</option>
                  <option value="completed">Pending</option>
                </select>
              </div>
            </div>
            <div class="d-flex justify-content-center mt-3">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Table Section -->
  <div class="card">
    <div class="card-header bg-secondary text-white d-flex justify-content-between align-items-center">
      <span>Events</span>
    </div>
    <div class="table-responsive">
      <table>
        <thead>
          <tr>
            <th>Event ID</th>
            <th>Event Name</th>
            <th>Type</th>
            <th>Client Name</th>
            <th>Email</th>
            <th>Phone number</th>
            <th>Date</th>
            <th>Package</th>
            <th>Services</th>
            <th>Notes</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <%
          ArrayList<Event> eventList = (ArrayList<Event>) request.getAttribute("allEventData");

          if (eventList != null && !eventList.isEmpty()) {
            for (Event ev : eventList) {
        %>
          <tr>
            <td><%= ev.getEventId() %></td>
            <td><%= ev.getEventName() %></td>
            <td><%= ev.getEventType() %></td>
            <td><%= ev.getClientName() %></td>
            <td><%= ev.getEmail() %></td>
            <td><%= ev.getPhone() %></td>
            <td><%= ev.getEventdate() %></td>
            <td><%= ev.getSelPackage() %></td>
            <td><%= ev.getSelServices() %></td>
            <td><%= ev.getText() %></td>
            <td><%= ev.getStatus() %></td>
            <td>
              <a href="update-Event.jsp?eventId=<%= ev.getEventId() %>" class="btn btn-outline-primary btn-sm">Update</a>
              <form action="deleteEvent" method="post" style="display:inline-block;">
                <input type="hidden" name="eventId" value="<%=ev.getEventId() %>">
                <button class="btn btn-outline-danger btn-sm">Delete</button>
              </form>
            </td>
          </tr>
        <%
            }
          } else {
        %>
          <tr>
            <td colspan="9" class="text-center text-muted">No event data found.</td>
          </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>