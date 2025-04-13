<%@page import="com.ninfinity.entities.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Display Student</title>
    <%@include file="bootStrapSupport.jsp"%>

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6); /* Gradient background */
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

        .navbar-custom {
            background-color: #0d6efd; /* Blue navbar */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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

        .btn-edit {
            background: linear-gradient(45deg, #0d6efd, #85c1ff);
            color: white;
            border-radius: 5px;
            padding: 8px 12px;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-edit:hover {
            background: linear-gradient(45deg, #0056b3, #6fa8dc);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .btn-delete {
            background: linear-gradient(45deg, #ff4b5c, #ff7a7a);
            color: white;
            border-radius: 5px;
            padding: 8px 12px;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-delete:hover {
            background: linear-gradient(45deg, darkred, #e63946);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>

<body>

    <h1>Student Display Page</h1>

    <%@include file="AdminNavbar.jsp"%>

    <div class="container">
        <h2>Student Details</h2>

        <table class="table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    AccountDAO adao = new AccountDAO(DatabaseConnect.connect());
                    ArrayList<Account> studentAccountList = adao.getAllStudents();

                    for (Account a : studentAccountList) {
                %>
                <tr>
                    <td><%= a.getUserid() %></td>
                    <td><%= a.getUsername() %></td>
                    <td><%= a.getEmail() %></td>
                    <td><%= a.getPassword() %></td>
                    <td><%= a.getRole() %></td>
                    <td>
                        <a href="AdminEditStudentPage.jsp?userid=<%= a.getUserid() %>" class="btn btn-sm btn-edit">Edit</a>
                        <a href="AdminDeleteStudentController?userid=<%= a.getUserid() %>" class="btn btn-sm btn-delete">Delete</a>
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
