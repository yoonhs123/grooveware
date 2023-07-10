package com.sp.grooveware.research;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.member.SessionInfo;

@Controller("research.ResearchController")
@RequestMapping("/research/*")
public class ResearchController {
	@Autowired
	private ResearchService service;
	
	@RequestMapping(value="researchBox")
	public String researchBox(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			HttpSession session,
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
		map.put("emp_no", info.getEmp_no());
		
		dataCount = service.dataCountResearchList(map);
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
		List<Research> list = service.listResearch(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
			
		return ".research.researchBox";
	}
	
	@RequestMapping(value="{category}/list")
	public String list(
			@PathVariable String category,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			HttpSession session,
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
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());
		
		dataCount = service.dataCountOpenList(map);
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
		List<Research> list = service.researchListStatus(map);
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".research.list";
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String writeResearchForm(HttpSession session, Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".research.researchForm";
	}
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String writeResearchSubmit(
			Research dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setEmp_no(info.getEmp_no());
			service.insertResearchForm(dto);
		} catch (Exception e) {
		}
		return "redirect:/research/researchBox";
	}
	
	@RequestMapping(value="{research_id}/multipleForm", method = RequestMethod.GET)
	public String writeMultipleForm(
			@PathVariable long research_id,
			HttpSession session,
			Model model) throws Exception {
	    
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("research_id", research_id);
		map.put("emp_no", info.getEmp_no());

		
		Research research = service.readresearchBox(research_id);
		
		model.addAttribute("mode", "write");
		model.addAttribute("research_id", research_id);
		model.addAttribute("research", research);
	    
		return ".research.multipleForm";
	}
	
	@RequestMapping(value="{research_id}/multipleForm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeMultipleSubmit(
			@PathVariable long research_id,
			Research dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		try {
			dto.setEmp_no(info.getEmp_no());
			service.insertResearchQna(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		return map;
	}
	
	@RequestMapping(value = "{research_id}/article", method = RequestMethod.GET)
	public String article(
			@PathVariable long research_id,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("research_id", research_id);
		map.put("emp_no", info.getEmp_no());
		
		Research dto = service.readresearchQuset(research_id);
		
		List<Research> list = service.readResearch(map);
			
		model.addAttribute("research_id", research_id);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);

	    return ".research.article";
	}
	
	@RequestMapping(value = "open/{research_id}/choice", method = RequestMethod.GET)
	public String choiceForm(
			@PathVariable long research_id,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("research_id", research_id);
		map.put("emp_no", info.getEmp_no());
		
		Research dto = service.readresearchQuset(research_id);
		
		List<Research> list = service.readResearch(map);
			
		model.addAttribute("research_id", research_id);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);

		return ".research.choice";
	}
	
	@RequestMapping(value = "open/{research_id}/choice", method = RequestMethod.POST)
	public String choiceSubmit(
			@PathVariable long research_id,
			Research dto,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setEmp_no(info.getEmp_no());
			dto.setResearch_id(research_id);
			
			service.responseResearch(dto);
		} catch (Exception e) {
		}		

		return "redirect:/research/open/list";
	}
	
	@RequestMapping(value = "{research_id}/update")
	public String delete(
			@PathVariable long research_id,
			HttpSession session) throws Exception {
		try {
			service.updateStatusResearch(research_id);
		} catch (Exception e) {
		}

		return "redirect:/research/{research_id}/article";
	}
	
	@RequestMapping(value = "{category}/{research_id}/result", method = RequestMethod.GET)
	public String result(
			@PathVariable String category,
			@PathVariable long research_id,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("research_id", research_id);
		map.put("emp_no", info.getEmp_no());
		map.put("category", category);
		
		Research dto = service.readresearchQuset(research_id);
		
		List<Research> list = service.readResearch(map);
			
		model.addAttribute("research_id", research_id);
		model.addAttribute("category", category);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);

		return ".research.result";
	}
	
	
}

