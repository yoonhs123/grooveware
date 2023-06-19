package com.sp.grooveware.insainfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("insa.insaInfoController")
public class InsaController {
	 
	@RequestMapping(value="/insa", method=RequestMethod.GET)
	public String method() {
		return ".insaInfoLayout";
	}
}