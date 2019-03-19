package com.library.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.BookDao;
import com.library.pojo.Book;
import com.library.pojo.BookType;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookDao bookDao;

	@Override
	public List<Book> queryBook(String name,String type,String press) {
		return bookDao.queryBook(name, type, press);
	}

	@Override
	public Book queryBookByNumber(String number) {
		return bookDao.queryBookByNumber(number);
	}

	@Override
	public List<BookType> queryAllBookType() {
		return bookDao.queryAllBookType();
	}

	@Override
	public void updateBookById(Book book) {
		bookDao.updateBookById(book);
		
	}

	@Override
	public void addBook(Book book) {
		bookDao.addBook(book);
		
	}

	@Override
	public void deleteBookByNumber(String number) {
		bookDao.deleteBookByNumber(number);
		
	}

	@Override
	/**
	 * 通过dao获取的list传到前端时，list中的元素是没有""的，前端无法解析成字符串，会被当成变量而报错，所以需要加上""，在传到前端
	 */
	public List<String> queryBookNumber() {
		List<String> list = new ArrayList<String>();
		List<String> list2 = bookDao.queryBookNumber();
		for(int i = 0;i<list2.size();i++){
			String temp = "\""+list2.get(i)+"\"";
			list.add(temp);
		}
		return list;
	}

	@Override
	public void updateBookStatusByNumber(int isborrow, String number) {
		bookDao.updateBookStatusByNumber(isborrow, number);
		
	}

	@Override
	public BookType queryBookTypeByNumber(String number) {
		return bookDao.queryBookTypeByNumber(number);
	}

	@Override
	public void updateBookTypeById(BookType bookType) {
		bookDao.updateBookTypeById(bookType);
		
	}

	@Override
	public void addBookType(BookType bookType) {
		bookDao.addBookType(bookType);
		
	}

	@Override
	public void deleteBookTypeByNumber(String number) {
		bookDao.deleteBookTypeByNumber(number);
		
	}

}
