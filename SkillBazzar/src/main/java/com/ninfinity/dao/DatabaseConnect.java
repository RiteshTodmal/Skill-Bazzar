package com.ninfinity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnect {
	
	public static Connection con;
	
	public static Connection connect() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Mil Gaya");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/skillbazzardb","root", "Pass@123");
			System.out.println("Connection Mil Gaya");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(con);
		
		return con;
	}

}
