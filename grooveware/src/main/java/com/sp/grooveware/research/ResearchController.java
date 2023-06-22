package com.sp.grooveware.research;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("research.ResearchController")
public class ResearchController {
	
	@RequestMapping(value="/research", method=RequestMethod.GET)
	public String method() {
		return ".research.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
	    model.addAttribute("mode", "write");
	    return ".research.write";
	}
	
}

