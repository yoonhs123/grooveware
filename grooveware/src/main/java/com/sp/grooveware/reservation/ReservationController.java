package com.sp.grooveware.reservation;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("reservation.reservationController")

public class ReservationController {
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String method() {
		return ".reservation.list";
		
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".reservation.write";
	}


}
	
