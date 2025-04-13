package com.ninfinity.entities;

public class ProcessTransaction {
	
	private String transactionid;
	private int userid;
	private int courseid;
	private int orderid;
	private String paymentstatus;
	
	
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
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
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getPaymentstatus() {
		return paymentstatus;
	}
	public void setPaymentstatus(String paymentstatus) {
		this.paymentstatus = paymentstatus;
	}
	
	
	public ProcessTransaction(String transactionid, int userid, int courseid, int orderid, String paymentstatus) {
		super();
		this.transactionid = transactionid;
		this.userid = userid;
		this.courseid = courseid;
		this.orderid = orderid;
		this.paymentstatus = paymentstatus;
		
	}
	public ProcessTransaction(String transactionid, int userid, int courseid, String paymentstatus) {
		super();
		this.transactionid = transactionid;
		this.userid = userid;
		this.courseid = courseid;
		this.paymentstatus = paymentstatus;
		
		
	}
	public ProcessTransaction() {
		super();
	}
	
	
	
	
	
	
	
	

}
