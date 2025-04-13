<%@page import="com.ninfinity.entities.Course1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Instructor My Courses</title>
<%@include file="bootStrapSupport.jsp"%>

<style>
body {
	background: linear-gradient(to right, #74ebd5, #9face6);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 0;
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
	text-align: center;
	color: blue;
	font-weight: bold;
}

.container {
	margin: 20px auto;
	background: white;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	max-width: 80%;
}

table {
	width: 100%;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	margin-top: 20px;
}

thead {
	background-color: black;
	color: white;
}

th, td {
	text-align: center;
	padding: 12px;
	font-size: 1rem;
	border-bottom: 1px solid #ddd;
}

tbody tr:hover {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h1>My Courses</h1>
	<%@include file="InstructorNavbar.jsp"%>

	<div class="container">
		<h2>Course Details</h2>

		<table class="table">
			<thead>
				<tr>
					<th>Course ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Price</th>
					<th>View Course</th>
					<th>Delete Course</th>
				</tr>
			</thead>
			<tbody>
				<%
                    //  Retrieve user ID from session
                    Integer userId = (Integer) session.getAttribute("userid");
                    if (userId == null) {
                        response.sendRedirect("InstructorLoginPage.jsp");
                        return;
                    }

                    // Fetch instructor's courses
                    CourseDAO cdao = new CourseDAO(DatabaseConnect.connect());
                    ArrayList<Course1> instructorCourseList = cdao.getAllInstructorMyCourse(userId);

                    for (Course1 c : instructorCourseList) {
                %>
				<tr>
					<td><%= c.getCourseid() %></td>
					<td><%= c.getTitle() %></td>
					<td><%= c.getDescription() %></td>
					<td><%= c.getPrice() %> Rs</td>
					<td>
						<!--  Secure: Use form instead of passing courseid in URL -->
						<form action="InstructorViewCourse.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="courseid" value="<%=c.getCourseid()%>">
							<button type="submit" class="btn btn-sm btn-primary">View
								</button>
						</form>
					</td>
					<td><a href="InstructorDeleteCourseController?courseid=<%=c.getCourseid()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
                    }
                %>
			</tbody>
		</table>
	</div>
</body>
</html>
