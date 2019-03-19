package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.pojo.Reader;
import com.library.pojo.ReaderType;

public interface ReaderDao {
	public List<Reader> queryReader(@Param("name")String name,@Param("type")String type,@Param("number")String number);
	
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
