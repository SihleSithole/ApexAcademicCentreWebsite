<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE HTML>
<html>
	<head>   
		<title>Book a Tutor</title>  
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="fix.css" rel="stylesheet">
	<link href="sp.css" rel="stylesheet">
	<link href="booking.css" rel="stylesheet">
	</head>
	<body class="body">

		<section class="main-section">

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
		</nav> 

		<section>
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
						int hours = tutor.getHoursTutored();
						byte[] image = tutor.getImage();
						String syllabus = tutor.getSyllabus();
						String iSmage = java.util.Base64.getEncoder().encodeToString(image);
						int ratings = tutor.getRatings();
						String area = tutor.getArea();
				%>
					<div class="tutor">
						<div class="top">
							<div class="profile">
								<img src="data:image/png;base64,<%= iSmage %>" alt="Member Image">
								<br>
							</div>
							<div class="details">
								<p><strong><%= name %></strong> <br><br>Province : <%= address %><br>Area : <%= area %><br>Curriculum : <%= syllabus %><br>Tutoring Option : <%= availability %></p>
								<br>
							</div>
							<div class="avaialability">
								<!--	<p><%=availability%></p>  -->
								</div>
							<div class="feedback">
								<div class="feedback-item">
									<i class="fas fa-clock"></i>
									<span><%= hours %> Hours Tutored</span>
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
						<div class="middle">
							<div class="grades">
								<br>
								<h4>Grades</h4><br>
								<p><%= grades %></p>
							</div>
							<div class="subjects-about">
								<div class="about">
									<br>
									<p><%= about %></p>
									<br>
								</div>
								<br>
								<div class="subjects">
									<%
										String[] sub = subjects.split(",");
										for (String subject : sub) {
									%>
										<p><%= subject %></p>
									<% } %>
								</div>
							</div>
							<div class="book-view">
								<button onclick="openPopup('<%= name %>' , '<%= address %>' , '<%= iSmage %>', '<%= hours %>' , '<%= ratings %>' , '<%= availability %>' , '<%= about %>' , '<%= qualifications %>' , '<%= subjects %>' , '<%= email %>' , '<%= area %>')" class="view_pp">
									VIEW PROFILE
								</button>
								<button onclick="openOpenopen('<%= name %>' , '<%= email %>')">BOOK TUTOR</button>
								<br>
							</div>
						</div>
						<br>
					</div>
				<% 
					} 
				%>
			</div>
		
		<% 
			} else { 
		%>
			<div>
				<p>Nothing Yet</p>
			</div>
		<% } %>
		

				<div class="backdrop" id="popupBackdrop"></div>
				<div class="popup" id="popupContainer">
					<div class="popup-content">
						<span class="close-popup" onclick="closePopup()">&times;</span>
						<div class="profile-container">
							<div class="profile-row">
								<div class="profile-picture">
									<img id="profile_image" src="" alt="Tutor Picture">
								</div>
								<div class="profile-info">
									<h2 id="profile_name"></h2>
									<p id="profile_province"></p>
									<p id="profile_area"></p>
									
									<!-- Additional info row -->
									<div class="additional-info-row">
										<div class="ratings">
											<i class="fa fa-star"></i><span id="profile_ratings"></span> 
										</div>
										<div class="hours-tutored">
											<i class="fa fa-clock"></i> <span id="profile_hours"></span>
										</div>
										<div class="background-check">
											<i class="fa fa-check-circle"></i><span> Background </span>
										</div>
									</div>
								</div>
								<div class="profile-mode">
									<p id="profile_avail"></p>
								</div>

								<div class="profile-action">

									<button id="book-tutor-button" class="book-tutor-button">Book Tutor</button>
									
								</div>

								
							</div>
			
						<!-- New row for "About Tutor" -->
						<div class="about-tutor-row">
							<div class="about-tutor-title"><i class="fas fa-user"></i>About</div>
							<div class="about-tutor-info">
								<p id="profile_about"></p>
							</div>
						</div>
		
						<!-- New row for "Qualifications" -->
						<div class="qualifications-row">
							<div class="qualifications-title"><i class="fas fa-graduation-cap"></i>Qualifications</div>
							<div class="qualifications-info" >
								<p id="profile_qualification"></p>

								
								
							</div>
						</div>
		
						<!-- New row for "Subjects" -->
						<div class="subjects-row">
							<div class="subjects-title"><i class="fas fa-book"></i>Subjects</div>
							<div class="subjects-info">



								
								<p id="profile_subjects"></p>
							</div>
						</div>
		
						<!-- New row for "Reviews" -->
						<div class="reviews-row">
							<div class="reviews-title"><i class="fas fa-user-circle"></i>Reviews</div>
							<div class="reviews-info">
								<p>"message"</p>
								<p class="reviewer-name">- sender</p>
							
							</div>
						</div>



							
						</div>
					</div>
				</div>
			

				<!--Booking forms here-->
	
							<div class="wrapper" id="modal">

								<div class="modal-content">

								<span class="close-btn" id="close-popup">&times;</span>

								<div class="header">
									<ul>
										<li class="active form_1_progessbar">
											<div>
												<p>1</p>
											</div>
										</li>
										<li class="form_2_progessbar">
											<div>
												<p>2</p>
											</div>
										</li>
										<li class="form_3_progessbar">
											<div>
												<p>3</p>
											</div>
										</li>
									</ul>
								</div>
								<!--START OF FORMS-->
								<div class="form_wrap">
									<div class="form_1 data_info">
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
														<label for="subject">Subject <span class="required">*</span></label>
														<input type="text" id="subject" name="subject" class="input" placeholder="Subject" required>
														<div id="subject-error" class="error"></div>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group">
														<label>What kind of tutoring do you choose? <span class="required">*</span></label>
														<div class="radio-group">
															<label>
																<input type="radio" name="tutoring" value="online" onclick="internetCheck()" required>
																Online
															</label>
															<label>
																<input type="radio" name="tutoring" value="in-person" onclick="suburbCheck()" required>
																In person
															</label>
															<div id="tutoring-error" class="error"></div>
														</div>
				
														<div class="row" id="internetCheck">
															<div class="checkbox-container">
																<input type="checkbox" id="internet-check" name="internet-check" />
																<label for="internet-check">
																	You have fast, stable internet (2Mbps or higher) - You have a computer/laptop with a webcam, microphone, and speakers
																</label>
															</div>
														</div>
				
														<div class="form-row" id="suburbCheck">
															<div class="form-group">
																<label for="suburb">Suburb <span class="required">*</span></label>
																<input type="text" id="suburb" name="suburb" class="input" placeholder="Suburb" required>
																<div id="suburb-error" class="error"></div>
															</div>
														</div>
				
													</div>
													<div class="form-group">
														<label>How do you like Apex to contact you? (Choose) <span class="required">*</span></label>
														<div class="radio-group">
															<label>
																<input type="radio" name="contact-method" value="email" required>
																Email
															</label>
															<label>
																<input type="radio" name="contact-method" value="phone" required>
																Phone
															</label>
															<div id="contact-error" class="error"></div>
														</div>
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
										<h2>Student Information</h2>
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
												</div>
				
												<div id="gradeSyllabus" class="hidden">
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
										<h2>Submit</h2>
										<div id="Message" class="hidden">
											<form id="submit-form" >
											<div class="form-row">
												<div class="form-group">
													<label for="message">Message <span class="required">*</span></label><br><br>
													<textarea id="message" name="message" placeholder="Your Message ..." class="textarea" required></textarea>
													<div id="message-error" class="error"></div>
												</div>
											</div>
											<div class="terms-row">
												<input type="checkbox" id="terms" name="terms" required>
												<label for="terms">
													I have read and agree to the <a href="#" target="_blank">Terms and Conditions</a> and <a href="#" target="_blank">Privacy Policy</a>.
												</label>
												<div id="terms-error" class="error"></div>
											</div>
										</div>
										<div class="btns_wrap">
											<div class="common_btns form_3_btns">
												<button type="button" class="btn_back">Back <span class="icon">←</span></button>
												<button type="button" class="btn_done">Done</button>
											</div>
										</div>
									</form>
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
					<!--</div>-->
							
				<!--Booking forms here-->
			
		</section>


       <script>

		 document.getElementById('popupContainer').style.display = 'none';
		 document.getElementById('popupBackdrop').style.display = 'none';

		 function openPopup(name,address,image,hours,ratings,availability,about,qualifications,subjects,email,area) {

           var profile_name = document.getElementById('profile_name');
		   profile_name.innerText = name;

		   var profile_province = document.getElementById('profile_province');
		   profile_province.innerText = "Provice : " + address;

		   var base64Image = image;

		   var imageElement = document.getElementById('profile_image');
		   imageElement.src = "data:image/png;base64," + base64Image;

		   var profile_hours = document.getElementById('profile_hours');
		   profile_hours.innerText = hours + " Hours";

		   var profile_ratings = document.getElementById('profile_ratings');
		   profile_ratings.innerText = ratings + " Ratings ";

		   var profile_avail = document.getElementById('profile_avail');
		   profile_avail.innerText = availability ;

		   var profile_about = document.getElementById('profile_about');
		   profile_about.innerText = about ;

			//added for qualificaton
			var profileQualificationElement = document.getElementById('profile_qualification');
           var quali = qualifications.split(',');
           var qualificationsString = quali.join(', ');
           profileQualificationElement.innerHTML = '<ul><li>' + quali.join('</li><li>') + '</li></ul>';

           //added for subjects
           var profileSubjectElement = document.getElementById('profile_subjects');
            var mySub = subjects.split(',');
            var subjectsString = mySub.join(', ');
            profileSubjectElement.innerHTML = '<ul><li>' + mySub.join('</li><li>') + '</li></ul>';
			
			var profile_area= document.getElementById('profile_area');

			profile_area.innerHTML = "Area : " + area; 

            document.getElementById('popupContainer').style.display = 'block';
            document.getElementById('popupBackdrop').style.display = 'block';

			 var button = document.getElementById('book-tutor-button');
    
            // Attach the event listener with a closure
			button.addEventListener('click', function() {
				openOpenopen(name, email);
			});

        }

        function closePopup() {
            document.getElementById('popupContainer').style.display = 'none';
            document.getElementById('popupBackdrop').style.display = 'none';
        }

