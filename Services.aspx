﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="barbershop.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Services - Ford's Barber Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
     <style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-image: url('Images/bg_blrd.jpg');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .container, .appointment-container, .guest-info-container {
    max-width: 900px; /* Same width for all containers */
    margin: 50px auto;
    background-color: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);

    }

    .overlay {
    display: none; /* Initially hidden */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent backdrop */
    justify-content: center;
    align-items: center;
    z-index: 9999; /* On top of other content */
    }

    .appointment-container h2, .guest-info-container h3 {
        text-align: center;
        margin-bottom: 20px;
    }

    .overlay.show {
        display: flex; /* Show overlay when class is added */
    }

    .header {
        background-color: #8B4513;
        padding: 15px 30px;
        color: white;
    }

    .header h1 {
        margin: 0;
        font-size: 24px;
    }

    .services-section {
        margin-top: 30px;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
    }

    .services-container {
        border: 1px solid #ccc;
        padding: 20px;
        background-color: #f8f8f8;
        border-radius: 10px;
    }

    .service-option {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 20px;
    }

    .service-option img {
        width: 80px;
        height: 80px;
        border-radius: 10px;
    }

    .service-option span {
        display: block;
    }

    .service-option span:first-of-type {
        font-weight: bold;
        font-size: 18px;
    }

    .service-option span:last-of-type {
        color: #888;
    }

    .next-button {
        margin-top: 30px;
        text-align: center;
    }

      .appointment-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #8B4513;
        color: white;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

   .book-now-btn {
        background-color: #8B4513;
        color: white;
        padding: 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 18px;
        width: 100%;
    }

   #bookNowPrice {
      font-size: 20px;
      font-weight: bold;
    }

   .guest-info-container input {
    width: calc(100% - 20px); /* Leave some margin on the sides */
    margin-bottom: 15px; /* Space between inputs */
    padding: 10px; /* Comfortable input padding */
    font-size: 16px; /* Improve readability */
    border: 1px solid #ccc; /* Border for visual structure */
    border-radius: 5px; /* Rounded corners for better aesthetics */
    box-sizing: border-box; /* Ensure padding doesn’t affect width */
}
  .guest-info-container button {
        width: 100%; /* Buttons take the full width */
        background-color: #8B4513; /* Match the theme */
        color: white;
        padding: 15px; /* Comfortable click area */
        margin-top: 10px; /* Space between buttons */
        border: none;
        border-radius: 5px; /* Rounded corners */
        font-size: 18px; /* Matching style */
        cursor: pointer;
    }
 
    #barberList {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        justify-content: center;
        align-items: center;
    }

    #barberList img {
        width: 100px;
        height: 100px;
        cursor: pointer;
        border-radius: 50%;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease;
    }

    #barberList img:hover {
        transform: scale(1.1);
    }

    #barberList p {
        margin-top: 8px;
        font-weight: bold;
    }

    .appointment-overlay.show {
        display: flex;
    }


    #barberSelectionOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

    #barberSelectionOverlay .appointment-container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        max-width: 600px;
        width: 90%;
    }

    #barberSelectionOverlay .appointment-container {
        flex-direction: column;
        text-align: center;
    }

    .total-price {
        font-weight: bold;
        margin-top: 20px;
    }

   .guest-info-container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 600px; 
        text-align: center;
        box-sizing: border-box; 
    }

    .guest-info-container input {
        width: 100%;
    }

    .appointment-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
    }

   #guestInfoOverlay {
        display: none; /* Initially hidden */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent backdrop */
        justify-content: center;
        align-items: center;
        z-index: 9999; /* Ensure it stays on top */
    }


    #guestInfoOverlay.show {
        display: flex; /* Show the overlay when the "show" class is added */
    }
