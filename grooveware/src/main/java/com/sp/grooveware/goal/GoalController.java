package com.sp.grooveware.goal;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.member.SessionInfo;

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
    					@RequestParam int pj_no,
    					Model model) throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();

    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	map.put("login_emp", info.getEmp_no());
    	map.put("pj_no", pj_no);
    	
    	List<Goal> list = service.listGoal(map);
    	
    	model.addAttribute("pj_no", pj_no);
    	model.addAttribute("list", list);
    	
    	return ".goal.list";
    }
    
    
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeForm(HttpSession session,
				    		@RequestParam int pj_no,
				    		Model model) throws Exception {
    	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("pj_no", pj_no);
    	map.put("login_emp", info.getEmp_no());
    	

    	List<Goal> depth_0 = service.listDepth1(map);		// 최상위 밑에 상위
    	List<Goal> depth_1 = service.listDepth2(map);		// 상위 밑에 하위
    	
    	
    	model.addAttribute("mode", "write");
    	model.addAttribute("listdepth_0", depth_0);
    	model.addAttribute("listdepth_1", depth_1);
    	
    	
    	return ".goal.write";
    }
    
    
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String writeSubmit(Goal dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "goal";
    	
    	try {
    		dto.setEmp_no(info.getEmp_no());
    		service.insertGoal(dto, pathname, "write");		// 모드로 write을 넘김
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "redirect:/goal/list";
    }

    
    
    // 목표 참여리스트 모달
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
		List<Goal> list = service.listEmp(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listEmp", list);
		
		return model;
    }
    		
    
    
}