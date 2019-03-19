package com.library.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.RecordDao;
import com.library.pojo.Record;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;

	@Override
	public void addRecord(Record record) {
		recordDao.addRecord(record);
	}

	@Override
	public void setReturnDate(String bookNumber, Date returnDate) {
		recordDao.setReturnDate(bookNumber, returnDate);
		
	}

	@Override
	public List<Record> queryAllFullRecord() {
		return recordDao.queryAllFullRecord();
	}

}
