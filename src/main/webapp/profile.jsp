<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <!--=============== REMIXICONS ===============-->
          <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
          <!--=============== SWIPER CSS ===============-->
         <link rel="stylesheet" href="assets/swiper-bundle.min.css"> 
    
          <!--=============== CSS ===============-->
          <link rel="stylesheet" href="assets/styles.css">
          <link href="bookingRep.css" rel="stylesheet">
          <link href="profilePage.css" rel="stylesheet"> 
          <style>
         
         .checkbox-container{
            display: inline-flex;
        }   
                
        .opt{
            display: none;
        }

        #fProvince{
            display: none; /* Hide province by default */
        }

        .popup {
                display: flex;
                justify-content: center;
                align-items: center;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1000;
            }

            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                width: 500px;
                text-align: center;
                cursor: pointer;
            }

            .popup-content:hover {
                    transform: scale(1.05); /* Slightly enlarge on hover */
                }

            .close {
                cursor: pointer;
                float: right;
                font-size: 20px;
            }
            .hide {
                display: none;
            }

            #pack-details {
                text-align: left; /* Aligns text to the left */
                /* Optional: You can also add padding or margin for better appearance */
                padding: 10px; 
            }

            .package-details:hover{
                transform: scale(1.05); /* Slightly enlarge on hover */
            }

            #popular{
                color: #001549;
                font-weight: bold;
            }

            @media screen and (max-width: 1024px) {

                
                .popup {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background-color: rgba(0, 0, 0, 0.5);
                        z-index: 1000;
            }

            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                width: 300px;
                text-align: center;
                cursor: pointer;
            }

            .popup-content:hover {
                    transform: scale(1.05); /* Slightly enlarge on hover */
                    cursor: pointer;
                }

            .close {
                cursor: pointer;
                float: right;
                font-size: 20px;
            }
            .hide {
                display: none;
            }

            #pack-details {
                text-align: left; /* Aligns text to the left */
                /* Optional: You can also add padding or margin for better appearance */
                padding: 10px; 
            }

            .package-details:hover{
                transform: scale(1.05); /* Slightly enlarge on hover */
                cursor: pointer;
            }

            #popular{
                color: #001549;
                font-weight: bold;

            }
                
            }

            .subject-label {
                max-width: 250x; /* Set max width for the label */
                overflow: hidden; /* Hide overflow text */
                text-overflow: ellipsis; /* Show ellipsis for overflow text */
                white-space: nowrap; /* Prevent text wrapping */
                display: flex; /* Keep flex for alignment */
                align-items: center; /* Center checkbox and text */
            }

            #tutorNameDisplay{
                font-size: 20px;
            }

            #termsCondition{

                  color: #02A552;
            }
       

    </style>
    <title>ApexAcademicCentre</title>
