<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.CourseDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@ page session="true" %>

<%
    // Ensure the user is logged in
    session = request.getSession(false);
    if (session == null || session.getAttribute("userid") == null) {
        response.sendRedirect("StudentLoginPage.jsp");
        return;
    }

    int userId = (int) session.getAttribute("userid");
    int courseId = Integer.parseInt(request.getParameter("courseid"));
    
    // Fetch video links from DAO
    CourseDAO courseDAO = new CourseDAO(DatabaseConnect.connect());
    ArrayList<String> videoLinks = courseDAO.getCourseVideos(courseId);

    // Handle review submission
    String reviewMessage = request.getParameter("reviewMessage");
    String videoLink = request.getParameter("videoLink");

    if (reviewMessage != null && videoLink != null) {
        Connection conn = null;
        try {
            conn = DatabaseConnect.connect();
            String sql = "INSERT INTO course_reviews (courseid, userid, review) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, courseId);
            pstmt.setInt(2, userId);
            pstmt.setString(3, reviewMessage);
            pstmt.executeUpdate();
            request.setAttribute("success", "Your review has been submitted!");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error submitting your review.");
        } finally {
            if (conn != null) conn.close();
        }
    }
%>

<!DOCTYPE html>
<%@include file="bootStrapSupport.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Videos</title>
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

        .video-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));  /* Responsive grid */
            gap: 20px;  /* Space between cards */
            margin-top: 40px;
        }

        .video-card {
            background-color: white;
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;  /* Uniform height */
            transition: transform 0.3s ease;
        }

        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        iframe {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            border: none;
            margin-bottom: 10px;
        }

        .video-title {
            color: #333;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .review-form {
            margin-top: 15px;
        }

        .no-videos {
            text-align: center;
            color: white;
            font-size: 1.5rem;
            margin-top: 40px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>

<body>
    <h2>Course Videos</h2>
    <%@include file="StudentNavbar.jsp" %>  <!-- Include the Student Navbar -->

    <div class="container my-5">
        <div class="video-container">
            <%
                if (videoLinks != null && !videoLinks.isEmpty()) {
                    for (String link : videoLinks) {
                        String embedCode = "";

                        // Extract video ID for embedding
                        if (link.contains("v=")) {
                            embedCode = link.split("v=")[1].split("&")[0];
                        } else if (link.contains("youtu.be/")) {
                            embedCode = link.split("youtu.be/")[1].split("\\?")[0];
                        } else {
                            out.println("<p style='color: red;'>Invalid video link format: " + link + "</p>");
                            continue;
                        }
            %>
                        <div class="video-card">
                            <iframe src="https://www.youtube.com/embed/<%= embedCode %>" allowfullscreen></iframe>
                            <p class="video-title">YouTube Video</p>
                            
                            <!-- Review Form -->
                            <form class="review-form" action="course_videos.jsp?courseid=<%= courseId %>" method="POST">
                                <input type="hidden" name="videoLink" value="<%= link %>">
                                <textarea class="form-control mb-2" name="reviewMessage" rows="2" placeholder="Write your review..." required></textarea>
                                <button type="submit" class="btn btn-primary btn-sm w-100">Submit Review</button>
                            </form>
                        </div>
            <%
                    }
                } else {
            %>
                <p class="no-videos">No videos found for this course.</p>
            <%
                }
            %>
        </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
