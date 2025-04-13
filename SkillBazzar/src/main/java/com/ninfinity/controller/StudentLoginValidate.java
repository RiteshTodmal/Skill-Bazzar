package com.ninfinity.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentLoginValidate
 */
@WebServlet("/StudentLoginValidate")
public class StudentLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginName = request.getParameter("loginName");
	    String password = request.getParameter("password");
	    //System.out.println(loginName + password);

//	    if (loginName.equals("Ritesh") && password.equals("todmal")) {
//	        RequestDispatcher view = request.getRequestDispatcher("StudentMainPage.jsp");
//	        view.forward(request, response);
//	    }
//	    else if (loginName.equals("Arjun") && password.equals("Patil")) {
//	        RequestDispatcher view = request.getRequestDispatcher("StudentMainPage.jsp");
//	        view.forward(request, response);
//	    }
//	    else {
//	        PrintWriter out = response.getWriter();
//	        response.setContentType("text/html");
//	        out.print("<h2 style=\"text-align: center; color: red;\">Invalid Credentials : Please Relogin </h2>");
//	        RequestDispatcher view = request.getRequestDispatcher("StudentLoginPage.jsp");
//	        view.include(request, response);
//	}
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skillbazzardb","root", "Pass@123");
			PreparedStatement pstmt = con.prepareStatement("select * from usertable where username = ? and password = ? and role = 'Student'");
			pstmt.setString(1, loginName);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				int userid = rs.getInt("userid");
				HttpSession session = request.getSession();
	            session.setAttribute("userid", userid); 
	            session.setAttribute("loginName", loginName); // loginName from user input or DB

				RequestDispatcher view = request.getRequestDispatcher("StudentMainPage.jsp");
				view.forward(request, response);
			}else {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.print("<h2 style=\"text-align: center; color: red;\">Invalid Credentials : Please Relogin </h2>");
				RequestDispatcher view = request.getRequestDispatcher("StudentLoginPage.jsp");
				view.include(request, response);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
