package com.ninfinity.dao;

import com.ninfinity.entities.Course;
import com.ninfinity.entities.Course1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CourseDAO {
    private Connection con;

    public CourseDAO(Connection con) {
        this.con = con;
    }

    // Method to get courses where progress status is "Enrolled"
    public ArrayList<Course> getEnrolledCourses(int userId) {
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            String query = "SELECT c.courseid, c.title, c.description, c.price, c.userid " +
                           "FROM courses c " +
                           "JOIN studentprogress sp ON c.courseid = sp.courseid " +
                           "WHERE sp.userid = ? AND sp.progressstatus = 'Enrolled'";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setCourseid(rs.getInt("courseid"));
                course.setCourse_name(rs.getString("title"));  // Assuming "title" is used instead of "course_name"
                course.setDescription(rs.getString("description"));
                course.setPrice(rs.getDouble("price"));  // Assuming price is a double
                course.setUserid(rs.getInt("userid"));
                courseList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
    
    
    public ArrayList<String> getCourseVideos(int courseId) {
        ArrayList<String> videoLinks = new ArrayList<>();
        try {
            String query = "SELECT video_link FROM course_links WHERE courseid = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, courseId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                videoLinks.add(rs.getString("video_link"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return videoLinks;
    }
    
    public ArrayList<Course> getAllCoursesWithInstructor() {
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            String query = "SELECT c.courseid, c.title, c.description, c.price, u.username " +
                           "FROM courses c JOIN usertable u ON c.userid = u.userid " +
                           "WHERE u.role = 'instructor'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setCourseid(rs.getInt("courseid"));
                course.setCourse_name(rs.getString("title"));
                course.setDescription(rs.getString("description"));
                course.setPrice(rs.getDouble("price"));
                course.setInstructorName(rs.getString("username"));  // Instructor's name
                courseList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
    
    public int getCourseSalesCount() {
        int salesCount = 0;
        try {
            String query = "SELECT COUNT(DISTINCT courseid, userid) FROM studentprogress WHERE progressstatus = 'Enrolled'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                salesCount = rs.getInt(1);  // Count of distinct (courseid, userid) pairs
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return salesCount;
    }
    
    public List<Course> getCourseSalesDetails() {
        List<Course> salesDataList = new ArrayList<>();

        try {
            String query = "SELECT c.title, c.description, c.price, u.username AS instructorName, " +
                           "       COUNT(DISTINCT sp.userid) AS salesCount " +
                           "FROM courses c " +
                           "LEFT JOIN studentprogress sp ON c.courseid = sp.courseid AND sp.progressstatus = 'Enrolled' " +
                           "LEFT JOIN usertable u ON c.userid = u.userid " +
                           "WHERE u.role = 'instructor' " +
                           "GROUP BY c.courseid";

            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String instructorName = rs.getString("instructorName");
                int salesCount = rs.getInt("salesCount");

                salesDataList.add(new Course(title, description, price, instructorName, salesCount));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return salesDataList;
    }
    
    public boolean addOneCourse(Course1 c1) {
		boolean status = true;

		String query = "insert into courses(title, description, price, userid) values(?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, c1.getTitle());
			pstmt.setString(2, c1.getDescription());
			pstmt.setInt(3, c1.getPrice());
			pstmt.setInt(4, c1.getUserid());

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
    
    public ArrayList<Course1> getAllInstructorMyCourse(int userid){

		ArrayList<Course1> instructorCourseList = new ArrayList<Course1>();

		String query = "select courseid, title, description, price from courses where userid = ?";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,userid);

			ResultSet result = pstmt.executeQuery();

			while(result.next()) {
				Course1 c1 = new Course1();

				c1.setCourseid(result.getInt(1));
				c1.setTitle(result.getString(2));
				c1.setDescription(result.getString(3));
				c1.setPrice(result.getInt(4));
				

				instructorCourseList.add(c1);

			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return instructorCourseList;
	}
    
    public ArrayList<Course> getAllInstructorLecture(int courseid){

		ArrayList<Course> instructorLectureList = new ArrayList<Course>();

		String query = "select courseid, course_name, video_link, id from course_links where courseid = ?";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,courseid);

			ResultSet result = pstmt.executeQuery();

			while(result.next()) {
				Course c1 = new Course();

				c1.setCourseid(result.getInt(1));
				c1.setCourse_name(result.getString(2));
				c1.setVideo_link(result.getString(3));
				c1.setId(result.getInt(4));
				

				instructorLectureList.add(c1);

			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return instructorLectureList;
	}
    
    public boolean DeleteCourseById(int courseid) {
		boolean status = false;
		
		String query = "delete from courses where courseid = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, courseid);
			
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