/*###########################################################################BOOKINGS###############################################################*/

document.addEventListener('DOMContentLoaded', function() {
            var form_1 = document.querySelector(".form_1");
            var form_2 = document.querySelector(".form_2");
            var form_3 = document.querySelector(".form_3");

            var form_1_btns = document.querySelector(".form_1_btns");
            var form_2_btns = document.querySelector(".form_2_btns");
            var form_3_btns = document.querySelector(".form_3_btns");

            var form_1_next_btn = document.querySelector(".form_1_btns .btn_next");
            var form_2_back_btn = document.querySelector(".form_2_btns .btn_back");
            var form_2_next_btn = document.querySelector(".form_2_btns .btn_next");
            var form_3_back_btn = document.querySelector(".form_3_btns .btn_back");

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
                var subject = document.getElementById('subject').value.trim();
                var tutoring = document.querySelector('input[name="tutoring"]:checked');
                var contactMethod = document.querySelector('input[name="contact-method"]:checked');
                var province = document.getElementById('province').value;

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

                if (!subject) {
                    document.getElementById('subject-error').textContent = "Subject is required.";
                    isValid = false;
                } else {
                    document.getElementById('subject-error').textContent = "";
                }

                // Validate radio buttons
                if (!tutoring) {
                    document.getElementById('tutoring-error').textContent = "Please select a tutoring type.";
                    isValid = false;
                } else {
                    document.getElementById('tutoring-error').textContent = "";
                }

                if (!contactMethod) {
                    document.getElementById('contact-error').textContent = "Please select a contact method.";
                    isValid = false;
                } else {
                    document.getElementById('contact-error').textContent = "";
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
                // Implement validation for additional form fields in Form 2 here
                // For demonstration, assume the form is valid


                   var isValid = true;

				var tutoringfor = document.getElementById("tutoring-for").value;

				var helpingFor = document.querySelector('input[name="help-with"]:checked');
				var ghg = helpingFor ? helpingFor.value : 'None';

				var studentName = document.getElementById('student-name').value.trim();
				var studentLastName = document.getElementById('student-last-name').value.trim();
				var yearFor = document.querySelector('input[name="year"]:checked');

				var syllabusId = document.getElementById('syllabus').value;

				var gradeId = document.getElementById('grade').value;
				
				
				if(ghg === "school"){
					
					if (!studentName) {
                    document.getElementById('student-name-error').textContent = "Student name is required.";
                    isValid = false;
                } else {
                    document.getElementById('first-name-error').textContent = "";
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

				var yourMessage = document.getElementById('message').value.trim();

				if (!yourMessage) {
                    document.getElementById('message-error').textContent = "Student message is required.";
                    isValid = false;
                } else {
                    document.getElementById('message-error').textContent = "";
                }




				var termsCheckbox = document.getElementById('terms');
            var termsError = document.getElementById('terms-error');

            // Ensure the form is visible
            formThree.style.display = 'block';

            // Validate the checkbox
            if (!termsCheckbox.checked) {
                termsError.style.display = 'block'; // Show error message
            } else {
                termsError.style.display = 'none'; // Hide error message
                // Optionally, proceed with form submission or other actions
               // alert('Form is valid and ready for submission.');
                // Hide the form after successful validation
                // formThree.style.display = 'none'; // Uncomment if you want to hide the form after validation
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


            btn_done.addEventListener("click", function() {
                if (validateForm3()) {

					const allData = combineFormData();

					  // Send data to Spring Boot controller
					  fetch('/booking', { // Replace with your actual endpoint URL
								method: 'POST',
								headers: { 
									'Content-Type': 'application/json' 
								},
								body: JSON.stringify(allData)
							})
							.then(response => response.json())
							.then(result => {
								console.log('Success:', result);
								// Optionally show success message or handle response
							})
							.catch(error => {
								console.error('Error:', error);
								// Optionally handle error response
							});

                    modal_wrapper.classList.add("active");
                    shadow.addEventListener("click", function() {
                        modal_wrapper.classList.remove("active");
                    });

                    setTimeout(function(){
                        window.location.href = '/';
                    } , 2000);
                    
                }
            });
        });


        document.getElementById("student-info").style.display = 'none';
        document.getElementById("year-selection-container").style.display='none';

        document.getElementById("internetCheck").style.display = 'none';

        document.getElementById("suburbCheck").style.display="none";
    
        document.getElementById("gradeSyllabus").style.display="none";

           function studentInfo(){

            document.getElementById("student-info").style.display = 'block';
            document.getElementById("gradeSyllabus").style.display="block";
            document.getElementById("year-selection-container").style.display='none';

           }

           function vasityInfo(){
            document.getElementById("year-selection-container").style.display='block';
            document.getElementById("student-info").style.display = 'none';
            document.getElementById("gradeSyllabus").style.display="none";
           }

           function internetCheck(){
            document.getElementById("internetCheck").style.display = 'block';
            document.getElementById("suburbCheck").style.display="none";
           }

           function suburbCheck(){
            document.getElementById("internetCheck").style.display = 'none';
            document.getElementById("suburbCheck").style.display="block";
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
    
    const form1Data = new FormData(form1);
    const form2Data = new FormData(form2);
    const form3Data = new FormData(form3);
    
    const data1 = formDataToObject(form1Data);
    const data2 = formDataToObject(form2Data);
    const data3 = formDataToObject(form3Data);
    
    // Combine all data into a single object
    return { ...data1, ...data2, ...data3 };
}




	   </script>

		<script src="js/jquery-3.3.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery-3.3.1.min.js"></script>

	</body>

</html>