package com.sp.grooveware.notic;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("notic.noticController")
@RequestMapping("/notic/*")
public class NoticController {

	
	@RequestMapping(value="notic", method=RequestMethod.GET)
	public String method() {
		return ".notic.list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");

		return ".notic.write";
	}

	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String articleForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");

		return ".notic.write";
	}

	
	
	
}