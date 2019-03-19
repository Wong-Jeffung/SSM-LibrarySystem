package com.library.pojo;

import java.io.Serializable;
import java.util.Date;

public class BookType implements Serializable{
	private int id;
	private String number;
	private String name;
	private String keyword;
	private String remark;
	private Date createtime;
	public BookType(){
		
	}
	public BookType(String number, String name, String remark,Date createtime) {
		super();
		this.number = number;
		this.name = name;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}
