package com.sp.grooveware.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("approval.approvalController")
public class approvalController {
	@RequestMapping(value="approval", method=RequestMethod.GET)
	public String method() {
		return ".community.write";
	}
}
