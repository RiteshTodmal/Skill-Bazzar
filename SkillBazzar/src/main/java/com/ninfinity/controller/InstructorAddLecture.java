package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.dao.LectureDAO;
import com.ninfinity.entities.Lecture;


/**
 * Servlet implementation class InstructorAddLecture
 */
@WebServlet("/InstructorAddLecture")
public class InstructorAddLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstructorAddLecture() {
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

		Integer courseid = Integer.parseInt(request.getParameter("courseid"));   
		String video_link = request.getParameter("video_link");
		String course_name = request.getParameter("course_name");
		
		Lecture l1 = new Lecture(courseid, video_link, course_name);
		
		LectureDAO ldao = new LectureDAO(DatabaseConnect.connect());
		
		boolean status = ldao.addOneLecture(l1);
		
		HttpSession session = request.getSession();
		
		if(status) {
//			System.out.println("Lecture Added");
			session.setAttribute("success","Lecture added in Database");
			response.sendRedirect("InstructorAddLecture.jsp");
		}else {
			System.out.println("Problem in Addition");
		}
	}

}
