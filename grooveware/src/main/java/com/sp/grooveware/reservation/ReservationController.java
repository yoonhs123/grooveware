package com.sp.grooveware.reservation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.grooveware.common.MyUtil;

@Controller("reservation.reservationController")
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	private ReservationService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		return ".reservation.main";
		
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".reservation.write";
	}
	



}
	
