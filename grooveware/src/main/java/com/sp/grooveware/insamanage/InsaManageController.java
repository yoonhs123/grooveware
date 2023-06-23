package com.sp.grooveware.insamanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.member.SessionInfo;

@Controller("insaManage.insaManageController")
@RequestMapping("/insaManage/*")
public class InsaManageController {
	@Autowired
	private InsaManageService service;
	
	@RequestMapping(value= "list", method = RequestMethod.GET)
	public String method() {
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
		List<InsaManage> listDeptCategory = service.listDeptCategory();
		List<InsaManage> listDeptSubCategory = null;
		List<InsaManage> listPosCategory = service.listPosCategory();
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
	
	
}
