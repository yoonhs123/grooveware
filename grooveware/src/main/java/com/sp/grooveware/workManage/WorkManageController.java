package com.sp.grooveware.workManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("workManage.workManageController")
@RequestMapping("/workManage/*")
public class WorkManageController {
	
	@RequestMapping("/list")
	public String list() {
	
		return ".workManage.list";
	}
	
	@GetMapping("/article")
	public String article() {
		
		return ".workManage.article";
	}
}
