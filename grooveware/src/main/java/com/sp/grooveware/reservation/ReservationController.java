package com.sp.grooveware.reservation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.grooveware.common.MyUtil;

@Controller("reservation.ReservationController")
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	private ReservationService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		return ".schedule.reservation.main";
		
	}
	
	@RequestMapping(value="resform", method=RequestMethod.GET)
	public String resForm() {
		return ".schedule.reservation.resform";
		
	}
	
	/*
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".schedule.reservation.main";
	}
	*/
	



}
	
