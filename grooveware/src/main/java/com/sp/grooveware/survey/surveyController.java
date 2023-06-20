package com.sp.grooveware.survey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("survay.surveyController")
public class surveyController {
	@RequestMapping(value="/survey", method=RequestMethod.GET)
	public String method() {
		return ".survey.list";
	}
}


