package com.ninfinity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.dao.LectureDAO;


/**
 * Servlet implementation class InstructorDeleteLectureController
 */
@WebServlet("/InstructorDeleteLectureController")
public class InstructorDeleteLectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InstructorDeleteLectureController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		LectureDAO lDao = new LectureDAO(DatabaseConnect.connect());

		boolean status = lDao.DeleteLectureById(id);

		if(status) {
			response.sendRedirect("InstructorViewCourse.jsp");
		}else {
	        response.getWriter().println("Error: Unable to delete lecture.");
	    }
	}

}
