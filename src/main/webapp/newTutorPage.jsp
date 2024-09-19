<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<html>
 <head>
    <title>ApexAcademicCentre</title> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="tutorNewPage.css" rel="stylesheet">
    <link href="book.css" rel="stylesheet">
    <style>
/* General Styling for the form */
.form_5 {
    position: relative;
    padding: 20px;
}

.btns_wrap {
    margin-top: 20px;
}

/* Styling for the divs container */
.div-container {
    display: flex;
    flex-wrap: wrap; /* Allows wrapping if necessary */
    justify-content: space-between; /* Distributes space between items */
    margin-top: 20px;
}

/* Styling for each div */
.custom-div {
    width: 100%;
    max-width: 200px; /* Adjust width as necessary */
    background: white;
    border: 1px solid white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    font-size: 16px;
    color: gray;
    position: relative;
    z-index: 1;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin-bottom: 20px; /* Space below each div */
    padding: 15px;
    box-sizing: border-box;
    height: 350px;
}

/* Heading inside each div */
.custom-div h3 {
    margin: 0;
    font-size: 18px;
    text-align: center;
    color: #02A552;
}

/* Content inside each div */
.content {
   /* display: flex;*/
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    height: 100%; /* Ensure div takes up full height */
}

/* Styling for session per month and package details */
.session-per-month,
.package-details {
    margin: 10px 0;
    text-align: center;
    padding: 5px;
    width: 100%; /* Ensures full width within the parent div */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Light shadow */
    background: white; /* Background color for better visibility of shadow */
    border-radius: 4px; /* Rounded corners for the box shadow */
}

/* Button styling */
.package-btn {
    background: #001549;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    align-items: center;
    margin-top: 80%;
    margin-left: 30px;

}

.package-btn:hover {
    background: #02A552;
}

/* Reflection effect */
.custom-div::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.1);
    transform: scaleY(-1);
    z-index: -1;
    opacity: 0.5;
}

