<%@page import="com.ninfinity.dao.LectureDAO"%>
<%@page import="com.ninfinity.entities.Course"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Instructor Edit Lecture</title>
    <%@include file="bootStrapSupport.jsp"%>

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);  
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
            font-size: 1.3rem;
            font-weight: bold;
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
    <h1> Edit Lecture </h1>
    
    <%@include file="InstructorNavbar.jsp"%>

    <main>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Edit Lecture</div>

                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            LectureDAO ldao = new LectureDAO(DatabaseConnect.connect());
                            Course c1 = ldao.getLectureById(id);
                        %>

                        <div class="card-body">
                            <form action="InstructorEditLectureController" method="post">
                                <div class="form-group">
                                    <label>Lecture Name</label> 
                                    <input type="text" class="form-control" placeholder="Enter Lecture Name" name="course_name" value="<%=c1.getCourse_name()%>">
                                </div>

                                <div class="form-group">
                                    <label>Video Link</label> 
                                    <input type="text" class="form-control" placeholder="Enter Video Link" name="video_link" value="<%=c1.getVideo_link()%>">
                                </div>

                                <input type="hidden" value="<%=c1.getCourseid()%>" name="courseid" />
                                <input type="hidden" value="<%=c1.getId()%>" name="id" />

                                <button type="submit" class="btn btn-primary">Update Lecture</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
