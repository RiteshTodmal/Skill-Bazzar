<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@include file="bootStrapSupport.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Instructor Main Page</title>
<style>
body {
	background: linear-gradient(to right, #74ebd5, #9face6);
	/* Gradient background */
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

h1 {
	color: white;
	text-align: center;
	margin-top: 20px;
	font-weight: bold;
	font-size: 2.5rem;
	text-shadow: 2px 2px #000;
}

h2 {
	color: white;
	text-align: center;
	margin-top: 20px;
	font-weight: bold;
	font-size: 2.5rem;
	text-shadow: 2px 2px #000;
}

.carousel-item img {
	width: 100%; /* Full width */
	height: auto; /* Keep aspect ratio to prevent cropping */
	max-height: 400px; /* Limit the image height to 400px */
	border-radius: 10px; /* Optional rounded corners */
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: black; /* Set arrow background to black */
	border-radius: 50%; /* Round arrow background */
	width: 40px; /* Adjust arrow width */
	height: 40px;
}

.carousel-container {
	position: relative;
	padding-top: 20px;
}

.course-card img {
	height: 200px;
	object-fit: cover; /* Ensure images are proportional */
	border-radius: 10px 10px 0 0;
}

.course-card .card-body {
	text-align: center;
}
</style>
</head>

<body>

	<%
	// Retrieve the login name from the session
	String username = (String) session.getAttribute("loginName");
	if (username == null) {
	    username = request.getParameter("loginName");
	    if (username != null) {
	        session.setAttribute("loginName", username);
	    }
	}
	%>

	<h1 style="text-align: center; color: white;">
		!!Welcome To Skill Bazaar - <%= (username != null) ? username : "Guest" %> !!
	</h1>
	
	<%@include file="InstructorNavbar.jsp"%>

	<!-- Carousel Section -->
	<div class="container my-4 carousel-container">
		<div id="imageCarousel" class="carousel slide" data-ride="carousel"
			data-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://i.ytimg.com/vi/Wx0SJa8L4dA/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBTtAm9b620BcU71XBI2vyMJDWqjA"
						class="d-block w-100" alt="Image 1">
				</div>
				<div class="carousel-item">
					<img src="https://www.ninfinitysolutions.com/assets/img/cover.png"
						class="d-block w-100" alt="Image 2">
				</div>
				<div class="carousel-item">
					<img
						src="https://i.ytimg.com/vi/k1qUIj2mi3Q/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDYeP9nhsMVFSstK-wEF1G1-xO_uA"
						class="d-block w-100" alt="Image 3">
				</div>
				<div class="carousel-item">
					<img
						src="https://i.ytimg.com/vi/ZVTLndiTWQ8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBKHH3rqMkEmN9J0JeAhFPl8brgMQ"
						alt="Image 4">
				</div>
			</div>

			<a class="carousel-control-prev" href="#imageCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#imageCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- Courses Section -->
	<div class="container my-4">
		<h2 style="text-align: center; color: white;">Available Courses</h2>
		<hr>
		<div class="row">
			<!-- Course 1 -->
			<div class="col-md-4">
				<div class="card course-card">
					<img src="https://www.ninfinitysolutions.com/assets/img/cover.png"
						class="card-img-top" alt="Course 1">
					<div class="card-body">
						<h5 class="card-title">TechniHongo</h5>
						<p class="card-text">Master JPTL With Java FullStack /
							Datascience For Today's IT LandScape</p>
						<a href="#" class="btn btn-primary">Enroll Now</a>
					</div>
				</div>
			</div>

			<!-- Course 2 -->
			<div class="col-md-4">
				<div class="card course-card">
					<img
						src="https://i.ytimg.com/vi/k1qUIj2mi3Q/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDYeP9nhsMVFSstK-wEF1G1-xO_uA"
						class="card-img-top" alt="Course 2">
					<div class="card-body">
						<h5 class="card-title">Fundamentals Of Programming Language</h5>
						<p class="card-text">Based On SPPU 2024 Pattern</p>
						<a href="#" class="btn btn-primary">Enroll Now</a>
					</div>
				</div>
			</div>

			<!-- Course 3 -->
			<div class="col-md-4">
				<div class="card course-card">
					<img
						src="https://i.ytimg.com/vi/ZVTLndiTWQ8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBKHH3rqMkEmN9J0JeAhFPl8brgMQ"
						class="card-img-top" alt="Course 3">
					<div class="card-body">
						<h5 class="card-title">Theory Of Computation</h5>
						<p class="card-text">Based On SPPU 2019 Pattern/Live Doubt
							Solving</p>
						<a href="#" class="btn btn-primary">Enroll Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
