package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ninfinity.dao.CourseDAO;
import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.entities.Course;
import com.ninfinity.entities.Course1;

@WebServlet("/InstructorAddCourse")
public class InstructorAddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InstructorAddCourse() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String priceStr = request.getParameter("price");
		
		HttpSession session = request.getSession();
		
		// ✅ Retrieve userid from session
		Integer userid = (Integer) session.getAttribute("userid");

		// ❌ If userid is null, redirect to login
		if (userid == null) {
			session.setAttribute("error", "User session expired. Please log in again.");
			response.sendRedirect("InstructorLoginPage.jsp");
			return;
		}

		// ✅ Validate price input
		Integer price = null;
		if (priceStr != null && !priceStr.isEmpty()) {
			try {
				price = Integer.parseInt(priceStr);
			} catch (NumberFormatException e) {
				session.setAttribute("error", "Invalid price value. Please enter a valid number.");
				response.sendRedirect("InstructorAddCourse.jsp");
				return;
			}
		} else {
			session.setAttribute("error", "Price cannot be empty.");
			response.sendRedirect("InstructorAddCourse.jsp");
			return;
		}

		// ✅ Proceed with course creation
		Course1 c1 = new Course1(title, description, price, userid);
		CourseDAO cdao = new CourseDAO(DatabaseConnect.connect());

		boolean status = cdao.addOneCourse(c1);

		if (status) {
//			System.out.println("Course created successfully.");
			session.setAttribute("success", "Congratulations! New Course is Created.");
		} else {
			session.setAttribute("error", "There was a problem creating the course. Please try again.");
		}

		response.sendRedirect("InstructorAddCourse.jsp");
	}
}
