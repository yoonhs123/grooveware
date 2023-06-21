package com.sp.grooveware.insamanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("insaManage.insaManageController")
@RequestMapping("/insaManage/*")
public class InsaManageController {
	
	@RequestMapping(value= "/insaManage", method = RequestMethod.GET)
	public String method() {
		return ".insaManage.home";
	}
}