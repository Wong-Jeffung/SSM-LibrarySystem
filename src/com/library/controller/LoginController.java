package com.library.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.pojo.Admin;
import com.library.pojo.ReaderAccount;

import com.library.service.LoginService;


@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

    @RequestMapping(value = {"/","/login.html"})
    public String toLogin(HttpServletRequest request){
        return "index";
    }
    
    @RequestMapping("/logout.html")
    public String logout(HttpServletRequest request) {
        return "redirect:/login.html";
    }
    
    @RequestMapping("/logincheck")
    public @ResponseBody Object loginCheck(HttpServletRequest request){
    	HashMap<String, String> res = new HashMap<String, String>();
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	Admin admin = loginService.queryAdminByUsernameAndPasswd(username, password);
    	ReaderAccount readerAccount = loginService.queryReaderAccountByUsernameAndPasswd(username, password);
    	if(admin != null && readerAccount == null){
    		res.put("stateCode", "1");
    		request.getSession().setAttribute("admin",admin);
    	}else if(admin == null && readerAccount != null){
    		res.put("stateCode", "2");
    		request.getSession().setAttribute("readerAccount",readerAccount);
    	}else{
    		res.put("stateCode", "0");
    	}
    	return res;
    }
    
    @RequestMapping("/admin_main.html")
    public String toAdminMain(HttpServletResponse response) {
        return "admin_main";
    }


    @RequestMapping("/reader_mainhtml")
    public String toReaderMain(HttpServletResponse response) {
        return "reader_main";
    }
}
