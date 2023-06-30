package com.sp.grooveware.address;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
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

import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

 
@Controller("address.addressController")
@RequestMapping("/address/*")
public class addressController {

	@Autowired
	private AddressService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	
	@RequestMapping(value="list")
	public String listForm(@RequestParam(value = "page", defaultValue = "1") int current_page,
	        @RequestParam(defaultValue = "all") String condition,
	        @RequestParam(defaultValue = "") String keyword,
	        HttpSession session,
	        HttpServletRequest req,
	        Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("emp_no", info.getEmp_no());
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Address> list = service.listAddressMember(map);
		
		String query = "";
		String listUrl = cp+ "/address/list";
		
		if(keyword.length() != 0) {
			query = "condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".address.list";
	}
	
	
	
	@RequestMapping(value="friendList")
	public String friendListForm(@RequestParam(value = "page", defaultValue = "1") int current_page,
	        @RequestParam(defaultValue = "all") String condition,
	        @RequestParam(defaultValue = "") String keyword,
	        HttpSession session,
	        HttpServletRequest req,
	        Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("emp_no", info.getEmp_no());
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Address> list = service.listAddressMember(map);
		
		String query = "";
		String listUrl = cp+ "/address/friendList";
		
		if(keyword.length() != 0) {
			query = "condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".address.friendList";
	}

	@RequestMapping(value="friendList", method=RequestMethod.POST)
	public String friendListForm() {
		return ".address.write";
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

