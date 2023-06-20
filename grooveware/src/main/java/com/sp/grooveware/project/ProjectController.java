package com.sp.grooveware.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("project.ProjectController")
public class ProjectController {
	
	@RequestMapping(value = "/project", method=RequestMethod.GET)
	public String method() {
		return ".project.main";
	}

}
