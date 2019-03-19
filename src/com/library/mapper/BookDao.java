package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.pojo.Book;
import com.library.pojo.BookType;

public interface BookDao {
	public List<Book> queryBook(@Param("name")String name,@Param("type")String type,@Param("press")String press);
	
	public Book queryBookByNumber(String number);
	
	public List<BookType> queryAllBookType();
	
	public void updateBookById(Book book);
	
	public void addBook(Book book);
	
	public void deleteBookByNumber(String number);
	
	public List<String> queryBookNumber();
	
	public void updateBookStatusByNumber(@Param("isborrow")int isborrow,@Param("number")String number);
	
	public BookType queryBookTypeByNumber(String number);
	
	public void updateBookTypeById(BookType bookType);
	
	public void addBookType(BookType bookType);
	
	public void deleteBookTypeByNumber(String number);
	
}
