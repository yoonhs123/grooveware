package com.sp.grooveware.survay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("address.survayInfoController")
public class survayController {
	@RequestMapping(value="/survay", method=RequestMethod.GET)
	public String method() {
		return ".survayInfoLayout";
	}
}
