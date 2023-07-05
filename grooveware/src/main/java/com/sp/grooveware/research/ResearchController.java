package com.sp.grooveware.research;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.member.SessionInfo;

@Controller("research.ResearchController")
@RequestMapping("/research/*")
public class ResearchController {
	@Autowired
	private ResearchService service;
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list() {
		
		return ".research.list";
	}
	
	@RequestMapping(value = "multipleForm", method = RequestMethod.GET)
	public String writeMultipleForm(HttpSession session, Model model) throws Exception {
	    
		model.addAttribute("mode", "write");
	    
		return ".research.multipleForm";
	}
	
	@RequestMapping(value = "multipleForm", method = RequestMethod.POST)
	public String writeMultipleSubmit(
			Research dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setEmp_no(info.getEmp_no());
			service.insertResearch(dto);
		} catch (Exception e) {
		}
		return "redirect:/research/list";
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(
			@RequestParam long research_id,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Research dto = service.readResearch(research_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("research_id", research_id);
		map.put("emp_no", info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
	    return "research/article";
	}
	
	@RequestMapping(value = "result", method = RequestMethod.GET)
	public String result(Model model, HttpSession session) throws Exception {

		return "research/result";
	}
	
	
}

