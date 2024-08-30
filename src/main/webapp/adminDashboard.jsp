<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Booking" %>
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
	<link rel="stylesheet" href="css/non.css">


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
				<li class="active">
					<a href="#" class="dashboard" onclick="showTutorPanel()"><i
							class="material-icons">dashboard</i>Tutors </a>

				</li>

				<li class="">
					<a href="#" class="" onclick="showBookingsPanel()"><i
							class="material-icons">library_books</i>Bookings </a>
				</li>

				<li class="">
					<a href="#" class="" onclick="showBlogsPanel()"><i class="material-icons">aspect_ratio</i>Blogs </a>
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

												<li><a href="#">
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
										<h2 class="ml-lg-2">Manage Tutors</h2>
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
											int hours = tutor.getHoursTutored();
                                            byte[] image = tutor.getImage();
                                            String syllabus = tutor.getSyllabus();

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
														data-about="<%= about %>" data-hours="<%= hours %>" data-image="<%= image %>" data-syllabus="<%= syllabus %>">
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
										<div class="mb-3">
											<label for="name">Full Names</label>
											<input type="text" id="name" name="name" class="form-control" required>
											<div id="nameError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="phone">Phone Number</label>
											<input type="text" id="phone" name="phone" class="form-control" required>
											<div id="phoneError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="email">Email Address</label>
											<input type="email" id="email" name="email" class="form-control"
												placeholder="Email" required>
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
											<label for="address">Address</label>
											<input type="text" id="address" name="address" class="form-control"
												required>
											<div id="addressError" class="error-message"></div>
										</div>

										<input type="button" value="Next" class="btn btn-primary"
											onclick="validateForm1()">
									</form>

									<!-- Form 2 -->
									<form id="form2" class="p-4 border rounded">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label for="subject">Subjects(Separate in Comma)</label>
											<input type="text" id="subjects" name="subjects" class="form-control"
												required>
											<div id="subjectError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="grades">Grades(Separate in Comma)</label>
											<input type="text" id="grades" name="grades" class="form-control" required>
											<div id="gradesError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="syllabus">Syllabus(Separate in
												Comma)</label>
											<input type="text" id="syllabus" name="syllabus" class="form-control"
												required>
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
											<textarea id="about" name="about" rows="4" cols="30"
												 maxlength="210"required>
								             </textarea>
										</div>
										<div class="mb-3">
											<label for="bio">Qualification(Separate in Comma)</label>
											<textarea id="bio" name="bio" rows="4" cols="30"required>
								</textarea>
										</div>

										<div class="mb-3">
											<label for="hours">Hours Tutored</label>
											<input type="number" id="hours" name="hours" class="form-control" value="0"
												required>
										</div>

										<div class="mb-3">
											<label for="profile">Profile Picture</label>
											<input type="file" id="profile" name="profile" class="form-control">
										</div>

										<div class="mb-3">
											<input type="hidden" id="hiddenName" name="hiddenName" class="form-control">
											<input type="hidden" id="hiddenID" name="hiddenID" class="form-control">
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
											<label for="name">Full Names</label>
											<input type="text" id="editname" name="editname" class="form-control" required>
											<div id="editnameError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="phone">Phone Number</label>
											<input type="text" id="editphone" name="editphone" class="form-control" required>
											<div id="editphoneError" class="error-message"></div>
										</div>
										<div class="mb-3">
											<label for="email">Email Address</label>
											<input type="editemail" id="editemail" name="editemail" class="form-control"
												placeholder="Email" required readonly>
											<div id="editemailError" class="error-message"></div>
										</div>

										<div class="mb-3">
											<label for="address">Address</label>
											<input type="text" id="editaddress" name="editaddress" class="form-control"
												required>
											<div id="editaddressError" class="error-message"></div>
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

										<input type="button" value="Previous" class="btn btn-secondary"
											onclick="editdisplayForm1()">
										<button type="button" class="btn btn-secondary"
											onclick="editvalidateForm2()">Next</button>

									</form>

									<!-- Form 3 -->
									<form id="editform3" class="p-4 border rounded" enctype="multipart/form-data">
										<h1 class="mb-4"></h1>
										<div class="mb-3">
											<label for="about">About Tutor</label>
											<textarea id="editabout" name="editabout" rows="4" cols="30"
												placeholder="Brief description of the tutor." required>
								</textarea>
										</div>
										<div class="mb-3">
											<label for="bio">Qualification(Separate in Comma)</label>
											<textarea id="editbio" name="editbio" required>
								</textarea>
										</div>

										<div class="mb-3">
											<label for="hours">Hours Tutored</label>
											<input type="number" id="edithours" name="edithours" class="form-control" value="0"
												required>
										</div>

										<div class="mb-3">
											<label for="profile">Profile Picture</label>
											<input type="file" id="editprofile" name="editprofile" class="form-control">
										</div>

										<div class="mb-3">
											<input type="hidden" id="edithiddenName" name="edithiddenName" class="form-control">
									
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
										<h2 class="ml-lg-2">View Bookings</h2>
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
												String bTutoring = book.getTutoring();
												String bTutorName = book.getTutorName();
												String bTutorEmail = book.getTutorEmail();
												String bStatus = book.getStatus();
												String bPhone = book.getPhone();
												String bSubject = book.getSubject();
												String bContactVia = book.getContactMethod();
												String bProvince = book.getProvince();
                                                String bSuburb = book.getSuburb();
												if(bSuburb.equals("")){
													bSuburb = "n/a";
												}
												String bgetInternetCheck = book.getInternetCheck();
												if(bgetInternetCheck.equals("on")){
													bgetInternetCheck = "Yes";

												}
												else{
													bgetInternetCheck = "No";
												}

												String bTutoringFor = book.getTutoringFor();
												String bHelpWith = book.getHelpWith();
												String bStudName = book.getStudName();
												if(bStudName.equals("")){
                                                bStudName = "n/a";
												}
                                                String bStudSurname = book.getStudSurname();
												if(bStudSurname.equals("")){
													bStudSurname = "n/a";
													}
												String bGrade = book.getGrade();
												if(bGrade.equals("")){
													bGrade = "n/a";
													}
												String bSyllabus = book.getSyllabus();
												if(bSyllabus.equals("")){
													bSyllabus = "n/a";
													}
												String bYear = book.getYear();
												if(bYear.equals("")){
													bYear = "n/a";
													}

													String bMessage = book.getMessage();


											%>
											<tr>
											
												<th>
													<%= bName %> <%= bSurname %>
												</th>
												<th>
													<%= bEmail %>
												</th>
												<th>
													<%= bTutoring %>
												</th>
												<th>
													<%= bTutorName %>
												</th>
												<th>
													<%= bTutorEmail %>
												</th>
												<th>
													<%= bStatus %>
												</th>
												<th>
										
													<a href="#" class="view" 
													data-toggle="modal" 
													data-target="#bookingModal"
													data-name="<%= bName %> <%= bSurname %>"
													data-email="<%= bEmail %>"
													data-tutoring="<%= bTutoring %>"
													data-tutor-name="<%= bTutorName %>"
													data-tutor-email="<%= bTutorEmail %>"
													data-status="<%= bStatus %>"
													data-phone="<%= bPhone %>"
													data-subject="<%= bSubject %>"
													data-contactvia="<%= bContactVia %>"
													data-province="<%= bProvince %>"
													data-suburb="<%= bSuburb %>"
													data-internetcheck="<%= bgetInternetCheck %>"
													data-tutoringfor="<%= bTutoringFor %>"
													data-helpwith="<%= bHelpWith %>"
													data-studname="<%= bStudName %>"
													data-studsurname="<%= bStudSurname %>"
													data-gradee="<%= bGrade %>"
													data-syllabuss="<%= bSyllabus %>"
													data-year="<%= bYear %>"
													data-message="<%= bMessage %>"
													>
													 <i class="material-icons" data-toggle="tooltip" title="View">&#xE8F4;</i>
												 </a>

												</th>
											</tr>

											<% } } else { %>
												<tr>
													<th>No bookings yet..</th>
												</tr>
												<% } %>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				    <!--Booking Panel-->

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
								<p><strong>Subject:</strong> <span id="modalSubject"></span></p>
								<p><strong>Tutoring:</strong> <span id="modalTutoring"></span></p>
								<p><strong>Contact Via:</strong> <span id="modalContactVia"></span></p>
								<p><strong>Province:</strong> <span id="modalProvince"></span></p>
								<p><strong>Suburb:</strong> <span id="modalSuburb"></span></p>
								<p><strong>Connection network:</strong> <span id="modalConnection"></span></p>
								</div>
								<!-- Student Details Section -->
								<div class="col-md-6">
								<h5>Student Details</h5>
								<p><strong>Tutoring For:</strong> <span id="modalTutoringFor"></span></p>
								<p><strong>Help with:</strong> <span id="modalHelpWith"></span></p>
								<p><strong>Student Name:</strong> <span id="modalStudName"></span></p>
								<p><strong>Student Surname:</strong> <span id="modalStudSurname"></span></p>
								<p><strong>Grade:</strong> <span id="modalGrade"></span></p>
								<p><strong>Syllabus:</strong> <span id="modalSyllabus"></span></p>
								<p><strong>Year:</strong> <span id="modalYear"></span></p>
								</div>
							</div>
							<!-- Message Section -->
							<div class="row">
							<div class="col-md-6">
								<h5>Tutor</h5>
								<p><strong>Tutor Name:</strong> <span id="modalTutorName"></span></p>
								<p><strong>Tutor Email:</strong> <span id="modalTutorEmail"></span></p>
							
							</div>

							<div class="col-md-6">
								<h5>Progress</h5>
								<p><strong>Booking Message:</strong> <span id="modalMessage"></span></p>
								<p><strong>Status:</strong> <span id="modalStatus"></span></p>
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


			document.getElementById('bookingPanel').style.display = 'none';
			document.getElementById('searchPanel').style.display = 'none';
			

			$(document).ready(function () {
				$(".xp-menubar").on('click', function () {
					$("#sidebar").toggleClass('active');
					$("#content").toggleClass('active');
				});

				$('.xp-menubar,.body-overlay').on('click', function () {
					$("#sidebar,.body-overlay").toggleClass('show-nav');
				});

			});

				/*View Booking Details*/
				$(document).ready(function() {
					// Event listener for the "View" icon
					$('.view').on('click', function() {
						// Get data from attributes
						var name = $(this).data('name');
						var email = $(this).data('email');
						var tutoring = $(this).data('tutoring');
						var tutorName = $(this).data('tutorName');
						var tutorEmail = $(this).data('tutorEmail');
						var status = $(this).data('status');
                        var bPhone = $(this).data('phone');
						var bSubject = $(this).data('subject');
						var bContactVia = $(this).data('contactvia');
						var bProvince = $(this).data('province');
						var bSuburb = $(this).data('suburb');
						var bgetInternetCheck = $(this).data('internetcheck');

						var bHelpWith = $(this).data('helpwith');
						var bStudName = $(this).data('studname');
						var bStudSurname = $(this).data('studsurname');
						var bTutoringFor = $(this).data('tutoringfor');
						var bGrade = $(this).data('gradee');
						var bSyllabus = $(this).data('syllabuss');
						var bYear = $(this).data('year');

						var bMessage = $(this).data('message');

						// Populate modal with the data
						$('#modalName').text(name);
						$('#modalEmail').text(email);
						$('#modalTutoring').text(tutoring);
						$('#modalTutorName').text(tutorName);
						$('#modalTutorEmail').text(tutorEmail);
						$('#modalStatus').text(status);
						$('#modalSubject').text(bSubject);
						$('#modalPhone').text(bPhone);
						$('#modalContactVia').text(bContactVia);
						$('#modalProvince').text(bProvince);
						$('#modalSuburb').text(bSuburb);
						$('#modalConnection').text(bgetInternetCheck);

						$('#modalHelpWith').text(bHelpWith);
						$('#modalStudName').text(bStudName);
						$('#modalStudSurname').text(bStudSurname);
						$('#modalTutoringFor').text(bTutoringFor);
						$('#modalGrade').text(bGrade);
						$('#modalSyllabus').text(bSyllabus);
						$('#modalYear').text(bYear);

						$('#modalMessage').text(bMessage);

							
					});
				});



			function showTutorPanel() {

				document.getElementById('bookingPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'block';
				document.getElementById('searchPanel').style.display = 'none';

			}


			function showBookingsPanel() {

				document.getElementById('searchPanel').style.display = 'none';
				document.getElementById('tutorPanel').style.display = 'none';
				document.getElementById('bookingPanel').style.display = 'block';

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

				//Get error message divs
				var nameError = document.getElementById("nameError");
				var phoneError = document.getElementById("phoneError");
				var emailError = document.getElementById("emailError");
				var addressError = document.getElementById("addressError");
				var backError = document.getElementById("backError");

				// Clear previous error messages
				nameError.innerText = "";
				phoneError.innerText = "";
				emailError.innerText = "";
				addressError.innerText = "";
				backError.innerText = "";


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
					addressError.innerText = "Address Required";
					addressError.style.color = "red"; // Set text color to red
				}



				// If any field is empty, return without proceeding
				if (name === "" || phone === "" || email === "" || background == "No" || address === "") {
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

				var subject = document.getElementById("subjects").value;
				var grades = document.getElementById("grades").value;
				var syllabus = document.getElementById("syllabus").value;
				var tutor = document.getElementById("tutorOptions").value;


				var subjectError = document.getElementById("subjectError");
				var gradesError = document.getElementById("gradesError");
				var syllabusError = document.getElementById("syllabusError");


				subjectError.innerText = "";
				gradesError.innerText = "";
				syllabusError.innerText = "";


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

				if (subject === "" || grades === "" || syllabus === "") {
					return;
				}

				subjectError.innerText = "";
				gradesError.innerText = "";
				syllabusError.innerText = "";

				var hiddenName = document.getElementById('hiddenName');
				hiddenName.value = name;

				var hiddenEmail = document.getElementById('hiddenEmail');
				hiddenEmail.value = email;

				var hiddenPhone = document.getElementById('hiddenPhone');
				hiddenPhone.value = phone;

				var hiddenBack = document.getElementById('hiddenID');
				hiddenBack.value = background;

				var hiddenSubjects = document.getElementById('hiddenSubjects');
				hiddenSubjects.value = subject;

				var hiddenGrades = document.getElementById('hiddenGrades');
				hiddenGrades.value = grades;

				var hiddenSyllabus = document.getElementById('hiddenSyllabus');
				hiddenSyllabus.value = syllabus;

				var tutorOption = document.getElementById('tutorOption');
				tutorOption.value = tutor;


				var addressTutor = document.getElementById('hiddenAddress');
				addressTutor.value = address;

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
					var phone = document.getElementById("editphone").value;
					var email = document.getElementById("editemail").value;
					var address = document.getElementById("editaddress").value;

					//Get error message divs
					var nameError = document.getElementById("editnameError");
					var phoneError = document.getElementById("editphoneError");
					var emailError = document.getElementById("editemailError");
					var addressError = document.getElementById("editaddressError");
			

					// Clear previous error messages
					nameError.innerText = "";
					phoneError.innerText = "";
					emailError.innerText = "";
					addressError.innerText = "";
				


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



					// If any field is empty, return without proceeding
					if (name === "" || phone === "" || email === "" || address === "") {
						return;
					}


					editdisplayForm2();

				}

				function editvalidateForm2() {

					var name = document.getElementById("editname").value;
					var phone = document.getElementById("editphone").value;
					var email = document.getElementById("editemail").value;
					
					var address = document.getElementById("editaddress").value;

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

				var editEmail = document.getElementById('editemail');
				editEmail.value = email;
				editEmail.placeholder = email;

				var editName = document.getElementById('editname');
				editName.value = name;
				editName.placeholder = name;

				var editPhone = document.getElementById('editphone');
				editPhone.value = phone;
				editPhone.placeholder = phone;

				var editAddress = document.getElementById('editaddress');
				editAddress.value = address;
				editAddress.placeholder = address; 

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

</script>
</body>

</html>