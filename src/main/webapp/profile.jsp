<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <!--=============== REMIXICONS ===============-->
          <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
          <!--=============== SWIPER CSS ===============-->
         <link rel="stylesheet" href="assets/css/swiper-bundle.min.css"> 
    
          <!--=============== CSS ===============-->
          <link rel="stylesheet" href="assets/css/styles.css">


    <title>View profile</title>
    <style>

body{
	
	font-family: 'Montserrat', sans-serif;
	background-color: #f6fffa;
  
	
}
  .profile-container{
        background-color: #f6fffa;
        border-radius: 8px;
        box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2); /* Creates the illusion of elevation */
        
    }

    .long-paragraph{
        margin-top: 40px;
        text-align: center;
        font-weight: bold;
        color: #001549;
        font-size: 30px;
        height: 12vh;
    }

    .short-paragraph{
        margin-top: 20px;
        text-align: center;
        font-size: 35px;
        font-weight: bold;
        color: #00a550;
    }

        .main-section {
            display: flex; /* Use flexbox to align child elements horizontally */
            align-items: flex-start; /* Align items to the top of the container */
            padding: 20px;
            width: 100%;
            background-color: #e7eeff; /* Optional: for better visibility */
            border: none;
        }

        .whole-wrapper {
            display: flex; /* Use flexbox to align child elements horizontally */
            align-items: flex-start; /* Align items to the top of the container */
            padding: 20px;
            border: 1px solid #ccc; /* Optional: for better visibility */
            background-color: #e7eeff; /* Optional: for better visibility */
            margin-top: 75px;
            width: 100%;
            border: none;
        }


.about-tutor-row, .qualifications-row {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #1cee50;
    padding-top: 15px;
    margin-left: 15px;
    margin-right: 15px;
}

.about-tutor-title, .qualifications-title {
    width: 150px;
    height: 100px;
    font-size: 1.2em;
    font-weight: bold;
    color: #021631;
    padding: 10px;
    border-radius: 5px;
    display: flex;
    align-items: left;
    justify-content: left;
    text-align: left;
}


.about-tutor-info {
    flex: 1 1 auto;
    color: #001549;
    margin-right: 20px;
    font-size: 14px;
    width:50%;
}

.qualifications-info, .subjects-info {
    flex: 1 1 auto;
    color: #001549;
    overflow: auto;
    margin-right: 20px;
    font-size: 14px;
}

.subjects-info {
    display: flex;
    flex-wrap: wrap; /* Allow items to wrap onto the next line */
   

}

.subjects-info p {
    flex: 0 0 calc(16.66% - 10px); /* Each paragraph takes up about 16.66% of the container width minus gap */
    margin: 5px; /* Margin for spacing between paragraphs */
    background-color: #e7eeff; /* Light background for visibility */
    display: inline; /* Make paragraphs fit tightly around their content */
    padding: 0; /* Optional: small padding for better aesthetics */
    text-align: center;
    height : fit-content;
    border-radius: 3px;
    color: #00a550;
}

/*Start here */

.profile-row {
            display: flex;
            align-items: flex-start;
        }

        .profile-picture-container, .matric {
            width: 250px; /* Adjust as needed */
            /*background-color: #f6fffa; */
            padding: 20px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
           
            justify-content: flex-start;
        }
        
        .matric img{
            width: 100%;
            height: 345px;
            border-radius: 8px;
        }

        .profile-picture-container img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .profile-picture-container .name,
        .profile-picture-container .age {
            margin-top: 10px;
            color: #001549;
            font-weight: bold;
            text-align: center;
        }

        .profile-picture-container .name{
            font-size: larger;
        }
        .profile-picture-container .age {
            font-style: italic;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 20px;
        }

        /* Adjusting the profile-container */
        .profile-container {
            flex: 1;
        }

/*end here*/


.qualification {
    display: inline-block;
    padding: 5px;
    background-color: gainsboro;
    border-radius: 4px;
    color: blue;
    text-align: center;
}

.subjectt {
    display: inline-block;
    padding: 5px;
    background-color: gainsboro;
    border-radius: 4px;
    color: blue;
    text-align: center;
}

