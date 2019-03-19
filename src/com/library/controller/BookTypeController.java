package com.library.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.library.pojo.BookType;
import com.library.service.BookService;

@Controller
public class BookTypeController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/booktype/list")
	public String bookTypeList(Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		List<BookType> bookTypeList = bookService.queryAllBookType();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(bookTypeList);
		System.out.println(jsonStr);
		model.addAttribute("bookTypes", bookTypeList);  //前端foreach标签好像解析不了json
		model.addAttribute("bookTypesJSON", jsonStr);
		return "admin_booktype";
	}
	
	@RequestMapping("/booktype/edit.action")
	public @ResponseBody BookType bookTypeEdit(String number){
		BookType booktype = bookService.queryBookTypeByNumber(number);
		return booktype;
	}
	
	@RequestMapping("/booktype/update.action")
	public @ResponseBody String bookTypeUpdate(BookType bookType){
		bookService.updateBookTypeById(bookType);
		return "OK";
	}
	
	@RequestMapping("/booktype/add.action")
	public @ResponseBody String bookTypeAdd(HttpServletRequest request) throws Exception{
		/*private int id;
		private String number;
		private String name;
		private String keyword;
		private String remark;*/
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String remark = request.getParameter("remark");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String createtimeStr = sdf.format(new Date());
		Date createtime = sdf.parse(createtimeStr);
		BookType bookType = new BookType(number, name, remark,createtime);
		bookService.addBookType(bookType);
		return "OK";	
	}
	
	@RequestMapping("/booktype/delete.action")
	public @ResponseBody String bookTypeDelete(String number){
		bookService.deleteBookTypeByNumber(number);
		return "OK";
	}
}
