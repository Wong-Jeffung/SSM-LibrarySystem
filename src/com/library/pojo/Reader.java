package com.library.pojo;

import java.util.Date;

public class Reader{
	private  int id ;
	private String name;
	private String number;
	private String type;
	private String sex;
	private String workunit;
	private String homeaddress;
	private String tel;
	private String email;
	private Date createtime;
	private String remark;
	public Reader(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getWorkunit() {
		return workunit;
	}
	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}
	public String getHomeaddress() {
		return homeaddress;
	}
	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Reader(String name, String number, String type, String sex, String workunit, String homeaddress, String tel,
			String email, Date createtime, String remark) {
		super();
		this.name = name;
		this.number = number;
		this.type = type;
		this.sex = sex;
		this.workunit = workunit;
		this.homeaddress = homeaddress;
		this.tel = tel;
		this.email = email;
		this.createtime = createtime;
		this.remark = remark;
	}
	
}	
