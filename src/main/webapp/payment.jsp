<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>ApexAcademicCentre</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="tutorNewPage.css" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?client-id=Af6Npuwe7XWQae1F2Z-d3Cpv182tycmxPbGhFSiP0PWtVQt8HEAEyZNm9GR9noxyVZHk9OelUYONUj8E"></script>
    <style>

        body{
            font-family: 'Montserrat', sans-serif;
            background-color: #f6fffa;
        }
        /* Add the responsive styles directly here if not using external CSS */
        .navbar {
            display: flex;
            justify-content: left;
            align-items: center;
            background-color: white;
            padding: 10px;
        }
    
        .logo {
            max-width: 100%;
            height: auto;
        }
    
        .main-section {
            padding: 20px;
            text-align: center;
        }
    
        .main-class {
            margin-bottom: 20px;
        }

        @media (max-width: 480px) {

            #tutorPar {
                font-size: 24px;
            }

            .center-button input[type="image"] {
                margin-top: 3%;
            width: 200px; /* Set a specific width */
            height: auto; /* Maintain aspect ratio */
            max-width: 100%; /* Ensure it doesn't exceed its container */
            cursor: pointer; /* Change cursor to pointer on hover */
            transition: transform 0.2s; /* Add transition for hover effect */
        }
    
        .center-button input[type="image"]:hover {
            transform: scale(1.05); /* Slightly enlarge the button on hover */
        }
            
        }
    
        @media (max-width: 600px) {
            #tutorPar {
                font-size: 20px;
            }

            .center-button input[type="image"] {
            width: 200px; /* Set a specific width */
            height: auto; /* Maintain aspect ratio */
            max-width: 100%; /* Ensure it doesn't exceed its container */
            cursor: pointer; /* Change cursor to pointer on hover */
            transition: transform 0.2s; /* Add transition for hover effect */
        }
    
        .center-button input[type="image"]:hover {
            transform: scale(1.05); /* Slightly enlarge the button on hover */
        }
        }
    
        @media (min-width: 601px) {
            #tutorPar {
                font-size: 24px;
            }

            .center-button input[type="image"] {
            width: 200px; /* Set a specific width */
            height: auto; /* Maintain aspect ratio */
            max-width: 100%; /* Ensure it doesn't exceed its container */
            cursor: pointer; /* Change cursor to pointer on hover */
            transition: transform 0.2s; /* Add transition for hover effect */
        }
    
        .center-button input[type="image"]:hover {
            transform: scale(1.05); /* Slightly enlarge the button on hover */
        }
        }
    
        .center-button input[type="image"] {
            width: 200px; /* Set a specific width */
            height: auto; /* Maintain aspect ratio */
            max-width: 100%; /* Ensure it doesn't exceed its container */
            cursor: pointer; /* Change cursor to pointer on hover */
            transition: transform 0.2s; /* Add transition for hover effect */
        }
    
        .center-button input[type="image"]:hover {
            transform: scale(1.05); /* Slightly enlarge the button on hover */
        }
    </style>
    
</head>
<body>

<nav class="navbar">
    <img src="apex.png" alt="Logo" class="logo" id="logo_image">
</nav>

<section class="main-section">
    <section class="main-class">
        <p id="tutorPar">These are the Highest Quality Online and In-person Tutors. Get your personalized tutor with Apex Academic Centre</p>
    </section>

    <%
            String amount = (String)session.getAttribute("amount");

            String baseUrl = "https://apexacademiccentrewebsite-production-017a.up.railway.app/"; // Change this to your actual domain
            String successUrl = baseUrl + "success";
            String failedUrl = baseUrl + "/payment/failed"; // Handle failed payments

    %>

    <form name="PayFastPayNowForm" action="https://payment.payfast.io/eng/process" method="post">
        <input required type="hidden" name="cmd" value="_paynow">
        <input required type="hidden" name="receiver" pattern="[0-9]" value="25220959">
        <input required type="hidden" name="amount" value="<%= amount %>">
        <input required type="hidden" name="item_name" maxlength="255" value="Payment">
        <input type="hidden" name="item_description" maxlength="255" value="Package Payment">
        <input type="hidden" name="return_url" value="<%= successUrl %>"> 
        <div class="center-button">
            <input type="image" src="https://my.payfast.io/images/buttons/PayNow/Primary-Large-PayNow.png" alt="Pay Now" title="Pay Now with Payfast">
        </div>
    </form>
</section>


</body>
</html>
