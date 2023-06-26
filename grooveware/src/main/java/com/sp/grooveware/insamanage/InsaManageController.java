package com.sp.grooveware.insamanage;

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
	
	@RequestMapping(value= "list", method = RequestMethod.GET)
	public String insaMemberManage(@RequestParam(value= "page", defaultValue= "1") int current_page, 
			@RequestParam(defaultValue = "emp_no") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String enabled,
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
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page ) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset <0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<InsaManage> list = service.listinsaMember(map);
		
		String query = "";
		String listUrl = cp+ "/insaManage/list";
		
		if(keyword.length() != 0) {
			query = "condition=" +condition+ "&keyword=" + URLEncoder.encode(keyword, "utf-8");
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
		
		return ".insaManage.list";
	}
	
	@GetMapping("listDeptSubCategory")
	@ResponseBody
	public Map<String, Object> listDeptSubCategory(
			@RequestParam long top_dept_no) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<InsaManage> listDeptSubCategory = service.listDeptSubCategory(top_dept_no);
		
		model.put("listDeptSubCategory", listDeptSubCategory);
		
		return model;
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) {

		// 모든 직위
		List<InsaManage> listPosCategory = service.listPosCategory();
		// 상위 부서
		List<InsaManage> listDeptCategory = service.listDeptCategory();
		List<InsaManage> listDeptSubCategory = null;
		
		long top_dept_no = 0;
		if(listDeptCategory.size() != 0) {
			top_dept_no = listDeptCategory.get(0).getDept_no();
		}
		listDeptSubCategory = service.listDeptSubCategory(top_dept_no);
		
		model.addAttribute("listDeptCategory", listDeptCategory);
		model.addAttribute("listDeptSubCategory", listDeptSubCategory);
		model.addAttribute("listPosCategory", listPosCategory);
		
		return ".insaManage.write";
	}
	
	@RequestMapping(value= "write", method = RequestMethod.POST)
	public String writeSubmit(InsaManage dto, 
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			// String root = session.getServletContext().getRealPath("/");
			// String pathname = root + "upload" + File.separator+ "emp_picture";
			dto.setQualifer(info.getEmp_no());
			
			service.insertEmp(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/insaManage/list";
	}
	
	// 회원상세 정보 : AJAX-Text 응답
	@RequestMapping(value = "profile")
	public String profileInsaMember(@RequestParam String emp_no, Model model) throws Exception {
		
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
		
		// InsaManage dto = service.
		
		return ".insaManage.insaCard";
	}
	
	/*
	@RequestMapping(value="updateInsaProfile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateInsaProfile(InsaManage dto) throws Exception  {
		
		
		return model;
	}
	*/
	
	
	
}
