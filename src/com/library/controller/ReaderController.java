package com.library.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.pojo.Reader;
import com.library.pojo.ReaderType;
import com.library.service.ReaderService;

@Controller
public class ReaderController {
	@Autowired
	private ReaderService readerService ;
	
	@RequestMapping("/reader/list")
	public String readerList(Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("readerName");
		String type = request.getParameter("readerType");
		String number = request.getParameter("readerNumber");
		List<Reader> readerList = readerService.queryReader(name, type, number);
		List<ReaderType> readerTypeList = readerService.queryAllReaderType();
		List<String> readerNumberList = readerService.queryReaderNumber();
		
		model.addAttribute("readers", readerList);
		request.getSession().setAttribute("readerTypes", readerTypeList);
		request.getSession().setAttribute("readerNumbers", readerNumberList);
		model.addAttribute("readerName", name);
		model.addAttribute("readerType", type);
		model.addAttribute("readerNumber", number);
		return "admin_readers";
	}
	
	@RequestMapping("/reader/edit.action")
	public @ResponseBody Reader readerEdit(String number){
		Reader reader = readerService.queryReaderByNumber(number);
		return reader;
	}
	
	@RequestMapping("/reader/update.action")
	public @ResponseBody String readerUpdate(Reader reader){
		readerService.updateReaderByNumber(reader);
		return "OK";
	}
	
	@RequestMapping("/reader/add.action")
	public @ResponseBody String readerAdd(HttpServletRequest request) throws Exception{
		/*private  int id ;
		private String name;
		private String number;
		private String type;
		private String sex;
		private String workunit;
		private String homeaddress;
		private String tel;
		private String email;
		private Date createtime;
		private String remark;*/
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String number = request.getParameter("number");
		String sex = request.getParameter("sex");
		String workunit = request.getParameter("workunit");
		String homeaddress = request.getParameter("homeaddress");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String remark = request.getParameter("remark");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String createtimeStr = sdf.format(new Date());
		Date createtime = sdf.parse(createtimeStr);
		
		Reader reader = new Reader(name, number, type, sex, workunit, homeaddress, tel, email, createtime, remark);
		
		readerService.addReader(reader);
		return "OK";
		
	}
	
	@RequestMapping("/reader/delete.action")
	public @ResponseBody String readerDelete(String number){
		readerService.deleteReaderByNumber(number);
		return "OK";
	}
}
