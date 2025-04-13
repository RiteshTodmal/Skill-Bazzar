package com.ninfinity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ninfinity.entities.Account;

public class AccountDAO {
	
	Connection con;
	
	public AccountDAO(Connection con) {
		this.con=con;
	}
	
	public boolean addOneAccount(Account a1) {
		boolean status = true;
		
		String query = "insert into usertable(username,email,password,role) values(?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, a1.getUsername());
			pstmt.setString(2, a1.getEmail());
			pstmt.setString(3, a1.getPassword());
			pstmt.setString(4, a1.getRole());
			
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
	
	public ArrayList<Account> getAllStudents(){

		ArrayList<Account> studentAccountList = new ArrayList<Account>();

		String query = "select * from usertable where role = 'Student'";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);

			ResultSet result = pstmt.executeQuery();

			while(result.next()) {
				Account a1 = new Account();

				a1.setUserid(result.getInt(1));
				a1.setUsername(result.getString(2));
				a1.setEmail(result.getString(3));
				a1.setPassword(result.getString(4));
				a1.setRole(result.getString(5));

				studentAccountList.add(a1);

			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studentAccountList;
	}


	public ArrayList<Account> getAllInstructors(){

		ArrayList<Account> instructorAccountList = new ArrayList<Account>();

		String query = "select * from usertable where role = 'Instructor'";

		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);

			ResultSet result = pstmt.executeQuery();

			while(result.next()) {
				Account a1 = new Account();

				a1.setUserid(result.getInt(1));
				a1.setUsername(result.getString(2));
				a1.setEmail(result.getString(3));
				a1.setPassword(result.getString(4));
				a1.setRole(result.getString(5));

				instructorAccountList.add(a1);

			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return instructorAccountList;
	}
	
	
	public Account getStudentById(int userid) {
		
		Account a1 = new Account();
		
		String query = "select * from usertable where userid =? and role = 'Student'";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userid);
			ResultSet result = pstmt.executeQuery();
			
			while (result.next()) {
				a1.setUserid(result.getInt(1));
				a1.setUsername(result.getString(2));
				a1.setEmail(result.getString(3));
				a1.setPassword(result.getString(4));
			}
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return a1;
	}
	
	public Account getInstructorById(int userid) {

		Account a1 = new Account();

		String query = "select * from usertable where userid =? and role = 'Instructor'";

		try {
			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, userid);
			ResultSet result = pstmt.executeQuery();

			while (result.next()) {
				a1.setUserid(result.getInt(1));
				a1.setUsername(result.getString(2));
				a1.setEmail(result.getString(3));
				a1.setPassword(result.getString(4));
			}
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return a1;
	}
	
	
	public boolean UpdateOneStudent(Account a1) {
		boolean status = false;
		
		String query = "update usertable set username = ? ,email = ? ,password = ? ,role = ? where userid = ? ";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,a1.getUsername());
			pstmt.setString(2,a1.getEmail());
			pstmt.setString(3,a1.getPassword());
			pstmt.setString(4,a1.getRole());
			pstmt.setInt(5,a1.getUserid());
			
			int n =pstmt.executeUpdate();
			con.close();
			if(n==1) {
				status = true ; 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public boolean DeleteUserById(int userid) {
		boolean status = false;
		
		String query = "delete from usertable where userid = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userid);
			
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