/*The added */


.subjects-row,  .qualifications-row {
  display: flex;
  align-items: center; /* Align items to the top */
}

.subjects-row{
    margin-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
}

/*.about-tutor-row{
 gap: 10px;
}*/
.subjects-title ,.about-tutor-title ,.qualifications-title{
  /*display: flex;*/
  align-items: center; /* Center the icon above the text */
  text-align: left; /* Center the text within the title */
  font-size: 14px; /* Adjust text size if needed */
}

.qualifications-title{
    align-items: center; /* Center the icon above the text */
  text-align: center;
}


        .subjects-title i,
        .about-tutor-title i,
        .qualifications-title i {
            font-size: 24px; /* Adjust icon size if needed */
            margin-bottom: 7px;
            color: #00a550;
            display: inline-block; /* Ensure the icon can have a shadow */
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.3); /* Add shadow */
            background-color: #e7eeff;
            width: 35px; /* Fixed width */
            height: 35px; /* Fixed height */
            line-height: 35px; /* Center vertically */
            text-align: center; /* Center horizontally */
            padding: 0; /* Remove default padding */
        }

.subjects-info {
  display: flex;
  align-items: center; /* Center the content vertically */
}

#profile_subjects {
  margin: 0; /* Remove default margin from <p> tag */
  font-size: 16px; /* Adjust text size if needed */
}


/*The left div*/
.details {
    background-color: #fff; /* Sets the background color to white */
    border-radius: 8px;
        box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2); /* Creates the illusion of elevation */
    border: none; /* Ensures no border is visible */
    padding: 10px; /* Adds some padding for better spacing */
}

.static-text {
    color: #001549; /* Sets the color of static text to dark blue */
    font-style: italic;
}

.detail-info {
    color: #00a550; /* Sets the color of detail information to green */
}

/* Optional: Styling for the ratings and feedback items */
.ratings, .feedback-item {
    margin-top: 10px; /* Adds spacing between items */
}

#rate-icon, #back-icon {
    margin-right: 5px; /* Adds spacing between icons and text */
   
}

#rate-icon{
    color: #fd590d;
}



/*Book tutor button*/
.profile-action {
    margin-top: 20px;
   /*margin-bottom: 15px;*/
    margin-left: 40px;
}


.book-tutor-button {
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #02A552;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 170px;
}

.find-tutor-button{
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #001549;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 170px;
    margin-left: 30px;
}

.book-tutor-button:hover {
    background-color: white;
    color: #02A552;
}

.find-tutor-button:hover {
    background-color: white;
    color: #001549;
}

.button-action{
    margin-right: 200px;
}
/* Start NavBar*/


body, ul, li {
    margin: 0;
    padding: 0;
    list-style: none;
}

/* Navbar container */
.navbar {
   
    display: flex;
    align-items: center;
    justify-content: space-between; 
    background-color: white;
    padding: 10px;
    font-family: 'Montserrat', sans-serif;
    position: fixed; /* Fixes the navbar to the top of the viewport */
    top: 0; /* Positions it at the top */
    left: 0; /* Ensures it stretches from the left edge */
    right: 0; /* Ensures it stretches to the right edge */
    z-index: 1000; /* Ensures it stays on top of other content */
}

/* Logo image */
.logo {
    height: 60px;
    margin-right: 20px;
    margin-left: 95px;
    width: 220px;
}

/* Navbar links container */
.nav-links {
    padding-left: 6%;
    display: flex;
    align-items: center;
    margin-right: auto; /* Pushes the nav links to the left */
    font-size: 14px;
    font-family: 'Montserrat', sans-serif;
}

/* Navbar links */
.nav-links li {
    position: relative;
    margin: 0 10px;
}

.nav-links a {
    color: #00154A;
    text-decoration: none;
    padding: 10px;
    display: block;
}

/* Dropdown container */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.nav-links a:hover {
    color: #02A552; /* Ensure text color remains white on hover */
}

/* Nav-right styling */
.nav-right {
    display: flex;
    align-items: center;
    gap: 10px; /* Adds spacing between items */
}

