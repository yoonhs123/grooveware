package com.sp.grooveware.club.notice;

import java.io.File;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.club.Club;
import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("club.notice.ClubNoticeController")
@RequestMapping("/club/{club_id}/notice/*")
public class ClubNoticeController {
	@Autowired
	private ClubNoticeService service;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="list")
	public String list(
			@PathVariable long club_id,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("club_id", club_id);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCountClubNotice(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		Club club = service.readClub(club_id);
		
		List<ClubNotice> list = service.listClubNotice(map);
		
		model.addAttribute("club", club);
		model.addAttribute("club_id", club_id);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".club.notice.list";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm(
			@PathVariable long club_id,
			HttpSession session, Model model) throws Exception{
		
		Club club = service.readClub(club_id);
		
		model.addAttribute("club", club);
		model.addAttribute("club_id",club_id);
		model.addAttribute("mode","write");
		
		return ".club.notice.write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(
			@PathVariable long club_id,
			ClubNotice dto, HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "club";
		try {
			dto.setEmp_no(info.getEmp_no());
			dto.setClub_id(club_id);
			service.insertClubNotice(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/club/"+club_id+"/notice/list";
	}
	
	@RequestMapping(value="article", method=RequestMethod.GET)
	public String article(
			@PathVariable long club_id,
			@RequestParam long club_noti_no,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(club_noti_no);
		
		ClubNotice dto = service.readClubNotice(club_noti_no);
		if(dto== null) {
			return "redirect:/club/"+club_id+"/notice/list?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("club_id", club_id);
		map.put("emp_no", info.getEmp_no());
		map.put("club_noti_no", club_noti_no);
		
		Club club = service.readClub(club_id);
		
		ClubNotice preReadDto = service.preReadBoard(map);
		ClubNotice nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("club", club);
		model.addAttribute("club_id", club_id);
		model.addAttribute("club_noti_no", club_noti_no);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".club.notice.article";
		
	}
}
