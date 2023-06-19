package com.sp.grooveware.notic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("arch.noticController")
public class NoticController {
	@RequestMapping(value="notic", method=RequestMethod.GET)
	public String method() {
		return ".notic.list";
	}

}