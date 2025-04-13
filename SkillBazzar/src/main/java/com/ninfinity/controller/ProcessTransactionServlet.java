package com.ninfinity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ninfinity.dao.DatabaseConnect;
import com.ninfinity.dao.ProccessTransactionDAO;
import com.ninfinity.entities.ProcessTransaction;

/**
 * Servlet implementation class ProcessTransactionServlet
 */
@WebServlet("/ProcessTransactionServlet")
public class ProcessTransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProcessTransactionServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve transactionId from form request
        String transactionId = request.getParameter("transactionId");

        // Retrieve userId from session (assuming user has logged in)
        HttpSession session = request.getSession(false);  // Retrieve existing session
        Integer userId = (Integer) session.getAttribute("userid");
        System.out.println(userId);

        // Retrieve courseId from form input or request parameter
        String courseIdStr = request.getParameter("courseId");  // Expecting it from the form
        int courseId = 0;  
        if (courseIdStr != null) {
            courseId = Integer.parseInt(courseIdStr);
        }

        // Null check to prevent errors
        if (userId == null || courseId == 0 || transactionId == null || transactionId.trim().isEmpty()) {
            session.setAttribute("error", "Invalid transaction details. Please try again.");
            response.sendRedirect("error.jsp");  // Redirect to an error page if data is invalid
            return;
        }

        // Create a ProcessTransaction object
        ProcessTransaction p1 = new ProcessTransaction(transactionId, userId, courseId, "pending");

        // Initialize DAO and process the transaction
        ProccessTransactionDAO pdao = new ProccessTransactionDAO(DatabaseConnect.connect());
        boolean status = pdao.EnrollStudent(p1);

        if (status) {
            // If the transaction was added successfully
            System.out.println("Transaction successfully added to database!");
            session.setAttribute("success", "Congratulations! Your Request For The Course Is Submitted - Please Wait For The Admin Approval");
            response.sendRedirect("Purchase.jsp");
        } else {
            System.out.println("Error occurred while processing the transaction.");
            session.setAttribute("error", "There was a problem processing your transaction. Please try again.");
            response.sendRedirect("error.jsp");  // Redirect to an error page
        }
    }
}
