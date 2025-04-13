package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ninfinity.dao.AccountDAO;
import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.entities.Account;

/**
 * Servlet implementation class AdminEditInstructorController
 */
@WebServlet("/AdminEditInstructorController")
public class AdminEditInstructorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditInstructorController() {
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
		int userid = Integer.parseInt(request.getParameter("userid"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
//		System.out.println(password);
		Account a1 = new Account(userid, username, email, password, role);
//		System.out.println(a1.getPassword());
		AccountDAO aDao = new AccountDAO(DatabaseConnect.connect());
		boolean status = aDao.UpdateOneStudent(a1);
		
		if(status) {
			response.sendRedirect("AdminDisplayInstructor.jsp");
		}
	}

}
