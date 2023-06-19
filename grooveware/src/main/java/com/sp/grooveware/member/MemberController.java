package com.sp.grooveware.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("login.loginController")
public class MemberController {
	@Autowired
	private MemberService service;
		 
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String Form() {
		return ".loginLayout";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String method(@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model) {
	
		MemberDTO dto = service.loginMember(userId);
		if(dto == null || !userPwd.equals(dto.getUserPwd())) {
				
		} else if(!userId.equals(dto.getUserId())) {
			model.addAttribute("message", "해당 아이디가 존재하지 않습니다.");
			return ".login.loginForm";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setMemberIdx(dto.getMemberIdx());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setMembership(dto.getMembership());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("member", info);
		
		return ".dashboard.main";
	}
		
}
