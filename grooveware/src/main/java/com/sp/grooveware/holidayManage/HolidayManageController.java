package com.sp.grooveware.holidayManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("holidayManage.holidayManageController")
@RequestMapping("/holidayManage/*")
public class HolidayManageController {
	
	@RequestMapping("/list")
	public String list() {
		return ".holidayManage.list";
	}
}
