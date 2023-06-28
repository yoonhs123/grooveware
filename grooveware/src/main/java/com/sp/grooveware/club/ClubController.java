package com.sp.grooveware.club;

import java.io.File;
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

import com.sp.grooveware.member.SessionInfo;

@Controller("club.ClubController")
@RequestMapping("/club/*")
public class ClubController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value="list")
	public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				HttpServletRequest req,
				Model model) throws Exception {
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCountClub(map);
		if(dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1: 0);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1 ) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<Club> list = service.listClub(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".club.list";
	}
	
	@RequestMapping(value="mylist")
	public String mylist(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				HttpSession session,
				HttpServletRequest req,
				Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCountClub(map);
		if(dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1: 0);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1 ) * size;
		if(offset < 0) offset = 0;
		
		map.put("emp_no", info.getEmp_no());
		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<Club> list = service.listmyClub(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".club.mylist";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String wirteForm(HttpSession session, Model model) throws Exception{
		model.addAttribute("mode", "write");

		return ".club.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Club dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "club";
		try {
			dto.setEmp_no(info.getEmp_no());
			service.insertClub(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/club/list";
	}
	
	@RequestMapping(value= "read", method=RequestMethod.GET)
	public String read(@RequestParam long club_id,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Club dto = service.readClub(club_id);

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("club_id", club_id);
		map.put("emp_no", info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return "club/read";
		// 포워딩 시켜서 데이터 읽어오기
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinClub(Club dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setEmp_no(info.getEmp_no());
			service.joinClub(dto);
		} catch (Exception e) {
		}

		return "redirect:/club/list";
	}
	
	@RequestMapping(value = "enterclub", method = RequestMethod.GET)
	public String enterClub(Club dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setEmp_no(info.getEmp_no());
		} catch (Exception e) {
		}
		
		return ".club.enterclub";
	}
	
	
}