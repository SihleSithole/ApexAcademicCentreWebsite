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
            String name = (String) session.getAttribute("name");
            String surname = (String) session.getAttribute("surname");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
            String province = (String) session.getAttribute("province");
            String country = (String) session.getAttribute("country");
            String instrLangauge = (String) session.getAttribute("instrLangauge");
            String tutorFor = (String) session.getAttribute("tutorFor");
            String helpWith = (String) session.getAttribute("helpWith");
            String learnerName = (String) session.getAttribute("learnerName");
            String learnerSurname = (String) session.getAttribute("learnerSurname");
            String grade = (String) session.getAttribute("grade");
            String syllabus = (String) session.getAttribute("syllabus");
            String studentName = (String) session.getAttribute("studentName");
            String studentSurname = (String) session.getAttribute("studentSurname");
            String year = (String) session.getAttribute("year");
            String postGrad = (String) session.getAttribute("postGrad");
            String subject = (String) session.getAttribute("subject");
            String onlineInperson = (String) session.getAttribute("onlineInperson");
            String suburb = (String) session.getAttribute("suburb");
            String toStart = (String) session.getAttribute("toStart");
            String secTutor = (String) session.getAttribute("secTutor");
            String tutorName = (String) session.getAttribute("tutorName");
            String tutorEmail = (String) session.getAttribute("tutorEmail");
            String packageType = (String) session.getAttribute("packageType");
            String message = (String) session.getAttribute("message");

            String baseUrl = "https://apexacademiccentrewebsite-production-017a.up.railway.app/"; // Change this to your actual domain
            String successUrl = baseUrl + "success";
            String failedUrl = baseUrl + "/payment/failed"; // Handle failed payments

    %>

    <form name="PayFastPayNowForm" action="https://payment.payfast.io/eng/process" method="post">
        <input required type="hidden" name="cmd" value="_paynow">
        <input type="" name="name" value="<%= name %>">
        <input type="hidden" name="surname" value="<%= surname  %>">
        <input type="hidden" name="email" value="<%= email %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="province" value="<%= province %>">
        <input type="hidden" name="country" value="<%= country %>">
        <input type="hidden" name="instrLangauge" value="<%= instrLangauge  %>">
        <input type="hidden" name="tutorFor" value="<%= tutorFor %>">
        <input type="hidden" name="helpWith" value="<%= helpWith %>">
        <input type="hidden" name="learnerName" value="<%= learnerName  %>">
        <input type="hidden" name="learnerSurname" value="<%= learnerSurname %>">
        <input type="hidden" name="grade" value="<%= grade %>">
        <input type="hidden" name="syllabus" value="<%= syllabus %>">
        <input type="hidden" name="studentName" value="<%= studentName %>">
        <input type="hidden" name="studentSurname" value="<%= studentSurname %>">
        <input type="hidden" name="year" value="<%= year %>">
        <input type="hidden" name="postGrad" value="<%= postGrad %>">
        <input type="hidden" name="subject" value="<%= subject %>">
        <input type="hidden" name="onlineInperson" value="<%= onlineInperson %>">
        <input type="hidden" name="suburb" value="<%= suburb %>">
        <input type="hidden" name="toStart" value="<%= toStart %>">
        <input type="hidden" name="secTutor" value="<%= secTutor %>">
        <input type="hidden" name="tutorName" value="<%= tutorName %>">
        <input type="hidden" name="tutorEmail" value="<%= tutorEmail %>">
        <input type="hidden" name="packageType" value="<%= packageType %>">
        <input type="hidden" name="message" value="<%= message %>">
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
<script>
        window.onload = function() {
            setTimeout(function(){
                window.location.href = '/';
            }, 3000); // Redirect after 3 seconds
        };
</script>

</body>
</html>
