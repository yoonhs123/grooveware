package com.sp.grooveware.dashBoard;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.grooveware.approval.ApprovalService;
import com.sp.grooveware.goal.GoalService;
import com.sp.grooveware.member.SessionInfo;
import com.sp.grooveware.myInsa.MyInsaService;
import com.sp.grooveware.notice.NoticeService;

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
	private GoalService goalService;
	
	@Autowired
	private NoticeService notiService;
	
	
	@RequestMapping(value="main")
	public String dashBoard(
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
	
		WorkTime workTime = dashService.readWorkTime(info.getEmp_no());

		model.addAttribute("workTime", workTime);
		
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
