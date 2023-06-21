package com.sp.grooveware.club;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("club.board.ClubBoardController")
public class ClubBoardController {
	@RequestMapping(value="/club", method=RequestMethod.GET)
	public String method() {
		return ".club.list";
	}
}