</style>
</head>
<body>
    <header class="header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Ford's Barber Shop</h1>
            <nav>
                <a href="Default.aspx" class="text-white text-decoration-none mx-3">Home</a>
                <a href="About.aspx" class="text-white text-decoration-none mx-3">About</a>
                <a href="Services.aspx" class="text-white text-decoration-none mx-3">Services</a>
                <a href="Reviews.aspx" class="text-white text-decoration-none mx-3">Reviews</a>
                <a href="Contact.aspx" class="text-white text-decoration-none mx-3">Contact</a>
            </nav>
        </div>
    </header>

    <div class="container" style="margin-top: 100px;">
        <div class="services-section">
            <h2 class="text-center text-primary mb-4">Services</h2>
            <form id="servicesForm">
                <div class="services-container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="service-option">
                                <input type="checkbox" id="scalp-therapy" name="service" value="850" onchange="updateSummary()" />
                                <label for="scalp-therapy">
                                    <img src="Images/scalptheraphy.png" alt="Scalp Therapy" />
                                    <div>
                                        <span>Scalp Therapy</span>
                                        <span>₱850.00</span>
                                    </div>
                                </label>
                            </div>
                            <div class="service-option">
                                <input type="checkbox" id="beard-shave" name="service" value="125" onchange="updateSummary()" />
                                <label for="beard-shave">
                                    <img src="Images/breadshave.png" alt="Beard Shave" />
                                    <div>
                                        <span>Beard Shave</span>
                                        <span>₱125.00</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="service-option">
                                <input type="checkbox" id="haircut" name="service" value="200" onchange="updateSummary()" />
                                <label for="haircut">
                                    <img src="Images/haircut.png" alt="Haircut" />
                                    <div>
                                        <span>Haircut</span>
                                        <span>₱200.00</span>
                                    </div>
                                </label>
                            </div>
                            <div class="service-option">
                                <input type="checkbox" id="hair-coloring" name="service" value="500" onchange="updateSummary()" />
                                <label for="hair-coloring">
                                    <img src="Images/haircoloring.png" alt="Hair Coloring" />
                                    <div>
                                        <span>Hair Coloring</span>
                                        <span>₱500.00</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
           <div class="text-center next-button">
            <button type="button" class="btn btn-primary" onclick="showAppointmentContainer()">Next</button>
        </div>
        </div>
    </div>

<div class="appointment-overlay" id="appointmentOverlay">
    <div class="appointment-container">
        <button class="close-btn" onclick="closeAppointmentContainer()">X</button>
        <div class="left-side">
            <h2>Book Your Appointment</h2>
            <form id="appointmentForm">
                <div id="serviceSummaryContainer"></div>
                
                <label for="date">Appointment Date</label>
                <input type="date" id="appointmentDate" class="form-control" required />

                <label for="time" class="mt-3">Appointment Time</label>
                <input type="time" id="appointmentTime" class="form-control" required />

                <label for="barber" class="mt-3">Preferred Barber</label>
                <input type="text" id="preferredBarber" class="form-control" readonly onclick="openBarberSelection()" placeholder="Select Barber" />
                
                <label for="book-now" class="mt-3"> </label>
              <input type="button" class="book-now-btn" id="bookNowButton" value="Book Now ₱0.00" onclick="showGuestInfoContainer()" />
            </form>
        </div>

        </div>
    </div>
</div>

    

            <div class="overlay" id="guestInfoOverlay">
        <div class="guest-info-container">
            <h3>Guest Information</h3>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" class="form-control">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" class="form-control">
            <label for="email">Email:</label>
            <input type="email" id="email" class="form-control">
            <button onclick="submitGuestInfo()">Submit</button>
            <button onclick="closeGuestInfoContainer()">Close</button>
        </div>
    </div>



    <div class="appointment-overlay" id="barberSelectionOverlay">
        <div class="appointment-container">
            <button class="close-btn" onclick="closeBarberSelection()">X</button>
            <h2 class="text-center mb-4">Select a Barber</h2>
            <div id="barberList"></div>
        </div>
    </div>
</body>

