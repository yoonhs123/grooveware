package com.sp.grooveware.chat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("chat.ChatController")
@RequestMapping("/chat/*")
public class ChatController {

	
	@RequestMapping("chat")
	public String main(
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();
		String wsURL = "ws://"+req.getServerName()+":"+req.getServerPort()+cp+"/chat.msg";
		model.addAttribute("wsURL", wsURL);
		
		return ".chat.chat";
	}
	
}
 