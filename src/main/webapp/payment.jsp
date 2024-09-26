<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<html>
 <head>
    <title>ApexAcademicCentre</title> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="tutorNewPage.css" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?client-id=Af6Npuwe7XWQae1F2Z-d3Cpv182tycmxPbGhFSiP0PWtVQt8HEAEyZNm9GR9noxyVZHk9OelUYONUj8E"></script> <!-- Replace with your PayPal client ID -->
    <style>

.center-button {
    text-align: center;
}

    </style>
   
 
</head>
<body>

    <nav class="navbar">
        <img src="apex.png" alt="Logo" class="logo" id="logo_image">
    </nav> 

    <section class="main-section">
        <section class="main-class">
            <p id="tutorPar" align="center">These are the Highest Quality Online Tutors. Process payment with Apex - the Best in Tutoring</p>
            <br>
            <br>
        </section>

        <%
        Map<String, String> bookings = (Map<String, String>) session.getAttribute("bookings");
        String amount = (String)session.getAttribute("amount");
        %>

        <form name="PayFastPayNowForm" action="https://payment.payfast.io/eng/process" method="post">
            <input required type="hidden" name="cmd" value="_paynow">
            <input required type="hidden" name="receiver" pattern="[0-9]" value="25220959">
            <input required type="hidden" name="amount" value="<%= amount %>">
            <input required type="hidden" name="item_name" maxlength="255" value="Payment">
            <input type="hidden" name="item_description" maxlength="255" value="Package Payment">

            <div style="text-align: center;">
                <input type="image" src="https://my.payfast.io/images/buttons/PayNow/Primary-Large-PayNow.png" alt="Pay Now" title="Pay Now with Payfast">
            </div>
        </form>
    </section>

</body>
</html>