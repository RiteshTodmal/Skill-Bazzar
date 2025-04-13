<%@page import="com.ninfinity.entities.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Instructor View Course</title>
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
    <h1>Your Lectures</h1>
    <%@include file="InstructorNavbar.jsp"%>

    <div class="container">
        <h2>Lecture Details</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Lecture Name</th>
                    <th>Link</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                //  Get courseid from session or request
                String courseidParam = request.getParameter("courseid");
                Integer courseid = null;

                if (courseidParam != null && !courseidParam.isEmpty()) {
                    courseid = Integer.parseInt(courseidParam);
                    session.setAttribute("courseid", courseid); // Store in session
                } else {
                    courseid = (Integer) session.getAttribute("courseid"); // Retrieve from session
                }

                if (courseid == null) {
                    response.sendRedirect("InstructorLoginPage.jsp");
                    return;
                }

                CourseDAO cdao = new CourseDAO(DatabaseConnect.connect());
                ArrayList<Course> instructorLectureList = cdao.getAllInstructorLecture(courseid);

                for (Course c : instructorLectureList) {
                %>
                <tr>
                    <td><%= c.getCourseid() %></td>
                    <td><%= c.getCourse_name() %></td>
                    <td><a href="<%= c.getVideo_link() %>" target="_blank">View Lecture</a></td>
                    <td>
                        <a href="InstructorEditLecture.jsp?id=<%= c.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="InstructorDeleteLectureController?id=<%= c.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
