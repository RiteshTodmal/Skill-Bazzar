<%@page import="com.ninfinity.entities.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Main Page</title>
    
    <%@include file="bootStrapSupport.jsp"%>

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);  /* Gradient background */
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

        .navbar {
            background-color: #007bff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .card {
            border-radius: 15px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .card-header {
            background-color: #343a40;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
            padding: 15px 0;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            width: 100%;
            border-radius: 10px;
            background: linear-gradient(45deg, #007bff, #00c6ff);
            border: none;
            font-size: 1.2rem;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #0056b3, #00aaff);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>

<body>
    <h1>SkillBazaar</h1>
    

    <!-- Including the Admin Navigation Bar -->
    <%@include file="AdminNavbar.jsp"%>
    

<%@page import="com.ninfinity.dao.CourseDAO"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="java.util.List"%>

<%
    // Fetch course sales data from the DAO
    CourseDAO courseDAO = new CourseDAO(DatabaseConnect.connect());
    List<Course> courseSalesList = courseDAO.getCourseSalesDetails();
%>

<div class="container mt-5">
    <h3 class="text-center text-white">Course Sales Report</h3>

    <table class="table table-bordered table-striped table-hover mt-4">
        <thead class="thead-dark">
            <tr>
                <th>Course Title</th>
                <th>Description</th>
                <th>Price (INR)</th>
                <th>Instructor Name</th>
                <th>Sales Count</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (courseSalesList != null && !courseSalesList.isEmpty()) {
                    for (Course data : courseSalesList) {
            %>
                        <tr>
                            <td><%= data.getCourse_name() %></td>
                            <td><%= data.getDescription() %></td>
                            <td><%= data.getPrice() %></td>
                            <td><%= data.getInstructorName() %></td>
                            <td><%= data.getSalescount() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5" class="text-center">No course sales found.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
    
</body>
</html>
