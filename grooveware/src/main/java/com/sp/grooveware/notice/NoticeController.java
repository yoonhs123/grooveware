package com.sp.grooveware.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.member.SessionInfo;

// 그룹웨어 

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {


	@Autowired
	private NoticeService service;

	
	
	
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
	                   @RequestParam(defaultValue = "all") String condition,
	                   @RequestParam(defaultValue = "") String keyword,
	                   HttpServletRequest req,
	                   Model model) throws Exception {
	   
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

	    return ".notice.list";
	    
	    
	    
	    
	}

	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String articleForm(Model model, HttpSession session) throws Exception {
	    model.addAttribute("mode", "article");
	    return ".notice.article";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
	    model.addAttribute("mode", "write");
	    
	    
	    
	    return ".notice.write";
	}
	
	
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String Write2Form(Notice dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		

		try {
			dto.setEmp_no(info.getEmp_no());		
			service.insertNotice(dto, "write");
		} catch (Exception e) {

		}

	    
	    return "redirect:/notice/list";
	}
}