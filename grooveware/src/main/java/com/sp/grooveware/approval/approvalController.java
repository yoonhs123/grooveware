package com.sp.grooveware.approval;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("approval.approvalController")
@RequestMapping("/approval/*")

public class approvalController {
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String method() {
		return ".approval.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".approval.write";
	}
	
}
