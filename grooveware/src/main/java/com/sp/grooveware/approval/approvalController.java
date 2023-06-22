package com.sp.grooveware.approval;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDate;
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
		
 
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {

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
		List<Approval> list = service.listApproval(map);


		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "approval/list";
		String articleUrl = cp + "/approval/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/approval/list?" + query;
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

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		

		 
		 
		System.out.println("list : "  + list);
		System.out.println("page : "  + current_page);
		System.out.println("dataCount : "  + dataCount);
		System.out.println("size : "  + size);
		System.out.println("total_page : "  + total_page);
		System.out.println("paging : "  + paging);
		System.out.println("articleUrl : "  + articleUrl);
		
		
		  
		
		return ".approval.list";
	}
	 
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
        // 현재 날짜를 생성
        LocalDate currentDate = LocalDate.now();

        // 모델에 현재 날짜를 전달
        model.addAttribute("currentDate", currentDate);
		model.addAttribute("mode", "write");

		return ".approval.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Approval dto, HttpSession session ) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "approval";

			dto.setEmp_no(info.getEmp_no());
			
			service.insertApproval(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}


		return "redirect:/approval/list";
	}
	
	

	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(@RequestParam("doc_no") long doc_no,
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

		Approval dto = service.readApproval(doc_no);
		if (dto == null) {
			return "redirect:/approval/list?" + query;
		}

		//List<Approval> listFile = service.listFile(doc_no);

		model.addAttribute("dto", dto);
		//model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);


		return ".approval.article";
	}	
	
	
	// 친구 리스트
	@GetMapping(value = "listMember")
	@ResponseBody
	public Map<String, Object> listMember(
			@RequestParam String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("emp_name", info.getEmp_name());
		List<Approval> list = service.listMember(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listMember", list);
		return model;
	}
	
}
