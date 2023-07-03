package com.sp.grooveware.research;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.grooveware.member.SessionInfo;

@Controller("research.ResearchController")
@RequestMapping("/research/*")
public class ResearchController {
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String method() {
		return ".research.list";
	}
	
	@RequestMapping(value = "multipleForm", method = RequestMethod.GET)
	public String writeMultipleForm(Model model, HttpSession session) throws Exception {
	    model.addAttribute("mode", "write");
	    return ".research.multipleForm";
	}
	
	@RequestMapping(value = "multipleForm", method = RequestMethod.POST)
	public String writeMultipleSubmit(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			
		} catch (Exception e) {
			
		}
		
		return "redirect:/research/list";
	}
	
	@RequestMapping(value = "shortForm", method = RequestMethod.GET)
	public String writeShortForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");
		return ".research.shortForm";
	}
	
	@RequestMapping(value = "shortForm", method = RequestMethod.POST)
	public String writeShortSubmit(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			
		} catch (Exception e) {
			
		}
		return "redirect:/research/list";
	}
	
}