.book-view form{
   padding-top: 20px;
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
                
                <i class="fas fa-user login-icon"></i> Login / Register
            </button>
        </div>
		</nav> 

        <section class="main-section">

        <section class="main-class">
			<img src="tutor.jpg" alt="tutorsImage" class="tutorImage"/>
			<h2 id="tutorHead" align="center">Apex Academic Centre Tutors</h2>
			<p id="tutorPar" align="center">These are the Highest Quality Online Tutors. Get Lessons Online with Apex - the Best in Tutoring</p>
            <button id="tutorBtn">BOOK A TUTOR</button>
			<br>
			<br>
		</section>

 

        <%
        List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
        if (tutors != null && !tutors.isEmpty()) {
    %>
    
        <!-- Container for scrolling tutors -->
        <div class="tutor-wrapper">
            <!-- Container for images -->
            <div class="image-wrapper">
                <img src="matric.png" alt="Image 1" class="image image1">
                <img src="camb.png" alt="Image 2" class="image image2">
            </div>
    
            <!-- Container for tutor profiles -->
            <div class="tutor-container">
                <% 
                    for (Tutor tutor : tutors) {
                        String email = tutor.getEmail();
                        String name = tutor.getFullNames();
                        String availability = tutor.getAvailability();
                        String phone = tutor.getPhoneNumber();
                        String subjects = tutor.getSubjects();
                        String grades = tutor.getGrades();
                        String address = tutor.getAddress();
                        String qualifications = tutor.getBio();
                        String about = tutor.getAbout();
                        String descTutor = tutor.getHoursTutored();
                        byte[] image = tutor.getImage();
                        String syllabus = tutor.getSyllabus();
                        String iSmage = java.util.Base64.getEncoder().encodeToString(image);
                        int ratings = tutor.getRatings();
                        String area = tutor.getArea();
                        String country = tutor.getCountry();
                %>
                <div class="tutor">
                    <div class="top">
                        <div class="profile">
                            <img src="data:image/png;base64,<%= iSmage %>" alt="Member Image">
                        </div>
                        <div class="details">
                            <p>
                                <span class="static-text"><strong><%= name %></strong></span><br><br>
                                <span class="static-text">Country :</span> <span class="detail-info"><%= country %></span><br>
                                <span class="static-text">Province :</span> <span class="detail-info"><%= address %></span><br>
                                <span class="static-text">Area :</span> <span class="detail-info"><%= area %></span><br>
                                <span class="static-text">Curriculum :</span> <span class="detail-info"><%= syllabus %></span><br>
                                <span class="static-text">Tutoring Option :</span> <span class="detail-info"><%= availability %></span>
                            </p>
                        </div>
                        <div class="feedback">
                            <div class="feedback-item">
                               <br>
                            </div>
                            <div class="ratings">
                                <i class="fas fa-star" id="rate-icon"></i>
                                <span id="rate"><%= ratings %> Ratings</span>
                            </div>
                            <div class="feedback-item">
                                <i class="fas fa-check-circle" id="back-icon"></i>
                                <span class="back">Background Checked</span>
                            </div>
                        </div>
                    </div>
    
                    <!--Middle Div Start HERE-->
    
                    <div class="last">
                        <div class="grades">
                            <h4>Grades</h4><br>
                            <div class="inside">
                                <%
                                String[] grds = grades.split(",");
                                for (String grd : grds) {
                                %>
                                <p><%= grd %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="user-details">
                            <div class="about">
                                <%= about %>
                            </div>
                            <br>
                            <div class="subjects">
                                <%
                                    String[] sub = subjects.split(",");
                                    for (String subject : sub) {
                                %>
                                    <p><%= subject %></p>
                                <% } %>
                                <br><br>
                            </div>
                        </div>
                        <div class="book-view">
                            <form action="/view-profile" method="post">
                                <input type="hidden" name="email" value="<%= email %>"/>
                            <button type="submit" class="view_pp">
                                VIEW PROFILE
                            </button>
                            <button type="button" onclick="openOpenopen('<%= name %>' , '<%= email %>')">BOOK TUTOR</button>
                            </form>
                           
                            <br>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
                <% 
                    } 
                %>
            </div>
        </div>
    
    <%
        } else { 
    %>
        <div>
            <p>Nothing Yet</p>
        </div>
    <%
        } 
    %>
    
   <!--BOOKING FORM--> 
	
                   <div class="wrapper" id="modal">

                    <div class="modal-content">

                    <span class="close-btn" id="close-popup">&times;</span>
                    <!--START OF FORMS-->
                    <div class="form_wrap">
                        <div class="form_1 data_info">
                            <h2>Book a Personalized Tutor Across South Africa!</h2>
                            <br>
                            <form id="contact-form">
                                <div class="form_container">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="first-name">First Name <span class="required">*</span></label>
                                            <input type="text" id="first-name" name="first-name" class="input" placeholder="John" required>
                                            <div id="first-name-error" class="error"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="last-name">Last Name <span class="required">*</span></label>
                                            <input type="text" id="last-name" name="last-name" class="input" placeholder="Doe" required>
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
                                            <input type="tel" id="phone" name="phone" class="input" placeholder="(123) 456-7890" required>
                                            <div id="phone-error" class="error"></div>
                                        </div>
                                    </div>
  
                                    <div class="form-row">
                                        <div class="form-group">
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


                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="language">Language<span class="required">*</span></label>
                                            <select id="language" name="language" class="input" required>
                                                <option value="" disabled selected>Select Language of Instruction</option>
                                                <option value="English">English</option>
                                                <option value="isiZulu">isiZulu</option>
                                                <option value="Afrikaans">Afrikaans</option>
                                                <option value="isiXhosa">Xhosa</option>
                                                <option value="isiNdebele">isiNdebele</option>
                                                <option value="Sepedi">Sepedi</option>
                                                <option value="Other">Other</option>
                                            </select>
                                            <div id="language-error" class="error"></div>
                                        </div>

                                    </div>


                                </div>
                                <div class="btns_wrap">
                                    <div class="common_btns form_1_btns">
                                        <button type="button" class="btn_next">Next <span class="icon">→</span></button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    
                                    <input type="hidden" id="hiddenTutorName" name="hiddenTutorName">
                                    <input type="hidden" id="hiddenTutorEmail" name="hiddenTutorEmail">

                                </div>
                            </form>
                        </div>
                        <div class="form_2" style="display: none;">
                            <h2>Book a Personalized Tutor Across South Africa!</h2>
                            <br>
                            <div id="form-container-2" class="form-container hidden">
                                <form id="additional-form">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="tutoring-for">Who is the tutoring for? <span class="required">*</span></label>
                                            <select id="tutoring-for" name="tutoring-for" required>
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
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                </select>
                                                <div id="grade-error" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="syllabus">Syllabus <span class="required">*</span></label>
                                                <select id="syllabus" name="syllabus" required>
                                                    <option value="" disabled selected>Select syllabus</option>
                                                    <option value="ieb">IEB</option>
                                                    <option value="caps">CAPS</option>
                                                    <option value="pearson-edexel">Pearson Edexel</option>
                                                    <option value="cambridge">Cambridge</option>
                                                    <option value="ged">GED</option>
                                                    <option value="other">Other</option>
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
                                                        <input type="radio" id="year" name="year" value="1st" required>
                                                        1st
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="2nd" required>
                                                        2nd
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="3rd" required>
                                                        3rd
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="4th" required>
                                                        4th
                                                    </label>
                                                    <label>
                                                        <input type="radio" id="year" name="year" value="postgrad" required>
                                                        Postgrad
                                                    </label>
                                                    <div id="year-error" class="error"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
    
                                    <div class="btns_wrap">
                                        <div class="common_btns form_2_btns">
                                            <button type="button" class="btn_back">Back <span class="icon">←</span></button>
                                            <button type="button" class="btn_next">Next <span class="icon">→</span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
    
                        <div class="form_3" style="display: none;" id="formThree">
                            <h2>Book a Personalized Tutor Across South Africa!</h2>
                            <br>
                        
                            <form id="submit-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="subject">Subject <span class="required">*</span></label><br>
                                        <select id="subject" name="subject" class="input" required>
                                            <option value="" disabled selected>Select your Subject</option>
                                            <option value="English">English</option>
                                            <option value="isiZulu">isiZulu</option>
                                            <option value="Mathematics">Mathematics</option>
                                            <option value="Science">Science</option>
                                            <option value="History">History</option>
                                            <option value="Geography">Geography</option>
                                            <option value="Other">Other</option>
                                          
                                        </select>
                                        <div id="subject-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Tutoring Option<span class="required">*</span></label>
                                    <div class="radio-group">
                                        <br>
                                        <label>
                                            <input type="radio" id="tutor-style" name="tutor-style" value="Online" onclick="onlineInfo()" required>
                                            Online
                                        </label>
                                        <label>
                                            <input type="radio" id="tutor-style" name="tutor-style" value="In Person" onclick="inPersonInfo()" required>
                                            In-Person
                                        </label>
                                        <div id="tutor-style-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="form-row" id="in-person-teaching">
                                    <div class="form-group">
                                        <label for="address">Address<span class="required">*</span></label><br>
                                        <input type="text" id="address-inperson" name="address-inperson" placeholder="" class="input" required>
                                        <div id="inperson-error" class="error"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="suburb-inperson">Suburb<span class="required">*</span></label><br>
                                        <input type="text" id="suburb-inperson" name="suburb-inperson" placeholder="" class="input" required>
                                        <div id="suburb-inperson-error" class="error"></div>
                                    </div>
                                </div>


                            <div class="btns_wrap">
                                <div class="common_btns form_3_btns">
                                    <button type="button" class="btn_back">Back <span class="icon">←</span></button>
                                    <button type="button" class="btn_next">Next</button>
                                </div>
                            </div>
                        </form>
                        </div>
                 

                        <div class="form_4" style="display: none;" >
                            <h2>Book a Personalized Tutor Across South Africa!</h2>
                            <div id="Message" class="hidden">
                                <form id="formFour">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="message">Message <span class="required">*</span></label><br><br>
                                        <textarea id="message" name="message" placeholder="Is there anything else you would like to add?...." class="textarea" required></textarea>
                                        <div id="message-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Would you like a second tutor option?<span class="required">*</span></label>
                                    <div class="radio-group">
                                        <br>
                                        <label>
                                            <input type="radio" id="tutor-option" name="tutor-option" value="Yes" required>
                                            Yes
                                        </label>
                                        <label>
                                            <input type="radio" id="tutor-option" name="tutor-option" value="No" required>
                                           No
                                        </label>
                                        <div id="tutor-option-error" class="error"></div>
                                    </div>
                                </div>

                                <div class="terms-row">
                                    <input type="checkbox" id="terms" name="terms" required>
                                    <label for="terms">
                                        I have read and agree to the <a href="#" target="_blank">Terms and Conditions</a> and <a href="#" target="_blank">Privacy Policy</a>.<span class="required">*</span>
                                    </label>
                                    <div id="terms-error" class="error"></div>
                                </div>

                            <div class="btns_wrap">
                                <div class="common_btns form_4_btns">
                                    <button type="button" class="btn_back">Back <span class="icon">←</span></button>
                                    <button type="button" class="btn_next">Next</button>
                                </div>
                            </div>
                           </form>
                        </div>
                    </div>

                        <!--form 5-->

                        <div class="form_5" style="display: none;" id="formFive">
                            <h2>Payment Packages</h2>
                        
                            <div class="div-container">
                                <div class="custom-div">
                                    <h3>Once Off Package</h3>
                                    <div class="content">
                                        <div class="session-per-month">1 Session per month<br>(once off)</div>
                                        <div class="package-details">Package Details</div>
                                 
                                        <button type="submit" class="package-btn" id="onceOffPackage">R250</button>
                                      
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <h3>Basic Package</h3>
                                    <div class="content">
                                        <div class="session-per-month">4 Sessions per month<br>(once a week)</div>
                                        <div class="package-details">Package Details</div>
                                
                                        <button type="submit" class="package-btn" id="basicPackage">R950 p/m</button>
                                     
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <h3>Premium Package</h3>
                                    <div class="content">
                                        <div class="session-per-month">8 Sessions per month<br>(once a week)</div>
                                        <div class="package-details">Package Details</div>
                                 
                                        <button type="submit" class="package-btn" id="premiumPackage">R1850 p/m</button>
                                    
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <h3>Advanced Package</h3>
                                    <div class="content">
                                        <div class="session-per-month">12 Sessions per month<br>(once a week)</div>
                                        <div class="package-details">Package Details</div>
                                    
                                        <button type="submit" class="package-btn" id="advancedPackage">R2650 p/m</button>
                                      
                                    </div>
                                </div>
                                <div class="custom-div">
                                    <h3>Elite Package</h3>
                                    <div class="content">
                                        <div class="session-per-month">16 Sessions per month<br>(once a week)</div>
                                        <div class="package-details">Package Details</div>
                                        
                                        <button type="submit" class="package-btn" id="elitePackage">R3350 p/m</button>
                                    
                                    </div>
                                </div>
                            </div>
                            
                            <div class="btns_wrap">
                                <div class="common_btns form_5_btns">
                                    <button type="button" class="btn_back">Back <span class="icon">←</span></button>
                                    <button type="button" class="btn_next">I Want to speak to a sales consultant first</button>
                                </div>
                            </div>
                        </div>
            
                        <!--form 5-->

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
        <!--</div>-->
                
      

   <!--BOOKING FORM--> 


</section>

<script>

document.addEventListener("DOMContentLoaded", function() {
  var imageWrapper = document.querySelector('.image-wrapper');
  var tutorContainer = document.querySelector('.tutor-container');
  var tutorRect = tutorContainer.getBoundingClientRect();
  var tutorTop = tutorRect.top + window.scrollY;
  var images = document.querySelectorAll('.image');

  window.addEventListener('scroll', function() {
    var scrollTop = window.scrollY;

    // Check if the scroll position is past the tutor container
    if (scrollTop > tutorTop) {
      images.forEach(function(image) {
        image.classList.add('fixed-image');
      });
    } else {
      images.forEach(function(image) {
        image.classList.remove('fixed-image');
      });
    }
  });
});

                                       /*#########################BOOKINGS#######################*/

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
                    document.getElementById('phone-error').textContent = "";
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
                if (!province) {
                    document.getElementById('province-error').textContent = "Please select a province.";
                    isValid = false;
                } else {
                    document.getElementById('province-error').textContent = "";
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
            var tutoring = document.querySelector('input[name="tutor-style"]:checked');
            var ghg = tutoring ? tutoring.value : 'None';
            var addressTeaching = document.getElementById('address-inperson').value.trim(); 
            var suburbTeaching = document.getElementById('suburb-inperson').value.trim(); 

            if (!subject) {
                    document.getElementById('subject-error').textContent = "Please select a tutoring type.";
                    isValid = false;
                } else {
                    document.getElementById('subject-error').textContent = "";
                }

            if (!tutoring) {
                    document.getElementById('tutor-style-error').textContent = "Please select a tutoring type.";
                    isValid = false;
                } else {
                    document.getElementById('tutor-style-error').textContent = "";
                }

                if(ghg === "In Person"){
					
					if (!addressTeaching) {
                    document.getElementById('inperson-error').textContent = "please fill in your address.";
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

            function validateForm4() {

                    var isValid = true;

                    var message = document.getElementById('message').value.trim();
                    var secondTutor = document.querySelector('input[name="tutor-option"]:checked');
                    var ghg = secondTutor ? secondTutor.value : 'None';

                  /*  if (!message) {
                    document.getElementById('message-error').textContent = "Please select a tutoring type.";
                    isValid = false;
                    } else {
                    document.getElementById('message-error').textContent = "";
                    } */

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
                    form_3_btns.style.display = "block";

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
                    form_4_btns.style.display = "block";

                }
            });

            form_4_back_btn.addEventListener("click", function() {
                form_3.style.display = "block";
                form_4.style.display = "none";

                form_3_btns.style.display = "flex";
                form_4_btns.style.display = "none";

            });

            form_4_next_btn.addEventListener("click", function() {
                if(validateForm4()) {
                    form_3.style.display = "none";
                    form_4.style.display = "none";
                    form_5.style.display = "block";

                    form_4_btns.style.display = "none";
                    form_5_btns.style.display = "block";

                }
            });

            form_5_back_btn.addEventListener("click", function() {
                form_4.style.display = "block";
                form_5.style.display = "none";

                form_4_btns.style.display = "flex";
                form_4_btns.style.display = "block";

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

        function inPersonInfo(){

          document.getElementById("in-person-teaching").style.display = 'block';
           
         }

         function onlineInfo(){

                document.getElementById("in-person-teaching").style.display = 'none';
                
                }

		/*var modal = document.getElementById("modal");
        var btn = document.getElementById("open-popup");*/

		function openOpenopen(name,email){

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

    // Function to handle button clicks
    function handleButtonClick(event) {
        // Get the ID of the button that was clicked
        const buttonId = event.target.id;

        // You can use a switch statement or if-else logic to handle specific buttons
        switch (buttonId) {
            case 'onceOffPackage':
                alert('Once Off Package selected');

                var amountTopay = '14.15';

                const allData = combineFormData();

                const dataToSend = {
                    ...allData, // Spread the existing data
                    amount: amountTopay // Add the buttonId
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

                var amountTopay = '53.79';

                const all = combineFormData();

                const ToSend = {
                    ...all, // Spread the existing data
                    amount: amountTopay // Add the buttonId
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

                var amountTopay = '104.75';

                const dataall = combineFormData();

                const ToSendData = {
                    ...dataall, // Spread the existing data
                    amount: amountTopay // Add the buttonId
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

                var amountTopay = '150.04';

                const data = combineFormData();

                const sendData = {
                    ...data, // Spread the existing data
                    amount: amountTopay // Add the buttonId
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

               var amountTopay = '189.68';

                const gatherData = combineFormData();

                const dataSend = {
                    ...gatherData, // Spread the existing data
                    amount: amountTopay // Add the buttonId
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



</script>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
 <!--End of body here-->
</body>
</html>