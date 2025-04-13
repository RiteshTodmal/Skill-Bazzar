package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ninfinity.dao.AccountDAO;
import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.dao.LectureDAO;
import com.ninfinity.entities.Course;

/**
 * Servlet implementation class InstructorEditLectureController
 */
@WebServlet("/InstructorEditLectureController")
public class InstructorEditLectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstructorEditLectureController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int courseid = Integer.parseInt(request.getParameter("courseid"));
		String video_link = request.getParameter("video_link");
		String course_name = request.getParameter("course_name");
		int id = Integer.parseInt(request.getParameter("id"));
		

		Course c1 = new Course(courseid, video_link, course_name, id);

		LectureDAO lDao = new LectureDAO(DatabaseConnect.connect());

		boolean status = lDao.UpdateOneLecture(c1);

		if(status) {
			response.sendRedirect("InstructorViewCourse.jsp");
		}
	}

}
