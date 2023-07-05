package com.sp.grooveware.project;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;

@Controller("project.ProjectController")
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("/project/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "pj_name") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 5;
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
		
		// 카테고리 (진행중, 완료)
		int category = 0;	// 진행
		map.put("category", category);
		
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
		List<Project> list = service.listProject(map);
		
		// 페이징 처리
		String cp = req.getContextPath();
		String query = "size=" + size;
		String listUrl = cp + "/project/list";
		String articleUrl = cp + "/project/article?page=" + current_page;
		if (keyword.length() != 0) {
			query += "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		//
		String goalUrl = cp + "/goal/list";
		
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("goalUrl", goalUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".project.list";
	}
	
	
	@RequestMapping("/project/listend")
	public String listend(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "pj_name") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 5;
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
		
		// 카테고리 (진행중, 완료)
		int category = 1;
		map.put("category", category);	// 완료
		
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
		List<Project> list = service.listProject(map);
		
		
		// 페이징 처리
		String cp = req.getContextPath();
		String query = "size=" + size;
		String listUrl = cp + "/project/list";
		String articleUrl = cp + "/project/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
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
		
		
		return ".project.listend";
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model)throws Exception {
		model.addAttribute("mode", "write");

		return ".project.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Project dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "project";
		
		try {
			dto.setPj_creator(info.getEmp_no());
			service.insertProject(dto, pathname);
		} catch (Exception e) {

		}
		return "redirect:/project/list";
	}
	
	
	// 친구 리스트
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
		List<Project> list = service.listEmp(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listEmp", list);
		System.out.println("listEmp" + list);
		return model;
		
		
	}

	
	@GetMapping("article")
	public String article(@RequestParam long pj_no,
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
		
		// 해당 레코드 가져오기
		Project dto = service.readProject(pj_no);
		
		if(dto == null) {
			return "redirect:/project/list?" + query;
		}
		
		
		// 프로젝트 참여멤버 가져오기
		List<Project> pj_member = service.readProjectmember(pj_no);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("pj_member", pj_member);
		model.addAttribute("query", query);
		model.addAttribute("size", size);
		model.addAttribute("page", page);
		
		
		return ".project.article";
	}
	

	@GetMapping("update")
	public String updateForm(@RequestParam long pj_no,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Project dto = service.readProject(pj_no);
		if (dto == null || !(info.getEmp_no() == dto.getPj_creator())) {
			return "redirect:/project/list?page=" + page;
		}
		
		// 프로젝트 참여멤버 가져오기
		List<Project> pj_member = service.readProjectmember(pj_no);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("pj_member", pj_member);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".project.write";
	}
	
	
	@PostMapping("update")
	public String updatesubmit(Project dto,
			@RequestParam String page,
			@RequestParam long pj_no,
			HttpSession session) throws Exception {
	
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "project";
		
		dto.setPj_no(pj_no);
		
		try {
			service.updateProject(dto, pathname);
		} catch (Exception e) {
		}
		
		
		return "redirect:/project/list?page=" + page;
	}
	
	
	@RequestMapping(value = "deleteMember")
	public Map<String, Object> deleteFile(@RequestParam long pj_no,
			@RequestParam long pj_member_no,
			@RequestParam String page) throws Exception {
		

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pj_no", pj_no);
		map.put("pj_member_no", pj_member_no);
		service.deletePjmember(map);
		
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
	
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long pj_no,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "project";
		
		service.deleteProject(pj_no, pathname, info.getEmp_no());

		return "redirect:/project/list?" + query;
	}
	
	
	
	@GetMapping(value = "download")
	public void download(@RequestParam long pj_no, 
			HttpServletResponse resp,
			HttpSession session) throws Exception {
	
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		Project dto = service.readProject(pj_no);	
		
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
