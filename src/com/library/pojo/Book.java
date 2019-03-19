package com.library.pojo;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book {
	private int id;
	private String type;
	private String name;
	private String number;
	private String author;
	private String press;
	private Date publicationdate;
	private BigDecimal price;
	private Integer pagecount;
	private String keyword;
	private Date createtime;	
	private int isborrow;
	private String remark;
	public Book(){
		
	}
	public Book(String type, String name, String number, String author, String press, Date publicationdate,
			BigDecimal price, Integer pagecount, Date createtime, int isborrow, String remark) {
		super();
		this.type = type;
		this.name = name;
		this.number = number;
		this.author = author;
		this.press = press;
		if(publicationdate != null){
			this.publicationdate = publicationdate;
		}
		if(price != null){
			this.price = price;
		}
		if(pagecount != null){
			this.pagecount = pagecount;
		}
		this.createtime = createtime;
		this.isborrow = isborrow;
		this.remark = remark;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Date getPublicationdate() {
		return publicationdate;
	}
	public void setPublicationdate(String publicationdate) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(publicationdate == ""){
			this.publicationdate = null;
		}else{
		    try{
		    	java.util.Date date=sdf.parse(publicationdate);
		    	this.publicationdate=date;
		    }catch (ParseException e){
		        e.printStackTrace();
		     }
		}
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price=price;
	}
	public Integer getPagecount() {
		return pagecount;
	}
	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	    try{
	        java.util.Date date=sdf.parse(createtime);
	        this.createtime=date;
	    }catch (ParseException e){
	        e.printStackTrace();
	     }
	}
	public int getIsborrow() {
		return isborrow;
	}
	public void setIsborrow(int isborrow) {
		this.isborrow = isborrow;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
