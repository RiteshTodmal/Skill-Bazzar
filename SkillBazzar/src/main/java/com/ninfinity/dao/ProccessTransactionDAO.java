package com.ninfinity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.ninfinity.entities.ProcessTransaction;

public class ProccessTransactionDAO {
    Connection con;

    public ProccessTransactionDAO(Connection con) {
        this.con = con;
    }

    public boolean EnrollStudent(ProcessTransaction p1) {
        boolean status = false;  // Default to false until we confirm success

        String query = "INSERT INTO orders(userid, courseid, transactionid, paymentstatus) VALUES (?, ?, ?, 'Pending')";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, p1.getUserid());
            pstmt.setInt(2, p1.getCourseid());
            pstmt.setString(3, p1.getTransactionid());

            int n = pstmt.executeUpdate();  // Execute insert into orders table
            System.out.println("SQL Query Executed: Insert into orders. Rows affected: " + n);

            if (n == 1) {
                //enrollStudent(p1.getUserid(), p1.getCourseid(), con);  // If order inserted, enroll student
                status = true;
            }
        } catch (SQLException e) {
            System.out.println("Error while inserting order: " + e.getMessage());
            e.printStackTrace();
        }
        return status;
    }

    
}
