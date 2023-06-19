package com.sp.grooveware.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("address.addressController")
public class addressController {
	 
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String method() {
		return ".address.list";
	}
}

