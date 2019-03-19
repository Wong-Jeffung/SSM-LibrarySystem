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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.library.pojo.ReaderType;
import com.library.service.ReaderService;

@Controller
public class ReaderTypeController {
	@Autowired
	private ReaderService readerService;
	
	@RequestMapping("/readertype/list")
	public String readerTypeList(Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		List<ReaderType> readerTypeList = readerService.queryAllReaderType();
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(readerTypeList);
		System.out.println(jsonStr);
		model.addAttribute("readerTypes", readerTypeList);  //前端foreach标签好像解析不了json
		model.addAttribute("readerTypesJSON", jsonStr);
		return "admin_readertype";
	}
	
	@RequestMapping("/readertype/edit.action")
	public @ResponseBody ReaderType readerTypeEdit(String number){
		ReaderType readertype = readerService.queryReaderTypeByNumber(number);
		return readertype;
	}
	
	@RequestMapping("/readertype/update.action")
	public @ResponseBody String readerTypeUpdate(ReaderType readerType){
		readerService.updateReaderTypeById(readerType);
		return "OK";
	}
	
	@RequestMapping("/readertype/add.action")
	public @ResponseBody String readerTypeAdd(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String borrownumber = request.getParameter("borrownumber");
		String borrowterm = request.getParameter("borrowterm");
		String remark = request.getParameter("remark");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String createtimeStr = sdf.format(new Date());
		Date createtime = sdf.parse(createtimeStr);
		ReaderType readerType = new ReaderType(number, name, borrownumber, borrowterm, remark, createtime);
		readerService.addReaderType(readerType);
		return "OK";	
	}
	
	@RequestMapping("/readertype/delete.action")
	public @ResponseBody String readerTypeDelete(String number){
		readerService.deleteReaderTypeByNumber(number);
		return "OK";
	}
}
