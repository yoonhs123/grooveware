package com.sp.grooveware.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.MemberController")
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
		 
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginForm() {
		return ".loginLayout";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String emp_no,
			@RequestParam String emp_pwd,
			HttpSession session,
			Model model) {
	
		Member dto = service.loginMember(emp_no);
		
		
		if(dto == null || !emp_pwd.equals(dto.getEmp_pwd())) {
			model.addAttribute("message", "패스워드가 틀립니다.");
			return ".loginLayout";
		} else if(!emp_no.equals(Long.toString(dto.getEmp_no()))) {
			model.addAttribute("message", "해당 아이디가 존재하지 않습니다.");
			return ".loginLayout";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setEmp_no(dto.getEmp_no());
		
		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("member", info);
		info.setEmp_no(dto.getEmp_no());
		info.setEmp_name(dto.getEmp_name());
		info.setDept_no(dto.getDept_no());
		info.setDept_name(dto.getDept_name());
		
		return "redirect:/member/dashboard";
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value="dashboard", method=RequestMethod.GET)
	public String dashBoardForm() {
		return ".member.dashboard";
	}
	
	
	
		
}
