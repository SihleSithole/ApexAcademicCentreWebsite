<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Booking" %>
<%@ page import="com.example.demo.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	
	<title>Admin Dashboard</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!----css3---->
	<link rel="stylesheet" href="css/dashboard.css">

	<!--google fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


	<!--google material icon-->
	<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
	<style>
		/* Hide the second form by default */
		#form2 {
			display: none;
		}

		/* Style for input fields on hover */
		input[type="text"]:hover,
		input[type="email"]:hover,
		input[type="tel"]:hover {
			border-color: rgb(128, 255, 255);
			/* Light blue border color */
		}

		/* Style for the button */
		input[type="button"],
		input[type="submit"] {
			background-color: rgb(128, 128, 128);
			/* Blue background color */
			color: white;
			/* White text color */
			padding: 10px 20px;
			/* Padding */
			border: none;
			/* Remove border */
			border-radius: 5px;
			/* Rounded corners */
			cursor: pointer;
			/* Cursor style */
		}

		/* Hover style for the button */
		/*  input[type="button"]:hover {
            background-color: rgb(128, 255, 255); /* Darker blue on hover */
		/* }*/

		.grid-container {
			display: grid;
			grid-template-columns: repeat(2, 1fr); /* Two columns layout */
			gap: 1rem; /* Space between items */
		}

		.mb-3 {
			margin-bottom: 1rem;
		}



	</style>

</head>

