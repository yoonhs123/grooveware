package com.sp.grooveware.schedule.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.grooveware.common.MyUtil;


@Controller("calendar.calendarController")
@RequestMapping("schedule/calendar/*")
public class calendarController {
	
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
		
 
	@RequestMapping(value = "list")
	public String list() throws Exception {

		return ".schedule.calendar.list";
	}
	 
	
	
}
