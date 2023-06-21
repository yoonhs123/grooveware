package com.sp.grooveware.insa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("insa.insaController")
public class InsaContoller {
	
	@RequestMapping(value = "/myInsa", method=RequestMethod.GET)
	public String method() {
		return ".myInsa.home";
	}
	
	
}
