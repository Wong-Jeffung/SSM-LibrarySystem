package com.library.service;

import java.util.List;

import com.library.pojo.Book;
import com.library.pojo.BookType;

public interface BookService {
	public List<Book> queryBook(String name,String type,String press);
	
	public Book queryBookByNumber(String number);
	
	public List<BookType> queryAllBookType();
	
	public void updateBookById(Book book);
	
	public void addBook(Book book);
	
	public void deleteBookByNumber(String number);
	
	public List<String> queryBookNumber();
	
	public void updateBookStatusByNumber(int isborrow,String number);
	
	public BookType queryBookTypeByNumber(String number);
	
	public void updateBookTypeById(BookType bookType);
	
	public void addBookType(BookType bookType);
	
	public void deleteBookTypeByNumber(String number);
}
