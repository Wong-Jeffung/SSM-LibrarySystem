package com.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.LoginDao;
import com.library.pojo.Admin;
import com.library.pojo.ReaderAccount;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao loginDao;

	@Override
	public Admin queryAdminByUsernameAndPasswd(String username, String password) {
		return loginDao.queryAdminByUsernameAndPasswd(username, password);
	}

	@Override
	public ReaderAccount queryReaderAccountByUsernameAndPasswd(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
