<%@page import="com.ninfinity.entities.Account"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Edit Instructor</title>
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
    <h1>Admin Edit Instructor Page</h1>
    
    <%@include file="AdminNavbar.jsp"%>

    <main>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Edit Instructor Data</div>

                        <%
                            int userid = Integer.parseInt(request.getParameter("userid"));
                            AccountDAO adao = new AccountDAO(DatabaseConnect.connect());
                            Account a1 = adao.getInstructorById(userid);
                        %>

                        <div class="card-body">
                            <form action="AdminEditInstructorController" method="post">
                                <div class="form-group">
                                    <label>Login Name</label> 
                                    <input type="text" class="form-control" placeholder="Enter UserName" name="username" value="<%=a1.getUsername()%>">
                                </div>

                                <div class="form-group">
                                    <label>Email</label> 
                                    <input type="email" class="form-control" placeholder="Enter Email" name="email" value="<%=a1.getEmail()%>">
                                </div>

                                <div class="form-group">
                                    <label>Select Role</label> 
                                    <select class="form-control" name="role">
                                        <option value="Instructor">Instructor</option>
                                        <option value="Student">Student</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Password</label> 
                                    <input type="text" class="form-control" placeholder="Enter Password" name="password" value="<%=a1.getPassword()%>">
                                </div>

                                <input type="hidden" value="<%=a1.getUserid()%>" name="userid" />
                                
                                <button type="submit" class="btn btn-primary">Edit Data</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
