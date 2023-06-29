package com.sp.grooveware.myInsa;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("profileUpdate")
	public String profileUpdateForm(@RequestParam long emp_no,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyInsa dto = myInsaService.readProfile(emp_no);

		if(dto == null || !Long.valueOf(info.getEmp_no()).equals(dto.getEmp_no())) {
			return "redirect:/myInsa/profile";
		}
		
		model.addAttribute("dto", dto);
			
		return ".myInsa.profileUpdate";
	}
	
	@PostMapping("profileUpdate")
	public String profileUpdateSubmit(MyInsa dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator+ "insaManage";
		
		try {
			myInsaService.profileUpdate(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/myInsa/profile";
	}
	
	
}
