package com.sp.grooveware.dashBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.approval.Approval;
import com.sp.grooveware.approval.ApprovalService;
import com.sp.grooveware.goal.Goal;
import com.sp.grooveware.goal.GoalService;
import com.sp.grooveware.member.SessionInfo;
import com.sp.grooveware.myInsa.MyInsa;
import com.sp.grooveware.myInsa.MyInsaService;
import com.sp.grooveware.notice.Notice;
import com.sp.grooveware.notice.NoticeService;
import com.sp.grooveware.task.Task;
import com.sp.grooveware.task.TaskService;

@Controller("dashBoard.DashBoardController")
@RequestMapping("/dashboard/*")
public class DashBoardController {
	@Autowired
	private DashBoardService dashService;
	
	@Autowired
	private MyInsaService myInsaService;
	
	@Autowired
	private ApprovalService approService;
	
	@Autowired
	private NoticeService notiService;
	
	@Autowired
	private TaskService taskService;
	
	
	@RequestMapping(value="main")
	public String dashBoard(
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		map.put("approval_status", 1);
		
		map.put("dept_id", info.getDept_no());
		map.put("offset", 0);
		map.put("size", 4);
		map.put("gubun", "all");
	
		WorkTime workTime = dashService.readWorkTime(info.getEmp_no());
		MyInsa myInsa = myInsaService.readProfile(info.getEmp_no());
		List<Approval> approvalList = approService.ApprovalStepList(map);
		List<Notice> notiList = notiService.listNotice(map);

		map.put("gubun", "dept");
		List<Notice> deptnotiList = notiService.listNotice(map);
		
		map.put("login_emp", info.getEmp_no());
		List<Task> listTask = taskService.listTask(map);
		
		model.addAttribute("workTime", workTime);
		model.addAttribute("myInsa", myInsa);
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("listTask", listTask);
		model.addAttribute("notiList", notiList);
		model.addAttribute("deptnotiList", deptnotiList);

		
		return ".dashboard.main";
		
	}
	
	@PostMapping(value="workTime")
	public String workTime(
			WorkTime dto,
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		
		dto.setEmp_no(info.getEmp_no());
		
		
		if(dto.getRecord_no() == 0) {
			// 출근(insert)
			dashService.insertWorkTime(dto);
		} else {
			// 퇴근(update)
			dashService.updateWorkTime(dto);
		}
		
		return "redirect:/dashboard/main";
	}	
}
