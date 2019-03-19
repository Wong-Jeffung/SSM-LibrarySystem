package com.library.service;

import java.util.List;

import com.library.pojo.Reader;
import com.library.pojo.ReaderType;

public interface ReaderService {
public List<Reader> queryReader(String name,String type,String number);
	
	public Reader queryReaderByNumber(String number);
	
	public List<ReaderType> queryAllReaderType();
	
	public void updateReaderByNumber(Reader reader);
	
	public void addReader(Reader reader);
	
	public void deleteReaderByNumber(String number);
	
	public List<String> queryReaderNumber();
	
	public ReaderType queryReaderTypeByNumber(String number);
	
	public void updateReaderTypeById(ReaderType readerType);
	
	public void addReaderType(ReaderType readerType);
	
	public void deleteReaderTypeByNumber(String number);
}
