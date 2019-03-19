package com.library.service;

import com.library.pojo.Admin;
import com.library.pojo.ReaderAccount;

public interface LoginService {
	public Admin queryAdminByUsernameAndPasswd(String username,String password);
	
	public ReaderAccount queryReaderAccountByUsernameAndPasswd(String username,String password);
}
