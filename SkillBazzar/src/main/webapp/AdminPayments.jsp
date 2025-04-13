<%@page import="com.ninfinity.entities.Admin"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.AdminDAO"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Payments</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 1rem;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .button {
            padding: 8px 15px;
            margin: 5px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .approve {
            background: linear-gradient(45deg, #28a745, #85d68a);
            color: white;
        }

        .reject {
            background: linear-gradient(45deg, #dc3545, #ff7a7a);
            color: white;
        }

        .approve:hover {
            background: linear-gradient(45deg, #218838, #76c478);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .reject:hover {
            background: linear-gradient(45deg, #c82333, #e86b6b);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>

<body>
    <h1>Admin - Manage Payments</h1>

    <!-- Including Admin Navbar -->
    <%@include file="AdminNavbar.jsp"%>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Course ID</th>
                <th>Transaction ID</th>
                <th>Payment Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            AdminDAO adao = new AdminDAO(DatabaseConnect.connect());
            ArrayList<Admin> studentRequestList = adao.getAllRequest();

            for (Admin a : studentRequestList) {
            %>
                <tr>
                    <td><%= a.getOrderid() %></td>
                    <td><%= a.getUserid() %></td>
                    <td><%= a.getCourseid() %></td>
                    <td><%= a.getTransactionid() %></td>
                    <td><%= a.getPaymentstatus() %></td>

                    <td>
                        <form action="AdminProcessPaymentServlet" method="post" style="display:inline-block;">
                            <input type="hidden" name="orderid" value="<%= a.getOrderid() %>">
                            <input type="hidden" name="userid" value="<%= a.getUserid() %>">
                            <input type="hidden" name="courseid" value="<%= a.getCourseid() %>">
                            <input type="hidden" name="paymentstatus" value="Completed">
                            <button type="submit" class="button approve">Approve</button>
                        </form>
                        <form action="AdminProcessPaymentServlet" method="post" style="display:inline-block;">
                            <input type="hidden" name="orderid" value="<%= a.getOrderid() %>">
                            <input type="hidden" name="userid" value="<%= a.getUserid() %>">
                            <input type="hidden" name="courseid" value="<%= a.getCourseid() %>">
                            <input type="hidden" name="paymentstatus" value="Failed">
                            <button type="submit" class="button reject">Reject</button>
                        </form>
                    </td>
                </tr>
            <%
            }
            %>
        </tbody>
    </table>

</body>
</html>
