package com.sp.grooveware.notice;

import java.net.URLDecoder;
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

import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

// 그룹웨어 

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {


	@Autowired
	private NoticeService service;

	@Autowired
	private MyUtil myUtil;
	
	
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
	                   @RequestParam(defaultValue = "all") String condition,
	                   @RequestParam(defaultValue = "") String keyword,
	                   HttpSession session,
	                   HttpServletRequest req,
	                   Model model) throws Exception {
	   
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;


		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<Notice> list = service.listNotice(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
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
	
	
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String Write2Form(Notice dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		

		try {
			dto.setEmp_no(info.getEmp_no());		
			dto.setDept_no(info.getDept_no());
			service.insertNotice(dto, "write");

		} catch (Exception e) {

		}

	    
	    return "redirect:/notice/list";
	}
}