<script>
    const appointmentDateInput = document.getElementById("appointmentDate");
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(today.getDate() + 1);
    const yyyy = tomorrow.getFullYear();
    const mm = String(tomorrow.getMonth() + 1).padStart(2, '0');
    const dd = String(tomorrow.getDate()).padStart(2, '0');
    appointmentDateInput.min = `${yyyy}-${mm}-${dd}`;

    let selectedServices = [];  // Holds selected services
    function updateSummary() {
        selectedServices = [];  // Clear previous selections
        const services = document.querySelectorAll('input[name="service"]:checked');  // Get checked services
        let total = 0;
        let summary = "";  // Remove the "Selected Services:" heading

        // Loop through selected services to create a list and calculate total
        services.forEach((service) => {
            const label = service.parentElement;
            const serviceName = label.querySelector("span:first-of-type").innerText;
            const servicePrice = parseFloat(service.value);

            selectedServices.push({ name: serviceName, price: servicePrice });  // Add to selected services array
            total += servicePrice;

            summary += `<p>${serviceName} - ₱${servicePrice.toFixed(2)}</p>`;  // Append service name and price to summary
        });

        // Update the summary section before the appointment date section
        const summaryDiv = document.createElement("div");
        summaryDiv.innerHTML = summary;
        const serviceSummaryContainer = document.getElementById("serviceSummaryContainer");

        // Clear existing summary and append new summary
        serviceSummaryContainer.innerHTML = ''; // Clear existing summary
        serviceSummaryContainer.appendChild(summaryDiv); // Display updated summary

        // Update the "Book Now" button text dynamically with the total price
        const bookNowButton = document.getElementById("bookNowButton");
        bookNowButton.value = `Book Now   ₱${total.toFixed(2)}`;
    }


    // Call updateSummary whenever a service is selected or unselected
    document.querySelectorAll('input[name="service"]').forEach((checkbox) => {
        checkbox.addEventListener('change', updateSummary);  // Update summary on change
    });

    function showAppointmentContainer() {
        document.getElementById("appointmentOverlay").style.display = "flex";
    
    }

    function closeAppointmentContainer() {
        const overlay = document.getElementById("appointmentOverlay");
        overlay.classList.remove('show');
    }

    function showGuestInfoContainer() {
        const overlay = document.getElementById("guestInfoOverlay");
        overlay.classList.add('show');  // Ensure the overlay is visible
    }

    function submitGuestInfo() {
        const firstName = document.getElementById("firstName").value;
        const lastName = document.getElementById("lastName").value;
        const email = document.getElementById("email").value;
        if (!firstName || !lastName || !email) {
            alert("Please fill in all the guest information!");
            return;
        }
        alert(`Appointment booked successfully for ${firstName} ${lastName} with email ${email}.`);
        window.location.href = "Default.aspx";
    }

    function closeGuestInfoContainer() {
        const overlay = document.getElementById("guestInfoOverlay");
        overlay.classList.remove('show');  // Close the overlay
    }

    const bookNowButton = document.getElementById("bookNowButton");
    bookNowButton.addEventListener('click', showGuestInfoContainer); 

    function openBarberSelection() {
        document.getElementById("barberSelectionOverlay").style.display = "flex";
        const barbers = [
            { id: 1, name: "No Preferences", image: "Images/blue.jpg" },
            { id: 2, name: "Ian", image: "Images/ian.png" },
            { id: 3, name: "Heaven", image: "Images/heaven.png" },
            { id: 4, name: "Shanelle", image: "Images/shanel.png" },
            { id: 5, name: "Erick", image: "Images/oyao.png" },
            { id: 6, name: "Titus", image: "Images/titus.png" },
        ];
        let content = "";
        barbers.forEach((barber) => {
            content += `
        <div class="text-center">
            <img src="${barber.image}" alt="${barber.name}" onclick="selectBarber('${barber.name}')" />
            <p>${barber.name}</p>
        </div>`;
        });
        document.getElementById("barberList").innerHTML = content;
    }

    function selectBarber(barberName) {
        document.getElementById("preferredBarber").value = barberName;
        closeBarberSelection();
    }

    function closeBarberSelection() {
        document.getElementById("barberSelectionOverlay").style.display = "none";
    }
</script>
</body>
</html>