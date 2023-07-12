package com.sp.grooveware.myInsa;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("myInsa.myInsaController")
@RequestMapping("/myInsa/*")
public class MyInsaController {
	
	@Autowired
	private MyInsaService myInsaService;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;

	
	
	@RequestMapping("profile")
	public String articleProfile(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		MyInsa dto = myInsaService.readProfile(info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return ".myInsa.profile";
	}
	
	
	@RequestMapping("insaCard")
	public String articleInsaCard(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		MyInsa dto = myInsaService.readInsaCard(info.getEmp_no());
		MyInsa dto2 = myInsaService.getWork(info.getEmp_no());
		List<MyInsa> posHistoryList = myInsaService.posHistoryList(info.getEmp_no());
		List<MyInsa> deptHistoryList = myInsaService.deptHistoryList(info.getEmp_no());
		
		model.addAttribute("dto", dto);
		model.addAttribute("dto2", dto2);
		model.addAttribute("posHistoryList", posHistoryList);
		model.addAttribute("deptHistoryList", deptHistoryList);
		
		return ".myInsa.insaCard";
	}
	
	@RequestMapping(value = "pwd", method = RequestMethod.GET)
	public String pwdForm(Model model) {
		return ".myInsa.pwd";
	}
	
	@RequestMapping(value = "pwd", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String emp_pwd,
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyInsa dto = myInsaService.readProfile(info.getEmp_no());
		if(dto == null) {
			session.invalidate();
			return "redirect:/";
		}
		if(!dto.getEmp_pwd().equals(emp_pwd)) {
			model.addAttribute("profileUpdate");
			model.addAttribute("message", "패스워드가 일치하지않습니다.");
			return ".myInsa.pwd";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("profileUpdate");
		
		return ".myInsa.profileUpdate";
	}
	
	/*
	@RequestMapping(value = "profileUpdate", method = RequestMethod.GET)
	public String profileUpdateForm(@RequestParam long emp_no,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyInsa dto = myInsaService.readProfile(emp_no);

		if(dto == null || !Long.valueOf(info.getEmp_no()).equals(dto.getEmp_no())) {
			return "redirect:/myInsa/profile";
		}
		
		model.addAttribute("dto", dto);
			
		return ".myInsa.profileUpdate";
	}
	*/
	
	@RequestMapping(value = "profileUpdate", method = RequestMethod.POST)
	public String profileUpdateSubmit(MyInsa dto, 
			HttpSession session,
			final RedirectAttributes reAttr,
			Model model) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator+ "insaManage";
		
		try {
			myInsaService.profileUpdate(dto, path);
		} catch (Exception e) {
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getEmp_name()+ "님의 개인정보가 정상적으로 변경되었습니다.<br>");
		
		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/myInsa/profile";
	}

	@RequestMapping(value="workRecord")
	public String workRecordArticle(
			@RequestParam(required = false) String year,
			@RequestParam(required = false) String month,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		 SessionInfo info = (SessionInfo)session.getAttribute("member");
		 Calendar cal = Calendar.getInstance();
		 int currentYear = cal.get(Calendar.YEAR);
		 
		 String date = null;
		 if(year == null || month == null) {
			 year = String.format("%04d", cal.get(Calendar.YEAR));
			 month = String.format("%02d", cal.get(Calendar.MONTH) + 1);
		 }
		 date = year + month;
			 
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("keyword", keyword);
		 map.put("condition", condition);
		 map.put("emp_no", info.getEmp_no());
		 map.put("work_starttime", date);
		 
		 List<MyInsa> list = myInsaService.readWorkTime(map, info.getEmp_no());
		 
		 MyInsa dto = myInsaService.getWork(info.getEmp_no());
		 
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("dto", dto);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return ".myInsa.workRecord";
	}
	
	@RequestMapping(value="holidayArticle")
	public String holidayArticle(
			@RequestParam(required = false) String year,
			@RequestParam(required = false) String month,
			Model model) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		 int currentYear = cal.get(Calendar.YEAR);
		 
		 if(year == null) {
			 year = String.format("%04d", cal.get(Calendar.YEAR));
		 }
		 
		 model.addAttribute("currentYear", currentYear);
		 model.addAttribute("year", year);
		 model.addAttribute("month", month);
		
		return ".myInsa.holidayArticle";
	}
	
	@RequestMapping(value = "organization", method = RequestMethod.GET)
	public String organization() throws Exception {
		
		return ".myInsa.organization";
	}
	
	@RequestMapping(value = "organizationItem", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> organizationItem() throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<MyInsa> list = myInsaService.listDept();
		
		model.put("list", list);
		
		return model;
	}

}
