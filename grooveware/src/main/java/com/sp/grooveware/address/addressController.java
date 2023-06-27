package com.sp.grooveware.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

 
@Controller("address.addressController")
@RequestMapping("/address/*")
public class addressController {

	
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String listForm()  {
		return ".address.list";
	}
	
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm() {
		return ".address.write";
	}
	
	@RequestMapping(value="article", method=RequestMethod.GET)
	public String articleForm() {
		return ".address.article";
	}
	
	
	
	
	
}