/* Search container */
.search-container {
    position: relative;
    margin-right: 20px;
    box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2); /* Creates the illusion of elevation */
    z-index: 10; /* Ensures it's on top of other content */
    height: 40px;
}

#search-input {
    padding: 5px 30px 5px 30px;
    border: 1px solid transparent; /* Hide the border */
    border-radius: 4px;
    font-size: 14px;
    width: 0;
    padding-left: 35px; /* Space for icon */
    background: white;
    outline: none;
    transition: width 0.3s, padding 0.3s;
}

#search-input:focus {
    width: 200px;
    padding-left: 35px; /* Adjust for icon */
}

#search-button {
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translateY(-50%);
    border: none;
    background: transparent;
    cursor: pointer;
    z-index: 1;
}

#search-button .search-icon {
    font-size: 18px;
    color: #00a550; /* Set the icon color */
}

.login-register {
    background-color: #00154A;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    display: flex;
    align-items: center;
    font-size: 14px;
    cursor: pointer;
}

.login-register .login-icon {
    margin-right: 8px;
    font-size: 18px;
}

.login-register:hover {
    background-color: white;
    color: blue;
}


.main-class .tutorImage{
	
	  width: 100%;
	  align-items: center;
	  height: 235px;
	
}

.the-left{
   
    margin-top: 10px;
    margin-left: 7%;
}

.right-side{
    width: 60%;
    background-color: #e7eeff;
   /*box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2); /* Creates the illusion of elevation */
    border-radius: 8px;
    margin-left:5%;
    margin-top: 19px;
    }

/* End NavBar*/

/* Responsive styles for smartphones */

@media (max-width: 768px) {
    .profile-row {
        flex-direction: column;
        align-items: center;
    }

    .profile-picture {
        width: 80px;
        height: 90px;
    }

    .profile-info {
        padding-left: 0;
        margin-left: 0;
    }

    .book-tutor-button {
        width: auto;
        font-size: 14px;
    }

    #profile_qualification {
        grid-template-columns: repeat(1, 1fr);
    }

    #profile_subjects {
        grid-template-columns: repeat(2, 1fr);
    }

    .additional-info-row {
        flex-direction: column;
        
    }
}

@media (max-width: 480px) {
    .profile-container {
        width: 95%;
        padding: 10px;
        margin: 10px auto;
    }

    .profile-picture {
        width: 70px;
        height: 80px;
    }

    .profile-info h2 {
        font-size: 1.2em;
    }

    .profile-info p {
        font-size: 14px;
    }

    .book-tutor-button {
        font-size: 12px;
        padding: 8px 16px;
        width: auto;
    }

    .about-tutor-title, .qualifications-title, .subjects-title, .reviews-title {
        width: auto;
        height: auto;
        font-size: 1em;
    }

    #profile_subjects {
        grid-template-columns: repeat(1, 1fr);
    }
}

.scroll-container {
    overflow-x: hidden; /* Allow horizontal scrolling */
    white-space: nowrap; /* Prevent text from wrapping */
    border: none; /* Optional: for visual separation */
    padding: 10px; /* Optional: for spacing */
    width: 905px; /* Set a fixed width */
    position: relative; /* Positioning context for arrows */
    height: 300px; /* Fixed height for consistency */
}

.scroll-item {
    display: inline-block; /* Allows items to be placed in a row */
    margin-right: 20px; /* Space between items */
    background-color: white; /* Light background color */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    padding: 10px; /* Padding around the item */
    text-align: center;
}

#isthombe {
    width: 180px; /* Set a fixed width for the image */
    height: 180px; /* Set a fixed height for the image */
    object-fit: cover; /* Ensure the image covers the area without distortion */
    padding: 5px; /* Padding around the image */
    background-color: #fff; /* Optional: Background for the image */
    border-radius: 10px; /* Rounded corners for the image */
}

.arrow {
    cursor: pointer; /* Pointer cursor on hover */
    background-color: #e7eeff; 
    border: none; /* Remove default border */
    padding: 5px; /* Padding for the arrow */
    margin: 0 5px; /* Space between arrows and scroll container */
    font-size: 35px; /* Adjust the size as needed */
}

