package com.ninfinity.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLoginValidate
 */
@WebServlet("/AdminLoginValidate")
public class AdminLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginName = request.getParameter("loginName");
	    String password = request.getParameter("password");
	    //System.out.println(loginName + password);

	    if (loginName.equals("Arjun") && password.equals("patil")) {
	        RequestDispatcher view = request.getRequestDispatcher("AdminMainPage.jsp");
	        view.forward(request, response);
	    } else {
	        PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        out.print("<h2 style=\"text-align: center; color: red;\">Invalid Credentials : Please Relogin </h2>");
	        RequestDispatcher view = request.getRequestDispatcher("AdminLoginPage.jsp");
	        view.include(request, response);
	}
	}

}
