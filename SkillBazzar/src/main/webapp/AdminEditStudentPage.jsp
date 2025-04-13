<%@page import="com.ninfinity.entities.Account"%>
<%@page import="com.ninfinity.dao.DatabaseConnect"%>
<%@page import="com.ninfinity.dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Edit Student Page</title>
<%@include file="bootStrapSupport.jsp"%>
</head>
<body>
	<h1 style="text-align: center; color: red;">Admin Edit Student Page</h1>
	<%@include file="AdminNavbar.jsp"%>

	<main>
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3 ">
					<div class="card">
						<div class="card-header">
							<p style="text-align: center; color: red;">Edit Student Data</p>
						</div>
						
						<% 
							int userid = Integer.parseInt(request.getParameter("userid"));
							AccountDAO adao = new AccountDAO(DatabaseConnect.connect());
							Account a1 = adao.getStudentById(userid);
						%>
						
						<div class="card-body">
							<form action="AdminEditStudentController" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Login Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter UserName" name="username" value="<%=a1.getUsername()%>">
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Email</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Email" name="email" value="<%=a1.getEmail()%>">
								</div>
								
								<div class="form-group">
									<label for="role">Select Role</label> <select
										class="form-control" id="role" name="role" >
										<option value="Student">Student</option>
										<option value="Instructor">Instructor</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Password</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Password" name="password" value="<%=a1.getPassword()%>">
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