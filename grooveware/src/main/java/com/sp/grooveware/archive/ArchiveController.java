package com.sp.grooveware.archive;

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



@Controller("arch.archiveController")
@RequestMapping("/archive/*")
public class ArchiveController {
	
	@Autowired 
	private ArchiveService service;
	 
	 @Autowired
	 @Qualifier("myUtilGeneral") private MyUtil myUtil;
	 
	 @Autowired 
	 private FileManager fileManager;
	 
	
	
	@RequestMapping(value="list")
	public String list(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		System.out.println(dataCount);
		System.out.println(total_page);
		System.out.println(current_page);
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Archive> list = service.listArchive(map);

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/archive/list";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/admin/noticeManage/list?" + query;
			}
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".archive.list";
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String writeSubmit(Archive dto, HttpSession session) throws Exception {

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "archive";

			service.insertFile(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/archive/list";
	}
	
	@RequestMapping(value = "folderlist", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> folderList() {
		List<Archive> folderList = null;
		
		folderList = service.listFolder();
		
		
		System.out.println(folderList.size());
		Map<String, Object> model = new HashMap<>();
		model.put("folderList", folderList);
		
		return model;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteFile(@RequestParam List<String> file_no,
			HttpSession session,
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("fileList", file_no);

		try {
			service.deleteFile(map);
		} catch (Exception e) {

		}

		return "redirect:/archive/list";
	}
	
	@GetMapping(value="download")
	public void download(@RequestParam String file_no,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "archive";
		
		Archive dto = service.readFile(file_no);
		
		if(dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSave_filename(), 
					dto.getOriginal_filename(), pathname, resp);
			if (b) {
				return;
			}
			
		}
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일 다운로드가 실패 했습니다.');history.back();</script>");
		
	}
	
	
	
}