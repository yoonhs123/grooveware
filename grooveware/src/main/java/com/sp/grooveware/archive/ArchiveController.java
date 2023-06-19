package com.sp.grooveware.archive;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("arch.archiveController")
public class ArchiveController {
	 
	@RequestMapping(value="archive", method=RequestMethod.GET)
	public String method() {
		return ".archive.list";
	}
}