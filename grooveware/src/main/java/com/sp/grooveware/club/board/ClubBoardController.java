package com.sp.grooveware.club.board;

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

import com.sp.grooveware.club.notice.ClubNotice;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("club.board.ClubBoardController")
@RequestMapping("/club/{club_id}/board/*")
public class ClubBoardController {
	@Autowired
	private ClubBoardService service;
	
	@RequestMapping(value="list")
	public String list(@PathVariable long club_id,
			@RequestParam long board_category,
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
		map.put("board_category", board_category);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCountClubBoard(map);
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
		
		List<ClubBoard> list = service.listClubBoard(map);
		
		model.addAttribute("club_id", club_id);
		model.addAttribute("board_category", board_category);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".club.board.list";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm(
			@PathVariable long club_id,
			@RequestParam long board_category,
			HttpSession session, Model model) throws Exception{
		
		model.addAttribute("club_id",club_id);
		model.addAttribute("board_category", board_category);
		model.addAttribute("mode","write");
		
		return ".club.board.write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(
			@PathVariable long club_id,
			@RequestParam long board_category,
			ClubBoard dto, HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		
		try {
			dto.setEmp_no(info.getEmp_no());
			dto.setClub_id(club_id);
			
			service.insertClubBoard(dto);
		} catch (Exception e) {
		}
		return "redirect:/club/"+club_id+"/board/list?board_category="+board_category;
	}
	
	@RequestMapping(value="article", method=RequestMethod.GET)
	public String article(
			@PathVariable long club_id,
			@RequestParam long board_category,
			@RequestParam long club_board_no,
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
		
		service.updateHitCount(club_board_no);
		
		ClubBoard dto = service.readClubBoard(club_board_no);
		if(dto== null) {
			return "redirect:/club/"+club_id+"/board/list?"+query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("club_id", club_id);
		map.put("emp_no", info.getEmp_no());
		map.put("club_board_no", club_board_no);
		map.put("board_category", board_category);
		
		ClubBoard preReadDto = service.preReadBoard(map);
		ClubBoard nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("club_id", club_id);
		model.addAttribute("club_board_no", club_board_no);
		model.addAttribute("board_category", board_category);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".club.board.article";
		
	}
}