.arrow-container {
    display: flex; /* Use flexbox for centering */
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    height: 350px; /* Set height */
    border: none; /* No border */
    background-color: #e7eeff; /* Light background color */
    
}

.reviews {
    display: inline-flex; /* Ensures icons are inline */
    margin-top: 10px; /* Margin for reviews */
}

.review-icon {
    margin-right: 5px; /* Space between icons */
    color: gold; /* Change color as needed */
    font-size: 20px; /* Adjust size */
}

.subjects-title {
            width: 150px;
            height: 100px;
            font-size: 1.2em;
            font-weight: bold;
            color: #021631;
            padding: 10px;
            border-radius: 5px;
            display: flex; /* Use flexbox */
            flex-direction: column; /* Stack items vertically */
        }
        .header {
            display: flex; /* Use flexbox for icon and title */
            align-items: center; /* Center items vertically */
            font-size: 14px;
            margin-right: 18px;
           
        }
        .tutoring-container {
            color: #00a550; /* Color for the tutoring title */
            font-size: 14px; /* Adjust font size as needed */
            margin-top: 8px; /* Space between title and grades */
            margin-left: 10px;
        }
        .grades {
            color: #001549; /* Color for grades */
            font-size: 10px; /* Adjust font size as needed */
            margin-left: 20px;
            background-color: #e7eeff; /* Light background color */
            /*border-radius: 8px; /* Rounded corners */
            /*box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }


    </style>
</head>
<body>

    <nav class="navbar">
    <img src="apex.png" alt="Logo" class="logo" id="logo_image">
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li class="dropdown">
            <a href="#" class="dropbtn">Tutoring <i class="fas fa-chevron-down"></i></a>
            <div class="dropdown-content">
                <a href="#">Online Tutoring</a>
                <a href="#">In-person Tutor</a>
                <a href="#">Matric Re-Write</a>
                <a href="#">Special Need Tutoring</a>
                <a href="#">University/ College Tutors</a>
                <a href="#">Homeschooling Support</a>
                <a href="#">Person Edexcel Tutoring</a>
            </div>
        </li>
        <li class="dropdown">
            <a href="#" class="dropbtn">Cambridge <i class="fas fa-chevron-down"></i></a>
            <div class="dropdown-content">
                <a href="#">Cambridge</a>
                <a href="#">A Level Tutoring</a>
                <a href="#">Expert Cambridge Tutors</a>
                <a href="#">IGCSE Level Tutoring</a>
                <a href="#">Cambridge Exam Timetable</a>
            </div>
        </li>
        <li><a href="#">Resources</a></li>
        <li><a href="#">Contact Us</a></li>
    </ul>

    <div class="search-container">
        <input type="text" id="search-input" placeholder="Search...">
        <button id="search-button">
            <i class="fas fa-search search-icon"></i>
        </button>
    </div>
    <button class="login-register">
        
         Book A Tutor
    </button>
</div>
</nav> 



  <%
 
        Tutor tutor = (Tutor) request.getAttribute("tutor");

            byte[] image = tutor.getImage();
            String tutorImage = java.util.Base64.getEncoder().encodeToString(image);
            String name = tutor.getFullNames();
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
            String formattedDate = formatter.format(currentDate);
            int currentYear = Integer.parseInt(formattedDate); 

            Date dob = tutor.getDob();
            formattedDate = formatter.format(dob);
            int birthYear = Integer.parseInt(formattedDate);

            // Calculate age
            int age = currentYear - birthYear;
            
            // Optional: Adjust if the birthday hasn't occurred yet this year
            Calendar today = Calendar.getInstance();
            Calendar birthDate = Calendar.getInstance();
            birthDate.setTime(dob);
            
            if (today.get(Calendar.MONTH) < birthDate.get(Calendar.MONTH) || 
                (today.get(Calendar.MONTH) == birthDate.get(Calendar.MONTH) && today.get(Calendar.DAY_OF_MONTH) < birthDate.get(Calendar.DAY_OF_MONTH))) {
                age--; // Decrease age if birthday hasn't occurred yet this year
            }

            String area = tutor.getArea();
            String country = tutor.getCountry();
            String province = tutor.getAddress();
            String curriculum = tutor.getSyllabus();
            String tutoring = tutor.getAvailability();
            String subjects = tutor.getSubjects();
            String qualifications = tutor.getBio();
            int ratings = tutor.getRatings();
            String descTutor = tutor.getHoursTutored();

            
  %>


    <div class="whole-wrapper">
        <div class="main-section">

            <div class="the-left">
                <!-- Tutor's Picture and Info Div -->
                <div class="profile-picture-container">
                    <img src="data:image/png;base64,<%= tutorImage %>" alt="Tutor's Picture">
                    <div class="name"><%= name %></div>
                    <div class="age"><%= age %> years old</div>
                </div>
                <!-- Tutor's information div -->

                <div class="details">
                    <p>
                        <span class="static-text">Country :</span> <span class="detail-info"><%= country %></span><br>
                        <span class="static-text">Province :</span> <span class="detail-info"><%= province %></span><br>
                        <span class="static-text">Area :</span> <span class="detail-info"><%= area %></span><br>
                        <span class="static-text">Curriculum :</span> <span class="detail-info"><%= curriculum%></span><br>
                        <span class="static-text">Tutoring Option :</span> <span class="detail-info"><%= tutoring %></span>
                    </p>
                    <div class="ratings">
                        <i class="fas fa-star" id="rate-icon"></i>
                        <span id="rate"> <%= ratings %> Ratings</span>
                    </div>
                    <div class="feedback-item">
                        <i class="fas fa-check-circle" id="back-icon"></i>
                        <span class="back">Background Checked</span>
                    </div>
                </div>

                <!--Book Tutor Button-->
                <div class="profile-action">
                    <button id="book-tutor-button" class="book-tutor-button">Book tutorName</button>
                </div>


                <div class="matric">
                    <img src="matric.png" alt="Matric">

                </div>
            </div>

            <div class="right-side">

                <div class="profile-container">

                    <div class="about-tutor-row">
                        <div class="about-tutor-title"><i class="far fa-user"></i>&nbsp;&nbsp;Bio</div>
                        <div class="about-tutor-info">
                            <p id="profile_about">
                                <%= descTutor %>
                            </p>
                        </div>
                    </div>
                    <div class="qualifications-row">
                        <div class="qualifications-title"><i class="fas fa-university"></i>&nbsp;&nbsp;Education</div>

                        <div class="subjects-info">
                            <ul>
                                <%
                                    String[] c = qualifications.split(",");
                                    for (String s : c) {
                                %>
                                    <li>•&nbsp;<%= s.trim() %></li>
                                <% } %>
                            </ul>
                            <br><br>
                        </div>
                        <br><br>

                    </div>
                    <div class="subjects-row">
                        <div class="subjects-title">
                            <div class="header">
                                <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                            </div>
                            <div class="tutoring-container">
                                School tutoring<br>
                                <span class="grades">GRD:1 - GRD:12</span>
                            </div>
                        </div>
                      
                            <div class="subjects-info">
                                <%
                               
                                    String[] sub = subjects.split(",");
                                    for (String subject : sub) {
                                %>
                                    <p><%= subject %></p>
                                <% } %>
                                <br><br>
                            </div>
                        
                    </div>

                </div>

                <div class="long-paragraph">
                    See the feedback and accolades from individuals who have experienced my work firsthand.
                </div>

                <section class="container">

                    <div class="card__container swiper">
                        <div class="card__content">
                            <div class="reviews">
                                <i class="fas fa-star" id="rate-icon"></i>
                                <span id="rev">Reviews</span>
                            </div>
                            <div class="swiper-wrapper">

                                <article class="card__article swiper-slide">


                                    <div class="card__data">
                                        <h3 class="card__name">Vuyiswa</h3>
                                        <p class="card__description">
                                            I am extremely certified and content with Apex arcademic,my son always looks forward
                                            to meet with his tutor Mr Prince,his confidence with Math has improved.Prince is doing
                                            a marvelous work.
                                        </p>

                                    </div>
                                </article>

                                <article class="card__article swiper-slide">


                                    <div class="card__data">
                                        <h3 class="card__name">Bongisani</h3>
                                        <p class="card__description">
                                            I am extremely certified and content with Apex arcademic,my son always looks forward
                                            to meet with his tutor Mr Prince,his confidence with Math has improved.Prince is doing
                                            a marvelous work.
                                        </p>


                                    </div>
                                </article>

                                <article class="card__article swiper-slide">


                                    <div class="card__data">
                                        <h3 class="card__name">Mdu</h3>
                                        <p class="card__description">
                                            I am extremely certified and content with Apex arcademic,my son always looks forward
                                            to meet with his tutor Mr Prince,his confidence with Math has improved.Prince is doing
                                            a marvelous work.
                                        </p>


                                    </div>
                                </article>

                                <article class="card__article swiper-slide">


                                    <div class="card__data">
                                        <h3 class="card__name">Mabhena</h3>
                                        <p class="card__description">
                                            I am extremely certified and content with Apex arcademic,my son always looks forward

                                        </p>


                                    </div>
                                </article>

                                <article class="card__article swiper-slide">

                                    <div class="card__data">
                                        <h3 class="card__name">Shobane</h3>
                                        <p class="card__description">
                                            I am extremely certified and content with Apex arcademic,my son always looks forward
                                            to meet with his tutor Mr Prince,his confidence with Math has improved.Prince is doing
                                            a marvelous work.
                                        </p>


                                    </div>
                                </article>
                            </div>
                        </div>

                        <!-- Navigation buttons -->
                        <div class="swiper-button-next">
                            <i class="ri-arrow-right-s-line"></i>
                        </div>

                        <div class="swiper-button-prev">
                            <i class="ri-arrow-left-s-line"></i>
                        </div>

                        <!-- Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </section>

                <div class="short-paragraph">
                    Your Personal Tutor in the Comfort of Your Own Home
                    <!--Book Tutor Button and find tutor-->
                    <div class="button-action">
                        <button id="book-tutor-button" class="book-tutor-button">Book tutorName</button>
                        <button id="find-tutor-button" class="find-tutor-button">Find Me A Tutor</button>
                    </div>
                </div>

            </div>

        </div>

    </div>
    

    <div class="arrow-container">
        <button class="arrow" id="scrollLeft">&#10094;</button>
        
        <div class="scroll-container" id="scrollContainer">
            <%
            List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
            String excludedName = (String) request.getAttribute("name"); // Assuming 'name' is set in request scope
            if (tutors != null && !tutors.isEmpty()) {
                for (Tutor t : tutors) {
                    byte[] imgs = t.getImage();
                    String tutorImg = java.util.Base64.getEncoder().encodeToString(imgs);
                    String tName = t.getFullNames();
    
                    // Check if the tutor's name does not match the excluded name
                    if (excludedName == null || !tName.equals(excludedName)) {
            %>
                        <div class="scroll-item">
                            <img src="data:image/png;base64,<%= tutorImg %>" alt="Member Image" id="isthombe">
                            <p><%= tName %></p>
                            <p class="reviews" style="margin-top: 10px;">
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                            </p>
                        </div>
            <%
                    }
                }
            } else {
            %>
                <div class="no-tutors">
                    <p>No tutors found.</p>
                </div>
            <%
            }
            %>
        </div>
    
        <button class="arrow" id="scrollRight">&#10095;</button>
    </div>
    
    
    <script>
    const scrollContainer = document.getElementById('scrollContainer');

document.getElementById('scrollLeft').addEventListener('click', () => {
    scrollContainer.scrollLeft -= 210; // Adjust as necessary
});

document.getElementById('scrollRight').addEventListener('click', () => {
    scrollContainer.scrollLeft += 210; // Adjust as necessary
});

    </script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--=============== SWIPER JS ===============-->
    <script src="swiper-bundle.min.js"></script> 

    <!--=============== MAIN JS ===============-->
     <script src="main.js"></script> 


</body>
</html>
