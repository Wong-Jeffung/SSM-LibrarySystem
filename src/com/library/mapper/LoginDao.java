package com.library.mapper;

import org.apache.ibatis.annotations.Param;

import com.library.pojo.Admin;
import com.library.pojo.ReaderAccount;

public interface LoginDao {
	public Admin queryAdminByUsernameAndPasswd(@Param("username")String username,@Param("password")String password);
	
	public ReaderAccount queryReaderAccountByUsernameAndPasswd(@Param("username")String username,@Param("password")String password);
}
