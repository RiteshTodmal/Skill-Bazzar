<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<a class="navbar-brand text-white" href="#">SkillBazaar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link text-white"
				href="index.jsp">Home <span class="sr-only">(current)</span></a></li>

			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
					<b>Login As</b>
				</a>

				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="StudentLoginPage.jsp">Student</a> 
					<a class="dropdown-item" href="InstructorLoginPage.jsp">Instructor</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="AdminLoginPage.jsp">Admin</a>
				</div>
			</li>
		</ul>

		<!-- Add ml-auto to push the button to the right -->
		<form action="CreateAccountPage.jsp" method="post" class="form-inline my-2 my-lg-0 ml-auto">
			<button type="submit" class="btn btn-success">Create Account</button>
		</form>
	</div>
</nav>
