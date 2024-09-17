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

.paypal {
    /*display: flex;*/
    justify-content: center;
    align-items: center;
    width: 750px;              /* Fixed width for the element */
    margin: 0 auto;           /* Center horizontally within its container */
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

    String name = bookings.get("first-name");
    String surname = bookings.get("last-name");
    String email = bookings.get("email");
    String phone = bookings.get("phone");
    String province = bookings.get("province");
    String country = bookings.get("country");
    String instrLangauge = bookings.get("language");
    String tutorFor = bookings.get("tutoring-for");
    String helpWith = bookings.get("help-with");
    String schName = "n/a";
    String schSurname = "n/a";
    String schGrade = "n/a";
    String schSyllabus = "n/a";
    String unName = "n/a";
    String unSurname = "n/1";
    String unYear = "n/a";

    if(helpWith.equals("school")){

        schName = bookings.get("student-name");
        schSurname = bookings.get("student-last-name");
        schGrade = bookings.get("grade");
        schSyllabus = bookings.get("syllabus");

    }

    else{

         unName = bookings.get("stud-name");
         unSurname = bookings.get("stud-last");
         unYear = bookings.get("year");

    }

    String subject = bookings.get("subject");
    String tutorStyle = bookings.get("tutor-style");

    String address = "n/a";
    String suburb = "n/a";

    if(tutorStyle.equals("In Person")){

         address = bookings.get("address-inperson");
         suburb = bookings.get("suburb-inperson");
    }

    String message = bookings.get("message");
    if(message.equals("")){
        message = "n/a";
    }
    
     String tutorOption = bookings.get("tutor-option");

     String userPackage = "Once Off Package";

     if(amount.equals("53.79")){

        userPackage = "Basic Package";

     }
  
     if(amount.equals("104.75")){

        userPackage = "Premium Package";

        }

          if(amount.equals("150.04")){

             userPackage = "Advanced Package";

       }

       if(amount.equals("189.68")){

        userPackage = "Elite Package";

        }

     String tutorName = bookings.get("hiddenTutorName");
     String tutorEmail = bookings.get("hiddenTutorEmail");

 %>

    <section class="paypal">

        <div id="paypal-button-container"></div>

    </section>

    <input type="hidden" id="amount" value='<%=amount%>'/>

    <form id="formData" style="display: none;">

        <input type="text" id="name" name="name" value='<%=name%>'/>
        <input type="text" id="surname" name="surname" value='<%=surname%>'/>
        <input type="text" id="email" name="email" value='<%=email%>'/>
        <input type="text" id="phone" name="phone" value='<%=phone%>'/>
        <input type="text" id="province" name="province" value='<%=province%>'/>
        <input type="text" id="country" name="country" value='<%=country%>'/>
        <input type="text" id="instrLangauge" name="instrLangauge" value='<%=instrLangauge%>'/>
        <input type="text" id="tutorFor" name="tutorFor" value='<%=tutorFor%>'/>
        <input type="text" id="helpWith" name="helpWith" value='<%=helpWith%>'/>
        <input type="text" id="schName" name="schName" value='<%=schName%>'/>
        <input type="text" id="schSurname" name="schSurname" value='<%=schSurname%>'/>
        <input type="text" id="schGrade" name="schGrade" value='<%=schGrade%>'/>
        <input type="text" id="schSyllabus" name="schSyllabus" value='<%=schSyllabus%>'/>
        <input type="text" id="unName" name="unName" value='<%=unName%>'/>
        <input type="text" id="unSurname" name="unSurname" value='<%=unSurname%>'/>
        <input type="text" id="unYear" name="unYear" value='<%=unYear%>'/>
        <input type="text" id="subject" name="subject" value='<%=subject%>'/>
        <input type="text" id="tutorStyle" name="tutorStyle" value='<%=tutorStyle%>'/>
        <input type="text" id="addres" name="address" value='<%=address%>'/>
        <input type="text" id="suburb" name="suburb" value='<%=suburb%>'/>
        <input type="text" id="message" name="message" value='<%=message%>'/>
        <input type="text" id="tutorOption" name="tutorOption" value='<%=tutorOption%>'/>
        <input type="text" id="userPackage" name="userPackage" value='<%=userPackage%>'/>
        <input type="text" id="tutorName" name="tutorName" value='<%=tutorName%>'/>
        <input type="text" id="tutorEmail" name="tutorEmail" value='<%=tutorEmail%>'/>
        

    </form>


    <script>
      
		var amount = document.getElementById("amount").value;
		
		 async function createOrder() {
		           try {
		               const response = await fetch('/create-payment', {
		                   method: 'POST',
		                   headers: {
		                       'Content-Type': 'application/json',
		                   },
		                   body: JSON.stringify({ amount }),
		               });
		
		               if (!response.ok) {
		                   throw new Error('Network response was not ok');
		               }
		
		               const data = await response.json();
		               return data.id;
		           } catch (error) {
		               console.error('Error creating order:', error);
		           }
		       }


        // Function to execute PayPal order
        async function executeOrder(orderID) {
            try {
                const response = await fetch('/execute-payment', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ orderID }),
                });
                const data = await response.json();
                return data;
            } catch (error) {
                console.error('Error executing order:', error);
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            paypal.Buttons({
                createOrder: async function(data, actions) {
                    const orderID = await createOrder();
                    return orderID;
                },
                onApprove: async function(data, actions) {
                    await executeOrder(data.orderID);
                    alert('Payment completed!');

                    const form1 = document.getElementById('formData');
                    const form1Data = new FormData(form1);
                    const data1 = formDataToObject(form1Data);

                    fetch('/pushBooking', { // Replace with your actual endpoint URL
								method: 'POST',
								headers: { 
									'Content-Type': 'application/json' 
								},
								body: JSON.stringify(data1)
							})
							.then(response => response.json())
							.then(result => {
							
								// Optionally show success message or handle response
							})
							.catch(error => {
								console.error('Error:', error);
								// Optionally handle error response
							});

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);
                               

                    setTimeout(function(){
                        window.location.href = '/';
                    } , 2000);
                },
                onError: function(err) {
                    alert('PayPal error:', err);
                }
            }).render('#paypal-button-container'); // Renders the PayPal button into the container
        });

        const form1 = document.getElementById('formData');
        const form1Data = new FormData(form1);
        const data1 = formDataToObject(form1Data);

        function formDataToObject(formData) {
            const data = {};
            formData.forEach((value, key) => {
                // Handle multiple values for the same key
                if (data[key]) {
                    // If value is already an array, push the new value
                    if (Array.isArray(data[key])) {
                        data[key].push(value);
                    } else {
                        // Convert existing value to an array and add new value
                        data[key] = [data[key], value];
                    }
                } else {
                    data[key] = value;
                }
            });
            return data;
        }


    </script>
    
</body>
</html>