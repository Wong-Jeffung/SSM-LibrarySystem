package com.library.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.ReaderDao;
import com.library.pojo.Reader;
import com.library.pojo.ReaderType;

@Service
public class ReaderServiceImpl implements ReaderService {
	@Autowired
	private ReaderDao readerDao;
	@Override
	public List<Reader> queryReader(String name, String type, String number) {
		return readerDao.queryReader(name, type, number);
	}

	@Override
	public Reader queryReaderByNumber(String number) {
		return readerDao.queryReaderByNumber(number);
	}

	@Override
	public List<ReaderType> queryAllReaderType() {
		return readerDao.queryAllReaderType();
	}

	@Override
	public void updateReaderByNumber(Reader reader) {
		readerDao.updateReaderByNumber(reader);
		
	}

	@Override
	public void addReader(Reader reader) {
		readerDao.addReader(reader);
	}

	@Override
	public void deleteReaderByNumber(String number) {
		readerDao.deleteReaderByNumber(number);
		
	}

	@Override
	public List<String> queryReaderNumber() {
		List<String> list = new ArrayList<String>();
		List<String> list2 = readerDao.queryReaderNumber();
		for(int i = 0;i<list2.size();i++){
			String temp = "\""+list2.get(i)+"\"";
			list.add(temp);
		}
		return list;
	}

	@Override
	public ReaderType queryReaderTypeByNumber(String number) {
		return readerDao.queryReaderTypeByNumber(number);
	}

	@Override
	public void updateReaderTypeById(ReaderType readerType) {
		readerDao.updateReaderTypeById(readerType);
		
	}

	@Override
	public void addReaderType(ReaderType readerType) {
		readerDao.addReaderType(readerType);
		
	}

	@Override
	public void deleteReaderTypeByNumber(String number) {
		readerDao.deleteReaderTypeByNumber(number);
		
	}

}
