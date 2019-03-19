package com.library.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.pojo.Book;
import com.library.pojo.BookType;
import com.library.pojo.Record;
import com.library.service.BookService;
import com.library.service.ReaderService;
import com.library.service.RecordService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private ReaderService readerService;
	
	@RequestMapping("/book/list")
	public String bookList(Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("bookName");
		String type = request.getParameter("bookType");
		String press = request.getParameter("bookPress");
		List<Book> bookList = bookService.queryBook(name, type, press);
		List<BookType> bookTypeList = bookService.queryAllBookType();
		List<String> bookNumberList = bookService.queryBookNumber();
		List<String> readerNumberList = readerService.queryReaderNumber();
		
		model.addAttribute("books", bookList);
		request.getSession().setAttribute("bookTypes", bookTypeList);
		request.getSession().setAttribute("bookNumbers", bookNumberList);
		request.getSession().setAttribute("readerNumbers", readerNumberList);
		model.addAttribute("bookName", name);
		model.addAttribute("bookType", type);
		return "admin_books";
	}
	
	@RequestMapping("/book/edit.action")
	public @ResponseBody Book bookEdit(String number){
		Book book = bookService.queryBookByNumber(number);
		return book;
	}
	
	@RequestMapping("/book/update.action")
	public @ResponseBody String bookUpdate(Book book){
		bookService.updateBookById(book);
		return "OK";
	}
	
	/*用book实体接收不了前端传过来的变量，只能一个一个收*/
	@RequestMapping("/book/add.action")
	public @ResponseBody String bookAdd(HttpServletRequest request) throws Exception{
		Date publicationdate = null;
		Integer pagecount = null;
		BigDecimal price = null;
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String author = request.getParameter("anthor");
		String number = request.getParameter("number");
		String press = request.getParameter("press");
		String publicationdateStr = request.getParameter("publicationdate");
		String priceStr = request.getParameter("price");
		String pagecountStr = request.getParameter("pagecount");
		String remark = request.getParameter("remark");

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String createtimeStr = sdf.format(new Date());
		Date createtime = sdf.parse(createtimeStr);
		if(publicationdateStr != ""){
			publicationdate = sdf.parse(publicationdateStr);
		}
		if(pagecountStr != ""){
			pagecount = Integer.parseInt(pagecountStr);
		}
		if(priceStr != ""){
			price = new BigDecimal(priceStr);
		}
		
		Book book = new Book(type,name,number,author,press,publicationdate,
				price,pagecount,createtime,0,remark);
		bookService.addBook(book);
		return "OK";
	}
	
	@RequestMapping("/book/delete.action")
	public @ResponseBody String bookDelete(String number){
		bookService.deleteBookByNumber(number);
		return "OK";
	}
	
	@RequestMapping("/book/lent.action")
	public @ResponseBody String lentBook(HttpServletRequest request) throws Exception{
		String bookNumber = request.getParameter("bookNumber");
		String readerNumber = request.getParameter("readerNumber");
		String remark = request.getParameter("remark");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String borrowtimeStr = sdf.format(new Date());
		Date borrowtime = sdf.parse(borrowtimeStr);
		Record record = new Record();
		record.setReaderNumber(readerNumber);
		record.setBookNumber(bookNumber);
		record.setBorrowDate(borrowtime);
		record.setRemark(remark);
		bookService.updateBookStatusByNumber(1, bookNumber);
		recordService.addRecord(record);
		return "OK";
	}
	
	@RequestMapping("/book/return.action")
	public @ResponseBody String returnBook(HttpServletRequest request) throws Exception{
		String bookNumber = request.getParameter("bookNumber");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String returntimeStr = sdf.format(new Date());
		Date returntime = sdf.parse(returntimeStr);
		bookService.updateBookStatusByNumber(0, bookNumber);
		recordService.setReturnDate(bookNumber, returntime);
		return "OK";
	}
	
	@RequestMapping("/record/list")
	public String recordList(Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		List<Record> recordList = recordService.queryAllFullRecord();
		model.addAttribute("records", recordList);
		return "record";
	}
}
