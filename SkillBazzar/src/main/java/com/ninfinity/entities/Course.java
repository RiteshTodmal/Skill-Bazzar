package com.ninfinity.entities;






public class Course {
	private int courseid;
	private String video_link;
	private String course_name;
	
	private String description;
	private double price;
	private int userid;
	
	 private String instructorName;
	 private int salescount;
	 private int id;
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Course(String course_name, String description, double price, String instructorName, int salescount) {
		super();
		this.course_name = course_name;
		this.description = description;
		this.price = price;
		this.instructorName = instructorName;
		this.salescount = salescount;
	}
	public int getSalescount() {
		return salescount;
	}
	public void setSalescount(int salescount) {
		this.salescount = salescount;
	}
	public String getInstructorName() {
		return instructorName;
	}
	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getVideo_link() {
		return video_link;
	}
	public void setVideo_link(String video_link) {
		this.video_link = video_link;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public Course(int courseid, String video_link, String course_name) {
		super();
		this.courseid = courseid;
		this.video_link = video_link;
		this.course_name = course_name;
	}
	public Course(String video_link, String course_name) {
		super();
		this.video_link = video_link;
		this.course_name = course_name;
	}
	public Course() {
		super();
	}
	
	public Course(int courseid, String video_link, String course_name, int id) {
		super();
		this.courseid = courseid;
		this.video_link = video_link;
		this.course_name = course_name;
		this.id = id;
	}
	
	
	

}
