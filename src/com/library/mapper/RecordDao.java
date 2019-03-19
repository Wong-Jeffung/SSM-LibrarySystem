package com.library.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.pojo.Record;

public interface RecordDao {
	public void addRecord(Record record);
	
	public void setReturnDate(@Param("bookNumber")String bookNumber,@Param("returnDate")Date returnDate);
	
	public List<Record> queryAllFullRecord();

}
