<nav
	class="navbar navbar-expand-lg navbar-light bg-primary px-4 shadow-lg">
	<a class="navbar-brand text-white font-weight-bold" href="#">SkillBazaar</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<!-- Left-aligned menu -->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a
				class="nav-link text-white font-weight-bold"
				href="InstructorMainPage.jsp"> Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-white font-weight-bold"
				href="#" id="courseDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Courses </a>
				<div class="dropdown-menu shadow-lg border-0 rounded-lg"
					aria-labelledby="courseDropdown">
					<a class="dropdown-item" href="InstructorAddCourse.jsp"> Create
						Course</a> <a class="dropdown-item" href="InstructorAddLecture.jsp">
						Add Lecture</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="InstructorMyCourse.jsp"> My
						Courses</a>
				</div></li>
		</ul>

	 <!-- Logout aligned to the right -->
       <form class="form-inline my-2 my-lg-0">
      <a href="InstructorLoginPage.jsp" class="btn btn-primary my-2 my-sm-0">Logout</a>
    </form>
	</div>
</nav>
