<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Student Login Page</title>

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

<h1>!! Welcome to Skill Bazaar - Student Login !!</h1>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand text-white" href="#">SkillBazaar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link text-white" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <b>Login As</b>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Student</a>
                    <a class="dropdown-item" href="#">Instructor</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="AdminLoginPage.jsp">Admin</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<main>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h2>Login Here</h2>
                    </div>

                    <div class="card-body">
                        <form action="StudentLoginValidate" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Login Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter Login Name" name="loginName">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control"
                                       id="exampleInputPassword1" placeholder="Enter Password" name="password">
                                 
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>



</body>
</html>
