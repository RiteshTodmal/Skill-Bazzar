package com.ninfinity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.ninfinity.entities.Admin;

public class AdminDAO {
	
Connection con;
	
	public AdminDAO(Connection con) {
		this.con=con;
	}
	
	public ArrayList<Admin> getAllRequest(){

		ArrayList<Admin> studentRequestList = new ArrayList<Admin>();

		String query = "SELECT orderid, userid, courseid, transactionid, paymentstatus FROM orders WHERE paymentstatus = 'Pending'";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);

			ResultSet result = pstmt.executeQuery();

			while(result.next()) {
				Admin a1 = new Admin();

				a1.setOrderid(result.getInt(1));
				a1.setUserid(result.getInt(2));
				a1.setCourseid(result.getInt(3));
				a1.setTransactionid(result.getString(4));
				a1.setPaymentstatus(result.getString(5));

				studentRequestList.add(a1);

			}

		

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studentRequestList;
	}
	
	
	
	

	public boolean Enroll(int orderid, String paymentstatus, int userid, int courseid) {
	    boolean status = false; // To track success

	    try {
	        // SQL query to update payment status in the orders table
	        String updateQuery = "UPDATE orders SET paymentstatus = ? WHERE orderid = ?";
	        PreparedStatement pstmt = con.prepareStatement(updateQuery);
	        pstmt.setString(1, paymentstatus);
	        pstmt.setInt(2, orderid);

	        // Execute the update
	        int rowsUpdated = pstmt.executeUpdate();
	        
	        // Check if update was successful and if payment status is "Completed"
	        if (rowsUpdated > 0 && "Completed".equals(paymentstatus)) {
	            enrollStudent(userid, courseid, con); // Enroll the student in the course
	            status = true; // Update status to true on successful enrollment
	        }

	    } catch (SQLException e) {
	        e.printStackTrace(); // Log the SQL error
	    }
	    
	    return status; // Return success/failure status
	}

	
	


	private void enrollStudent(int userId, int courseId, Connection conn) {
	    String enrollQuery = "INSERT INTO studentprogress (userid, courseid, progressstatus) VALUES (?, ?, 'Enrolled')";
	    try {
	        PreparedStatement psEnroll = conn.prepareStatement(enrollQuery);
	        psEnroll.setInt(1, userId);
	        psEnroll.setInt(2, courseId);
	        psEnroll.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Error enrolling student with User ID: " + userId + " and Course ID: " + courseId);
	    }
	}

}


