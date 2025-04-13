package com.ninfinity.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ninfinity.dao.DatabaseConnect;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Retrieve review details from form
        String reviewText = request.getParameter("review");
        String courseIdStr = request.getParameter("courseid");

        // Step 2: Retrieve user ID from session
        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userid") : null;

        // Step 3: Validate inputs and handle null values
        if (userId != null && reviewText != null && !reviewText.trim().isEmpty() && courseIdStr != null) {
            int courseId = Integer.parseInt(courseIdStr);

            try (Connection con = DatabaseConnect.connect()) {
                String query = "INSERT INTO course_reviews (userid, courseid, review) VALUES (?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, userId);
                pstmt.setInt(2, courseId);
                pstmt.setString(3, reviewText);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Review added successfully!");
                } else {
                    System.out.println("Failed to add review.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Invalid input: Review or user information is missing.");
        }

        // Step 4: Redirect back to My Courses page after review submission
        response.sendRedirect("mycourses.jsp");
    }
}
