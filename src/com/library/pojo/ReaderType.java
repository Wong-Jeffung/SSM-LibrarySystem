package com.library.pojo;

import java.io.Serializable;
import java.util.Date;

public class ReaderType implements Serializable{
	private int id;
	private String number;
	private String name;
	private String borrownumber;
	private String borrowterm;
	private String remark;
	private Date createtime;
	
	public ReaderType(){
		
	}
	public ReaderType(String number, String name, String borrownumber, String borrowterm, String remark,
			Date createtime) {
		super();
		this.number = number;
		this.name = name;
		this.borrownumber = borrownumber;
		this.borrowterm = borrowterm;
		this.remark = remark;
		this.createtime = createtime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getBorrownumber() {
		return borrownumber;
	}
	public void setBorrownumber(String borrownumber) {
		this.borrownumber = borrownumber;
	}
	public String getBorrowterm() {
		return borrowterm;
	}
	public void setBorrowterm(String borrowterm) {
		this.borrowterm = borrowterm;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}
