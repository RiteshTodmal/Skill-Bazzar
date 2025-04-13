package com.ninfinity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ninfinity.entities.Course;
import com.ninfinity.entities.Lecture;



public class LectureDAO {
	
	Connection con;

	public LectureDAO(Connection con) {
		this.con=con;
	}

	public boolean addOneLecture(Lecture l1) {
		boolean status = true;

		String query = "insert into course_links(courseid, video_link, course_name) values(?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, l1.getCourseid());
			pstmt.setString(2, l1.getVideo_link());
			pstmt.setString(3, l1.getCourse_name());
			
			int n = pstmt.executeUpdate();

			if(n==1) {
				status=true;
			}else {
				status=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;	
	}
	
	public Course getLectureById(int id) {
	    Course c1 = new Course();
	    
	    String query = "SELECT id, video_link, course_name FROM course_links WHERE id = ?"; // Fix: Included id field
	    
	    try {
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setInt(1, id);
	        ResultSet result = pstmt.executeQuery();

	        if (result.next()) {
	            c1.setId(result.getInt("id"));  // Fix: Setting ID correctly
	            c1.setVideo_link(result.getString("video_link"));
	            c1.setCourse_name(result.getString("course_name"));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return c1;
	}

	
	public boolean UpdateOneLecture(Course c1) {
	    boolean status = false;
	    
	    String query = "UPDATE course_links SET video_link = ?, course_name = ? WHERE id = ?";
	    
	    try {
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, c1.getVideo_link());
	        pstmt.setString(2, c1.getCourse_name());
	        pstmt.setInt(3, c1.getId()); // Set the ID correctly in WHERE clause
	        
	        int n = pstmt.executeUpdate();
	        
	        if (n == 1) {
	            status = true; 
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return status;
	}

	
	public boolean DeleteLectureById(int id) {
		boolean status = false;
		
		String query = "delete from course_links where id = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, id);
			
			int n = pstmt.executeUpdate();
			
			if(n==1) {
				status = true;
			}
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
}