</head>
<body>
 
    <nav class="navbar">
        <img src="apex.png" alt="Logo" class="logo" id="logo_image">
        <button class="navbar-toggle" id="navbar-toggle">
            <i class="fas fa-bars"></i> <!-- Hamburger icon -->
        </button>
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


            <li>
                <button class="login-register" id="tutorBtn" onclick="openOpenopen()">
                   Book Tutor
                </button>
            </li>
        </ul>
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
            String email = tutor.getEmail().trim().replaceAll("\\s+", "");
            String descTutor = tutor.getHoursTutored();
            String surname = tutor.getSurname();
            String modules = tutor.getModule();
            String fullName = name;
            String grades = tutor.getGrades();
            int exp = tutor.getExperience();

            
  %>


    <div class="whole-wrapper">
        <div class="main-section">

            <div class="the-left">
                <!-- Tutor's Picture and Info Div -->
                <div class="upper-line">
                    <div class="profile-picture-container">
                        <img src="data:image/png;base64,<%= tutorImage %>" alt="Tutor's Picture">
                        <div class="name"><%= name %></div>
                        <div class="age"><%= age %> years old</div>
                        <div class="age"><%= exp %> year(s) experience</div>
                    </div>
                    <div class="details">
                        <p>
                            <span class="static-text">Country :</span> <span class="detail-info"><%= country %></span><br>
                            <span class="static-text">Province :</span> <span class="detail-info"><%= province %></span><br>
                            <span class="static-text">Area :</span> <span class="detail-info"><%= area %></span><br>
                            <span class="static-text">Curriculum :</span> <span class="detail-info"><%= curriculum %></span><br>
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
                </div>
                

                <!--Book Tutor Button-->
                <div class="profile-action">
                    <button id="book-tutor-button" class="book-tutor-button" onclick="openOpenopen('<%= fullName %>' , '<%= email %>', '<%= curriculum %>', '<%= grades %> ', '<%= subjects %> ')">Book <%= name %></button>
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

                        <div class="subjects-info" >
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
                            <div class="school_head">
                                <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                            </div>
                            <div class="bongi">
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
                   
                    <%
                    if (modules != null && !modules.isEmpty()) { // Check for null and empty
                    %>
                        <div class="University-row">
                            <div class="subjects-title">
                                <div class="header1">
                                    <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                                </div>
                                <div class="tutoring-container1">
                                    University tutoring<br>
                                    <span class="modules">1st yr - 4th yr</span>
                                </div>
                            </div>
                            <div class="subjects-info">
                                <%
                                String[] mod = modules.split(",");
                                for (String modu : mod) {
                                %>
                                    <p><%= modu.trim() %></p> <!-- Trim to remove any leading/trailing whitespace -->
                                <% } %>
                                <br><br>
                            </div>
                        </div>
                    <%
                    } else {
                    %>
                       
                    <%
                    }
                    %>

                </div>

                <div class="long-paragraph">
                    See the feedback and accolades from individuals who have experienced my work firsthand.
                </div>

                <section class="container">

                    <div class="card__container swiper">
                        <div class="card__content">
                            <div class="reviews1">
                                <i class="fas fa-star" id="rate-icon"></i>
                                <span id="rev">Reviews</span>
                            </div>
                            <div class="swiper-wrapper">
                                <%
                                    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                                    Set<String> displayedTutors = new HashSet<>();
                                    boolean hasReviews = false; // Flag to check if there are any approved reviews
                                    int reviewCount = 0; // Counter to limit displayed reviews
                                    final int maxReviewsToShow = 3; // Maximum reviews to show
                    
                                    if (reviews != null) {
                                        for (Review r : reviews) {
                                            String emailTutor = r.getTutorEmail().trim().replaceAll("\\s+", "");
                                            if (emailTutor.equals(email) && r.getStatus().equals("approved")) {
                                                hasReviews = true; // Set flag if there's at least one approved review
                                                String tutName = r.getName();
                                                String reviewDescription = r.getMessage();
                                                
                                                // Create a unique key for each tutor's review
                                                String uniqueKey = emailTutor + "_" + tutName;
                    
                                                // Only display if this unique key hasn't been displayed yet
                                                if (!displayedTutors.contains(uniqueKey)) {
                                                    displayedTutors.add(uniqueKey);
                                                    reviewCount++; // Increment the review counter
                    
                                                    // Limit the number of displayed reviews
                                                    if (reviewCount > maxReviewsToShow) {
                                                        break; // Exit the loop if the limit is reached
                                                    }
                                %>
                                                    <article class="card__article swiper-slide">
                                                        <div class="card__data">
                                                            <h3 class="card__name"><%= tutName %></h3>
                                                            <p class="card__description">
                                                                <%= reviewDescription != null ? reviewDescription : "No description available." %>
                                                            </p>
                                                        </div>
                                                    </article>
                                <%
                                                }
                                            }
                                        }
                                    }
                    
                                    // Display a message if no approved reviews were found
                                    if (!hasReviews) {
                                %>
                                        <p>No reviews available.</p>
                                <%
                                    }
                                %>
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
                    </div>
                    
                </section>

                <div class="short-paragraph">
                    Your Personal Tutor in the Comfort of Your Own Home
                    <br>
                    <!--Book Tutor Button and find tutor-->
                    <div class="button-action">
                        <button id="book-tutor-button" class="book-tutor-button" onclick="openOpenopen('<%= fullName %>' , '<%= email %>', '<%= curriculum %>', '<%= grades %> ', '<%= subjects %>')">Book <%= name %></button>
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



     <!--BOOKING FORM--> 
	
    
     <div class="wrapper" id="modal">

        <div class="modal-content" id="yesyes">

        <span class="close-btn" id="close-popup">&times;</span>
        <!--START OF FORMS-->
        <div class="form_wrap">
            <div class="form_1 data_info">
                <h2><span class="directTutor"></span></h2>
                <br>
                <form id="contact-form">
                    <div class="form_container">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="first-name">First Name <span class="required">*</span></label>
                                <input type="text" id="first-name" name="first-name" class="input" placeholder="Sihle" required>
                                <div id="first-name-error" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="last-name">Last Name <span class="required">*</span></label>
                                <input type="text" id="last-name" name="last-name" class="input" placeholder="Sithole" required>
                                <div id="last-name-error" class="error"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">Email <span class="required">*</span></label>
                                <input type="email" id="email" name="email" class="input" placeholder="example@domain.com" required>
                                <div id="email-error" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone <span class="required">*</span></label>
                                <input 
                                    type="tel" 
                                    id="phone" 
                                    name="phone" 
                                    class="input" 
                                    placeholder="+27797565412" 
                                    required 
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                >
                                <div id="phone-error" class="error"></div>
                            </div>
                        </div>

                        <div class="form-row">

                            <div class="form-group">
                                <label for="country">Country <span class="required">*</span></label>
                                <select id="country" name="country" class="input" required>
                                    <option value="" disabled selected>Select your country</option>
                                    <option value="South Africa">South Africa</option>
                                    <option value="Australia">Australia</option>
                                    <option value="Japan">Japan</option>
                                    <option value="Brazil">Brazil</option>
                                    <option value="India">India</option>
                                    <option value="Mexico">Mexico</option>
                                    <option value="France">France</option>
                                    <option value="Italy">Italy</option>
                                    <option value="Germany">Germany</option>
                                </select>
                                <div id="country-error" class="error"></div>
                            </div>

                            <div class="form-group" id="fProvince">
                                <label for="province">Province <span class="required">*</span></label>
                                <select id="province" name="province" class="input" required>
                                    <option value="" disabled selected>Select your province</option>
                                    <option value="limpopo">Limpopo</option>
                                    <option value="gauteng">Gauteng</option>
                                    <option value="free-state">Free State</option>
                                    <option value="north-west">North West</option>
                                    <option value="northern-cape">Northern Cape</option>
                                    <option value="eastern-cape">Eastern Cape</option>
                                    <option value="kwa-zulu-natal">Kwa Zulu Natal</option>
                                    <option value="mpumalanga">Mpumalanga</option>
                                    <option value="western-cape">Western Cape</option>
                                </select>
                                <div id="province-error" class="error"></div>
                            </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="language">Language<span class="required">*</span></label>
                                <select id="language" name="language" class="input" required>
                                    <option value="" disabled selected>Select Language of Instruction</option>
                                    <option value="English">English</option>
                                </select>
                                <div id="language-error" class="error"></div>
                            </div>

                        </div>


                    </div>
                    <div class="btns_wrap">
                        <div class="common_btns form_1_btns">
                            <button type="button" class="btn_next">Next</button>
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <input type="hidden" id="hiddenTutorName" name="hiddenTutorName">
                        <input type="hidden" id="hiddenTutorEmail" name="hiddenTutorEmail">

                    </div>
                </form>
            </div>
            <div class="form_2" style="display: none;">
               <h2><span class="directTutor"></span></h2>
                <br>
                <div id="form-container-2" class="form-container hidden">
                    <form id="additional-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="tutoring-for">Who is the tutoring for? <span class="required">*</span></label>
                                <select id="tutoring-for" name="tutoring-for" required onchange="toggleReadOnly()">
                                    <option value="" disabled selected>Select one</option>
                                    <option value="my-son">My son</option>
                                    <option value="my-daughter">My daughter</option>
                                    <option value="me">Me</option>
                                    <option value="someone-else">Someone else</option>
                                </select>
                                <div id="tutoring-for-error" class="error"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>What do you need help with? <span class="required">*</span></label>
                                <div class="radio-group">
                                    <label>
                                        <input type="radio" id="help-with" name="help-with" value="school" onclick="studentInfo()" required>
                                        School
                                    </label>
                                    <label>
                                        <input type="radio" id="help-with" name="help-with" value="university" onclick="vasityInfo()" required>
                                        University
                                    </label>
                                    <div id="help-with-error" class="error"></div>
                                </div>
                            </div>
                        </div>
                    
                        <div id="student-info" class="hidden">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="student-name">Student Name <span class="required">*</span></label><br>
                                    <input type="text" id="student-name" name="student-name" placeholder="Student name" class="input" required>
                                    <div id="student-name-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="student-last-name">Last name <span class="required">*</span></label><br>
                                    <input type="text" id="student-last-name" name="student-last-name" placeholder="Last name" class="input" required>
                                    <div id="student-last-name-error" class="error"></div>
                                </div>
                            </div>
                        
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="grade">Grade <span class="required">*</span></label><br>
                                    <select id="grade" name="grade" required>
                                        <option value="" disabled selected>Select grade</option>
                                    </select>
                                    <div id="grade-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="syllabus">Syllabus <span class="required">*</span></label>
                                    <select id="syllabus" name="syllabus" required>
                                        <option value="Other" id="other-option">Other</option>
                                    </select>
                                    <div id="syllabus-error" class="error"></div>
                                </div>
                            </div>
                        </div>
                    
                        <div id="year-selection-container" class="hidden">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="stud-name">Student Name <span class="required">*</span></label><br>
                                    <input type="text" id="stud-name" name="stud-name" placeholder="Student name" class="input" required>
                                    <div id="stud-name-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="stud-last">Last name <span class="required">*</span></label><br>
                                    <input type="text" id="stud-last" name="stud-last" placeholder="Last name" class="input" required>
                                    <div id="stud-last-error" class="error"></div>
                                </div>
                            </div>
                    
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Select year <span class="required">*</span></label>
                                    <div class="radio-group">   
                                        <label>
                                            <input type="radio" id="year" name="year" value="1st" required onchange="checkPostgrad()">
                                            1st
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="2nd" required onchange="checkPostgrad()">
                                            2nd
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="3rd" required onchange="checkPostgrad()">
                                            3rd
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="4th" required onchange="checkPostgrad()">
                                            4th
                                        </label>
                                        <label>
                                            <input type="radio" id="year-postgrad" name="year" value="postgrad" required onchange="checkPostgrad()">
                                            Postgrad
                                        </label>
                                        <div id="year-error" class="error"></div>
                                    </div>
                                    <div id="postgrad-options" class="opt">
                                        <label>
                                            <input type="radio" name="postgrad-type" value="Honors" required>
                                            Honors
                                        </label>
                                        <label>
                                            <input type="radio" name="postgrad-type" value="Masters" required>
                                            Masters
                                        </label>
                                        <div id="postType-error" class="error"></div> 
                                    </div>

                                </div>
                            </div>
                        </div> 
                    
                        <div class="btns_wrap">
                            <div class="common_btns form_2_btns">
                                <button type="button" class="btn_back">Back</button>
                                <button type="button" class="btn_next">Next</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="form_3" style="display: none;" id="formThree">
                <h2><span class="directTutor"></span></h2>
                <br>
            
                <form id="submit-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="subject">Subjects<span class="required">*</span></label><br>
                            <input type="text" id="subject" name="subject" class="input" placeholder="Mathematics,Mathematics Literacy...." required readonly onclick="toggleSubjectOptions()">
                            <div id="subjectContainer" style="display: none;"></div>
                            <div id="subject-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="tutor-style">Tutoring Option<span class="required">*</span></label>
                        <select id="tutor-style" name="tutor-style" required onchange="handleTutorStyleChange()">
                            <option value="" disabled selected>Select an option</option>
                            <option value="Online">Online</option>
                            <option value="In Person" id="in-peerson">In-Person</option>
                        </select>
                        <div id="tutor-style-error" class="error"></div>
                    </div>

                    <div class="row" id="internetCheck">
                        <div class="checkbox-container">
                            <br>
                            <input type="checkbox" id="internet-check" name="internet-check" />
                            <label for="internet-check">
                                You have fast, stable internet (2Mbps or higher). You must have a computer, laptop, tablet, or phone with a Webcam, microphone and speakers.
                            </label>
                            <div id="internet-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-row" id="in-person-teaching">

                        <div class="form-group">
                            <label for="suburb-inperson">Suburb<span class="required">*</span></label><br>
                            <input type="text" id="suburb-inperson" name="suburb-inperson" placeholder="Which suburb do you stay" class="input" required>
                            <div id="suburb-inperson-error" class="error"></div>
                        </div>

                        <div class="form-group">
                            <label for="address">When would you like to start<span class="required">*</span></label><br>
                            <select id="address-inperson" name="address-inperson" class="input" required>
                                <option value="" disabled selected>Select an option</option>
                                <option value="ASAP">ASAP</option>
                                <option value="This Week">This Week</option>
                                <option value="This Month">This Month</option>
                                <option value="Not right now">Not right now</option>
                            </select>
                            <div id="inperson-error" class="error"></div>
                        </div>
                    </div>


                <div class="btns_wrap">
                    <div class="common_btns form_3_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next">Next</button>
                    </div>
                </div>
            </form>
            </div>
     

            <div class="form_4" style="display: none;" >
                <h2><span class="directTutor"></span></h2>
                <div id="Message" class="hidden">
                    <form id="formFour">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="message">Message <span class="required"></span></label><br><br>
                            <textarea id="message" name="message" placeholder="Is there anything else you would like to add?...." class="textarea" required></textarea>
                            <div id="message-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-group" id="tutor-option-group">
                        <label>Would you like a second tutor option?<span class="required">*</span></label>
                        <div class="radio-group">
                            <br>
                            <label>
                                <input type="radio" name="tutor-option" value="Yes" required>
                                Yes
                            </label>
                            <label>
                                <input type="radio" name="tutor-option" value="No" required >
                                No
                            </label>
                            <div id="tutor-option-error" class="error"></div>
                        </div>
                    </div>

                    <div class="terms-row">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">
                            I have read and agree to the <a href="#" target="_blank" id="termsCondition">Terms and Conditions</a> and <a href="#" target="_blank" id="termsCondition">Privacy Policy</a>.<span class="required">*</span>
                        </label>
                        <div id="terms-error" class="error"></div>
                    </div>

                <div class="btns_wrap">
                    <div class="common_btns form_4_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next">Next</button>
                    </div>
                </div>
               </form>
            </div>
        </div>

            <!--form 5-->

            <div class="form_5" style="display: none;" id="formFive">
                <h2>Payment Packages</h2>
                
                <div class="div-container" id="schoolPackages">
                    <div class="custom-div">
                        <p>Once Off Package</p>
                        <div class="content">
                            <div class="session-per-month">1 Session per month<br>(once off)</div>
                            <div class="package-details" onclick="onceOffPackage()">Package Details</div>
                            <button type="submit" class="package-btn" id="onceOffPackage">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>Basic Package</p>
                        <div class="content">
                            <div class="session-per-month">4 Sessions per month<br>(once a week)</div>
                            <div class="package-details" onclick="basicPackage()">Package Details</div>
                            <button type="submit" class="package-btn" id="basicPackage">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>Premium Package</p>
                        <div class="content">
                            <div class="session-per-month">8 Sessions per month<br>(twice a week)</div>
                            <div class="package-details" onclick="premiumPackage()" id="popular">Popular</div>
                            <button type="submit" class="package-btn" id="premiumPackage">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>Advanced Package</p>
                        <div class="content">
                            <div class="session-per-month">12 Sessions per month<br>(three times a week)</div>
                            <div class="package-details" onclick="advanceElite()">Package Details</div>
                            <button type="submit" class="package-btn" id="advancedPackage">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>Elite Package</p>
                        <div class="content">
                            <div class="session-per-month">16 Sessions per month<br>(four times a week)</div>
                            <div class="package-details" onclick="advanceElite()">Package Details</div>
                            <button type="submit" class="package-btn" id="elitePackage">Select</button>
                        </div>
                    </div>
                </div>
            
                <div class="div-container" id="universityPackages">
                    <div class="custom-div">
                        <p>One on One</p>
                        <div class="content">
                            <div class="package-details" onclick="oneOnoneUniversity()">Package Details</div>
                            <button type="submit" class="package-btn" id="oneOnone">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>2 to 5 students</p>
                        <div class="content">
                            <div class="package-details" onclick="groupUniversity()">Package Details</div>
                            <button type="submit" class="package-btn" id="twoTofivePackage">Select</button>
                        </div>
                    </div>
                    <div class="custom-div">
                        <p>6 to 10 students</p>
                        <div class="content">
                            <div class="package-details" onclick="groupUniversity()">Package Details</div>
                            <button type="submit" class="package-btn" id="sixTo10Package">Select</button>
                        </div>
                    </div>
                </div>
                
                <div class="btns_wrap">
                    <div class="common_btns form_5_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next" id="consult_btn">Speak to consultant</button>
                    </div>
                </div>
            </div>
            

            <!--form 5-->

       <!--</div>-->


        <div id="popup" class="popup hide">
            <div class="popup-content">
                <span class="close" onclick="closePopup()">&times;</span>
                <h2>Package Details</h2>
                <div id="pack-details"></div>
                <!-- Add more details as needed -->
            </div>
        </div>


        <!--END OF FORMS-->
        <div class="modal_wrapper">
            <div class="shadow"></div>
            <div class="success_wrap">
                <div class="modal_icon">✓</div>
                <p>Thank you! Your form has been submitted successfully.</p>
            </div>
        </div>
    </div>
