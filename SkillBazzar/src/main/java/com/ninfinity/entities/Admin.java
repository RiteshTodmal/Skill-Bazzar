package com.ninfinity.entities;

public class Admin {
	private String paymentstatus;
	private int orderid;
	private int userid;
	private int courseid;
	public Admin() {
		super();
	}
	public Admin(String paymentstatus, int userid, int courseid, String transactionid) {
		super();
		this.paymentstatus = paymentstatus;
		this.userid = userid;
		this.courseid = courseid;
		this.transactionid = transactionid;
	}
	public Admin(String paymentstatus, int orderid) {
		super();
		this.paymentstatus = paymentstatus;
		this.orderid = orderid;
	}
	public Admin(String paymentstatus, int orderid, int userid, int courseid, String transactionid) {
		super();
		this.paymentstatus = paymentstatus;
		this.orderid = orderid;
		this.userid = userid;
		this.courseid = courseid;
		this.transactionid = transactionid;
	}
	private String transactionid;
	public String getPaymentstatus() {
		return paymentstatus;
	}
	public void setPaymentstatus(String paymentstatus) {
		this.paymentstatus = paymentstatus;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
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
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	

}
