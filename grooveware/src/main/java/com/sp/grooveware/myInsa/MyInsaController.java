package com.sp.grooveware.myInsa;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.grooveware.member.SessionInfo;

@Controller("myInsa.myInsaController")
@RequestMapping("/myInsa/*")
public class MyInsaController {
	
	@Autowired
	private MyInsaService myInsaService;
	
	@RequestMapping("insaCard")
	public String articleInsaCard(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		MyInsa dto = myInsaService.readInsaCard(info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return ".myInsa.insaCard";
	}
	
	@RequestMapping("profile")
	public String articleProfile(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		MyInsa dto = myInsaService.readProfile(info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return ".myInsa.profile";
	}
	
}
