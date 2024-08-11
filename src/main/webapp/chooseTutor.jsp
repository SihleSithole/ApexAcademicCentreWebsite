<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Book a Tutor</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									
									<a href="index.html" class="logo"><img src="apex.png" alt="apex"></a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>

									</ul>
								</header>

							<!-- Banner -->
							<section id="banner">
								<!--THE START-->
							    <div class="content">
							        <header>
							            <h1>TutorsName</h1>
							        </header>
							        <p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue.</p>
							        
							        <!-- Icon and Label for Ratings -->
							        <div class="info-item">
							            <i class="fa fa-star"></i>
							            <span class="label">Ratings:</span> fromDatabase
							        </div>
							
							        <!-- Icon and Label for Background Check -->
							        <div class="info-item">
							            <i class="fa fa-check-circle"></i>
							            <span class="label">Background Check:</span> isTrueFromDatabase
							        </div>
							
							        <!-- Icon and Label for Hours Tutored -->
							        <div class="info-item">
							            <i class="fa fa-clock"></i>
							            <span class="label">Hours Tutored:</span> fromDatabase
							        </div>
							
							        <!-- List of Subjects -->
							        <div class="subjects">
							            <h2>Subjects:</h2>
							            <ul>
							                <li>Dynamic from database</li>

							            </ul>
							        </div>

                                    									
									<div class="info-item" id="rev">
									    <a href="#"><i class="fa fa-comments"></i>
									    <span class="label">Reviews</span> </a>
									</div>
							        
							        <ul class="actions">
							            <li><a href="#" class="button big">Book Tutor</a></li>
							            <li><a href="#" class="button big">View Profile</a></li>
							        </ul>
							    </div>
							    <span class="image object">
							        <img src="sihle.jpeg" alt="" id="sami"/>
							    </span>

								<!--THE END-->

							</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search Keyword" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>

										<li>
											<span class="opener">FILTER</span>
											<ul>
												<li><a href="#">Location</a></li>
												<span class="opener">Availability</span>
												<ul>
													<li><a href="#">During week</a></li>
													<li><a href="#">Weekends</a></li>
													<li><a href="#">Night</a></li>
												</ul>
											</ul>
										<li>
											<span class="opener">Sort Options</span>
											<ul>
                                                <li><a href="#">High Rating</a></li>
												<li><a href="#">More Experience</a></li>
											</ul>
										</li>

									</ul>
								</nav>



							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Our tutors are situated in all 9 provinces of South Africa, in a variety of industries. From medicine to finance, our tutors offer more than academic assistance to their students, they also give students insight into their chosen careers.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">info@apexacademiccentre.co.za</a></li>
										<li class="icon solid fa-phone">(011) 354-0198</li>
										<li class="icon solid fa-home">Physical Address</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; 2024 Apex Academic Centre(Pty) Ltd. All rights reserved</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>