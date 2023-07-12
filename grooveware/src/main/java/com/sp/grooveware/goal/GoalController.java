package com.sp.grooveware.goal;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.sp.grooveware.member.SessionInfo;
import com.sp.grooveware.task.Task;

@Controller("goal.goalController")
@RequestMapping("/goal/*")
public class GoalController {

    @Autowired
    private GoalService service;
    
    @Autowired
    private FileManager fileManager;
    
    @RequestMapping(value = "/list")
    public String list(HttpSession session,
    					HttpServletRequest req,
    					@RequestParam long pj_no,
    					Model model) throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();

    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	map.put("login_emp", info.getEmp_no());
    	map.put("pj_no", pj_no);
    	
    	List<Goal> list = service.listGoal(map);
    	
    	Goal dto = service.readPjname(pj_no);
    	
    	
    	// article Url
    	String cp = req.getContextPath();
    	String articleUrl = cp + "/goal/article?goal_no=";
    	
    	int dataCount = 0;
    	dataCount = service.dataCount(pj_no);

    	int pj_status = 0;
    	pj_status = service.readstatus(pj_no);
    	
		int qualify = service.readAcess(map);
    	
    	
    	model.addAttribute("dataCount", dataCount);
    	model.addAttribute("pj_status", pj_status);
    	model.addAttribute("articleUrl", articleUrl);
    	model.addAttribute("pj_no", pj_no);
    	model.addAttribute("list", list);
    	model.addAttribute("pj_name", dto.getPj_name());
    	model.addAttribute("qualify", qualify);
    	
