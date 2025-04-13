package com.ninfinity.entities;

public class Course1 {
	private int courseid;
	private String title;
	private String description;
	private int price;
	private int userid;
	
	public Course1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Course1(int courseid, String title, String description, int price, int userid) {
		super();
		this.courseid = courseid;
		this.title = title;
		this.description = description;
		this.price = price;
		this.userid = userid;
	}
	public int getCourseid() {
		return courseid;
	}
	public Course1(String title, String description, int price, int userid) {
		super();
		this.title = title;
		this.description = description;
		this.price = price;
		this.userid = userid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
	
}