<body>



	<div class="wrapper">

		<div class="body-overlay"></div>

		<!-------sidebar--design------------>

		<div id="sidebar">
			<div class="sidebar-header">
				<h3><span>APEX ACADEMIC CENTRE</span></h3>
			</div>
			<ul class="list-unstyled component m-0">

				<li class="active" id="tutors">
					<a href="#" class="dashboard" onclick="showTutorPanel(); return false;"><i class="material-icons">dashboard</i>Tutors </a>
				</li>

				<li id="bookings">
					<a href="#" class="dashboard" onclick="showBookingsPanel(); return false;"><i class="material-icons">library_books</i>Pending Bookings </a>
				</li>

				<li id="blogs">
					<a href="#" class="dashboard" onclick="showApprovedPanel(); return false;">
						<i class="material-icons">check_circle</i>Approved Bookings 
					</a>
				</li>

				<li id="reviews">
					<a href="#" class="dashboard" onclick="showReviewsPanel(); return false;">
						<i class="material-icons">rate_review</i>Reviews
					</a>
				</li>

				<li id="consultants">
					<a href="#" class="dashboard" onclick="showConsultantsPanel(); return false;">
						<i class="material-icons">business_center</i>Consultants
					</a>
				</li>

				<li id="others">
					<a href="#" class="dashboard" onclick="showOthersPanel(); return false;">
						<i class="material-icons">help_outline</i>Others
					</a>
				</li>

			</ul>
		</div>

		<!-------sidebar--design- close----------->

		<!-------page-content start----------->

		<div id="content">

			<!------top-navbar-start----------->

			<div class="top-navbar">
				<div class="xd-topbar">
					<div class="row">
						<div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
							<div class="xp-menubar">
								<span class="material-icons text-white">signal_cellular_alt</span>
							</div>
						</div>

						<div class="col-md-5 col-lg-3 order-3 order-md-2">
							<div class="xp-searchbar">
							    <form id="searchForm">
									<div class="input-group">
										<input type="search" class="form-control" placeholder="Search by Email" name="email" id="searchEemail" required>
										<div class="input-group-append">
											<button class="btn" type="button" id="button-addon2" onclick="searchTutor()">Go</button>
										</div>
									</div>
								</form>
							</div>
						</div>


						<div class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
							<div class="xp-profilebar text-right">
								<nav class="navbar p-0">
									<ul class="nav navbar-nav flex-row ml-auto">

										<li class="dropdown nav-item">
											<a class="nav-link" href="#" data-toggle="dropdown">
												<img src="image" style="width:40px; border-radius:50%;" />
												<span class="xp-user-live"></span>
											</a>
											<ul class="dropdown-menu small-menu">

												<li><a href="/logout" onclick="preventBackNavigation()">
														<span class="material-icons">logout</span>
														Logout
													</a></li>

											</ul>
										</li>


									</ul>
								</nav>
							</div>
						</div>

					</div>

					<div class="xp-breadcrumbbar text-center">
						<h4 class="page-title">Dashboard</h4>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Apex</a></li>
							<li class="breadcrumb-item active" aria-curent="page">Dashboard</li>
						</ol>
					</div>


				</div>
			</div>
			<!------top-navbar-end----------->


			<!------main-content-start----------->

			<div class="main-content">
				<!--START HERE-->

				<div class="row" id="tutorPanel">
					<div class="col-md-12">
						<div class="table-wrapper">

							<div class="table-title">
								<div class="row">
									<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
										<h2 class="ml-lg-2">Tutors</h2>
									</div>
									<div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">
										<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
											<i class="material-icons">&#xE147;</i>
											<span>Add New Tutor</span>
										</a>

									</div>
								</div>
							</div>

							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th><span class="custom-checkbox">
												<input type="checkbox" id="selectAll">
												<label for="selectAll"></label></th>
										<th>Name</th>
										<th>Email</th>
										<th>Teaching</th>
										<th>Phone</th>
										<th>Actions</th>
									</tr>
								</thead>

								<tbody>

									<% List<Tutor> tutors = (List<Tutor>)
											request.getAttribute("tutors");
											if (tutors != null && !tutors.isEmpty()) {
											for (Tutor tutor : tutors) {

											String email = tutor.getEmail();
											String name = tutor.getFullNames();
											String availability = tutor.getAvailability();
											String phone = tutor.getPhoneNumber();
											String subjects = tutor.getSubjects();
											String grades = tutor.getGrades();
											String address = tutor.getAddress();
											String bio = tutor.getBio();
											String about = tutor.getAbout();
											String hours = tutor.getHoursTutored();
                                            byte[] image = tutor.getImage();
                                            String syllabus = tutor.getSyllabus();
                                            String area = tutor.getArea();
											String country = tutor.getCountry();

											%>

											<tr>
												<th><span class="custom-checkbox">
														<input type="checkbox" id="checkbox1" name="option[]" value="1">
														<label for="checkbox1"></label></th>
												<th>
													<%=tutor.getFullNames()%>
												</th>
												<th>
													<%=tutor.getEmail()%>
												</th>
												<th>
													<%=tutor.getAvailability()%>
												</th>
												<th>
													<%=tutor.getPhoneNumber()%>
												</th>
												<th>
										
											       <a href="#editEmployeeModal" class="edit" data-toggle="modal" data-name="<%= name %>" data-email="<%= email %>" data-availability="<%= availability %>"
														data-phone="<%= phone %>" data-subjects="<%= subjects %>" data-grades="<%= grades %>" data-address="<%= address %>" data-bio="<%= bio %>"
														data-about="<%= about %>" data-hours="<%= hours %>" data-country="<%= country %>" data-image="<%= image %>" data-syllabus="<%= syllabus %>" data-area="<%= area %>"   >
														<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
														</a> 

													<a href="#deleteEmployeeModal" class="delete" data-toggle="modal"
														data-email="<%= email %>">
														<i class="material-icons" data-toggle="tooltip"
															title="Delete">&#xE872;</i>
													</a>

												</th>
											</tr>

											<% } } else { %>
												<tr>
													<th>No Tutor yet..</th>
												</tr>
												<% } %>

								</tbody>
							</table>
						</div>
					</div>

					<!--END HERE-->

					<!----add-modal start--------->
					<div class="modal fade" tabindex="-1" id="addEmployeeModal" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Add Tutor</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- Form 1 -->
									<form id="form1" class="p-4 border rounded">
										<h1 class="mb-4"></h1>
										<div class="grid-container">
											<div class="mb-3">
												<label for="name">Name</label>
												<input type="text" id="name" name="name" class="form-control" placeholder="Bongi">
												<div id="nameError" class="error-message"></div>
											</div>
									
											<div class="mb-3">
												<label for="name">Surname</label>
												<input type="text" id="lsurname" name="lsurname" class="form-control" placeholder="Mabhena" required>
												<div id="lSurnameError" class="error-message"></div>
											</div>

											<div class="mb-3">
												<label for="idnumber">Date of Birth</label>
												<input type="date" id="idnumber" name="idnumber" class="form-control" required>
												<div id="idError" class="error-message"></div>
											</div>
											
											<div class="mb-3">
												<label for="phone">Phone Number</label>
												<input type="text" id="phone" name="phone" class="form-control" placeholder="0712345678"required>
												<div id="phoneError" class="error-message"></div>
											</div>

											

											<div class="mb-3">
												<label for="nationality">Nationality</label>
												<select id="nationality" name="nationality" class="form-control" required>
													<option value="" disabled selected>Select your nationality</option>
													<option value="No">African</option>
												</select>
												
											</div>

											
											<div class="mb-3">
												<label for="email">Email Address</label>
												<input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
												<div id="emailError" class="error-message"></div>
											</div>
									
											<div class="mb-3">
												<label for="background">Background check</label>
												<select id="background" name="background" class="form-control" required>
													<option value="No">No</option>
													<option value="Yes">Yes</option>
												</select>
												<div id="backError" class="error-message"></div>
											</div>
									
											<div class="mb-3">
												<label for="country">Country</label>
												<select id="country" name="country" class="form-control" required>
													<option value="" disabled selected>Select your Country</option>
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
												<div id="countryError" class="error-message"></div>
											</div>
									
											<div class="mb-3">
												<label for="address">Province</label>
												<select id="address" name="address" class="form-control" required>
													<option value="" disabled selected>Select your province</option>
													<option value="Limpopo">Limpopo</option>
													<option value="Gauteng">Gauteng</option>
													<option value="Free State">Free State</option>
													<option value="North West">North West</option>
													<option value="Northern Cape">Northern Cape</option>
													<option value="Eastern Cape">Eastern Cape</option>
													<option value="KwaZulu Natal">KwaZulu Natal</option>
													<option value="Mpumalanga">Mpumalanga</option>
													<option value="Western Cape">Western Cape</option>
												</select>
												<div id="addressError" class="error-message"></div>
											</div>
										</div>
									
										<input type="button" value="Next" class="btn btn-primary" onclick="validateForm1()">
									</form>
									

									<!-- Form 2 -->
									<form id="form2" class="p-4 border rounded">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label>
												<input type="checkbox" name="university" value="yes" id="universityCheckbox">
												Do you tutor University Students?
											</label>
											<div class="modules" id="modulesDiv" style="display: none;"> 
												<label for="unsubjects">Modules (Separate in Comma)</label>
												<input type="text" id="unSubjects" name="unSubjects" class="form-control"  required>
												<div id="unError" class="error-message"></div>
											</div>
										</div>
										<div class="mb-3">
											<label for="subject">School Subjects</label>
											<input type="text" id="subjects" name="subjects" class="form-control" required readonly onclick="toggleSubjectOptions()">
											<div id="subjectContainer" style="display: none;">
												<label><input type="checkbox" value="Mathematics" onchange="updateSubjects()"> Mathematics</label>
												<label><input type="checkbox" value="isiZulu" onchange="updateSubjects()"> isiZulu</label>
												<label><input type="checkbox" value="History" onchange="updateSubjects()"> History</label>
												<label><input type="checkbox" value="Geography" onchange="updateSubjects()"> Geography</label>
												<label><input type="checkbox" value="English" onchange="updateSubjects()"> English</label>
												<label><input type="checkbox" value="Afrikaans" onchange="updateSubjects()"> Afrikaans</label>
												<label><input type="checkbox" value="Physics" onchange="updateSubjects()"> Physics</label>
											</div>
											<div id="subjectError" class="error-message"></div>
										</div>
										
										<div class="mb-3">
											<label for="grades">Select Grades</label>
											<input type="text" id="grades" name="grades" class="form-control" required readonly onclick="toggleCheckboxes()">
											<div id="gradesContainer" style="display: none;">
												<label><input type="checkbox" value="GRD:R" onchange="updateGrades()"> R</label>
												<label><input type="checkbox" value="GRD:1" onchange="updateGrades()"> 1</label>
												<label><input type="checkbox" value="GRD:2" onchange="updateGrades()"> 2</label>
												<label><input type="checkbox" value="GRD:3" onchange="updateGrades()"> 3</label>
												<label><input type="checkbox" value="GRD:4" onchange="updateGrades()"> 4</label>
												<label><input type="checkbox" value="GRD:5" onchange="updateGrades()"> 5</label>
												<label><input type="checkbox" value="GRD:6" onchange="updateGrades()"> 6</label>
												<label><input type="checkbox" value="GRD:7" onchange="updateGrades()"> 7</label>
												<label><input type="checkbox" value="GRD:8" onchange="updateGrades()"> 8</label>
												<label><input type="checkbox" value="GRD:9" onchange="updateGrades()"> 9</label>
												<label><input type="checkbox" value="GRD:10" onchange="updateGrades()"> 10</label>
												<label><input type="checkbox" value="GRD:11" onchange="updateGrades()"> 11</label>
												<label><input type="checkbox" value="GRD:12" onchange="updateGrades()"> 12</label>
											</div>
											<div id="gradesError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="syllabus">Select Syllabus</label>
											<input type="text" id="syllabus" name="syllabus" class="form-control" required readonly onclick="toggleSyllabusOptions()">
											<div id="syllabusContainer" style="display: none;">
												<label><input type="checkbox" value="CAPs" onchange="updateSyllabus()"> CAPs</label>
												<label><input type="checkbox" value="IEB" onchange="updateSyllabus()"> IEB</label>
												<label><input type="checkbox" value="IB" onchange="updateSyllabus()"> IB</label>
												<label><input type="checkbox" value="Cambridge" onchange="updateSyllabus()"> Cambridge</label>
												<label><input type="checkbox" value="Pearson Edexel" onchange="updateSyllabus()"> Pearson Edexcel</label>
											</div>
											<div id="syllabusError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="tutorOptions">Tutoring Options</label>
											<select id="tutorOptions" name="tutorOptions" class="form-control" required
												aria-placeholder="Tutoring Options">
												<option value="Online">Online</option>
												<option value="In person">In person</option>
												<option value="Online / In person">Online &
													In person</option>
											</select>
										</div>

										<div class="mb-3">
											<label for="area">Area</label>
											<input type="text" id="area" name="area" class="form-control"
												required>
											<div id="areaError" class="error-message"></div>
										</div>

										<input type="button" value="Previous" class="btn btn-secondary"
											onclick="displayForm1()">
										<button type="button" class="btn btn-secondary"
											onclick="validateForm2()">Next</button>

									</form>

									<!-- Form 3 -->
									<form id="form3" class="p-4 border rounded" enctype="multipart/form-data">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label for="about">About Tutor</label>
											<input type="text" id="about" name="about" class="form-control" style="height: 150px;" required />
								            
										</div>

										<div class="mb-3">
											<label for="hours">Bio</label>
											<input type="text" id="hours" name="hours" class="form-control" style="height: 150px;" required />
								            
										</div>

										<div class="mb-3">
											<label for="bio">Qualification(Separate in Comma)</label>
											<input type="text" id="bio" name="bio" class="form-control" style="height: 150px;" required>
								
										</div>

										<div class="mb-3">
											<label for="profile">Profile Picture</label>
											<input type="file" id="profile" name="profile" class="form-control">
										</div>

										<div class="mb-3">
											<input type="hidden" id="hiddenName" name="hiddenName" class="form-control">
											<input type="hidden" id="hiddenSurname" name="hiddenSurname" class="form-control">
											<input type="hidden" id="hiddenModules" name="hiddenModules" class="form-control">
											<input type="hidden" id="hiddenID" name="hiddenID" class="form-control">
											<input type="hidden" id="hiddenIdentity" name="hiddenIdentity" class="form-control">
											<input type="hidden" id="hiddenEmail" name="hiddenEmail"
												class="form-control">
											<input type="hidden" id="hiddenPhone" name="hiddenPhone"
												class="form-control">
											<input type="hidden" id="hiddenSubjects" name="hiddenSubjects"
												class="form-control">
											<input type="hidden" id="hiddenGrades" name="hiddenGrades"
												class="form-control">
											<input type="hidden" id="hiddenSyllabus" name="hiddenSyllabus"
												class="form-control">
											<input type="hidden" id="tutorOption" name="tutorOption"
												class="form-control">
											<input type="hidden" id="hiddenAddress" name="hiddenAddress"
												class="form-control">
												<input type="hidden" id="hiddenArea" name="hiddenArea"
												class="form-control">
												<input type="hidden" id="hiddenCountry" name="hiddenCountry" class="form-control">
										</div>

										<input type="button" value="Previous" class="btn btn-secondary"
											onclick="displayForm2()">
										<button type="submit" class="btn btn-success">Send</button>
										
									</form>
								</div>

							</div>
						</div>
					</div>

					<!----edit-modal end--------->


					<!----edit-modal start--------->
					<div class="modal fade" tabindex="-1" id="editEmployeeModal" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Edit Tutor</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								
								<div class="modal-body">
									<!--START HERE-->
									<!-- Form 1 -->
									<form id="editform1" class="p-4 border rounded">
										<h1 class="mb-4"></h1>
										

										<div class="mb-3">
											<label for="name">Name</label>
											<input type="text" id="editname" name="editname" class="form-control" placeholder="Sihle">
											<div id="editnameError" class="error-message"></div>
										</div>
								
										<div class="mb-3">
											<label for="surname">Surname</label>
											<input type="text" id="editsurname" name="editsurname" class="form-control" placeholder="Sithole" required>
											<div id="editsurnameError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="idnumber">Date of Birth</label>
											<input type="date" id="idnumber" name="idnumber" class="form-control" required>
											<div id="idError" class="error-message"></div>
										</div>


										<div class="mb-3">
											<label for="phone">Phone Number</label>
											<input type="text" id="editphone" name="editphone" class="form-control" required>
											<div id="editphoneError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="nationality">Nationality</label>
											<select id="nationality" name="nationality" class="form-control" required>
												<option value="" disabled selected>Select your nationality</option>
												<option value="No">African</option>
											</select>
											
										</div>

										


										<div class="mb-3">
											<label for="email">Email Address</label>
											<input type="editemail" id="editemail" name="editemail" class="form-control"
												placeholder="Email" required readonly>
											<div id="editemailError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="editaddress">Province</label>
											<select id="editaddress" name="editaddress" class="form-control" required>
												<option value="" disabled selected>Select your province</option>
												<option value="Limpopo">Limpopo</option>
												<option value="Gauteng">Gauteng</option>
												<option value="Free State">Free State</option>
												<option value="North West">North West</option>
												<option value="Northern Cape">Northern Cape</option>
												<option value="Eastern Cape">Eastern Cape</option>
												<option value="KwaZulu Natal">KwaZulu Natal</option>
												<option value="Mpumalanga">Mpumalanga</option>
												<option value="Western Cape">Western Cape</option>
											</select>
											<div id="editaddressError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="editcountry">Country</label>
											<select id="editcountry" name="editcountry" class="form-control" required>
												<option value="" disabled selected>Select your Country</option>
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
											<div id="editcountryError" class="error-message"></div>
										</div>

										<input type="button" value="Next" class="btn btn-primary"
											onclick="editvalidateForm1()">
									</form>

									<!-- Form 2 -->
									<form id="editform2" class="p-4 border rounded">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label for="subject">Subjects(Separate in Comma)</label>
											<input type="text" id="editsubjects" name="editsubjects" class="form-control"
												required>
											<div id="editsubjectError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="grades">Grades(Separate in Comma)</label>
											<input type="text" id="editgrades" name="editgrades" class="form-control" required>
											<div id="editgradesError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="syllabus">Syllabus(Separate in
												Comma)</label>
											<input type="text" id="editsyllabus" name="editsyllabus" class="form-control"
												required>
											<div id="editsyllabusError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="tutorOptions">Tutoring Options</label>
											<select id="edittutorOptions" name="edittutorOptions" class="form-control" required
												aria-placeholder="Tutoring Options">
												<option value="Online">Online</option>
												<option value="In-Person">In-Person</option>
												<option value="Online & In-Person">Online &
													In-Person</option>
											</select>
										</div>

										<div class="mb-3">
											<label for="area">Area</label>
											<input type="text" id="editarea" name="editarea" class="form-control"
												required>
											<div id="editAreaError" class="error-message"></div>
										</div>

										<input type="button" value="Previous" class="btn btn-secondary"
											onclick="editdisplayForm1()">
										<button type="button" class="btn btn-secondary"
											onclick="editvalidateForm2()">Next</button>

									</form>

									<!-- Form 3 -->
									<form id="editform3" class="p-4 border rounded" enctype="multipart/form-data">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label for="editabout">About Tutor</label>
											<input type="text" id="editabout" name="editabout" class="form-control" style="height: 150px;" required />
								            
										</div>

										<div class="mb-3">
											<label for="hours">Bio</label>
											<input type="text" id="edithours" name="edithours" class="form-control" style="height: 150px;" required />
								            
										</div>

										<div class="mb-3">
											<label for="editbio">Qualification(Separate in Comma)</label>
											<input type="text" id="editbio" name="editbio" class="form-control" style="height: 150px;" required>
								
										</div>

										<div class="mb-3">
											<label for="profile">Profile Picture</label>
											<input type="file" id="editprofile" name="editprofile" class="form-control">
										</div>

										<div class="mb-3">
											<input type="hidden" id="edithiddenName" name="edithiddenName" class="form-control">
									        <input type="hidden" id="edithiddenCountry" name="edithiddenCountry" class="form-control">
											<input type="hidden" id="edithiddenEmail" name="edithiddenEmail"
												class="form-control">
											<input type="hidden" id="edithiddenPhone" name="edithiddenPhone"
												class="form-control">
											<input type="hidden" id="edithiddenSubjects" name="edithiddenSubjects"
												class="form-control">
											<input type="hidden" id="edithiddenGrades" name="edithiddenGrades"
												class="form-control">
											<input type="hidden" id="edithiddenSyllabus" name="edithiddenSyllabus"
												class="form-control">
											<input type="hidden" id="edittutorOption" name="edittutorOption"
												class="form-control">
											<input type="hidden" id="edithiddenAddress" name="edithiddenAddress"
												class="form-control">
												<input type="hidden" id="edithiddenArea" name="edithiddenArea"
												class="form-control">
										</div>

										<input type="button" value="Previous" class="btn btn-secondary"
											onclick="editdisplayForm2()">
										<button type="submit" class="btn btn-success">Save</button>
									</form>

									<!--END HERE-->
								</div>

								<!--END HERE-->

							</div>
						</div>
					</div>

					<!----edit-modal end--------->


					<!----delete-modal start--------->
					<div id="deleteEmployeeModal" class="modal fade" tabindex="-1" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Confirm Deletion</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form action="/deleteTutor" method="post">
									<div class="modal-body">
										<p>Are you sure you want to delete the Tutor?</p>
										<input type="hidden" name="deleteEmail" id="deleteEmail" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-danger"
											onclick="confirmDeletion()">Delete</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!----delete-modal end--------->

				</div>
				

				<!--Booking Panel-->

				<div class="row" id="bookingPanel">
					<div class="col-md-12">
						<div class="table-wrapper">

							<div class="table-title">
								<div class="row">
									<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
										<h2 class="ml-lg-2">Pending Bookings</h2>
									</div>
								</div>
							</div>

							<table class="table table-striped table-hover">

								<thead>
									<tr>
										<th>Name</th>
										<th>Email</th>
										<th>Online / In-person</th>
										<th>Tutor Name</th>
										<th>Tutor Email</th>
										<th>Status</th>
										<th>View</th>
									</tr>
								</thead>

								<tbody>

									<% List<Booking> bookings = (List<Booking>)
											request.getAttribute("bookings");
											if (bookings != null && !bookings.isEmpty()) {
												
											for (Booking book : bookings) {

												String bName = book.getName();
												String bSurname = book.getSurname();
												String bEmail = book.getEmail();
												String bTutoringOption = book.getTutorStyle();
												String bTutorName = book.getTutorName();
												String bTutorEmail = book.getTutorEmail();
												String bStatus = book.getStatus();
                                                String clientName = bName + " " + bSurname;
												
												String bPaid = book.getIsPaid();
												String bPackageType = book.getPackageType();
												String bTutorOption = book.getTutorOption();
												String bMessage = book.getMessage();
												String bSuburb = book.getSuburb();
												String bAddress = book.getAddress();
												String bSubject = book.getSubject();
												String bPhone = book.getPhone();
												String bProvince = book.getProvince();
												String bCountry = book.getCountry();
												String bInstrLanguage = book.getInstrLanguage();
												String bTutorFor = book.getTutorFor();
												String bHelpWith = book.getHelpWith();
												String bSchName = book.getSchName() ;
												String bSchSurname = book.getSchSurname();
												String bSchGrade = book.getSchGrade();
												String bSchSyllabus = book.getSchSyllabus();
												String bnName = book.getUnName();
												String bnSurname = book.getUnSurname();
												String bnYear = book.getUnYear();
												


												if(bStatus.equalsIgnoreCase("pending")){

											        %>
											<tr>
											
												<th>
													<%= bName %> <%= bSurname %>
												</th>
												<th>
													<%= bEmail %>
												</th>
												<th>
													<%= bTutoringOption %>
												</th>
												<th>
													<%= bTutorName%>
												</th>
												<th>
													<%= bTutorEmail %>
												</th>
												<th>
													<%= bStatus %>
												</th>
												<th>
										
										
													<a href="#" class="view" 
													data-toggle="modal" data-target="#bookingModal"
													data-name="<%= clientName%>"
													data-phone="<%= bPhone %> "
													data-email="<%= bEmail %> "
													data-country="<%= bCountry %> "
													data-province="<%= bProvince %> "
													data-language="<%= bInstrLanguage %> "
													data-tutoringfor="<%= bTutorFor %> "
													data-helpwith="<%= bHelpWith %> "
													data-sname="<%= bSchName %> "
													data-ssurname="<%= bSchSurname %> "
													data-sgrade="<%= bSchGrade %> "
													data-ssyllabus="<%= bSchSyllabus %> "
													data-ssubject="<%= bSubject %> "
													data-syear="<%= bnYear%> "
													data-uname="<%= bnName %> "
													data-usurname="<%= bnSurname %>"
													data-address="<%= bAddress %>"
													data-suburb="<%= bSuburb %>"
													data-message="<%= bMessage %>"
													data-status="<%= bStatus %>"
													data-tutorname="<%= bTutorName %>"
													data-tutoremail="<%= bTutorEmail %>"
													data-tutoropt="<%= bTutoringOption %>"
													data-secondopt="<%= bTutorOption %>"
													data-package="<%= bPackageType %>"
													>
													 <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
												 </a>

												</th>
											</tr>

											<% } } } else { %>
												<tr>
													<th>No Bookings yet..</th>
												</tr>
												<% } %>

								</tbody>
							</table>
						</div>
					</div>
										
				</div>						    

					<!--Approved Booking Panel-->

					<!--Reviews Panel-->

					<div class="row" id="reviewsPanel">
						<div class="col-md-12">
							<div class="table-wrapper">
	
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
											<h2 class="ml-lg-2">Reviews</h2>
										</div>
									</div>
								</div>
	
								<table class="table table-striped table-hover">
	
									<thead>
										<tr>
											<th>Name</th>
											<th>Rating</th>
											<th>Message</th>
										
											<th>Tutor Email</th>
											<th>View</th>
										</tr>
									</thead>
	
									<tbody>

								     	<% List<Review> reviews = (List<Review>)
											request.getAttribute("reviews");
											if (reviews != null && !reviews.isEmpty()) {
												
											for (Review rv : reviews) {

												String message = rv.getMessage();
												String msg = message;
												String useMessage = msg;

												String rName = rv.getName();
												String rTutorEmail = rv.getTutorEmail();
												int rRating = rv.getRating();
												Long rEntryId = rv.getEntryId();
												String rStatus = rv.getStatus();

												if(rStatus.equals("pending")){

												%>

												<tr>
													<th>
													    <%= rName %>
													</th>
													<th>
													    <%= rRating %>
													</th>
													<th>
														<%= useMessage %>
													</th>
													<th>
														<%= rTutorEmail %>
													</th>
													<th>
											
														<a href="#" class="review" data-toggle="modal" data-target="#reviewModal" data-name="<%= rName %>" data-message="<%= message %>" data-rating="<%= rRating %>" data-message="<%= message %>" data-tutor="<%= rEntryId %>" data-email="rTutorEmail">
														 <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
													    </a>
	
													</th>
												</tr>
												<% } } } else { %>
													<tr>
														<th>No Reviews yet..</th>
													</tr>
													<% } %>
	
											
									</tbody>
								</table>
							</div>
						</div>
											
					</div>
					   

					<!--Reviews Panel-->

					<!--Start Consultans Panel-->

					<div class="row" id="consultantsPanel">
						<div class="col-md-12">
							<div class="table-wrapper">
					
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
											<h2 class="ml-lg-2">Pending Consultations</h2>
										</div>
									</div>
								</div>
					
								<table class="table table-striped table-hover">
					
									<thead>
										<tr>
											<th>Name</th>
											<th>Email</th>
											<th>Online / In-person</th>
											<th>Consultant Name</th>
											<th>Consultant Email</th>
											<th>Status</th>
											<th>View</th>
										</tr>
									</thead>
					
									<tbody>
					
										<% List<Booking> consultations = (List<Booking>)
												request.getAttribute("bookings");
												if (consultations != null && !consultations.isEmpty()) {
					
												for (Booking consultation : consultations) {
					
													String cbName = consultation.getName();
													String cbSurname = consultation.getSurname();
													String cbEmail = consultation.getEmail();
													String cbTutoringOption = consultation.getTutorStyle();
													String cbTutorName = consultation.getTutorName();
													String cbTutorEmail = consultation.getTutorEmail();
													String cbStatus = consultation.getStatus();
													String cclientName = cbName + " " + cbSurname;
													
													String cbPaid = consultation.getIsPaid();
													String cbPackageType = consultation.getPackageType();
													String cbTutorOption = consultation.getTutorOption();
													String cbMessage = consultation.getMessage();
													String cbSuburb = consultation.getSuburb();
													String cbAddress = consultation.getAddress();
													String cbSubject = consultation.getSubject();
													String cbPhone = consultation.getPhone();
													String cbProvince = consultation.getProvince();
													String cbCountry = consultation.getCountry();
													String cbInstrLanguage = consultation.getInstrLanguage();
													String cbTutorFor = consultation.getTutorFor();
													String cbHelpWith = consultation.getHelpWith();
													String cbSchName = consultation.getSchName() ;
													String cbSchSurname = consultation.getSchSurname();
													String cbSchGrade = consultation.getSchGrade();
													String cbSchSyllabus = consultation.getSchSyllabus();
													String cbnName = consultation.getUnName();
													String cbnSurname = consultation.getUnSurname();
													String cbnYear = consultation.getUnYear();

													Long cId = consultation.getEntry();
													
					
													if(cbStatus.equalsIgnoreCase("consult")) {
					
														%>
														<tr>
					
															<th>
																<%= cclientName %>
															</th>
															<th>
																<%= cbEmail %>
															</th>
															<th>
																<%= cbTutoringOption %>
															</th>
															<th>
																<%= cbTutorName %>
															</th>
															<th>
																<%= cbTutorEmail %>
															</th>
															<th>
																<%= cbStatus %>
															</th>
															<th>
					
																<a href="#" class="consultView"
																   data-toggle="modal" data-target="#consultationModal"
																 
																   data-name="<%= cclientName%>"
																   data-phone="<%= cbPhone %> "
																   data-email="<%= cbEmail %> "
																   data-country="<%= cbCountry %> "
																   data-province="<%= cbProvince %> "
																   data-language="<%= cbInstrLanguage %> "
																   data-tutoringfor="<%= cbTutorFor %> "
																   data-helpwith="<%= cbHelpWith %> "
																   data-sname="<%= cbSchName %> "
																   data-ssurname="<%= cbSchSurname %> "
																   data-sgrade="<%= cbSchGrade %> "
																   data-ssyllabus="<%= cbSchSyllabus %> "
																   data-ssubject="<%= cbSubject %> "
																   data-syear="<%= cbnYear%> "
																   data-uname="<%= cbnName %> "
																   data-usurname="<%= cbnSurname %>"
																   data-address="<%= cbAddress %>"
																   data-suburb="<%= cbSuburb %>"
																   data-message="<%= cbMessage %>"
																   data-status="<%= cbStatus %>"
																   data-tutorname="<%= cbTutorName %>"
																   data-tutoremail="<%= cbTutorEmail %>"
																   data-tutoropt="<%= cbTutoringOption %>"
																   data-secondopt="<%= cbTutorOption %>"
																   data-package="<%= cbPackageType %>"
																   data-sid="<%= cId %>"
																   >
																   
																	<i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>

																</a>
					
															</th>


														</tr>
					
														<% } } } else { %>
															<tr>
																<th>No Consultations yet..</th>
															</tr>
															<% } %>
					
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<!--End Consultans Panel-->

					<!--Start others panel-->

					<div class="row" id="othersPanel">
						<div class="col-md-12">
							<div class="table-wrapper">
					
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
											<h2 class="ml-lg-2">Pending Others</h2>
										</div>
									</div>
								</div>
					
								<table class="table table-striped table-hover">
					
									<thead>
										<tr>
											<th>Name</th>
											<th>Email</th>
											<th>Contacts</th>
											
											<th>View</th>
										</tr>
									</thead>
					
									<tbody>
					
										<% List<Booking> othersBookings = (List<Booking>) request.getAttribute("bookings");
										   if (othersBookings != null && !othersBookings.isEmpty()) {
											   for (Booking other : othersBookings) {
					
												String obName = other.getName();
												String obSurname = other.getSurname();
												String obEmail = other.getEmail();
												String obTutoringOption = other.getTutorStyle();
												String obTutorName = other.getTutorName();
												String obTutorEmail = other.getTutorEmail();
												String obStatus = other.getStatus();
												String oclientName = obName + " " + obSurname;
												
												String obPaid = other.getIsPaid();
												String obPackageType = other.getPackageType();
												String obTutorOption = other.getTutorOption();
												String obMessage = other.getMessage();
												String obSuburb = other.getSuburb();
												String obAddress = other.getAddress();
												String obSubject = other.getSubject();
												String obPhone = other.getPhone();
												String obProvince = other.getProvince();
												String obCountry = other.getCountry();
												String obInstrLanguage = other.getInstrLanguage();
												String obTutorFor = other.getTutorFor();
												String obHelpWith = other.getHelpWith();
												String obSchName = other.getSchName() ;
												String obSchSurname = other.getSchSurname();
												String obSchGrade = other.getSchGrade();
												String obSchSyllabus = other.getSchSyllabus();
												String obnName = other.getUnName();
												String obnSurname = other.getUnSurname();
												String obnYear = other.getUnYear();

												Long oid = other.getEntry();
					
												   if (obSchSyllabus.equalsIgnoreCase("other")) {
										%>
										<tr>
											<th>
												<%= oclientName %>
											</th>
											<th>
												<%= obEmail %>
											</th>
											<th>
												<%= obPhone %>
											</th>
											
											
											<th>
												<a href="#" class="otherView" 
												   data-toggle="modal" data-target="#otherModal"
												   data-name="<%= oclientName%>"
												   data-phone="<%= obPhone %> "
												   data-email="<%= obEmail %> "
												   data-country="<%= obCountry %> "
												   data-province="<%= obProvince %> "
												   data-language="<%= obInstrLanguage %> "
												   data-tutoringfor="<%= obTutorFor %> "
												   data-helpwith="<%= obHelpWith %> "
												   data-sname="<%= obSchName %> "
												   data-ssurname="<%= obSchSurname %> "
												   data-sgrade="<%= obSchGrade %> "
												   data-ssyllabus="<%= obSchSyllabus %> "
												   data-ssubject="<%= obSubject %> "
												   data-syear="<%= obnYear%> "
												   data-uname="<%= obnName %> "
												   data-usurname="<%= obnSurname %>"
												   data-address="<%= obAddress %>"
												   data-suburb="<%= obSuburb %>"
												   data-message="<%= obMessage %>"
												   data-status="<%= obStatus %>"
												   data-tutorname="<%= obTutorName %>"
												   data-tutoremail="<%= obTutorEmail %>"
												   data-tutoropt="<%= obTutoringOption %>"
												   data-secondopt="<%= obTutorOption %>"
												   data-package="<%= obPackageType %>"
												   data-oid = "<%= oid %>"
												   >
													<i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
												</a>
											</th>
										</tr>
					
										<% } } } else { %>
											<tr>
												<th>No Others yet..</th>
											</tr>
										<% } %>
					
									</tbody>
								</table>
							</div>
						</div>
					</div>
					

					<!--End others panel-->


					<div class="row" id="approvedBookingPanel">
						<div class="col-md-12">
							<div class="table-wrapper">
	
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
											<h2 class="ml-lg-2">Approved Bookings</h2>
										</div>
									</div>
								</div>
	
								<table class="table table-striped table-hover">
	
									<thead>
										<tr>
											<th>Name</th>
											<th>Email</th>
											<th>Online / In-person</th>
											<th>Tutor Name</th>
											<th>Tutor Email</th>
											<th>Status</th>
											<th>View</th>
										</tr>
									</thead>
	
									<tbody>
	
										<% List<Booking> bk = (List<Booking>)
												request.getAttribute("bookings");
												if (bk != null && !bk.isEmpty()) {
													
												for (Booking bks : bk) {
	
													String aName = bks.getName();
													String aSurname = bks.getSurname();
													String aEmail = bks.getEmail();
													String aTutoringOption = bks.getTutorStyle();
													String aTutorName = bks.getTutorName();
													String aTutorEmail = bks.getTutorEmail();
													String aStatus = bks.getStatus();

													String aPaid = bks.getIsPaid();
													String aPackageType = bks.getPackageType();
													String aTutorOption = bks.getTutorOption();
													String aMessage = bks.getMessage();
													String aSuburb = bks.getSuburb();
													String aAddress = bks.getAddress();
													String aSubject = bks.getSubject();
													String aPhone = bks.getPhone();
												    String aProvince = bks.getProvince();
													String aCountry = bks.getCountry();
													String aInstrLanguage = bks.getInstrLanguage();
													String aTutorFor = bks.getTutorFor();
													String aHelpWith = bks.getHelpWith();
													String aSchName = bks.getSchName() ;
													String aSchSurname = bks.getSchSurname();
													String aSchGrade = bks.getSchGrade();
													String aSchSyllabus = bks.getSchSyllabus();
													String anName = bks.getUnName();
													String anSurname = bks.getUnSurname();
													String anYear = bks.getUnYear();
													String aPackage = bks.getPackageType();
	
	
													if(aStatus.equalsIgnoreCase("approved")){
	
									
														%>
												<tr>
													<th>
														<%= aName %> <%= aSurname %>
													</th>
													<th>
														<%= aEmail %>
													</th>
													<th>
														<%= aTutoringOption %>
													</th>
													<th>
														<%= aTutorName%>
													</th>
													<th>
														<%= aTutorEmail %>
													</th>
													<th>
														<%= aStatus %>
													</th>
													<th>
											
													<a href="#" class="view" 
													data-toggle="modal" data-target="#bookingModal"
													data-name="<%= aName %> <%= aSurname %>"
													data-phone="<%= aPhone %> "
													data-email="<%= aEmail %> "
													data-country="<%= aCountry %> "
													data-province="<%= aProvince %> "
													data-language="<%= aInstrLanguage %> "
													data-tutoringfor="<%= aTutorFor %> "
													data-helpwith="<%= aHelpWith %> "
													data-sname="<%= aSchName %> "
													data-ssurname="<%= aSchSurname %> "
													data-sgrade="<%= aSchGrade %> "
													data-ssyllabus="<%= aSchSyllabus %> "
													data-ssubject="<%= aSubject %> "
													data-syear="<%= anYear%> "
													data-uname="<%= anName %> "
													data-usurname="<%= anSurname %>"
													data-address="<%= aAddress %>"
													data-suburb="<%= aSuburb %>"
													data-message="<%= aMessage %>"
													data-status="<%= aStatus %>"
													data-tutorname="<%= aTutorName %>"
													data-tutoremail="<%= aTutorEmail %>"
													data-tutoropt="<%= aTutoringOption %>"
													data-secondopt="<%= aTutorOption %>"
													data-package="<%= aPackage %>"
													>
														 <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
													 </a>
	
													</th>
												</tr>
	
												<% } } } else { %>
													<tr>
														<th>No Tutor yet..</th>
													</tr>
													<% } %>
	
									</tbody>
								</table>
							</div>
						</div>
											
					</div>	



					<!--Approved Booking Panel-->

					<!--View Booking modal-->

				<!-- Modal Structure -->
					<div id="bookingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
							<h5 class="modal-title" id="bookingModalLabel">Booking Details</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<div class="modal-body">
							<div class="row">
								<!-- Applicant Section -->
								<div class="col-md-6">
								<h5>Applicant</h5>
								<p><strong>Name:</strong> <span id="modalName"></span></p>
								<p><strong>Email:</strong> <span id="modalEmail"></span></p>
								<p><strong>Phone:</strong> <span id="modalPhone"></span></p>
								<p><strong>Country:</strong> <span id="modalCountry"></span></p>
								<p><strong>Province:</strong> <span id="modalProvince"></span></p>
								<p><strong>Language oF Instruction:</strong> <span id="modalLanguage"></span></p>
								<p><strong>Package Type:</strong> <span id="modalPackage"></span></p>
								</div>
								<!-- Student Details Section -->
								<div class="col-md-6">
								<h5>Student Details</h5>
								<p><strong>Tutoring For:</strong> <span id="modalTutoringFor"></span></p>
								<p><strong>Help with:</strong> <span id="modalHelpWith"></span></p>
								<p><strong>Student Name:</strong> <span id="modalStudName"></span></p>
								<p><strong>Student Surname:</strong> <span id="modalStudSurname"></span></p>
								<p id="schGrade"><strong>Grade:</strong> <span id="modalGrade"></span></p>
								<p id="schSyllabus"><strong>Syllabus:</strong> <span id="modalSyllabus"></span></p>
								<p><strong>Subject:</strong> <span id="modalSubject"></span></p>
								<p id="unvYear"><strong>Year:</strong> <span id="modalYear"></span></p>	
							</div>
							</div>
							<!-- Message Section -->
							<div class="row">
							<div class="col-md-6">
								<h5>Process</h5>
							    <p><strong>Booking Message:</strong> <span id="modalMessage"></span></p>
								<p><strong>Status:</strong><span id="modalStatus"></span></p>
								<p><strong>Platform:</strong><span id="modalPlatform"></span></p>
								<p id="fOne"><strong>Suburb:</strong><span id="modalSuburb"></span></p>
								<p id="fSec"><strong>Address:</strong><span id="modalAddress"></span></p>
							</div>

							<div class="col-md-6">
								<h5>Tutor</h5>
								<p><strong>Tutor Name:</strong> <span id="modalTutorName"></span></p>
								<p><strong>Tutor Email:</strong> <span id="modalTutorEmail"></span></p>
								<p><strong>Second Tutor Option?</strong> <span id="modalSecondOpt"></span></p>
							</div>
							</div>
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</div>
						</div>
					</div>
					
						

					<!--View Booking modal-->

					<!--View Reviews Modal-->

					<div id="reviewModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
							<h5 class="modal-title" id="bookingModalLabel">Review</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							
						<form action="/approve-review" method="post">
							<div class="modal-body">
							<div class="row">
								<!-- Applicant Section -->
								<div class="col-md-6">
							
								<p><strong>Name:</strong> <span id="modalNameReview"></span></p>
								<p><strong>Message:</strong> <span id="modalMessageReview"></span></p>
								<p><strong>Rating:</strong> <span id="modalRatingReview"></span></p>
								<input type="hidden" id="rEntryId" name="rEntryId"/>
								<input type="hidden" id="rTutorEmail" name="rTutorEmail"/>

							
								</div>
								
							</div>
						
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button class="btn btn-success" type="submit">Accept</button>
							</div>
					    </form>

						</div>
						</div>
					</div>

					<!--View Reviews Modal-->


					<!--CONSULTATION MODAL-->

					<div id="consultationModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
							<h5 class="modal-title" id="bookingModalLabel">Consultant Details</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<div class="modal-body">
							<div class="row">
								<!-- Applicant Section -->
								<div class="col-md-6">
								<h5>Applicant</h5>
								<p><strong>Name:</strong> <span id="cmodalName"></span></p>
								<p><strong>Email:</strong> <span id="cmodalEmail"></span></p>
								<p><strong>Phone:</strong> <span id="cmodalPhone"></span></p>
								<p><strong>Country:</strong> <span id="cmodalCountry"></span></p>
								<p><strong>Province:</strong> <span id="cmodalProvince"></span></p>
								<p><strong>Language oF Instruction:</strong> <span id="cmodalLanguage"></span></p>
								<p><strong>Package Type:</strong> <span id="cmodalPackage"></span></p>
								</div>
								<!-- Student Details Section -->
								<div class="col-md-6">
								<h5>Student Details</h5>
								<p><strong>Tutoring For:</strong> <span id="cmodalTutoringFor"></span></p>
								<p><strong>Help with:</strong> <span id="cmodalHelpWith"></span></p>
								<p><strong>Student Name:</strong> <span id="cmodalStudName"></span></p>
								<p><strong>Student Surname:</strong> <span id="cmodalStudSurname"></span></p>
								<p id="cschGrade"><strong>Grade:</strong> <span id="cmodalGrade"></span></p>
								<p id="cschSyllabus"><strong>Syllabus:</strong> <span id="cmodalSyllabus"></span></p>
								<p><strong>Subject:</strong> <span id="cmodalSubject"></span></p>
								<p id="cunvYear"><strong>Year:</strong> <span id="cmodalYear"></span></p>	
							</div>
							</div>
							<!-- Message Section -->
							<div class="row">
							<div class="col-md-6">
								<h5>Process</h5>
							    <p><strong>Booking Message:</strong> <span id="cmodalMessage"></span></p>
								<p><strong>Status:</strong><span id="cmodalStatus"></span></p>
								<p><strong>Platform:</strong><span id="cmodalPlatform"></span></p>
								<p id="cfOne"><strong>Suburb:</strong><span id="cmodalSuburb"></span></p>
								<p id="cfSec"><strong>Address:</strong><span id="cmodalAddress"></span></p>
							</div>

							<div class="col-md-6">
								<h5>Tutor</h5>
								<p><strong>Tutor Name:</strong> <span id="cmodalTutorName"></span></p>
								<p><strong>Tutor Email:</strong> <span id="cmodalTutorEmail"></span></p>
								<p><strong>Second Tutor Option?</strong> <span id="cmodalSecondOpt"></span></p>
							</div>
							</div>
							</div>
							<div class="modal-footer">
								<form action="/deleteConsult" method="post">
									<div class="modal-body">
										<p>Before you remove the consultant, make sure you have reach to.</p>
										<input type="hidden" name="deleteEmailConsult" id="deleteEmailConsult" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-danger"
											onclick="confirmDeletionConsult()">Delete</button>
									</div>
								</form>
							
							</div>
						</div>
						</div>
					</div>


					<!--CONSULTATION MODAL-->


					<!--OTHER MODAL-->


					<div id="otherModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
							<h5 class="modal-title" id="bookingModalLabel">Other Details</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<div class="modal-body">
							<div class="row">
								<!-- Applicant Section -->
								<div class="col-md-6">
								<h5>Applicant</h5>
								<p><strong>Name:</strong> <span id="omodalName"></span></p>
								<p><strong>Email:</strong> <span id="omodalEmail"></span></p>
								<p><strong>Phone:</strong> <span id="omodalPhone"></span></p>
								<p><strong>Country:</strong> <span id="omodalCountry"></span></p>
								<p><strong>Province:</strong> <span id="omodalProvince"></span></p>
								<p><strong>Language oF Instruction:</strong> <span id="omodalLanguage"></span></p>
								<p><strong>Package Type:</strong> <span id="omodalPackage"></span></p>
								</div>
								<!-- Student Details Section -->
								<div class="col-md-6">
								<h5>Student Details</h5>
								<p><strong>Tutoring For:</strong> <span id="omodalTutoringFor"></span></p>
								<p><strong>Help with:</strong> <span id="omodalHelpWith"></span></p>
								<p><strong>Student Name:</strong> <span id="omodalStudName"></span></p>
								<p><strong>Student Surname:</strong> <span id="omodalStudSurname"></span></p>
								<p id="oschGrade"><strong>Grade:</strong> <span id="omodalGrade"></span></p>
								<p id="oschSyllabus"><strong>Syllabus:</strong> <span id="omodalSyllabus"></span></p>
								<p><strong>Subject:</strong> <span id="omodalSubject"></span></p>
								<p id="ounvYear"><strong>Year:</strong> <span id="omodalYear"></span></p>	
							</div>
							</div>
							<!-- Message Section -->
							<div class="row">
							<div class="col-md-6">
								<h5>Process</h5>
							    <p><strong>Booking Message:</strong> <span id="omodalMessage"></span></p>
								<p><strong>Status:</strong><span id="omodalStatus"></span></p>
								<p><strong>Platform:</strong><span id="omodalPlatform"></span></p>
								<p id="ofOne"><strong>Suburb:</strong><span id="omodalSuburb"></span></p>
								<p id="ofSec"><strong>Address:</strong><span id="omodalAddress"></span></p>
							</div>

							<div class="col-md-6">
								<h5>Tutor</h5>
								<p><strong>Tutor Name:</strong> <span id="omodalTutorName"></span></p>
								<p><strong>Tutor Email:</strong> <span id="omodalTutorEmail"></span></p>
								<p><strong>Second Tutor Option?</strong> <span id="omodalSecondOpt"></span></p>
							</div>
							</div>
							</div>
							<div class="modal-footer">
								<form action="/deleteOther" method="post">
									<div class="modal-body">
										<p>Before you remove the applicant, make sure you have reach to.</p>
										<input type="hidden" name="deleteEmailOther" id="deleteEmailOther" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-danger"
											onclick="confirmDeletionOther()">Delete</button>
									</div>
								</form>
							</div>
						</div>
						</div>
					</div>


					<!--OTHER MODAL-->



					<!--Search Panel-->

					<div class="row" id="searchPanel">
						<div class="col-md-12">
							<div class="table-wrapper">
	
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
											<h2 class="ml-lg-2">Search Result</h2>
										</div>

									</div>
								</div>
	
								<table class="table table-striped table-hover">
									<thead>
										<tr>
									
											<th>Name</th>
											<th>Email</th>
											<th>Availability</th>
											<th>Address</th>
											<th>Phone Number</th>
											<th>Actions</th>
										</tr>
									</thead>
	
									<tbody>

									<th >
										<span id="searchName"></span>
									</th>
									<th >
										<span id="searchEmail"></span>
									</th>
									<th>
										<span id="searchAvail"></span>
									</th>
									<th >
										<span id="searchLocation"></span>
									</th>
									<th >
                                        <span id="searchPhone"></span>
									</th>
									<th>
							
									   <a href="#editEmployeeModal" class="edit" >
											<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
											</a> 

										<a href="#deleteEmployeeModal" class="delete" data-toggle="modal"
											>
											<i class="material-icons" data-toggle="tooltip"
												title="Delete">&#xE872;</i>
										</a>

									</th>

	
									</tbody>
								</table>
							</div>
						</div>
					</div>
	

					<!--Search Panel-->


					
				

				<!------main-content-end----------->

			

		</div>


		<script src="js/jquery-3.3.1.slim.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">

			$('a.delete').on('click', function () {
				// Get the email from the data attribute
				var email = $(this).data('email');

				var deleteEmail = document.getElementById('deleteEmail');
				deleteEmail.value = email;
				deleteEmail.placeholder = email;

				// Set the email in the modal
				$('#emailToDelete').text(email);
			});


			$(document).ready(function() {
			$('a.consultView').on('click', function () {
				
				            $('#cmodalStudName').hide();
							$('#cmodalStudSurname').hide();
							$('#cmodalGrade').hide();
							$('#cmodalSyllabus').hide();
							$('#cmodalSubject').hide();
							$('#cmodalYear').hide();


						// Get data from attributes
						var name = $(this).data('name');
						var email = $(this).data('email');
						var phone = $(this).data('phone');
						var country = $(this).data('country');
						var province = $(this).data('province');
						var language = $(this).data('language');
						var tutoringFor = $(this).data('tutoringfor');
						var helpWith = $(this).data('helpwith');
						var sName = $(this).data('sname');
						var sSurname = $(this).data('ssurname');
						var uName = $(this).data('uname');
						var uSurname = $(this).data('usurname');
						var sGrade = $(this).data('sgrade');
						var sSyllabus = $(this).data('ssyllabus');
						var sSubject = $(this).data('ssubject');
						var sYear = $(this).data('syear');
						var tutorOpt = $(this).data('tutoropt');
						var address = $(this).data('address');
						var suburb = $(this).data('suburb');
						var message = $(this).data('message');
						var status = $(this).data('status');
						var tutorName = $(this).data('tutorname');
						var tutorEmail = $(this).data('tutoremail');
						var secondOpt = $(this).data('secondopt');
						var package = $(this).data('package');
						var cIs = $(this).data('sid');

						var deleteEmailConsult = document.getElementById('deleteEmailConsult');
				        deleteEmailConsult.value = cIs;
				        deleteEmailConsult.placeholder = cIs;
						

		 				// Populate modal with the data
						$('#cmodalName').text(name);
						$('#cmodalEmail').text(email);
						$('#cmodalPhone').text(phone);
						$('#cmodalCountry').text(country);
						$('#cmodalProvince').text(province);
						$('#cmodalLanguage').text(language);
						$('#cmodalTutoringFor').text(tutoringFor);
						$('#cmodalHelpWith').text(helpWith);

						helpWith = helpWith.replace(/\s+/g, '');
						tutorOpt = tutorOpt.replace(/\s+/g, '');

						if (helpWith === "school") {
								// Set values for the modal fields and show them
								$('#cmodalStudName').text(sName).show();
								$('#cmodalStudSurname').text(sSurname).show();
								$('#cmodalGrade').text(sGrade).show();
								$('#cmodalSyllabus').text(sSyllabus).show();
								$('#cmodalSubject').text(sSubject).show();
								schGrade.style.display = 'block';
                                schSyllabus.style.display = 'block';
								
							} else {
								// Set values for the modal fields and show them
								
								$('#cmodalStudName').text(uName).show();
								$('#cmodalStudSurname').text(uSurname).show();
								$('#cmodalYear').text(sYear).show();
								$('#cmodalSubject').text(sSubject).show();
								
                            }

						$('#cmodalPlatform').text(tutorOpt);
						$('#cmodalAddress').text(address);
						$('#cmodalSuburb').text(suburb);

						if(tutorOpt === "Online"){

                             var addrSub = document.getElementById('cfOne');
		                       addrSub.style.display = 'none';
							var subAdrr = document.getElementById('cfSec');
							  subAdrr.style.display = 'none';
						}

						else{

							var addrSub = document.getElementById('cfOne');
		                       addrSub.style.display = 'block';
							var subAdrr = document.getElementById('cfSec');
							  subAdrr.style.display = 'block';
						}

						$('#cmodalMessage').text(message);
						$('#cmodalStatus').text(status );
						$('#cmodalTutorName').text(tutorName );
						$('#cmodalTutorEmail').text(tutorEmail );
						$('#cmodalSecondOpt').text(secondOpt);
						$('#cmodalPackage').text(package);		
		                

			});
		});



		$(document).ready(function() {

			$('a.otherView').on('click', function () {
				
				            $('#omodalStudName').hide();
							$('#omodalStudSurname').hide();
							$('#omodalGrade').hide();
							$('#omodalSyllabus').hide();
							$('#omodalSubject').hide();
							$('#omodalYear').hide();


						// Get data from attributes
						var name = $(this).data('name');
						var email = $(this).data('email');
						var phone = $(this).data('phone');
						var country = $(this).data('country');
						var province = $(this).data('province');
						var language = $(this).data('language');
						var tutoringFor = $(this).data('tutoringfor');
						var helpWith = $(this).data('helpwith');
						var sName = $(this).data('sname');
						var sSurname = $(this).data('ssurname');
						var uName = $(this).data('uname');
						var uSurname = $(this).data('usurname');
						var sGrade = $(this).data('sgrade');
						var sSyllabus = $(this).data('ssyllabus');
						var sSubject = $(this).data('ssubject');
						var sYear = $(this).data('syear');
						var tutorOpt = $(this).data('tutoropt');
						var address = $(this).data('address');
						var suburb = $(this).data('suburb');
						var message = $(this).data('message');
						var status = $(this).data('status');
						var tutorName = $(this).data('tutorname');
						var tutorEmail = $(this).data('tutoremail');
						var secondOpt = $(this).data('secondopt');
						var package = $(this).data('package');

						var cIs = $(this).data('oid');

						var deleteEmailOther = document.getElementById('deleteEmailOther');
						deleteEmailOther.value = cIs;
						deleteEmailOther.placeholder = cIs;
						

		 				// Populate modal with the data
						$('#omodalName').text(name);
						$('#omodalEmail').text(email);
						$('#omodalPhone').text(phone);
						$('#omodalCountry').text(country);
						$('#omodalProvince').text(province);
						$('#omodalLanguage').text(language);
						$('#omodalTutoringFor').text(tutoringFor);
						$('#omodalHelpWith').text(helpWith);

						helpWith = helpWith.replace(/\s+/g, '');
						tutorOpt = tutorOpt.replace(/\s+/g, '');

						if (helpWith === "school") {
								// Set values for the modal fields and show them
								$('#omodalStudName').text(sName).show();
								$('#omodalStudSurname').text(sSurname).show();
								$('#omodalGrade').text(sGrade).show();
								$('#omodalSyllabus').text(sSyllabus).show();
								$('#omodalSubject').text(sSubject).show();
								schGrade.style.display = 'block';
                                schSyllabus.style.display = 'block';
								
							} else {
								// Set values for the modal fields and show them
								
								$('#omodalStudName').text(uName).show();
								$('#omodalStudSurname').text(uSurname).show();
								$('#omodalYear').text(sYear).show();
								$('#omodalSubject').text(sSubject).show();
								
                            }

						$('#omodalPlatform').text(tutorOpt);
						$('#omodalAddress').text(address);
						$('#omodalSuburb').text(suburb);

						if(tutorOpt === "Online"){

                             var addrSub = document.getElementById('ofOne');
		                       addrSub.style.display = 'none';
							var subAdrr = document.getElementById('ofSec');
							  subAdrr.style.display = 'none';
						}

						else{

							var addrSub = document.getElementById('ofOne');
		                       addrSub.style.display = 'block';
							var subAdrr = document.getElementById('ofSec');
							  subAdrr.style.display = 'block';
						}

						$('#omodalMessage').text(message);
						$('#omodalStatus').text(status );
						$('#omodalTutorName').text(tutorName );
						$('#omodalTutorEmail').text(tutorEmail );
						$('#omodalSecondOpt').text(secondOpt);
						$('#omodalPackage').text(package);	
				

			});

		});


			document.getElementById('bookingPanel').style.display = 'none';
			document.getElementById('searchPanel').style.display = 'none';
			document.getElementById('approvedBookingPanel').style.display = 'none';
			document.getElementById('reviewsPanel').style.display = 'none';
			document.getElementById('consultantsPanel').style.display = 'none';
			document.getElementById('othersPanel').style.display = 'none';

			$(document).ready(function () {
				$(".xp-menubar").on('click', function () {
					$("#sidebar").toggleClass('active');
					$("#content").toggleClass('active');
				});

				$('.xp-menubar,.body-overlay').on('click', function () {
					$("#sidebar,.body-overlay").toggleClass('show-nav');
				});

			});

			var schGrade = document.getElementById('schGrade');
			schGrade.style.display = 'none';
            var schSyllabus = document.getElementById('schSyllabus');
			schSyllabus.style.display = 'none';
            var unvYear = document.getElementById('unvYear');
			unvYear.style.display = 'none';

				/*View Booking Details*/
				$(document).ready(function() {
					// Event listener for the "View" icon
					$('.view').on('click', function() {

						    $('#modalStudName').hide();
							$('#modalStudSurname').hide();
							$('#modalGrade').hide();
							$('#modalSyllabus').hide();
							$('#modalSubject').hide();
							$('#modalYear').hide();


						// Get data from attributes
						var name = $(this).data('name');
						var email = $(this).data('email');
						var phone = $(this).data('phone');
						var country = $(this).data('country');
						var province = $(this).data('province');
						var language = $(this).data('language');
						var tutoringFor = $(this).data('tutoringfor');
						var helpWith = $(this).data('helpwith');
						var sName = $(this).data('sname');
						var sSurname = $(this).data('ssurname');
						var uName = $(this).data('uname');
						var uSurname = $(this).data('usurname');
						var sGrade = $(this).data('sgrade');
						var sSyllabus = $(this).data('ssyllabus');
						var sSubject = $(this).data('ssubject');
						var sYear = $(this).data('syear');
						var tutorOpt = $(this).data('tutoropt');
						var address = $(this).data('address');
						var suburb = $(this).data('suburb');
						var message = $(this).data('message');
						var status = $(this).data('status');
						var tutorName = $(this).data('tutorname');
						var tutorEmail = $(this).data('tutoremail');
						var secondOpt = $(this).data('secondopt');
						var package = $(this).data('package');
						

		 				// Populate modal with the data
						$('#modalName').text(name);
						$('#modalEmail').text(email);
						$('#modalPhone').text(phone);
						$('#modalCountry').text(country);
						$('#modalProvince').text(province);
						$('#modalLanguage').text(language);
						$('#modalTutoringFor').text(tutoringFor);
						$('#modalHelpWith').text(helpWith);

						helpWith = helpWith.replace(/\s+/g, '');
						tutorOpt = tutorOpt.replace(/\s+/g, '');

						if (helpWith === "school") {
								// Set values for the modal fields and show them
								$('#modalStudName').text(sName).show();
								$('#modalStudSurname').text(sSurname).show();
								$('#modalGrade').text(sGrade).show();
								$('#modalSyllabus').text(sSyllabus).show();
								$('#modalSubject').text(sSubject).show();
								schGrade.style.display = 'block';
                                schSyllabus.style.display = 'block';
								
							} else {
								// Set values for the modal fields and show them
								
								$('#modalStudName').text(uName).show();
								$('#modalStudSurname').text(uSurname).show();
								$('#modalYear').text(sYear).show();
								$('#modalSubject').text(sSubject).show();
								
                            }

						$('#modalPlatform').text(tutorOpt);
						$('#modalAddress').text(address);
						$('#modalSuburb').text(suburb);

						if(tutorOpt === "Online"){

                             var addrSub = document.getElementById('fOne');
		                       addrSub.style.display = 'none';
							var subAdrr = document.getElementById('fSec');
							  subAdrr.style.display = 'none';
						}

						else{

							var addrSub = document.getElementById('fOne');
		                       addrSub.style.display = 'block';
							var subAdrr = document.getElementById('fSec');
							  subAdrr.style.display = 'block';
						}

						$('#modalMessage').text(message);
						$('#modalStatus').text(status );
						$('#modalTutorName').text(tutorName );
						$('#modalTutorEmail').text(tutorEmail );
						$('#modalSecondOpt').text(secondOpt);
						$('#modalPackage').text(package);
								
					});
				});

		    function setActive(id) {
				// Remove 'active' class from all list items
				document.querySelectorAll('#sidebar ul li').forEach(function(item) {
					item.classList.remove('active');
				});

				// Add 'active' class to the selected list item
				document.getElementById(id).classList.add('active');
			}



			function showTutorPanel() {

				setActive('tutors');
				document.getElementById('bookingPanel').style.display = 'none';
				document.getElementById('reviewsPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'block';
				document.getElementById('searchPanel').style.display = 'none';
				document.getElementById('searchEemail').style.display = 'block';
				document.getElementById('button-addon2').style.display = 'block';
				document.getElementById('approvedBookingPanel').style.display = 'none';
				document.getElementById('consultantsPanel').style.display = 'none';
				document.getElementById('othersPanel').style.display = 'none';
			}


			function showBookingsPanel() {

				setActive('bookings');
				document.getElementById('searchEemail').style.display = 'none';
				document.getElementById('button-addon2').style.display = 'none';
				document.getElementById('searchPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'none';
				document.getElementById('bookingPanel').style.display = 'block';
				document.getElementById('reviewsPanel').style.display = 'none';
				document.getElementById('approvedBookingPanel').style.display = 'none';
				document.getElementById('consultantsPanel').style.display = 'none';
				document.getElementById('othersPanel').style.display = 'none';

			}

			function showApprovedPanel(){

				setActive('blogs');
				document.getElementById('searchEemail').style.display = 'none';
				document.getElementById('button-addon2').style.display = 'none';
				document.getElementById('searchPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'none';
				document.getElementById('bookingPanel').style.display = 'none';
				document.getElementById('reviewsPanel').style.display = 'none';
				document.getElementById('approvedBookingPanel').style.display = 'block';
				document.getElementById('consultantsPanel').style.display = 'none';
				document.getElementById('othersPanel').style.display = 'none';
			}

			function showReviewsPanel(){

				setActive('reviews');
				document.getElementById('searchEemail').style.display = 'none';
				document.getElementById('button-addon2').style.display = 'none';
				document.getElementById('searchPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'none';
				document.getElementById('bookingPanel').style.display = 'none';
				document.getElementById('approvedBookingPanel').style.display = 'none';
				document.getElementById('reviewsPanel').style.display = 'block';
				document.getElementById('consultantsPanel').style.display = 'none';
				document.getElementById('othersPanel').style.display = 'none';
			}


			function showConsultantsPanel(){

			setActive('consultants');
			document.getElementById('searchEemail').style.display = 'none';
			document.getElementById('button-addon2').style.display = 'none';
			document.getElementById('searchPanel').style.display = 'none';
			document.getElementById('tutorPanel').style.display = 'none';
			document.getElementById('bookingPanel').style.display = 'none';
			document.getElementById('approvedBookingPanel').style.display = 'none';
			document.getElementById('reviewsPanel').style.display = 'none';
			document.getElementById('consultantsPanel').style.display = 'block';
			document.getElementById('othersPanel').style.display = 'none';
			}


			function showOthersPanel(){

			setActive('others');
			document.getElementById('searchEemail').style.display = 'none';
			document.getElementById('button-addon2').style.display = 'none';
			document.getElementById('searchPanel').style.display = 'none';
			document.getElementById('tutorPanel').style.display = 'none';
			document.getElementById('bookingPanel').style.display = 'none';
			document.getElementById('approvedBookingPanel').style.display = 'none';
			document.getElementById('reviewsPanel').style.display = 'none';
			document.getElementById('consultantsPanel').style.display = 'none';
			document.getElementById('othersPanel').style.display = 'block';
			}


			document.getElementById("form3").style.display = "none";

			// Function to display Form 2
			function displayForm2() {
				document.getElementById("form1").style.display = "none";
				document.getElementById("form2").style.display = "block";
				document.getElementById("form3").style.display = "none";


			}

			// Function to display Form 1
			function displayForm1() {
				document.getElementById("form2").style.display = "none";
				document.getElementById("form3").style.display = "none";
				document.getElementById("form1").style.display = "block";

			}

			function displayForm3() {
				document.getElementById("form2").style.display = "none";
				document.getElementById("form1").style.display = "none";
				document.getElementById("form3").style.display = "block";
			}

			// Function to redirect to home page
			function redirectToHome() {

				window.location.href = "/";

			}

			function validateForm1() {

				// Check if name, phone, and email are filled
				var name = document.getElementById("name").value;
				var phone = document.getElementById("phone").value;
				var email = document.getElementById("email").value;
				var background = document.getElementById("background").value;
				var address = document.getElementById("address").value;
				var country = document.getElementById("country").value;
				var id = document.getElementById("idnumber").value;
				var lsurname = document.getElementById("lsurname").value;
				
				//Get error message divs
				var nameError = document.getElementById("nameError");
				var phoneError = document.getElementById("phoneError");
				var emailError = document.getElementById("emailError");
				var addressError = document.getElementById("addressError");
				var backError = document.getElementById("backError");
				var countryError = document.getElementById("countryError");
				var idError = document.getElementById("idError");
				
				// Clear previous error messages
				nameError.innerText = "";
				phoneError.innerText = "";
				emailError.innerText = "";
				addressError.innerText = "";
				backError.innerText = "";
				countryError.innerText = "";
				idError.innerText = "";


				if (name === "") {
					nameError.innerText = "Full Name is required.";
					nameError.style.color = "red"; // Set text color to red
				}

				if (phone === "") {
					phoneError.innerText = "Phone Number is required.";
					phoneError.style.color = "red"; // Set text color to red
				}

				if (email === "") {
					emailError.innerText = "Email is required.";
					emailError.style.color = "red"; // Set text color to red
				}


				if (background === "No") {
					backError.innerText = "Tutors background must be checked first.";
					backError.style.color = "red"; // Set text color to red
				}

				if (address === "") {
					addressError.innerText = "Province Required";
					addressError.style.color = "red"; // Set text color to red
				}

				if (country === "") {
					countryError.innerText = "Country is required.";
					countryError.style.color = "red"; // Set text color to red
				}

				if (id === "") {
					idError.innerText = "DOB number is required.";
					idError.style.color = "red"; // Set text color to red
				}

				if (lsurname === "") {
					lSurnameError.innerText = "Surname is required.";
					lSurnameError.style.color = "red"; // Set text color to red
				}

				// If any field is empty, return without proceeding
				if (name === "" || phone === "" || email === "" || background == "No" || address === ""  || country === "" || id === "" || lsurname === "") {
					return;
				}


				displayForm2();

			}

			function validateForm2() {

				var name = document.getElementById("name").value;
				var phone = document.getElementById("phone").value;
				var email = document.getElementById("email").value;
				var background = document.getElementById("background").value;
				var address = document.getElementById("address").value;
				var country = document.getElementById("country").value;
				var id = document.getElementById("idnumber").value;
				var lsurname = document.getElementById("lsurname").value;
				var modules = document.getElementById("unSubjects").value;

				var subject = document.getElementById("subjects").value;
				var grades = document.getElementById("grades").value;
				var syllabus = document.getElementById("syllabus").value;
				var tutor = document.getElementById("tutorOptions").value;
				var area = document.getElementById("area").value;


				var subjectError = document.getElementById("subjectError");
				var gradesError = document.getElementById("gradesError");
				var syllabusError = document.getElementById("syllabusError");
				var areaError = document.getElementById("areaError");
				


				subjectError.innerText = "";
				gradesError.innerText = "";
				syllabusError.innerText = "";
				areaError.innerText = "";


				if (subject === "") {
					subjectError.innerText = "Subjects cannot be null";
					subjectError.style.color = "red"; // Set text color to red
				}

				if (grades === "") {
					gradesError.innerText = "Grades cannot be null";
					gradesError.style.color = "red"; // Set text color to red
				}

				if (syllabus === "") {
					syllabusError.innerText = "Syllabus cannot be null";
					syllabusError.style.color = "red"; // Set text color to red
				}

				if (area === "") {
					areaError.innerText = "Area cannot be null";
					areaError.style.color = "red"; // Set text color to red
				}

				if (subject === "" || grades === "" || syllabus === "" || area === "") {
					return;
				}

				subjectError.innerText = "";
				gradesError.innerText = "";
				syllabusError.innerText = "";
				areaError.innerText = "";

				var hiddenName = document.getElementById('hiddenName');
				hiddenName.value = name;

				var hiddenEmail = document.getElementById('hiddenEmail');
				hiddenEmail.value = email;

				var hiddenID = document.getElementById('hiddenIdentity');
				hiddenID.value = id;

				var hiddenPhone = document.getElementById('hiddenPhone');
				hiddenPhone.value = phone;

				var hiddenModules = document.getElementById('hiddenModules');
				hiddenModules.value = modules;

				var hiddenCountry = document.getElementById('hiddenCountry');
				hiddenCountry.value = country;

				var hiddenBack = document.getElementById('hiddenID');
				hiddenBack.value = background;

				var hiddenSubjects = document.getElementById('hiddenSubjects');
				hiddenSubjects.value = subject;

				var hiddenSurname = document.getElementById('hiddenSurname');
				hiddenSurname.value = lsurname;
				

				var hiddenGrades = document.getElementById('hiddenGrades');
				hiddenGrades.value = grades;

				var hiddenSyllabus = document.getElementById('hiddenSyllabus');
				hiddenSyllabus.value = syllabus;

				var tutorOption = document.getElementById('tutorOption');
				tutorOption.value = tutor;


				var addressTutor = document.getElementById('hiddenAddress');
				addressTutor.value = address;

				var areaTutor = document.getElementById('hiddenArea');
				areaTutor.value = area;

				displayForm3();

			}

			document.getElementById('form3').addEventListener('submit', async function (event) {
				event.preventDefault(); // Prevent default form submission

				const form = event.target;
				const formData = new FormData(form);

				try {
					const response = await fetch('/addTutor', {
						method: 'POST',
						body: formData
					});



					if (response.ok) {
						const result = await response.text(); // Read response as text
						console.log('Upload successful:', result);
						alert("Tutor Successfully Registered.");

						window.location.href = '/admin';
					} else {
						console.error('Upload failed:', response.statusText);
					}
				} catch (error) {
					console.error('Error during upload:', error);
				}
			});

			/*TO HERE*/

			function confirmDeletion() {

				alert("Tutor Deleted");
			}

			function confirmDeletionConsult(){

				alert("Consultant deleted.");
			}

			function confirmDeletionOther(){

				alert("Applicant deleted.");
				}


            /*START HERE*/

			document.getElementById("editform3").style.display = "none";
			document.getElementById("editform2").style.display = "none";

// Function to display Form 2
				function editdisplayForm2() {
					document.getElementById("editform1").style.display = "none";
					document.getElementById("editform2").style.display = "block";
					document.getElementById("editform3").style.display = "none";


				}

				// Function to display Form 1
				function editdisplayForm1() {
					document.getElementById("editform2").style.display = "none";
					document.getElementById("editform3").style.display = "none";
					document.getElementById("editform1").style.display = "block";

				}

				function editdisplayForm3() {
					document.getElementById("editform2").style.display = "none";
					document.getElementById("editform1").style.display = "none";
					document.getElementById("editform3").style.display = "block";
				}

				// Function to redirect to home page
				function editredirectToHome() {

					window.location.href = "/";

				}

				function editvalidateForm1() {

					// Check if name, phone, and email are filled
					var name = document.getElementById("editname").value;
					var surname= document.getElementById("editsurname").value;
					var phone = document.getElementById("editphone").value;
					var email = document.getElementById("editemail").value;
					var address = document.getElementById("editaddress").value;
					var country = document.getElementById("editcountry").value;
					
				
					//Get error message divs
					var nameError = document.getElementById("editnameError");
					var surnameError = document.getElementById("editsurnameError");
					var phoneError = document.getElementById("editphoneError");
					var emailError = document.getElementById("editemailError");
					var addressError = document.getElementById("editaddressError");
					var editcountryError = document.getElementById("editcountryError");
			
					// Clear previous error messages
					nameError.innerText = "";
					phoneError.innerText = "";
					emailError.innerText = "";
					addressError.innerText = "";
					editcountryError.innerText = "";
				
					if (name === "") {
						editnameError.innerText = "Full Name is required.";
						editnameError.style.color = "red"; // Set text color to red
					}

					if (phone === "") {
						editphoneError.innerText = "Phone Number is required.";
						editphoneError.style.color = "red"; // Set text color to red
					}

					if (email === "") {
						editemailError.innerText = "Email is required.";
						editemailError.style.color = "red"; // Set text color to red
					}

					if (address === "") {
						editaddressError.innerText = "Address Required";
						editaddressError.style.color = "red"; // Set text color to red
					}

					if (country === "") {
						editcountryError.innerText = "Country is Required";
						editcountryError.style.color = "red"; // Set text color to red
					}

					// If any field is empty, return without proceeding
					if (name === "" || phone === "" || email === "" || address === "" || country === "") {
						return;
					}


					editdisplayForm2();

				}

				function editvalidateForm2() {

					var name = document.getElementById("editname").value;
					var phone = document.getElementById("editphone").value;
					var email = document.getElementById("editemail").value;
					var country = document.getElementById("editcountry").value;
					
					var address = document.getElementById("editaddress").value;
					var area = document.getElementById("editarea").value;

					var subject = document.getElementById("editsubjects").value;
					var grades = document.getElementById("editgrades").value;
					var syllabus = document.getElementById("editsyllabus").value;
					var tutor = document.getElementById("edittutorOptions").value;


					var subjectError = document.getElementById("editsubjectError");
					var gradesError = document.getElementById("editgradesError");
					var syllabusError = document.getElementById("editsyllabusError");


					subjectError.innerText = "";
					gradesError.innerText = "";
					syllabusError.innerText = "";


					if (subject === "") {
						editsubjectError.innerText = "Subjects cannot be null";
						editsubjectError.style.color = "red"; // Set text color to red
					}

					if (grades === "") {
						editgradesError.innerText = "Grades cannot be null";
						editgradesError.style.color = "red"; // Set text color to red
					}

					if (syllabus === "") {
						editsyllabusError.innerText = "Syllabus cannot be null";
						editsyllabusError.style.color = "red"; // Set text color to red
					}

					if (subject === "" || grades === "" || syllabus === "") {
						return;
					}

					editsubjectError.innerText = "";
					editgradesError.innerText = "";
					editsyllabusError.innerText = "";

					var hiddenName = document.getElementById('edithiddenName');
					hiddenName.value = name;

					var hiddenEmail = document.getElementById('edithiddenEmail');
					hiddenEmail.value = email;

					var hiddenPhone = document.getElementById('edithiddenPhone');
					hiddenPhone.value = phone;

					var hiddenSubjects = document.getElementById('edithiddenSubjects');
					hiddenSubjects.value = subject;

					var hiddenGrades = document.getElementById('edithiddenGrades');
					hiddenGrades.value = grades;

					var hiddenSyllabus = document.getElementById('edithiddenSyllabus');
					hiddenSyllabus.value = syllabus;

					var tutorOption = document.getElementById('edittutorOption');
					tutorOption.value = tutor;


					var addressTutor = document.getElementById('edithiddenAddress');
					addressTutor.value = address;

					var areaTutor = document.getElementById('edithiddenArea');
					areaTutor.value = area;

					var countryTutor = document.getElementById('edithiddenCountry');
					countryTutor.value = country;

					editdisplayForm3();

				}

				document.getElementById('editform3').addEventListener('submit', async function (event) {
					event.preventDefault(); // Prevent default form submission

					alert("Update in progress");

					const form = event.target;
					const formData = new FormData(form);

					try {
						const response = await fetch('/editTutor', {
							method: 'POST',
							body: formData
						});



						if (response.ok) {
							const result = await response.text(); // Read response as text
							console.log('Upload successful:', result);
							alert("Tutor Successfully Updated.");

							window.location.href = '/admin';

						} else {
							console.error('Upload failed:', response.statusText);
						}
					} catch (error) {
						console.error('Error during upload:', error);
					}
				});

			/*END HERE*/


			/*EDIT STARTS HERE*/

			$('a.edit').on('click', function () {
				// Get the email from the data attribute
				var email = $(this).data('email');
				var name = $(this).data('name'); 
				var phone = $(this).data('phone');
				var availability= $(this).data('availability');
				var subjects = $(this).data('subjects');
				var grades = $(this).data('grades'); 
				var address = $(this).data('address');
		    	var bio = $(this).data('bio');
				var about = $(this).data('about');
				var hours = $(this).data('hours');
				var image = $(this).data('image');
				var syllabus = $(this).data('syllabus');
				var area = $(this).data('area');
				var country = $(this).data('country');

				var editCountry = document.getElementById('editcountry');
				editCountry.value = country;
				editCountry.placeholder = email;

				var editEmail = document.getElementById('editemail');
				editEmail.value = email;
				editEmail.placeholder = country;

				var editName = document.getElementById('editname');
				editName.value = name;
				editName.placeholder = name;

				var editPhone = document.getElementById('editphone');
				editPhone.value = phone;
				editPhone.placeholder = phone;

				var editAddress = document.getElementById('editaddress');
				editAddress.value = address;
				editAddress.placeholder = address; 

				
				var editArea = document.getElementById('editarea');
				editArea.value = area;
				editArea.placeholder = area; 

				/*Next Button*/

				var editOpt = document.getElementById('edittutorOptions');
				editOpt.value = availability;
				editOpt.placeholder = availability; 

				var editGrades = document.getElementById('editgrades');
				editGrades.value = grades;
				editGrades.placeholder = grades; 

				var editSub= document.getElementById('editsubjects');
				editSub.value = subjects;
				editSub.placeholder = subjects; 

				var editSy = document.getElementById('editsyllabus');
				editSy.value = syllabus;
				editSy.placeholder = syllabus; 

				/*Save Button*/

				var editBio= document.getElementById('editbio');
				editBio.value = bio;
				editBio.placeholder = bio; 

				var editAbout = document.getElementById('editabout');
				editAbout.value = about;
				editAbout.placeholder = about; 

				var editHours = document.getElementById('edithours');
				editHours.value = hours;
				editHours.placeholder = hours; 

				var editImage = document.getElementById('editprofile');
				editImage.value = image;
				editImage.placeholder = image; 

				alert(image);
				
			}); 

            function searchTutor(){

				// Get the email from the input field
				var email = document.getElementById('searchEemail').value;

				// Prepare the request options
				var requestOptions = {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify({ searchEmail: email }) // Include studentId in the request body
				};

				// Send the fetch request
				fetch('/searchTutor', requestOptions)
					.then(response => response.json())
					.then(tutor => {
						// Check if the tutor is not empty
						if (tutor && tutor.email === email) {
							alert("Tutor found");
							document.getElementById('searchEemail').value = "";
							document.getElementById('tutorPanel').style.display = 'none';

                            /*Initialise Values*/
							document.getElementById('searchName').textContent = tutor.fullNames;
							document.getElementById('searchEmail').textContent = tutor.email;
							document.getElementById('searchAvail').textContent = tutor.availability;
							document.getElementById('searchLocation').textContent = tutor.address;
							document.getElementById('searchPhone').textContent = tutor.phoneNumber;

							document.getElementById('searchPanel').style.display = 'block';

						} else {
							alert("Not Found"); // Display error if not found
							document.getElementById('searchEemail').value = "";
						}
					})
					.catch(error => {
						console.error('Error:', error); // Handle any errors
					});
											

				}

				$(document).ready(function() {
					// Event listener for the "View" icon
					$('.review').on('click', function() {
						// Get data from attributes
						var name = $(this).data('name');
						var message = $(this).data('message');
						var rating = $(this).data('rating');
						var tutor = $(this).data('tutor');
						var email = $(this).data('email');
						
		
						// Populate modal with the data
						$('#modalNameReview').text(name);
						$('#modalMessageReview').text(message);
						$('#modalRatingReview').text(rating);


						document.getElementById("rEntryId").value = tutor;
						document.getElementById("rTutorEmail").value = email;
							
					});
				});

				function toggleCheckboxes() {
						const container = document.getElementById('gradesContainer');
						container.style.display = container.style.display === 'none' ? 'block' : 'none';
					}

					function updateGrades() {
						const checkboxes = document.querySelectorAll('#gradesContainer input[type="checkbox"]');
						const selectedGrades = [];
						
						checkboxes.forEach((checkbox) => {
							if (checkbox.checked) {
								selectedGrades.push(checkbox.value);
							}
						});
						
						document.getElementById('grades').value = selectedGrades.join(', ');
					}

					function toggleSyllabusOptions() {
						const container = document.getElementById('syllabusContainer');
						container.style.display = container.style.display === 'none' ? 'block' : 'none';
					}

					function updateSyllabus() {
						const checkboxes = document.querySelectorAll('#syllabusContainer input[type="checkbox"]');
						const selectedSyllabi = [];
						
						checkboxes.forEach((checkbox) => {
							if (checkbox.checked) {
								selectedSyllabi.push(checkbox.value);
							}
						});
						
						document.getElementById('syllabus').value = selectedSyllabi.join(', ');
					}

		function toggleSubjectOptions() {
				const container = document.getElementById('subjectContainer');
				container.style.display = container.style.display === 'none' ? 'block' : 'none';
			}

			function updateSubjects() {
				const checkboxes = document.querySelectorAll('#subjectContainer input[type="checkbox"]');
				const selectedSubjects = [];
				
				checkboxes.forEach((checkbox) => {
					if (checkbox.checked) {
						selectedSubjects.push(checkbox.value);
					}
				});
				
				document.getElementById('subjects').value = selectedSubjects.join(', ');
			}

			const checkbox = document.getElementById('universityCheckbox');
				const modulesDiv = document.getElementById('modulesDiv');

				checkbox.addEventListener('change', function() {
					if (this.checked) {
						modulesDiv.style.display = 'block';
					} else {
						modulesDiv.style.display = 'none';
					}
				});

				function preventBackNavigation() {
            // Push a new state to the history
            window.history.pushState(null, null, window.location.href);
            // Listen for the popstate event
            window.onpopstate = function() {
                // Redirect to a specific page when the back button is pressed
                window.location.href = '/adminpanel'; // Change this to your desired page
            };
        }





</script>
</body>

</html>