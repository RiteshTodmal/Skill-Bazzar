package com.ninfinity.entities;

public class Lecture {
 private int courseid ;
 private String video_link;
 private String course_name;
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
public Lecture(int courseid, String video_link, String course_name) {
	super();
	this.courseid = courseid;
	this.video_link = video_link;
	this.course_name = course_name;
}
public Lecture() {
	super();
	// TODO Auto-generated constructor stub
}
public Lecture(String video_link, String course_name) {
	super();
	this.video_link = video_link;
	this.course_name = course_name;
}
 

}