    	return ".goal.list";
    }
    
    
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeForm(HttpSession session,
				    		@RequestParam long pj_no,
				    		Model model) throws Exception {
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("pj_no", pj_no);
    	
    	
    	
    	
    	
    	List<Goal> depth_0 = service.listDepth1(map);		// 최상위 밑에 상위
    	List<Goal> depth_1 = service.listDepth2(map);		// 상위 밑에 하위
    	
    	
    	model.addAttribute("pj_no", pj_no);
    	model.addAttribute("mode", "write");
    	model.addAttribute("listdepth_0", depth_0);
    	model.addAttribute("listdepth_1", depth_1);
    	
    	
    	return ".goal.write";
    }
    
    
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String writeSubmit(Goal dto,
    						@RequestParam long pj_no,
    						@RequestParam long parent,
    						HttpSession session) throws Exception {
    	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "goal";
    	
    	Goal dto1 = new Goal();
    	
    	dto1 = service.selectParent(parent);
    	
    	
    	dto.setPj_no(pj_no);
    	dto.setLogin_emp(info.getEmp_no());
    	
    	
    	try {
    		if(dto1 == null) {	// 최상위목표로 인서트  
    			
    			
    			service.insertGoal1(dto, pathname);	
    		
    		} else  {	// 상위목표로 인서트	
    			dto.setParent(dto1.getGoal_no());
    			dto.setGroup_no(dto1.getGroup_no());
    			dto.setDepth(dto1.getDepth());
    			dto.setOrder_no(dto1.getOrder_no());
    			
    			service.insertGoal2(dto, pathname);	
    		}   
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "redirect:/goal/list?pj_no="+pj_no;
    }

    
    
    // 목표 참여리스트 모달
    @GetMapping(value = "listEmp")
    @ResponseBody
    public Map<String, Object> listEmp(
    		@RequestParam String condition,
			@RequestParam String keyword,
			@RequestParam long pj_no,
			HttpSession session) throws Exception {
    	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());
		map.put("pj_no", pj_no);
		List<Goal> list = service.listEmp(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listEmp", list);
		
		
		return model;
    }
    		
    @GetMapping("article")
    public String article(@RequestParam long goal_no,
    		@RequestParam long pj_no,
    		HttpSession session,
			Model model) throws Exception {

    	Goal dto = service.readGoal(goal_no);

    	if(dto == null) { 
    		return "redirect:/goal/list?pj_no=" + pj_no; 
    	}

		List<Goal> goal_member = service.readGoalmember(goal_no);
		
		
		String pj_name	= service.readprojectname(pj_no);
		
		String parent_name;
		if(dto.getParent() == 0) {
			parent_name = ""; 
		} else {
			parent_name = service.readparentname(dto.getParent());
		}
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pj_no", pj_no);
		map.put("login_emp", info.getEmp_no());
		
		int qualify = service.readAcess(map);
		
		int pj_status = 0;
    	pj_status = service.readstatus(pj_no);
    	
    	List<Task> task = service.readTaskmember(goal_no);
    	
    	int taskCount = service.taskCount(goal_no);
    	int finishCount = service.finishCount(goal_no);
    	
    	model.addAttribute("pj_status", pj_status);
		model.addAttribute("dto", dto);
		model.addAttribute("goal_member", goal_member);
		model.addAttribute("pj_name", pj_name);
		model.addAttribute("parent_name", parent_name);
		model.addAttribute("qualify", qualify);
		model.addAttribute("task", task);
		model.addAttribute("taskCount", taskCount);
		model.addAttribute("finishCount", finishCount);
    	
    	return ".goal.article";
    }
    
    @GetMapping("update")
    public String updateForm(@RequestParam long pj_no,
    		@RequestParam long goal_no,
    		HttpSession session,
    		Model model) throws Exception {
    	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
    	Map<String, Object> map = new HashMap<String, Object>();

		map.put("login_emp", info.getEmp_no());
    	map.put("pj_no", pj_no);

    	int qualify = service.readAcess(map);

		Goal dto = service.readGoal(goal_no);
		if(dto == null || !(qualify == 0 || qualify == 1)) { 
    		return "redirect:/goal/list?pj_no=" + pj_no; 
    	}
		
		List<Goal> goal_member = service.readGoalmember(goal_no);

		
    	List<Goal> depth_0 = service.listDepth1(map);		// 최상위 밑에 상위
    	List<Goal> depth_1 = service.listDepth2(map);		// 상위 밑에 하위
		
		model.addAttribute("dto", dto);
		model.addAttribute("pj_no", pj_no);
		model.addAttribute("goal_no", goal_no);
		model.addAttribute("goal_member", goal_member);
		model.addAttribute("mode", "update");
		model.addAttribute("listdepth_0", depth_0);
    	model.addAttribute("listdepth_1", depth_1);
    	
		return ".goal.write";
    }
    
    @PostMapping("update")
    public String updatesubmit(Goal dto,
    		@RequestParam long pj_no,
    		@RequestParam long goal_no,
    		HttpSession session) throws Exception {
    	
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "goal";
    	
		dto.setPj_no(pj_no);
		dto.setGoal_no(goal_no);
		
		try { 
			
			service.updateGoal(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
		return "redirect:/goal/list?pj_no=" + pj_no;
    }
    
    @RequestMapping(value = "deleteMember")
    public Map<String, Object> DeleteFile(@RequestParam long pj_no,
    		@RequestParam long goal_no,
    		@RequestParam long pj_member_no) throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("pj_no", pj_no);
		map.put("goal_no", goal_no);
		map.put("goal_member_no", pj_member_no);
		service.deleteGoalmember(map);
    	
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
    }
    
    @RequestMapping(value = "delete")
    public String delete(@RequestParam long goal_no,
    		@RequestParam long pj_no,
    		HttpSession session) throws Exception {
    	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "goal";
    	
		service.deleteGoal(pj_no, goal_no, info.getEmp_no(), pathname);
    	
    	
    	return "redirect:/goal/list?pj_no=" + pj_no;
    }
    
    
    @RequestMapping(value = "deleteFile")
    public String deleteFile(@RequestParam long pj_no,
    		@RequestParam long goal_no,
    		HttpSession session) throws Exception {
    	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "goal";
		
		Goal dto = service.readGoal(goal_no);
		if( dto == null) {
			return "redirect:/goal/list?pj_no=" + pj_no;
		}

		
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("login_emp", info.getEmp_no());
    	map.put("pj_no", pj_no);
    	
		int qualify = service.readAcess(map);
		
		if( !(qualify == 0 || qualify == 1) ) {
			return "redirect:/goal/list?pj_no=" + pj_no;
		}

		
		try {
			if(dto.getSaveFilename() != null) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname); // 실제파일삭제
				dto.setSaveFilename("");
				dto.setOriginalFilename("");
				service.updateGoal(dto, pathname); // DB 테이블의 파일명 변경(삭제)
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
		return "redirect:/goal/update?goal_no=" + goal_no + "&pj_no=" + pj_no; 
    }
    
    
	@GetMapping(value = "download")
	public void download(@RequestParam long goal_no,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "goal";
		
		Goal dto = service.readGoal(goal_no);
		
		if (dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFilename(),
					dto.getOriginalFilename(), pathname, resp);
			
			if(b) {
				return;
			}
		}
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일 다운로드가 실패 했습니다.');history.back();</script>");
		
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}