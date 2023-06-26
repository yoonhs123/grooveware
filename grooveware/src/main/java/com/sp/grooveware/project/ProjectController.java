package com.sp.grooveware.project;

import java.lang.ProcessHandle.Info;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("project.ProjectController")
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("/project/list")
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
		map.put("login_emp", info.getEmp_no());
		
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
		List<Project> list = service.listProject(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".project.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model)throws Exception {
		model.addAttribute("mode", "write");

		return ".project.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Project dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setPj_creator(info.getEmp_no());
			service.insertProject(dto, "write");
		} catch (Exception e) {

		}
		return "redirect:/project/list";
	}
	
	
	// 친구 리스트
	@GetMapping(value = "listEmp")
	@ResponseBody
	public Map<String, Object> listEmp(
			@RequestParam String condition,
			@RequestParam String keyword,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
				
		keyword = URLDecoder.decode(keyword, "UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());
		List<Project> list = service.listEmp(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listEmp", list);
		System.out.println("listEmp" + list);
		return model;
		
		
	}

	
	@GetMapping("article")
	public String article() {
		return ".project.article";
	}
	

	@GetMapping("update")
	public String updateForm() {
		
		return null;
	}
	
	@PostMapping("update")
	public String updatesubmit() {
	
		return null;
	}
}
