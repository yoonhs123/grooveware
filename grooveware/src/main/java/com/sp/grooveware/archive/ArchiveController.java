package com.sp.grooveware.archive;

import java.io.File;  
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.member.SessionInfo;



@Controller("arch.archiveController")
@RequestMapping("/archive/*")
public class ArchiveController {
	
	@Autowired 
	private ArchiveService service;
	 /* 
	 * @Autowired
	 * 
	 * @Qualifier("myUtilGeneral") private MyUtil myUtil;
	 */ 
	 @Autowired 
	 private FileManager fileManager;
	 
	
	
	@RequestMapping(value="list")
	public String list(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		// dataCount = 
		
		return ".archive.list";
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String writeSubmit(Archive dto, HttpSession session) throws Exception {

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";

			service.insertFile(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/archive/list";
	}
	
	
}