</div>
</div>

     <!--BOOKING FORM--> 
    
    
    <script>

const navbarToggle = document.getElementById('navbar-toggle');
const navLinks = document.querySelector('.nav-links');

// Toggle menu on button click
navbarToggle.addEventListener('click', function() {
    navLinks.classList.toggle('show');
});

// Close menu when a link is clicked
navLinks.querySelectorAll('li a').forEach(link => {
    link.addEventListener('click', function() {
        navLinks.classList.remove('show'); // Close the menu
    });
});

// Optional: Close menu when clicking outside of it
window.addEventListener('click', function(event) {
    if (!navbarToggle.contains(event.target) && !navLinks.contains(event.target)) {
        navLinks.classList.remove('show'); // Close the menu
    }
});



    const scrollContainer = document.getElementById('scrollContainer');

document.getElementById('scrollLeft').addEventListener('click', () => {
    scrollContainer.scrollLeft -= 210; // Adjust as necessary
});

document.getElementById('scrollRight').addEventListener('click', () => {
    scrollContainer.scrollLeft += 210; // Adjust as necessary
});


         /*#########################BOOKINGS#######################*/

         function onceOffPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session 
        <ul>
            <li>•Format: One-on-one live sessions </li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one In-person tutoring at your home</li>
            <li>•Pricing: All prices are quoted in South African Rand.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}


function basicPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Only covers one subject in a month</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers one subject per month.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');
}

function premiumPackage(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Covers 2 subjects in a month</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers up to two subjects per month.</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}


