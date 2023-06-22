package com.sp.grooveware.insamanage;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("insaManage.insaManageController")
@RequestMapping("/insaManage/*")
public class InsaManageController {
	@Autowired
	private InsaManageService service;
	
	@RequestMapping(value= "list", method = RequestMethod.GET)
	public String method() {
		return ".insaManage.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session) throws Exception {
			
		return ".insaManage.write";
	}
	
	@RequestMapping(value= "write", method = RequestMethod.POST)
	public String writeSubmit(InsaManage dto, HttpSession session) throws Exception {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "upload" + File.separator+ "emp_picture";
			
			service.insertEmp(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/insaManage/list";
	}
	
	
}
