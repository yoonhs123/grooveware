package com.sp.grooveware.notice;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;

// 그룹웨어 

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {


	@Autowired 
	private NoticeService service;

	@RequestMapping(value="list", method=RequestMethod.GET)
	public String method() {
		return ".notice.list";
	}

	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String articleForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "article");
		
		return ".notice.article";
	}
	

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");

		return ".notice.write";
	}


	
	
	
}