package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ninfinity.dao.AccountDAO;
import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.entities.Account;

/**
 * Servlet implementation class AddAccountController
 */
@WebServlet("/AddAccountController")
public class AddAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served At: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		String password = request.getParameter("password");
		
		Account a1 = new Account(username, email, password, role);
		
		AccountDAO adao = new AccountDAO(DatabaseConnect.connect());
		
		boolean status =adao.addOneAccount(a1);
		
		HttpSession session = request.getSession();
		
		if(status) {
			System.out.println("Account created");
			session.setAttribute("success","Congratulations Account Created");
			response.sendRedirect("CreateAccountPage.jsp");
		}else {
			System.out.println("Problem In Creating");
		}
	
		
		
		
	}

}
