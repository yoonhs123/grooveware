package com.sp.grooveware.task;

import java.io.File;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("task.taskController")
@RequestMapping("/task/*")
public class TaskController {

    @Autowired
    private TaskService service;
    
    @Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
    
    @Autowired
    private FileManager fileManager;
    
    @RequestMapping(value = "/listreceive")
    public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
    		@RequestParam(defaultValue = "task_name") String condition,
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
			total_page = myUtil.pageCount(dataCount, size);
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
		List<Task> list = service.listTask(map);
		
		// 페이징 처리
		String cp = req.getContextPath();
		String query = "size=" + size;
		String listUrl = cp + "/task/listreceive";
		String articleUrl = cp + "/task/receivearticle?page=" + current_page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
    	return ".task.listreceive";
    }
    	
    
    
    @RequestMapping(value = "/listsend")
    public String listSend(@RequestParam(value = "page", defaultValue = "1") int current_page,
    		@RequestParam(defaultValue = "task_name") String condition,
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
    	
    	dataCount = service.dataCount1(map);
    	if (dataCount != 0) {
    		total_page = myUtil.pageCount(dataCount, size);
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
    	List<Task> list = service.listTask1(map);
    	
    	// 페이징 처리
    	String cp = req.getContextPath();
    	String query = "size=" + size;
    	String listUrl = cp + "/task/listsend";
    	String articleUrl = cp + "/task/sendarticle?page=" + current_page;
    	if (keyword.length() != 0) {
    		query += "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
    	}
    	
    	listUrl += "?" + query;
    	articleUrl += "&" + query;
    	
    	String paging = myUtil.paging(current_page, total_page, listUrl);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("page", current_page);
    	model.addAttribute("dataCount", dataCount);
    	model.addAttribute("size", size);
    	model.addAttribute("total_page", total_page);
    	model.addAttribute("paging", paging);
    	model.addAttribute("articleUrl", articleUrl);
    	
    	model.addAttribute("condition", condition);
    	model.addAttribute("keyword", keyword);
    	
    	return ".task.listsend";
    }
    
    
    
    
    
    
    
    @RequestMapping(value ="write", method = RequestMethod.GET)
    public String writeForm(@RequestParam long goal_no,
    		@RequestParam long pj_no,
    		HttpSession session,
    		Model model) throws Exception {
    	
    	String goal_name = service.readGoalname(goal_no);
    	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("login_emp", info.getEmp_no());
		map.put("goal_no", goal_no);
		
    	List<Task> goal_member = service.listGoalmember(map);
    	
    	model.addAttribute("goal_no", goal_no);
    	model.addAttribute("pj_no", pj_no);
    	model.addAttribute("goal_name", goal_name);
    	model.addAttribute("mode", "write");
    	model.addAttribute("goal_member", goal_member);
    	
    	return ".task.write";
    }
    
    
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String writeSubmit(Task dto,
    		@RequestParam long goal_no,
    		@RequestParam long pj_no,
    		HttpSession session) throws Exception {
    	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "task";
    	
    	try {
    		
    		dto.setTask_manager(info.getEmp_no());
    		dto.setGoal_no(goal_no);
    		service.insertTask(dto, pathname);
			
		} catch (Exception e) {

			e.printStackTrace();
		}
    	
    	return "redirect:/goal/article?goal_no="+goal_no+"&pj_no="+pj_no;
    }
    
    
    
    
    @RequestMapping(value = "newTaskCount")
	@ResponseBody
	public Map<String, Object> newNoteCount(HttpSession session) throws Exception {
		String state = "true";
		int newCount = 0;
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			long emp_no = info.getEmp_no();
			
			newCount = service.newTaskCount(emp_no);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("newCount", newCount);
		
		return map;
	}
    
    
    @GetMapping("receivearticle")
    public String receivearticle(@RequestParam long task_no,
    		@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam int size,
			Model model) throws Exception {
    	
    	keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page + "&size=" + size;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8"); 
		}
    	
    	// 해당 레코드 가져오기
		Task dto = service.readTask(task_no);
		
		if(dto == null) {
			return "redirect:/task/listreceive?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("size", size);
		model.addAttribute("page", page);
		
		
		
    	return ".task.receivearticle";
    }
    
	
    @GetMapping("sendarticle")
    public String sendarticle(@RequestParam long task_no,
    		@RequestParam String page,
    		@RequestParam(defaultValue = "all") String condition,
    		@RequestParam(defaultValue = "") String keyword,
    		@RequestParam int size,
    		Model model) throws Exception {
    	
    	keyword = URLDecoder.decode(keyword, "utf-8");
    	
    	String query = "page=" + page + "&size=" + size;
    	if (keyword.length() != 0) {
    		query += "&condition=" + condition + 
    				"&keyword=" + URLEncoder.encode(keyword, "UTF-8"); 
    	}
    	
    	// 해당 레코드 가져오기
    	Task dto = service.readTask1(task_no);
    	
    	if(dto == null) {
    		return "redirect:/task/listsend?" + query;
    	}
    	
    	model.addAttribute("dto", dto);
    	model.addAttribute("query", query);
    	model.addAttribute("size", size);
    	model.addAttribute("page", page);
    	
    	
    	
    	return ".task.sendarticle";
    }
    
    @RequestMapping(value = "submit", method = RequestMethod.GET)
    public String submitForm(
    		@RequestParam long task_no,
    		@RequestParam String page,
    		@RequestParam(defaultValue = "all") String condition,
    		@RequestParam(defaultValue = "") String keyword,
    		@RequestParam int size,
    		HttpSession session,
    		Model model) throws Exception {
    	
    	keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page + "&size=" + size;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8"); 
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
    	Task dto = service.readTask(task_no);
    	
    	if(dto == null || !(info.getEmp_no() == dto.getTask_member_no())) {
    		return "redirect:/task/receivearticle?" + query + "&task_no" + task_no;
    	}
    	
    	model.addAttribute("dto", dto);
    	model.addAttribute("query", query);
    	model.addAttribute("task_no", task_no);
    			
    	return ".task.submit";
    }
    
    @RequestMapping(value = "submit", method = RequestMethod.POST)
    public String submitSubmit(Task dto,
    		@RequestParam long task_no,
    		HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");

    	String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "task";
		
		dto.setTask_no(task_no);
		dto.setTask_member_no(info.getEmp_no());
		
		try {
			service.submitTask(dto,pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
    	return "redirect:/task/listreceive";
    	
    }

    
    
    
    
    
    
    
    
}

