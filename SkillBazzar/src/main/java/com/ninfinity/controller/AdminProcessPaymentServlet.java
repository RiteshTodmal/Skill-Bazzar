package com.ninfinity.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ninfinity.dao.AdminDAO;
import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.entities.Admin;

import java.io.*;

@WebServlet("/AdminProcessPaymentServlet") 
public class AdminProcessPaymentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		String paymentstatus = request.getParameter("paymentstatus"); 
		int userid = Integer.parseInt(request.getParameter("userid"));
		int courseid = Integer.parseInt(request.getParameter("courseid"));// 'Completed' or 'Failed'
		
		System.out.println(orderid + " "+paymentstatus+" "+userid+" "+courseid);

		///Admin a1 = new Admin(paymentstatus,orderid);

		AdminDAO adao = new AdminDAO(DatabaseConnect.connect());
		
		boolean status = adao.Enroll(orderid, paymentstatus, userid, courseid);
		
		System.out.println(status);
		
		if (status) {
		    response.sendRedirect("adminsuccess.jsp");
		} else {
		    response.sendRedirect("adminFailure.jsp");
		}
	}
}
