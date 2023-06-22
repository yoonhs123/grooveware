package com.sp.grooveware.insamanage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.grooveware.member.SessionInfo;

@Controller("insaManage.insaManageController")
@RequestMapping("/insaManage/*")
public class InsaManageController {
	@Autowired
	private InsaManageService service;
	
	@RequestMapping(value= "list", method = RequestMethod.GET)
	public String method() {
		return ".insaManage.list";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profileForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("profile");
		
		return ".insaManage.profile";
	}
	
	@RequestMapping(value= "profile", method = RequestMethod.POST)
	public String profileSubmit(InsaManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setDept_no(info.getDept_no());
			service.insertEmp(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/insaManage/list";
	}
	
	
}
