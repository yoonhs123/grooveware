package com.sp.grooveware.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.member.SessionInfo;

@Controller("task.taskController")
@RequestMapping("/task/*")
public class TaskController {

    @Autowired
    private TaskService service;
    
    @Autowired
    private FileManager fileManager;
    
    
    
    
    @RequestMapping(value ="write", method = RequestMethod.GET)
    public String writeForm(@RequestParam long goal_no,
    		HttpSession session,
    		Model model) throws Exception {
    	
    	String goal_name = service.readGoalname(goal_no);
    	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("login_emp", info.getEmp_no());
		map.put("goal_no", goal_no);
		
    	List<Task> goal_member = service.listGoalmember(map);
    	
    	
    	model.addAttribute("goal_name", goal_name);
    	model.addAttribute("mode", "write");
    	model.addAttribute("goal_member", goal_member);
    	
    	return ".task.write";
    }
    
    
}