function advanceElite(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');
var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

if (ghg === "Online" && forwho === 'school' ){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one live sessions</li>
            <li>•Special Offer: 10% sibling discount available</li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
            <li>•Covers two or more subjects per month </li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•Format: One-on-one, in-person tutoring at your home</li>
            <li>•Pricing: All prices quoted in South African Rand (ZAR)</li>
            <li>•Family Discount: 10% sibling discount available.</li>
            <li>•Covers two or more subjects </li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');
  
}

function oneOnoneUniversity(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');

if (ghg === "Online"){

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Format: One-on-one live sessions.</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions</li>
            <li>•All prices are quoted in South African Rand (ZAR).</li>
        </ul>`;
      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Location: Campus or home tutoring</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions.</li>
            <li>•All prices are quoted in South African Rand (ZAR)</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');

}

function groupUniversity(){

var ghg = document.getElementById('tutor-style').value.trim(); 
var pack_details = document.getElementById('pack-details');

if (ghg === "Online"){

    pack_details.innerHTML = `
        •Duration: 60 minutes per session
        <ul>
            <li>•All sessions are live interactive learning experiences </li>
            <li>•Currency: All prices quoted in South African Rand (ZAR)</li>
          
        </ul>`;


      
} 

else{

    pack_details.innerHTML = `
        •Duration: 60 minutes 
        <ul>
            <li>•Location: Campus or home tutoring</li>
            <li>•Discount: we offer a discount if you book more than 5 sessions.</li>
            <li>•All prices are quoted in South African Rand (ZAR)</li>
        </ul>`;

   }

document.getElementById('popup').classList.remove('hide');


}




function closePopup() {
document.getElementById('popup').classList.add('hide');
}

function openPackageDetailsUniversity(){

var pack_details = document.getElementById('pack-details');
var ghg = document.getElementById('tutor-style').value.trim(); 


if (ghg === "In Person"){

pack_details.innerHTML = `
•Each session is 60 minutes
<ul>
<li>•Campus Tutoring or home tutoring (in-person)</li>
<li>•All prices are in South African currency</li>
</ul>`;

}
else{


pack_details.innerHTML = `
•Live sessions
<ul>
<li>•These prices are per session</li>
<li>•All prices are in South African currency</li>
</ul>`;

}

document.getElementById('popup').classList.remove('hide');


}

document.addEventListener('DOMContentLoaded', function() {
const otherOption = document.getElementById('other-option');
otherOption.style.display = 'none'; // Hide the "Other" option
});

document.addEventListener('DOMContentLoaded', function() {
var form_1 = document.querySelector(".form_1");
var form_2 = document.querySelector(".form_2");
var form_3 = document.querySelector(".form_3");
var form_4 = document.querySelector(".form_4");
var form_5 = document.querySelector(".form_5");

var form_1_btns = document.querySelector(".form_1_btns");
var form_2_btns = document.querySelector(".form_2_btns");
var form_3_btns = document.querySelector(".form_3_btns");
var form_4_btns = document.querySelector(".form_4_btns");
var form_5_btns = document.querySelector(".form_5_btns");

var form_1_next_btn = document.querySelector(".form_1_btns .btn_next");
var form_2_back_btn = document.querySelector(".form_2_btns .btn_back");
var form_2_next_btn = document.querySelector(".form_2_btns .btn_next");
var form_3_back_btn = document.querySelector(".form_3_btns .btn_back");
var form_3_next_btn = document.querySelector(".form_3_btns .btn_next");
var form_4_back_btn = document.querySelector(".form_4_btns .btn_back");
var form_4_next_btn = document.querySelector(".form_4_btns .btn_next");
var form_5_back_btn = document.querySelector(".form_5_btns .btn_back");
var consult = document.querySelector(".form_5_btns .btn_next");


var form_2_progessbar = document.querySelector(".form_2_progessbar");
var form_3_progessbar = document.querySelector(".form_3_progessbar");

var btn_done = document.querySelector(".btn_done");
var modal_wrapper = document.querySelector(".modal_wrapper");
var shadow = document.querySelector(".shadow");

function validateForm1() {

    var firstName = document.getElementById('first-name').value.trim();
    var lastName = document.getElementById('last-name').value.trim();
    var email = document.getElementById('email').value.trim();
    var phone = document.getElementById('phone').value.trim();
    var province = document.getElementById('province').value;
    var country = document.getElementById('country').value;
    var language = document.getElementById('language').value;

    var isValid = true;

    // Validate required text inputs
    if (!firstName) {
        document.getElementById('first-name-error').textContent = "First name is required.";
        isValid = false;
    } else {
        document.getElementById('first-name-error').textContent = "";
    }

    if (!lastName) {
        document.getElementById('last-name-error').textContent = "Last name is required.";
        isValid = false;
    } else {
        document.getElementById('last-name-error').textContent = "";
    }

    if (!email) {
        document.getElementById('email-error').textContent = "Email is required.";
        isValid = false;
    } else {
        document.getElementById('email-error').textContent = "";
    }

    if (!phone) {
    document.getElementById('phone-error').textContent = "Phone number is required.";
    isValid = false;
} else {
    // Check if it consists of only digits
    const phoneRegex = /^[0-9]+$/; // Matches any length of digits

    if (!phoneRegex.test(phone)) {
        document.getElementById('phone-error').textContent = "Phone number must consist of digits only.";
        isValid = false;
    } else {
        document.getElementById('phone-error').textContent = "";
    }
}

    if (!country) {
        document.getElementById('country-error').textContent = "Country is required.";
        isValid = false;
    } else {
        document.getElementById('country-error').textContent = "";
    }

    // Validate radio buttons
    if (!language) {
        document.getElementById('language-error').textContent = "Language is required.";
        isValid = false;
    } else {
        document.getElementById('language-error').textContent = "";
    }

    // Validate dropdown
    if(country === "South Africa"){
         document.getElementById("in-peerson").style.display = 'block';
        if (!province) {
        document.getElementById('province-error').textContent = "Please select a province.";
        isValid = false;
    } else {
        document.getElementById('province-error').textContent = "";
    }

    }
   else{

       document.getElementById("in-peerson").style.display = 'none';
   }


    return isValid;                



}

function validateForm2() {

    var isValid = true;
    var tutoringfor = document.getElementById("tutoring-for").value;
    var helpingFor = document.querySelector('input[name="help-with"]:checked');
    var ghg = helpingFor ? helpingFor.value : 'None';
    var studentName = document.getElementById('student-name').value.trim();
    var studentLastName = document.getElementById('student-last-name').value.trim();
    var yearFor = document.querySelector('input[name="year"]:checked');
    var syllabusId = document.getElementById('syllabus').value;
    var gradeId = document.getElementById('grade').value;
    var studname =  document.getElementById('stud-name').value;
    var studlast =  document.getElementById('stud-last').value;
    
    
    if(ghg === "school"){
        
        if (!studentName) {
        document.getElementById('student-name-error').textContent = "Student name is required.";
        isValid = false;
    } else {
        document.getElementById('student-name-error').textContent = "";
    }

    if (!studentLastName) {
        document.getElementById('student-last-name-error').textContent = "Last name is required.";
        isValid = false;
    } else {
        document.getElementById('student-last-name-error').textContent = "";
    }

    if (!syllabusId) {
        document.getElementById('syllabus-error').textContent = "Please select syllabus.";
        isValid = false;
    } else {
        document.getElementById('syllabus-error').textContent = "";
    }

    if (!gradeId) {
        document.getElementById('grade-error').textContent = "Please select grade.";
        isValid = false;
    } else {
        document.getElementById('grade-error').textContent = "";
    }

    }else{
        
        if (!yearFor) {
        document.getElementById('year-error').textContent = "Please select year.";
        isValid = false;
        } else {
        document.getElementById('year-error').textContent = "";
        }

        const postgradRadio = document.getElementById('year-postgrad');
        var postType = document.querySelector('input[name="postgrad-type"]:checked');

        if (postgradRadio.checked) {
        
             if(!postType){

                document.getElementById('postType-error').textContent = "Please select qualification.";
                isValid = false;

             }

             else{

                document.getElementById('postType-error').textContent = "";

             }
           

        }
    


        if (!studname) {
        document.getElementById('stud-name-error').textContent = "Student name required.";
        isValid = false;
        } else {
        document.getElementById('stud-name-error').textContent = "";
        }

        if (!studlast) {
        document.getElementById('stud-last-error').textContent = "Student surname required.";
        isValid = false;
        } else {
        document.getElementById('stud-last-error').textContent = "";
        }

    }

    // Validate dropdown
    if (!tutoringfor) {
        document.getElementById('tutoring-for-error').textContent = "Please select one.";
        isValid = false;
    } else {
        document.getElementById('tutoring-for-error').textContent = "";
    }

    // Validate radio buttons
    if (!helpingFor) {
        document.getElementById('help-with-error').textContent = "Please choose what you need help with.";
        isValid = false;
    } else {
        document.getElementById('help-with-error').textContent = "";
    }

    return isValid;
}

function validateForm3() {

var isValid = true;

var subject = document.getElementById('subject').value.trim();
var ghg = document.getElementById('tutor-style').value.trim(); 
var addressTeaching = document.getElementById('address-inperson').value.trim(); 
var suburbTeaching = document.getElementById('suburb-inperson').value.trim(); 
var internet_check = document.getElementById('internet-check').value.trim();

if (!subject) {
        document.getElementById('subject-error').textContent = "Please select subject(s) type.";
        isValid = false;
    } else {
        document.getElementById('subject-error').textContent = "";
    }

if (!ghg) {
        document.getElementById('tutor-style-error').textContent = "Please select a tutoring type.";
        isValid = false;
    } else {
        document.getElementById('tutor-style-error').textContent = "";
    }

    if(ghg === "In Person"){
        
        if (!addressTeaching) {
        document.getElementById('inperson-error').textContent = "please specify.";
        isValid = false;
    } else {
        document.getElementById('inperson-error').textContent = "";
    }

    if (!suburbTeaching) {
        document.getElementById('suburb-inperson-error').textContent = "please fill in your suburb.";
        isValid = false;
    } else {
        document.getElementById('suburb-inperson-error').textContent = "";
    }
  }
 
    
    return isValid;

}

consult.addEventListener("click", function() {

    alert("Consultant will get in touch  with you shortly. Thank you.");

    const allData = combineFormData();

    var other = "consult";

    const dataToSend = {
        ...allData, who : other
    };

            fetch('/other-booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataToSend)
                })
                .then(response => response.json())
                .then(result => {
                
                    setTimeout(function(){
                            window.location.href = '/';
                        } , 2000);

                        
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Optionally handle error response
                });

    setTimeout(function(){
        window.location.href = '/';
    } , 2000);

});

function validateForm4() {

    var ghg = document.getElementById('tutor-style').value.trim(); 
    var helpingFor = document.querySelector('input[name="help-with"]:checked');
    var forWho = helpingFor ? helpingFor.value : 'None';
    var syllabusId = document.getElementById('syllabus').value;

    if(forWho === "school"){

        var universityPackages = document.getElementById("universityPackages");
        universityPackages.style.display = 'none';
        var schoolPackages = document.getElementById("schoolPackages");
        schoolPackages.style.display = 'flex';

    if(ghg === "Online" && (syllabusId === "IEB" || syllabusId === "CAPs")){

        const onceOffPackage = document.getElementById('onceOffPackage');
        onceOffPackage.textContent = 'R300'; // I changed R300 to R10 for testing

        const basicPackage= document.getElementById('basicPackage');
        basicPackage.textContent = 'R1100'; // or button.innerHTML = 'Submit';

        const premiumPackage = document.getElementById('premiumPackage');
        premiumPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

        const advancedPackage = document.getElementById('advancedPackage');
        advancedPackage.textContent = 'R3250'; // or button.innerHTML = 'Submit';

        const elitePackage =  document.getElementById('elitePackage');
        elitePackage.textContent = 'R4350'; // or button.innerHTML = 'Submit';

    }
    else{
        if(ghg === "Online" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           
           
        
            const onceOffPackage = document.getElementById('onceOffPackage');
            onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

            const basicPackage= document.getElementById('basicPackage');
            basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

            const premiumPackage = document.getElementById('premiumPackage');
            premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

            const advancedPackage = document.getElementById('advancedPackage');
            advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

            const elitePackage =  document.getElementById('elitePackage');
            elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

        }
        else{
            if(ghg === "In Person" && (syllabusId === "IEB" || syllabusId === "CAPs")){

                

                const onceOffPackage = document.getElementById('onceOffPackage');
                onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

                const basicPackage= document.getElementById('basicPackage');
                basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

                const premiumPackage = document.getElementById('premiumPackage');
                premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

                const advancedPackage = document.getElementById('advancedPackage');
                advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

                const elitePackage =  document.getElementById('elitePackage');
                elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

                    }

                else{
                    if(ghg === "In Person" && (syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel")){
           
                      

                            const onceOffPackage = document.getElementById('onceOffPackage');
                            onceOffPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

                            const basicPackage= document.getElementById('basicPackage');
                            basicPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

                            const premiumPackage = document.getElementById('premiumPackage');
                            premiumPackage.textContent = 'R4300'; // or button.innerHTML = 'Submit';

                            const advancedPackage = document.getElementById('advancedPackage');
                            advancedPackage.textContent = 'R6350'; // or button.innerHTML = 'Submit';

                            const elitePackage =  document.getElementById('elitePackage');
                            elitePackage.textContent = 'R8500'; // or button.innerHTML = 'Submit';

                        }
                       
                }
        }
    }
}

    else{

         var schoolPackages = document.getElementById("schoolPackages");
         schoolPackages.style.display = 'none';
         var universityPackages = document.getElementById("universityPackages");
         universityPackages.style.display = 'flex';


            var yearFor = document.querySelector('input[name="year"]:checked');
            var yearIn = yearFor ? yearFor.value : 'None';

           if(ghg === "In Person" && (yearIn === '1st' ||  yearIn === '2nd')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R650'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R350'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "Online" && (yearIn === '1st' ||  yearIn === '2nd')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R200'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "In Person" && (yearIn === '3rd' ||  yearIn === '4th')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R750'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

            }

            else{

                if(ghg === "Online" && (yearIn === '3rd' ||  yearIn === '4th')){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

            }


            else{

                if(ghg === "In Person" && yearIn === 'postgrad'){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R850'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R750'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

            }
            else{

                if(ghg === "Online" && yearIn === 'postgrad'){
           
           const onceOffPackage = document.getElementById('oneOnone');
           onceOffPackage.textContent = 'R650'; // or button.innerHTML = 'Submit';

           const basicPackage= document.getElementById('twoTofivePackage');
           basicPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

           const premiumPackage = document.getElementById('sixTo10Package');
           premiumPackage.textContent = 'R350'; // or button.innerHTML = 'Submit';

            }
            }



            }


            }


            }


            }

    
      

    }

        var isValid = true;

        var message = document.getElementById('message').value.trim();
        var secondTutor = document.querySelector('input[name="tutor-option"]:checked');
        var ghg = secondTutor ? secondTutor.value : 'None';

        if (!secondTutor) {
        document.getElementById('tutor-option-error').textContent = "Please specify.";
        isValid = false;
        } else {
        document.getElementById('tutor-option-error').textContent = "";
        }
        
        var termsCheckbox = document.getElementById('terms');
            if (termsCheckbox.checked) {
                document.getElementById('terms-error').textContent = "";
            } else {
                document.getElementById('terms-error').textContent = "Required";
                isValid = false;
            }


             return isValid;

        }

form_1_next_btn.addEventListener("click", function() {

    if (validateForm1()) {
        form_1.style.display = "none";
        form_2.style.display = "block";

        form_1_btns.style.display = "none";
        form_2_btns.style.display = "flex";

        form_2_progessbar.classList.add("active");
        form_1.classList.remove("active");
    }
});

form_2_back_btn.addEventListener("click", function() {
    form_1.style.display = "block";
    form_2.style.display = "none";

    form_1_btns.style.display = "flex";
    form_2_btns.style.display = "none";

    form_2_progessbar.classList.remove("active");
    form_1.classList.add("active");
});

form_2_next_btn.addEventListener("click", function() {
    if (validateForm2()) {
        form_2.style.display = "none";
        form_3.style.display = "block";

        form_2_btns.style.display = "none";
        form_3_btns.style.display = "flex";

        form_3_progessbar.classList.add("active");
        form_2.classList.remove("active");
    }
});

form_3_back_btn.addEventListener("click", function() {
    form_2.style.display = "block";
    form_3.style.display = "none";

    form_2_btns.style.display = "flex";
    form_3_btns.style.display = "none";

    form_3_progessbar.classList.remove("active");
    form_2.classList.add("active");
});

form_3_next_btn.addEventListener("click", function() {
   if (validateForm3()) {
        form_2.style.display = "none";
        form_3.style.display = "none";
        form_4.style.display = "block";

        form_2_btns.style.display = "none";
        form_4_btns.style.display = "flex";

    }
});

form_4_back_btn.addEventListener("click", function() {

    const modC = document.getElementById('yesyes');
        modC.style.backgroundColor = ''; // Reset to default
        modC.style.width = ''; // Reset to default

    form_3.style.display = "block";
    form_4.style.display = "none";

    form_3_btns.style.display = "flex";
    form_4_btns.style.display = "none";

});


function applyResponsiveStyles() {
const divContainer = document.getElementById('universityPackages');
const modC = document.getElementById('yesyes');

const currentWidth = window.innerWidth; // Get the current width of the viewport

if (currentWidth === 480) { // Mobile view
divContainer.style.width = '250px'; // Width for small screens
modC.style.width = '300px'; // Width for small screens
} 
// Apply styles based on the current width
if (currentWidth < 768) { // Mobile view
divContainer.style.width = '250px'; // Width for small screens
modC.style.width = '300px'; // Width for small screens
} else if (currentWidth < 1024) { // Tablet view
divContainer.style.width = '625px'; // Default width for larger screens
modC.style.width = '780px'; // Default width for larger screens
} else { // Large screens
divContainer.style.width = '625px'; // Default width for larger screens
modC.style.width = '780px'; // Default width for larger screens
}
}

window.addEventListener('resize', applyResponsiveStyles);

form_4_next_btn.addEventListener("click", function() {

 if(validateForm4()) {

        const divContainer = document.getElementById('universityPackages');

const modC = document.getElementById('yesyes');

var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forWho = helpingFor ? helpingFor.value : 'None';

if (forWho === "university") {

divContainer.style.padding = '10px'; // Add padding if desired
divContainer.style.justifyContent = 'center'; // Change justification if needed
applyResponsiveStyles(); // Apply responsive styles


//lso be set in applyResponsiveStyles)
}

        var syllabus = document.getElementById("syllabus").value;
        var helpingFor = document.querySelector('input[name="help-with"]:checked');
        var forWho = helpingFor ? helpingFor.value : 'None';

        if(syllabus === "Other" && forWho !== "university"){

        modal_wrapper.classList.add("active");
        shadow.addEventListener("click", function() {
            modal_wrapper.classList.remove("active");
        });

        const allData = combineFormData();

        var other = "other";

        const dataToSend = {
            ...allData, who : other
        };

                fetch('/other-booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(dataToSend)
                    })
                    .then(response => response.json())
                    .then(result => {
                    
                        setTimeout(function(){
                                window.location.href = '/';
                            } , 2000);

                            
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Optionally handle error response
                    });

        setTimeout(function(){
            window.location.href = '/';
        } , 2000);

        }

      else{


        form_3.style.display = "none";
        form_4.style.display = "none";
        form_5.style.display = "block";

        form_4_btns.style.display = "none";
        form_5_btns.style.display = "flex";

      }

    }
});

form_5_back_btn.addEventListener("click", function() {

    const modC = document.getElementById('yesyes');
        modC.style.backgroundColor = ''; // Reset to default
        modC.style.width = ''; // Reset to default

    form_4.style.display = "block";
    form_5.style.display = "none";

    form_4_btns.style.display = "flex";
    form_4_btns.style.display = "flex";

});

            
});


document.getElementById("student-info").style.display = 'none';
document.getElementById("year-selection-container").style.display='none';
document.getElementById("in-person-teaching").style.display='none';

function studentInfo(){

document.getElementById("student-info").style.display = 'block';
document.getElementById("year-selection-container").style.display='none';

}

function vasityInfo(){
document.getElementById("year-selection-container").style.display='block';
document.getElementById("student-info").style.display = 'none';

}

function handleTutorStyleChange() {
const selectedValue = document.getElementById('tutor-style').value;
if (selectedValue === 'Online') {
onlineInfo();
} else if (selectedValue === 'In Person') {
inPersonInfo();
}
}

function inPersonInfo(){

document.getElementById("internetCheck").style.display = 'none';
document.getElementById("in-person-teaching").style.display = 'block';

}

document.getElementById("internetCheck").style.display = 'none';

function onlineInfo(){

    document.getElementById("in-person-teaching").style.display = 'none';
    document.getElementById("internetCheck").style.display = 'block';

}

/*var modal = document.getElementById("modal");
var btn = document.getElementById("open-popup");*/

function openOpenopen(name, email, subjects, grades , subsub) {

if(subjects === undefined){

    const syll = "CAPs,IEB,Cambridge,IB,Pearson Edexcel";
    const syllabusArray = syll.split(',').map(item => item.trim());

    const syllabi = syllabusArray.map(item => {
            return { value: item, text: item };
        });

    const syllabusSelect = document.getElementById('syllabus');

    while (syllabusSelect.options.length > 1) {

        const secondOption = syllabusSelect.options[1];

        // Check if the second option exists and remove it
        if (secondOption) {
            syllabusSelect.remove(1); // Remove the second option
        } else {
            break; // Exit the loop if no second option exists
        }
    }


    syllabi.forEach(syllabus => {
        const option = document.createElement('option');
        option.value = syllabus.value;
        option.textContent = syllabus.text;

        syllabusSelect.appendChild(option);

    });
                
}
else{
const syllabusArray = subjects.split(',').map(item => item.trim());

const syllabi = syllabusArray.map(item => {
        return { value: item, text: item };
    });

    const syllabusSelect = document.getElementById('syllabus');

    while (syllabusSelect.options.length > 1) {

        const secondOption = syllabusSelect.options[1];

        // Check if the second option exists and remove it
        if (secondOption) {
            syllabusSelect.remove(1); // Remove the second option
        } else {
            break; // Exit the loop if no second option exists
        }
    }


    syllabi.forEach(syllabus => {
        const option = document.createElement('option');
        option.value = syllabus.value;
        option.textContent = syllabus.text;

        syllabusSelect.appendChild(option);

    });

}

/*Grades Start Here*/

if(grades === undefined){

        const grd = "GRD:1,GRD:2,GRD:3,GRD:4,GRD:5,GRD:6,GRD:7,GRD:8,GRD:9,GRD:10,GRD:11,GRD:12";
        const gradesArray = grd.split(',').map(item => item.trim());

        const gr = gradesArray.map(item => {
                return { value: item, text: item };
            });

        const gradesSelect = document.getElementById('grade');

        while (gradesSelect.options.length > 0) {

            const secondOption = gradesSelect.options[0];

            // Check if the second option exists and remove it
            if (secondOption) {
                gradesSelect.remove(0); // Remove the second option
            } else {
                break; // Exit the loop if no second option exists
            }
        }


        gr.forEach(gradee => {
            const option = document.createElement('option');
            option.value = gradee.value;
            option.textContent = gradee.text;

            gradesSelect.appendChild(option);

        });
                    
        }
            else{
                const gradesArray = grades.split(',').map(item => item.trim());

                const gr = gradesArray.map(item => {
                                        return { value: item, text: item };
                                    });

                                    const gradesSelect = document.getElementById('grade');

            while (gradesSelect.options.length > 0) {

                const secondOption = gradesSelect.options[0];

                // Check if the second option exists and remove it
                if (secondOption) {
                    gradesSelect.remove(0); // Remove the second option
                } else {
                    break; // Exit the loop if no second option exists
                }
            }


                gr.forEach(gradee => {
                    const option = document.createElement('option');
                    option.value = gradee.value;
                    option.textContent = gradee.text;

                    gradesSelect.appendChild(option);

                });

                }

/*Grades End Here*/

/*Subects Start Here*/
const defaultSubjects = "Mathematics, Mathematics Literacy, English, Afrikaans, IsiZulu, Physics, Life Sciences, Physical Sciences, Biology, Chemistry, Natural Sciences, E.M.S, Sepedi, Accounting, History, Geography, German, Computer Science, Information Technology, Combined Science, Marine Science, Social Sciences, Technology, Humanities and Social Sciences, Creative Arts, Life Orientation, Life Skills, Business Studies, Economics, Sociology, Tourism, Travel & Tourism, French, Spanish, Portuguese, Engineering Graphics and Design, Sesotho, Setswana, IsiNdebele, Tshivenda, Xitsonga, Arabic, Italian, Computer Application Technology, Chinese, Swahili, Hindi, Environmental Management, Thai, Turkish, Vietnamese, Malay, IsiXhosa, Urdu, Psychology, Enterprise, Civil Technology, Electrical Technology, Mechanical Technology, Dance Studies, Design, Dramatic Arts, Agricultural Management Practices, Design & Technology, Drama, Chinese, Agricultural Sciences, Music, Agricultural Technology, Physical Education";

const subjectsArray = (subsub || defaultSubjects).split(',').map(item => item.trim());

const subjectContainer = document.getElementById('subjectContainer');


// Clear existing checkboxes
subjectContainer.innerHTML = '';

// Calculate the maximum length of subject names
const maxSubjectLength = Math.max(...subjectsArray.map(subject => subject.length));

// Increased spacing values
const baseGap = 10; // Increased base gap for styling
const dynamicGap = maxSubjectLength * 2; // Increased multiplier for more spacing
const gapSize = Math.max(baseGap, dynamicGap); // Ensure the gap isn't too small

const columnCount = 4; // Number of columns to display

function appendCheckboxes() {
let wrapper = document.createElement('div');
wrapper.style.display = 'flex';
wrapper.style.flexWrap = 'wrap'; // Allow wrapping to the next line
wrapper.style.gap = `${gapSize}px`; // Space between checkboxes based on longest subject

subjectsArray.forEach((subject, index) => {
const label = document.createElement('label');
label.className = 'subject-label'; // Add class to the label
label.style.display = 'flex'; // Use flex to align checkbox and text
label.style.alignItems = 'center'; // Center vertically
label.style.width = 'calc(25% - 15px)'; // Set width for each label to fit 4 columns and adjust for gaps
label.style.overflow = 'hidden'; // Hide overflow text
label.style.textOverflow = 'ellipsis'; // Show ellipsis for overflow text
label.style.whiteSpace = 'nowrap'; // Prevent text wrapping

const checkbox = document.createElement('input');
checkbox.type = 'checkbox';
checkbox.value = subject;
checkbox.onchange = updateSubjects; // Assuming updateSubjects is defined elsewhere

// Set the label text
label.textContent = subject; // Set the text for the label

// Append checkbox to label
label.prepend(checkbox); // Add checkbox before the label text

// Check if the screen width is greater than 768px
if (window.innerWidth > 768) {
// Append the label to the wrapper only if not a small screen

wrapper.appendChild(label);
}

// Append the wrapper to the container after every specified number of subjects (columns)
if ((index + 1) % columnCount === 0) {
subjectContainer.appendChild(wrapper); // Append the current column set
wrapper = document.createElement('div'); // Create a new wrapper for the next column
wrapper.style.display = 'flex';
wrapper.style.flexWrap = 'wrap'; // Allow wrapping to the next line
wrapper.style.gap = `${gapSize}px`; // Space between checkboxes based on longest subject
}
});

// Append remaining subjects if there are less than 'columnCount' in the last wrapper
if (wrapper.childElementCount > 0) {
subjectContainer.appendChild(wrapper);
}
}

// Call the function to append checkboxes initially
appendCheckboxes();

// Add an event listener for window resize
window.addEventListener('resize', () => {
// Clear existing checkboxes
subjectContainer.innerHTML = '';
// Re-append the checkboxes based on current screen width
appendCheckboxes();
});

/*Subects End Here*/

const button = document.getElementById('tutorBtn');
const directTutors = document.querySelectorAll('.directTutor');
const otherOption = document.getElementById('other-option');

if (event.target === button) {
    // The button was clicked
    directTutors.forEach(tutor => {
        tutor.textContent = 'BOOK A PERSONALIZED TUTOR';
    });
    otherOption.style.display = 'block'; // Show the "Other" option

    const tutorOptionGroup = document.getElementById('tutor-option-group');
    tutorOptionGroup.style.display = 'none'; // Hide the radio buttons

    
    const tutorOptionInputs = document.getElementsByName('tutor-option');
    for (let input of tutorOptionInputs) {
        if (input.value === 'No') {
            input.checked = true; 
        }
    }
    

} else {
    directTutors.forEach(tutor => {
        tutor.textContent = 'Book ' + name + ' for Tutoring!';
    });
    otherOption.style.display = 'none'; // Hide the "Other" option
    document.querySelector("#syllabus option:first-child").textContent = "";

    const tutorOptionGroup = document.getElementById('tutor-option-group');
        tutorOptionGroup.style.display = 'block'; // Hide the radio buttons



     }

document.getElementById("modal").style.display = 'block';
var span = document.getElementById("close-popup");

var tutorName = document.getElementById('hiddenTutorName');
tutorName.value = name;

var tutorEmail = document.getElementById('hiddenTutorEmail');
tutorEmail.value = email;

span.onclick = function() {
modal.style.display = "none";
}

window.onclick = function(event) {
if (event.target == modal) {
    modal.style.display = "none";
}
}

}

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

function combineFormData() {

const form1 = document.getElementById('contact-form');
const form2 = document.getElementById('additional-form');
const form3 = document.getElementById('submit-form');
const form4 = document.getElementById('formFour');

const form1Data = new FormData(form1);
const form2Data = new FormData(form2);
const form3Data = new FormData(form3);
const form4Data = new FormData(form4);

const data1 = formDataToObject(form1Data);
const data2 = formDataToObject(form2Data);
const data3 = formDataToObject(form3Data);
const data4 = formDataToObject(form4Data);

// Combine all data into a single object
return { ...data1, ...data2, ...data3, ...data4,};
}



document.addEventListener('DOMContentLoaded', (event) => {
// Get the buttons by their IDs
const onceOffButton = document.getElementById('onceOffPackage');
const basicButton = document.getElementById('basicPackage');
const premiumButton = document.getElementById('premiumPackage');
const advancedButton = document.getElementById('advancedPackage');
const eliteButton = document.getElementById('elitePackage');

const oneOnone = document.getElementById('oneOnone');
const twoTofivePackage = document.getElementById('twoTofivePackage');
const sixTo10Package = document.getElementById('sixTo10Package');

// Function to handle button clicks
function handleButtonClick(event) {
// Get the ID of the button that was clicked
const buttonId = event.target.id;

var ghg = document.getElementById('tutor-style').value.trim(); 
var syllabusId = document.getElementById('syllabus').value;

// You can use a switch statement or if-else logic to handle specific buttons
switch (buttonId) {
case 'onceOffPackage':
alert('Once Off Package selected');
var amountTopay;
var typePackage = 'Once off Package';

if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
     amountTopay = '300'; // amount to pay; i changed R300 to R10 for testing
   }
   else{

   if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
           
           amountTopay = '400'; // amount to pay;

   }

   else{

    if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

            amountTopay = '400'; // amount to pay;

            }

            else{

                if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
           
                        amountTopay = '550'; // amount to pay;
    
                    }

            }

   }

}

    const allData = combineFormData();

    const dataToSend = {
        ...allData, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataToSend)
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

    break;
case 'basicPackage':
    alert('Basic Package selected');

    var amountTopay;
    var typePackage = 'Basic Package';

    if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
     amountTopay = '1100'; // amount to pay;
      }
      else{
      if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
          amountTopay = '1550'; // amount to pay;

      }

      else{

        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

            amountTopay = '1550'; // or button.innerHTML = 'Submit';

            }
            else{

                if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                amountTopay = '2150'; // amount to pay;
      }

                
            }
      }

    }

    const all = combineFormData();

    const ToSend = {
        ...all, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(ToSend)
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

    break;
case 'premiumPackage':
    alert('Premium Package selected');

    var amountTopay;
    var typePackage = 'Premium Package';

    if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
    amountTopay = '2150'; // amount to pay;
    }
    else{
        if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
           amountTopay = '3100'; // amount to pay;
    }

    else{

        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

                amountTopay = '3100'; // amount to pay;

                }
                else{

                    if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
           amountTopay = '4300'; // amount to pay;
    }

 }

    }

    }

    const dataall = combineFormData();

    const ToSendData = {
        ...dataall, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(ToSendData)
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

    break;
case 'advancedPackage':
    alert('Advanced Package selected');

    var amountTopay;
    var typePackage = 'Advanced Package';

    if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
     amountTopay = '3250'; // amount to pay;
      }
      else{
        if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
         amountTopay = '4650'; // amount to pay;
      }

      else{
        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){
       amountTopay = '4650'; // amount to pay;
      }
      else{

        if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
           amountTopay = '6350'; // amount to pay;
          }

      }

      }

      }

    const data = combineFormData();

    const sendData = {
        ...data, // Spread the existing data
        amount: amountTopay, package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(sendData)
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


    break;
case 'elitePackage':
   alert('Elite Package selected');
   var  typePackage = 'Elite Package';

   var amountTopay;

    if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
    amountTopay = '4350'; // amount to pay;
    }
    else{
        if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
        amountTopay = '6200'; // or button.innerHTML = 'Submit';

        }
        else{

            if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){
            amountTopay = '6200'; // or button.innerHTML = 'Submit';

                }
                else{

                    if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
          amountTopay = '8500'; // or button.innerHTML = 'Submit';

       }

                }
        }

    }

    const gatherData = combineFormData();

    const dataSend = {
        ...gatherData, // Spread the existing data
        amount: amountTopay , package : typePackage
    };

    fetch('/booking', { // Replace with your actual endpoint URL
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(dataSend)
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

    break;

    case 'oneOnone':

    let value;

              do {
                    value = prompt("How many sessions do you want? (Please enter a number greater than 0)");
                    
                    // If user cancels, exit the loop
                    if (value === null) {
                        console.log("Prompt was canceled.");
                        break; // Exit the loop
                    }

                } while (isNaN(value) || value <= 0);

      //const value = prompt("How many sessions do you want?");

      var yearFor = document.querySelector('input[name="year"]:checked');
      var yearIn = yearFor ? yearFor.value : 'None';

       var amountTopay;
       var calcAmount;
       var discountAmount;
       var amountAfterDiscount;
       var trackDiscount = 0;
       var  typePackage = 'One on One: University';

       if(ghg === "In Person" && yearIn === '1st' ||  yearIn === '2nd'){

             calcAmount = 650 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                      
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount =3;
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

       }
       else{

        if(ghg === "Online" && yearIn === '1st' ||  yearIn === '2nd'){

             calcAmount = 450 * value;

             if(value >= 8 && value <= 11){

                discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                amountAfterDiscount = amountAfterDiscount.toString();
                amountTopay = amountAfterDiscount;
                trackDiscount = 1;
                
                }
                else{
                if(value >= 12 && value <= 19){

                discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                amountAfterDiscount = amountAfterDiscount.toString();
                amountTopay = amountAfterDiscount;
                trackDiscount = 2;
                
                }
                else{
                    if(value >= 20 ){

                    discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                    amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                    amountAfterDiscount = amountAfterDiscount.toString();
                    amountTopay = amountAfterDiscount;
                    trackDiscount = 3;
                    
                    }
                    else{

                        if(value <= 7){

                        calcAmount = calcAmount.toString();
                        amountTopay = calcAmount;

                        }
                    }
                }
                }

        }
        else{
            if(ghg === "Online" && yearIn === '3rd' ||  yearIn === '4th'){

                calcAmount = 550 * value;
                
                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                     
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }
               

                }
                else{
                    if(ghg === "In Person" && yearIn === '3rd' ||  yearIn === '4th'){

                    calcAmount = 750 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                       
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                    }

                    else{
                        if(ghg === "In Person" && yearIn === 'postgrad'){

                            calcAmount = 850 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                     
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            
                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                            }
                            else{
                                if(ghg === "Online" && yearIn === 'postgrad'){

                                calcAmount = 650 * value;

                  if(value >= 8 && value <= 11){

                     discountAmount = (5 / 100) * calcAmount; // 5% discount applied
                     amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                     amountAfterDiscount = amountAfterDiscount.toString();
                     amountTopay = amountAfterDiscount;
                     trackDiscount = 1;
                    
                  }
                  else{
                    if(value >= 12 && value <= 19){

                        discountAmount = (10 / 100) * calcAmount; // 10% discount applied
                        amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                        amountAfterDiscount = amountAfterDiscount.toString();
                        amountTopay = amountAfterDiscount;
                        trackDiscount = 2;
                        
                        }
                        else{
                            if(value >= 20 ){

                            discountAmount = (20 / 100) * calcAmount; // 20% discount applied
                            amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
                            amountAfterDiscount = amountAfterDiscount.toString();
                            amountTopay = amountAfterDiscount;
                            trackDiscount = 3;
                            

                            }
                            else{

                                if(value <= 7){

                                calcAmount = calcAmount.toString();
                                amountTopay = calcAmount;

                                }
                            }
                        }
                  }

                              }

                            }

                    }

                }

        }

       }

       if (value !== null) {
                      
        if(trackDiscount === 1){

           alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

       }
       else{
        if(trackDiscount === 2){

            alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

                }
                else{

                    if(trackDiscount === 3){

                        alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

                    }

                    else{

                        alert("Amount to pay R"+amountTopay);
                    }

                }

       }

       const gatheredData = combineFormData();

        const dataSendout = {
            ...gatheredData, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : value
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(dataSendout)
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

        }

    break;

    case 'twoTofivePackage':
   

    let valuee;

        do {
            valuee= prompt("How many sessions do you want? (Please enter a number greater than 0)");
            
            // If user cancels, exit the loop
            if (valuee === null) {
                console.log("Prompt was canceled.");
                break; // Exit the loop
            }

        } while (isNaN(valuee) || valuee <= 0);

var yearFor = document.querySelector('input[name="year"]:checked');
var yearIn = yearFor ? yearFor.value : 'None';

var amountTopay;
var calcAmount;
var discountAmount;
var amountAfterDiscount;
var trackDiscount = 0;
var typePackage = 'Two to Five : University';

if(ghg === "In Person" && yearIn === '1st' ||  yearIn === '2nd'){

calcAmount = 450 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
    
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount =3;
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

}
else{

if(ghg === "Online" && yearIn === '1st' ||  yearIn === '2nd'){

calcAmount = 300 * valuee;

if(valuee >= 8 && valuee <= 11){

discountAmount = (5 / 100) * calcAmount; // 5% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 1;

}
else{
if(valuee >= 12 && valuee <= 19){

discountAmount = (10 / 100) * calcAmount; // 10% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 2;

}
else{
  if(valuee >= 20 ){

  discountAmount = (20 / 100) * calcAmount; // 20% discount applied
  amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
  amountAfterDiscount = amountAfterDiscount.toString();
  amountTopay = amountAfterDiscount;
  trackDiscount = 3;
  
  }
  else{

      if(valuee <= 7){

      calcAmount = calcAmount.toString();
      amountTopay = calcAmount;

      }
  }
}
}

}
else{
if(ghg === "Online" && yearIn === '3rd' ||  yearIn === '4th'){

calcAmount = 400 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}


}
else{
  if(ghg === "In Person" && yearIn === '3rd' ||  yearIn === '4th'){

  calcAmount = 550 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
     
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

  }

  else{
      if(ghg === "In Person" && yearIn === 'postgrad'){

          calcAmount = 750 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

          }
          else{
              if(ghg === "Online" && yearIn === 'postgrad'){

              calcAmount = 450 * valuee;

if(valuee >= 8 && valuee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valuee >= 12 && valuee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valuee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          

          }
          else{

              if(valuee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

            }

          }

  }

}

}

}

if (valuee !== null) {

if(trackDiscount === 1){

alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{
if(trackDiscount === 2){

alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{

  if(trackDiscount === 3){

      alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

  }

  else{

      alert("Amount to pay R"+amountTopay);
  }

}

}
        const gatheredDat = combineFormData();

        const ataSendout = {
            ...gatheredDat, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : value
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(ataSendout)
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
}

    break;

    case 'sixTo10Package':

    let valueee;

        do {
            valueee = prompt("How many sessions do you want? (Please enter a number greater than 0)");
            
            // If user cancels, exit the loop
            if (valueee === null) {
                console.log("Prompt was canceled.");
                break; // Exit the loop
            }

        } while (isNaN(valueee) || valueee <= 0);

var yearFor = document.querySelector('input[name="year"]:checked');
var yearIn = yearFor ? yearFor.value : 'None';

var amountTopay;
var calcAmount;
var discountAmount;
var amountAfterDiscount;
var trackDiscount = 0;
var typePackage = 'Six to Ten : University';

if(ghg === "In Person" && yearIn === '1st' ||  yearIn === '2nd'){

calcAmount = 350 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
    
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount =3;
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

}
else{

if(ghg === "Online" && yearIn === '1st' ||  yearIn === '2nd'){

calcAmount = 200 * valueee;

if(valueee >= 8 && valueee <= 11){

discountAmount = (5 / 100) * calcAmount; // 5% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 1;

}
else{
if(valueee >= 12 && valueee <= 19){

discountAmount = (10 / 100) * calcAmount; // 10% discount applied
amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
amountAfterDiscount = amountAfterDiscount.toString();
amountTopay = amountAfterDiscount;
trackDiscount = 2;

}
else{
  if(valueee >= 20 ){

  discountAmount = (20 / 100) * calcAmount; // 20% discount applied
  amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
  amountAfterDiscount = amountAfterDiscount.toString();
  amountTopay = amountAfterDiscount;
  trackDiscount = 3;
  
  }
  else{

      if(valueee <= 7){

      calcAmount = calcAmount.toString();
      amountTopay = calcAmount;

      }
  }
}
}

}
else{
if(ghg === "Online" && yearIn === '3rd' ||  yearIn === '4th'){

calcAmount = 300 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}


}
else{
  if(ghg === "In Person" && yearIn === '3rd' ||  yearIn === '4th'){

  calcAmount = 450 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
     
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

  }

  else{
      if(ghg === "In Person" && yearIn === 'postgrad'){

          calcAmount = 550 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
   
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          
          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

          }
          else{
              if(ghg === "Online" && yearIn === 'postgrad'){

              calcAmount = 350 * valueee;

if(valueee >= 8 && valueee <= 11){

   discountAmount = (5 / 100) * calcAmount; // 5% discount applied
   amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
   amountAfterDiscount = amountAfterDiscount.toString();
   amountTopay = amountAfterDiscount;
   trackDiscount = 1;
  
}
else{
  if(valueee >= 12 && valueee <= 19){

      discountAmount = (10 / 100) * calcAmount; // 10% discount applied
      amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
      amountAfterDiscount = amountAfterDiscount.toString();
      amountTopay = amountAfterDiscount;
      trackDiscount = 2;
      
      }
      else{
          if(valueee >= 20 ){

          discountAmount = (20 / 100) * calcAmount; // 20% discount applied
          amountAfterDiscount = calcAmount - discountAmount; // Subtract the discount
          amountAfterDiscount = amountAfterDiscount.toString();
          amountTopay = amountAfterDiscount;
          trackDiscount = 3;
          

          }
          else{

              if(valueee <= 7){

              calcAmount = calcAmount.toString();
              amountTopay = calcAmount;

              }
          }
      }
}

            }

          }

  }

}

}

}
if (valueee !== null) {

if(trackDiscount === 1){

alert("5% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{
if(trackDiscount === 2){

alert("10% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

}
else{

  if(trackDiscount === 3){

      alert("20% discount of R"+calcAmount  + " applied. Amount to pay R"+amountTopay);

  }

  else{

      alert("Amount to pay R"+amountTopay);
  }

}

}

        const outData = combineFormData();

        const sendOut = {
            ...outData, // Spread the existing data
            amount: amountTopay , package : typePackage , sessions : value
        };

        fetch('/booking', { // Replace with your actual endpoint URL
                        method: 'POST',
                        headers: { 
                            'Content-Type': 'application/json' 
                        },
                        body: JSON.stringify(sendOut)
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

        }

    break;
default:
    console.log('Unknown button clicked');
}
}

// Add click event listeners to the buttons
onceOffButton.addEventListener('click', handleButtonClick);
basicButton.addEventListener('click', handleButtonClick);
premiumButton.addEventListener('click', handleButtonClick);
advancedButton.addEventListener('click', handleButtonClick);
eliteButton.addEventListener('click', handleButtonClick);
oneOnone.addEventListener('click' , handleButtonClick);
twoTofivePackage.addEventListener('click' , handleButtonClick);
sixTo10Package.addEventListener('click' , handleButtonClick);

});


function openPopup(email) {
fetch('/view-profile', {
method: 'POST',
headers: { 
'Content-Type': 'application/json' 
},
body: JSON.stringify({ email: email })
})
.then(response => {
if (response.ok) {
// Redirect to profile page after successful response
window.location.href = '/profile'; // Adjust the path as needed
} else {
throw new Error('Network response was not ok');
}
})
.catch(error => {
console.error('Error:', error);
});

}

function toggleSubjectOptions() {
const container = document.getElementById('subjectContainer');
const inputField = document.getElementById('subject');

var helpingFor = document.querySelector('input[name="help-with"]:checked');
var forwho = helpingFor ? helpingFor.value : 'None';

// For larger screens, toggle the visibility of the checkbox list

if(forwho === "school"){

if (window.innerWidth > 768) {
// Show the container if hidden and hide it if shown
if (container.style.display === 'none' || container.style.display === '') {
container.style.display = 'block'; // Show container
inputField.readOnly = true; // Keep input read-only
} else {
container.style.display = 'none'; // Hide container
}
}

else {
// For small screens, toggle the visibility of the subject container
if (container.style.display === 'none' || container.style.display === '') {
// Show the container
container.style.display = 'block';
inputField.readOnly = false; // Allow typing in the input field
} else {
// Hide the container and enable typing
container.style.display = 'none';
inputField.readOnly = true; // Make input read-only when container is hidden
}
}

}
else{

if (window.innerWidth > 768) {
// Show the container if hidden and hide it if shown
if (container.style.display === 'none' || container.style.display === '') {
container.style.display = 'none'; // Show container
inputField.readOnly = false; // Keep input read-only
} else {
container.style.display = 'none'; // Hide container
}
}

else {
// For small screens, toggle the visibility of the subject container
if (container.style.display === 'none' || container.style.display === '') {
// Show the container
container.style.display = 'block';
inputField.readOnly = false; // Allow typing in the input field
} else {
// Hide the container and enable typing
container.style.display = 'none';
inputField.readOnly = true; // Make input read-only when container is hidden
}
}



}


}


function updateSubjects() {
const checkboxes = document.querySelectorAll('#subjectContainer input[type="checkbox"]');
const selectedSubjects = [];

checkboxes.forEach((checkbox) => {
if (checkbox.checked) {
selectedSubjects.push(checkbox.value);
}
});

document.getElementById('subject').value = selectedSubjects.join(', ');
}

function toggleReadOnly() {
const tutoringFor = document.getElementById('tutoring-for').value;
const studentName = document.getElementById('student-name');
const studentLastName = document.getElementById('student-last-name');
const studName = document.getElementById('stud-name');
const studLast = document.getElementById('stud-last');

var firstName = document.getElementById('first-name').value.trim();
var lastName = document.getElementById('last-name').value.trim();



const isMe = tutoringFor === 'me';

studentName.readOnly = isMe;
studentLastName.readOnly = isMe;
studName.readOnly = isMe;
studLast.readOnly = isMe;

// Optionally clear values if readOnly is set
if (isMe) {
studentName.value = firstName;
studentName.placeholder = firstName;
studentLastName.value = lastName;
studentLastName.placeholder = lastName;
studName.value = firstName;
studName.placeholder = firstName;
studLast.value = lastName;
studLast.placeholder = lastName;
}
else{

studentName.value = '';
studentName.placeholder = '';
studentLastName.value = '';
studentLastName.placeholder = '';
studName.value = '';
studName.placeholder = '';
studLast.value = '';
studLast.placeholder = '';

}


}


function checkPostgrad() {
const postgradRadio = document.getElementById('year-postgrad');
const postgradOptions = document.getElementById('postgrad-options');

if (postgradRadio.checked) {
postgradOptions.classList.remove('opt');
} else {
postgradOptions.classList.add('opt');
}
}

document.addEventListener("DOMContentLoaded", function() {
const countrySelect = document.getElementById("country");
const provinceGroup = document.getElementById("fProvince");

function toggleProvince() {
if (countrySelect.value === "South Africa") {
    provinceGroup.style.display = "block";
} else {
    provinceGroup.style.display = "none";
    document.getElementById("province").value = "";
}
}

toggleProvince();
countrySelect.addEventListener("change", toggleProvince);
});



    </script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--=============== SWIPER JS ===============-->
    <script src="swiper-bundle.min.js"></script> 

    <!--=============== MAIN JS ===============-->
     <script src="main.js"></script> 


</body>
</html>
