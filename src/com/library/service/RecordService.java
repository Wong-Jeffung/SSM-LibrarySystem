package com.library.service;

import java.util.Date;
import java.util.List;

import com.library.pojo.Record;

public interface RecordService {
	public void addRecord(Record record);
	
	public void setReturnDate(String bookNumber,Date returnDate);
	
	public List<Record> queryAllFullRecord();

}
