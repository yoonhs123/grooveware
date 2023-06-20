package com.sp.grooveware.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("reservation.reservationController")
public class ReservationController {
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String method() {
		return ".reservation.list";

}
}