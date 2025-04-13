package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.dao.CourseDAO;

/**
 * Servlet implementation class InstructorDeleteCourseController
 */
@WebServlet("/InstructorDeleteCourseController")
public class InstructorDeleteCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstructorDeleteCourseController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int courseid = Integer.parseInt(request.getParameter("courseid"));

		CourseDAO cDao = new CourseDAO(DatabaseConnect.connect());

		boolean status = cDao.DeleteCourseById(courseid);

		if(status) {
			response.sendRedirect("InstructorMyCourse.jsp");
		}
	}

}
