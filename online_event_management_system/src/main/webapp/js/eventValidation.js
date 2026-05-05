// Filename: eventValidation.js

document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");

  form.addEventListener("submit", function (e) {
    let valid = true;
    const today = new Date().toISOString().split("T")[0];

    const eventId = document.getElementById("eventId").value.trim();
    const eventName = document.getElementById("eventName").value.trim();
    const eventType = document.getElementById("eventType").value.trim();
    const clientName = document.getElementById("clientName").value.trim();
    const email = document.getElementById("email").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const eventDate = document.getElementById("eventDate").value;
    const packageSelected = document.getElementById("package").value;
    const services = document.querySelectorAll("input[name='services']:checked");

    const nameRegex = /^[A-Za-z ]+$/;
    const digitsRegex = /^\d+$/;

    // Event ID: only digits allowed
    if (!digitsRegex.test(eventId)) {
      alert("Event ID must be numbers only.");
      valid = false;
    }

    // Event Name: letters only
    if (!nameRegex.test(eventName)) {
      alert("Event Name must contain letters only.");
      valid = false;
    }

    // Type: letters only
    if (!nameRegex.test(eventType)) {
      alert("Type must contain letters only.");
      valid = false;
    }

    // Client Name: letters only
    if (!nameRegex.test(clientName)) {
      alert("Client Name must contain letters only.");
      valid = false;
    }

    // Email: must contain '@'
    if (!email.includes("@")) {
      alert("Email must contain '@'.");
      valid = false;
    }

    // Phone: exactly 10 digits and starts with 0
    if (!/^0\d{9}$/.test(phone)) {
      alert("Phone number must be 10 digits and start with 0.");
      valid = false;
    }

    // Date: must not be a past date
    if (eventDate < today) {
      alert("Event date cannot be a past date.");
      valid = false;
    }

    // Package: must be selected
    if (packageSelected === "") {
      alert("Please select a package.");
      valid = false;
    }

    // At least one service should be selected
    if (services.length === 0) {
      alert("Please select at least one service.");
      valid = false;
    }

    if (!valid) e.preventDefault();
  });
});
