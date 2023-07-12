package com.sp.grooveware.insamanage;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("insaManage.insaManageController")
@RequestMapping("/insaManage/*")
public class InsaManageController {
	@Autowired
	private InsaManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value= "list")
	public String insaMemberManage(@RequestParam(value= "page", defaultValue= "1") int current_page, 
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "3") int emp_status,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("emp_no", info.getEmp_no());
		map.put("emp_status", emp_status);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<InsaManage> list = service.listinsaMember(map);
		
		String query = "emp_status=" +emp_status;
		String listUrl = cp+ "/insaManage/list";
		
		if(keyword.length() != 0) {
			query = "&condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("emp_status", emp_status);
		
		return ".insaManage.list";
	}
	
	/*
	@GetMapping("listDeptSubCategory")
	@ResponseBody
	public Map<String, Object> listDeptSubCategory(
			@RequestParam long top_dept_no) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<InsaManage> listDeptSubCategory = service.listDeptSubCategory(top_dept_no);
		
		model.put("listDeptSubCategory", listDeptSubCategory);
		
		return model;
	}
	*/
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) {
		
		
		// 모든 직위
		List<InsaManage> listPosCategory = service.listPosCategory();
		// 상위 부서
		List<InsaManage> listDeptCategory = service.listDeptCategory();
		// List<InsaManage> listDeptSubCategory = null;
		
		/*
		long top_dept_no = 0;
		if(listDeptCategory.size() != 0) {
			top_dept_no = listDeptCategory.get(0).getDept_no();
		}
		listDeptSubCategory = service.listDeptSubCategory(top_dept_no);
		*/
		
		model.addAttribute("listDeptCategory", listDeptCategory);
		// model.addAttribute("listDeptSubCategory", listDeptSubCategory);
		model.addAttribute("listPosCategory", listPosCategory);
		
		return ".insaManage.write";
	}
	
	@RequestMapping(value= "write", method = RequestMethod.POST)
	public String writeSubmit(InsaManage dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator+ "insaManage";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			
			dto.setQualifer(info.getEmp_no());
			
			service.insertEmp(dto, path);
			
		} catch (Exception e) {
		}
		
		return "redirect:/insaManage/list";
	}
	
	// 회원상세 정보 : AJAX-Text 응답
	@RequestMapping(value = "profile")
	public String profileInsaMember(@RequestParam long emp_no, Model model) throws Exception {
		
		InsaManage dto = service.readProfile(emp_no);
		
		model.addAttribute("dto", dto);
		
		return "/insaManage/profile";
	}
	
	@RequestMapping(value = "insaCard")
	public String insaCardArticle(@RequestParam long emp_no,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" +page;
		if(keyword.length() != 0) {
			query += "&condition=" +condition+ "&keyword=" +URLEncoder.encode(keyword, "utf-8");
		}
		
		InsaManage dto = service.readInsaCard(emp_no);
		InsaManage dto2 = service.getWork(emp_no);
		List<InsaManage> posHistoryList = service.posHistoryList(emp_no);
		List<InsaManage> deptHistoryList = service.deptHistoryList(emp_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("dto2", dto2);
		model.addAttribute("query", query);
		model.addAttribute("posHistoryList", posHistoryList);
		model.addAttribute("deptHistoryList", deptHistoryList);
		
		return ".insaManage.insaCard";
	}
	

	@RequestMapping(value = "updateEmpStatus")
	public String updateEmpStatus(@RequestParam long emp_no, @RequestParam long emp_status
			) throws Exception {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp_no", emp_no);
			map.put("emp_status", emp_status);
			
			service.updateEmpStatus(map);
			
			if(emp_status == 2) {
				service.updateEmpStatus(map);
				service.updateEmpStatus2(map);
			}
			
			return "redirect:/insaManage/list";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/insaManage/list";
		}
	}
	
	@RequestMapping(value = "updateEmpHistory", method = RequestMethod.GET)
	public String updateForm(@RequestParam long emp_no,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		List<InsaManage> listPosCategory = service.listPosCategory();
		List<InsaManage> listDeptCategory = service.listDeptCategory();
		
		InsaManage dto = service.readPosDept(emp_no);
		if(dto == null) {
			return "redirect:/insaManage/list";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("listDeptCategory", listDeptCategory);
		model.addAttribute("listPosCategory", listPosCategory);
		
		return ".insaManage.updateEmpHistory";
	}
	
	
	@RequestMapping(value = "updateEmpHistory", method = RequestMethod.POST)
	public String updateSubmit(InsaManage dto,
			@RequestParam long emp_no,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		List<InsaManage> listPosCategory = service.listPosCategory();
		List<InsaManage> listDeptCategory = service.listDeptCategory();
		
		try {
			service.updatePosDept(dto);
			service.insertPosDept(dto);
		} catch (Exception e) {
		}
		
		model.addAttribute("listDeptCategory", listDeptCategory);
		model.addAttribute("listPosCategory", listPosCategory);
		
		
		return "redirect:/insaManage/list";
	}
	
	@RequestMapping(value = "workList")
	public String workList(
			@RequestParam(required =  false) String year,
			@RequestParam(value= "page", defaultValue= "1") int current_page, 
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception { 
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Calendar cal = Calendar.getInstance();
		int currentYear = cal.get(Calendar.YEAR);
		
		String date = null;
		if(year == null) {
			year = String.format("%04d", cal.get(Calendar.YEAR));
		}
		date = year;
		
		int size = 10;
		int total_page = 0;
		int workDataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("emp_no", info.getEmp_no());
		map.put("work_starttime", date);
		
		workDataCount = service.workDataCount(map);
		System.out.println("workDataCount: " +workDataCount);
		
		if(workDataCount != 0) {
			total_page = myUtil.pageCount(workDataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		System.out.println("workSize: " +size );
		System.out.println("offset: " +offset );
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<InsaManage> list2 = service.workList(map);
		
		String query = "";
		String listUrl = cp+ "/insaManage/workList";
		
		if(keyword.length() != 0) {
			query = "condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list2", list2);
		model.addAttribute("page", current_page);
		model.addAttribute("workDataCount", workDataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		
		return ".insaManage.workList";
	}
	
	@RequestMapping(value="workRecord")
	public String workRecordArticle(
			@RequestParam long emp_no,
			@RequestParam(required = false) String year,
			@RequestParam(required = false) String month,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
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
		 map.put("emp_no", emp_no);
		 map.put("work_starttime", date);
		 
		List<InsaManage> list = service.readWorkTime(map, emp_no);
		 
		InsaManage dto = service.getWork(emp_no);
		 
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("dto", dto);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return ".insaManage.workRecord";
	}
	
	
	@RequestMapping(value =  "holidayList")
	public String holidayList(@RequestParam(value= "page", defaultValue= "1") int current_page, 
			@RequestParam(required =  false) String year,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "3") int emp_status,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Calendar cal = Calendar.getInstance();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		int currentYear = cal.get(Calendar.YEAR);
		
		String date = null;
		if(year == null) {
			year = String.format("%04d", cal.get(Calendar.YEAR));
		}
		date = year;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("emp_no", info.getEmp_no());
		map.put("emp_status", emp_status);
		map.put("work_starttime", date);
		
		dataCount = service.holidayCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		
		List<InsaManage> list = service.holidayMemberList(map);
		
		String query = "emp_status=" +emp_status;
		String listUrl = cp+ "/insaManage/holidayList";
		
		if(keyword.length() != 0) {
			query = "&condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("emp_status", emp_status);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		
		return ".insaManage.holidayList";
	}
	
	@RequestMapping(value = "holidayArticle")
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
		
		return ".insaManage.holidayArticle";
	}
	
	@RequestMapping("holidaySetting")
	public String holidaySetting() throws Exception {
		return ".insaManage.holidaySetting";
	}
}
