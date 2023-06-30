package com.sp.grooveware.approval;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;


@Controller("approval.approvalController")
@RequestMapping("/approval/*")
public class approvalController {
	
	@Autowired
	private ApprovalService service;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
		
 
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int doc_status, 
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {

		// 개인 리스트를 보기 위해 세션에서 해당 멤버 가져오기
		SessionInfo info = (SessionInfo)session.getAttribute("member");
 
		
		int size = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());
		map.put("doc_status", doc_status);
		
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
		List<Approval> list = service.listDoc(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/approval/list?doc_status=" + doc_status;
		String articleUrl = cp + "/approval/article?doc_status=" + doc_status + "&page=" + current_page;

		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/approval/list?doc_satus=" + doc_status + "&" + query;
			articleUrl = cp + "/approval/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("doc_status", doc_status);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".approval.list";
	}
	 
	
	
	@RequestMapping(value = "standByList", method = RequestMethod.GET)
	public String standByList(  
			@RequestParam(defaultValue = "0") int approval_status, 
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		String cp = req.getContextPath();
		String articleUrl = cp + "/approval/articleAp";

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		map.put("approval_status", approval_status);

		List<Approval> standByList = service.standByList(map);

		model.addAttribute("standByList", standByList);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("approval_status", approval_status);
		
		
		return ".approval.approvalList";
	}
	
	@RequestMapping(value = "progressList", method = RequestMethod.GET)
	public String progressList(  
			@RequestParam(defaultValue = "0") int approval_status, 
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		String cp = req.getContextPath();
		String articleUrl = cp + "/approval/articleAp";

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		map.put("approval_status", approval_status);

		List<Approval> progressList = service.progressList(map);

		model.addAttribute("progressList", progressList);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("approval_status", approval_status);
		
		
		return ".approval.approvalList";
	}
	
 
	 
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".approval.write";
	}

	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Approval dto, HttpSession session ) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int doc_status = dto.getDoc_status();
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "approval";

			
			dto.setDoc_status(doc_status);

			dto.setEmp_no(info.getEmp_no());
			
			service.insertApproval(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}


		return "redirect:/approval/list?doc_satus=" + doc_status;
	}
	
	

	@RequestMapping(value = "article")
	public String article(@RequestParam long doc_no,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam int size,
			Model model) throws Exception {

		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		
		
		String query = "page=" + page + "&size=" + size;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Approval dto = service.readDoc(doc_no);
		
		if (dto == null) {
			return "redirect:/approval/list?" + query;
		}

		
		List<Approval> listApproval = service.listApproval(doc_no);
	
		List<Approval> listFile = service.listFile(doc_no);
        

		model.addAttribute("dto", dto);
		model.addAttribute("listApproval", listApproval);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);


		return ".approval.article";
	}	

	@RequestMapping(value = "articleAp")
	public String articleAp(@RequestParam long doc_no,
			Model model) throws Exception {


		Approval dto = service.readDoc(doc_no);
		
		if (dto == null) {
			return "redirect:/approval/approvalList";
		}
		List<Approval> listApproval = service.listApproval(doc_no);
	
		List<Approval> listFile = service.listFile(doc_no);
        

		model.addAttribute("dto", dto);
		model.addAttribute("listApproval", listApproval);
		model.addAttribute("listFile", listFile);


		return ".approval.approvalArticle";
	}	
	
	
	@RequestMapping(value = "updateAp")
	public String updateAp(Approval dto,
			@RequestParam long doc_no,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {

			dto.setEmp_no(info.getEmp_no());
			dto.setApproval_status(dto.getApproval_status());
			service.updateApproval(dto);
		} catch (Exception e) {
		}

		return "redirect:/approval/ApprovalList";
	}
	

	@RequestMapping(value = "download")
	public void download(@RequestParam long file_no,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "approval";

		boolean b = false;

		Approval dto = service.readFile(file_no);
		
		if (dto != null) {
			String saveFilename = dto.getSave_filename();
			String originalFilename = dto.getOriginal_filename();

			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long doc_no,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Approval dto = service.readDoc(doc_no);
		if (dto == null || !Long.valueOf(info.getEmp_no()).equals(dto.getEmp_no())) {
		    return "redirect:/approval/list?page=" + page;
		}
		List<Approval> listFile = service.listFile(doc_no);

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		return ".approval.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Approval dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "approval";

			dto.setEmp_no(info.getEmp_no());
			service.updateDoc(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/approval/list?page=" + page;
	}

	

	
	@RequestMapping(value = "delete") 
	public String deleteDoc(@RequestParam long doc_no,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "approval";
			service.deleteApproval(doc_no, pathname);
		} catch (Exception e) {
		}

		return "redirect:/approval/list?" + query;
	}

	
	
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long file_no, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "approval";

		Approval dto = service.readFile(file_no);
		if (dto != null) {
			fileManager.doFileDelete(dto.getSave_filename(), pathname);
		}

		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "file_no");
			map.put("doc_no", file_no);
			service.deleteFile(map);
			state = "true";
		} catch (Exception e) {
		}

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	
	// 멤버 리스트
	@GetMapping(value = "listMember")
	@ResponseBody
	public Map<String, Object> listMember(
			@RequestParam String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("emp_no", info.getEmp_no());
		List<Approval> list = service.listMember(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listMember", list);
		System.out.println("listMember" + list);
		return model;
	}
	
}
