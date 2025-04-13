<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.CourseDAO"%>
<%@page import="com.ninfinity.entities.Course"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>

<%
    // Ensure the user is logged in
    session = request.getSession(false);
    if (session == null || session.getAttribute("userid") == null) {
        response.sendRedirect("StudentLoginPage.jsp");
        return;
    }
    
    int userId = (Integer) session.getAttribute("userid");

    // Create DAO and get enrolled courses
    CourseDAO courseDAO = new CourseDAO(DatabaseConnect.connect());
    ArrayList<Course> enrolledCourses = courseDAO.getEnrolledCourses(userId);
%>

<!DOCTYPE html>
<%@include file="bootStrapSupport.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Enrolled Courses</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Poppins', Arial, sans-serif;
        }

        h2 {
            color: white;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 2.5rem;
            text-shadow: 2px 2px #000;
        }

        .course-card {
            background-color: white;
            border-radius: 12px;
            padding: 15px;
            margin: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%; /* Ensure all cards have the same height */
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-view {
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            padding: 10px 15px;
            font-weight: bold;
        }

        .btn-view:hover {
            background-color: #0056b3;
        }

        .no-courses {
            text-align: center;
            color: #555;
            margin: 20px;
        }

        .course-title {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        .course-description {
            flex-grow: 1;  /* Allows flexible height for description */
            text-align: center;
            padding: 10px 0;
            color: #666;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));  /* Uniform columns with flexible widths */
            gap: 20px;
            margin-top: 40px;
        }

        .course-card p {
            margin: 0;
            padding: 5px 0;
        }
    </style>
</head>

<body>
<h2>My Enrolled Courses</h2>
    <%@include file="StudentNavbar.jsp" %>  <!-- Navbar at the top -->

    <div class="container my-5">
        <div class="card-container">
            <%
                if (enrolledCourses != null && !enrolledCourses.isEmpty()) {
                    for (Course course : enrolledCourses) {
            %>
                    <div class="course-card">
                        <div class="course-title">
                            <%= course.getCourse_name() %>
                        </div>
                        <div class="course-description">
                            <p><%= course.getDescription() %></p>
                        </div>
                        <a href="course_videos.jsp?courseid=<%= course.getCourseid() %>" class="btn btn-view">View Lectures</a>
                    </div>
            <%
                    }
                } else {
            %>
                <div class="no-courses">
                    <p>You are not enrolled in any courses yet.</p>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
