package com.sp.grooveware.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("chat.chatController")
@RequestMapping("/chat/*")
public class ChatController {

	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String method() {
		return ".chat.chat";
	}
}
 