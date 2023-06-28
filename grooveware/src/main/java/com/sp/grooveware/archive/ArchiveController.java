package com.sp.grooveware.archive;

import java.io.File; 
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;



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
	public String writeSubmit(Archive dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setEmp_no(info.getEmp_no());
		System.out.println("emp_no: " + dto.getEmp_no());
		try {
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "archive";
			service.insertFile(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/archive/"+ dto.getRoot_folder() ;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createSubmit(Archive dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setEmp_no(info.getEmp_no()); 
		
		try {
			service.insertFolder(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/archive/" + dto.getRoot_folder();
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
	public String deleteFile(@RequestParam(required = false) List<String> file_no,
			@RequestParam(required = false) List<String> folder_no,
			@RequestParam String root_folder,
			HttpSession session,
			Model model) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "archive";
		System.out.println(folder_no);
		System.out.println(file_no);
		
		if (folder_no != null && (file_no == null || file_no.isEmpty())) {
	        // folder_no만 null이 아닐 때
	        for (String folder : folder_no) {
	            long folderNo = Long.parseLong(folder);
	            List<String> file_name = service.getSubFolderNum(folderNo);
	            fileManager.doFileDelete(file_name, pathname);
	        }
	        service.deleteFolder(folder_no);
	    } else if (folder_no == null || folder_no.isEmpty() && file_no != null) {
	        // file_no만 null이 아닐 때
            List<String> file_name = service.getAllFileName(file_no);
            fileManager.doFileDelete(file_name, pathname);
	        
	    	service.deleteFile(file_no);
	    	
	    } else if (folder_no != null && file_no != null) {
	        // folder_no와 file_no 모두 null이 아닐 때
	        for (String folder : folder_no) {
	            long folderNo = Long.parseLong(folder);
	            List<String> file_name = service.getSubFolderNum(folderNo);
	            fileManager.doFileDelete(file_name, pathname);
	        }
	        List<String> file_name = service.getAllFileName(file_no);
            fileManager.doFileDelete(file_name, pathname);
            
            service.deleteFolder(folder_no);
	    	service.deleteFile(file_no);
	    }
		

		return "redirect:/archive/" + root_folder ;
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
	@GetMapping(value="download/{file_no}")
	public void download2(@PathVariable String file_no,
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
	
	/*
	 * @RequestMapping(value="list2") public String list(Model model) throws
	 * Exception { // 최상위 폴더 정보 조회
	 * 
	 * Archive root_folder = service.getTopLevelFolders();
	 * 
	 * 
	 * // 모델에 데이터를 담아 JSP로 전달합니다. model.addAttribute("folder", root_folder); //
	 * list2.jsp로 이동합니다. return ".archive.list2";
	 * 
	 * }
	 */
	
	@RequestMapping(value="archive/{folder_no}")
	public String folder(@PathVariable long folder_no,
			Model model,
			HttpSession session
			) throws Exception {
		String msg = null;
		long emp_no = 0;
		long root_folderNum = 0;
		List<Archive> sub_folders = null;
		List<Archive> sub_files = null;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		emp_no = info.getEmp_no();
		
		root_folderNum = service.getTopLevelFolderNum(folder_no);
		
		System.out.println(emp_no);
		System.out.println(root_folderNum);
		
		if(root_folderNum == 1) {
			sub_folders = service.getSubFolders(folder_no);
			sub_files = service.getSubFiles(folder_no);			
		} else {
			sub_folders = service.getPrivateSubFolders(folder_no, emp_no);
			sub_files = service.getPrivateSubFiles(folder_no, emp_no);	
		}
		
		System.out.println("sub_folders" + sub_folders);
		System.out.println("sub_files" + sub_files);
		
		
		if(sub_files.isEmpty() && sub_folders.isEmpty()) {
			msg = "하위 폴더 및 파일이 없습니다.";
		}
		
		model.addAttribute("root_folderNum", root_folderNum);
	    model.addAttribute("sub_folders", sub_folders);
	    model.addAttribute("sub_files", sub_files);
	    model.addAttribute("msg", msg);
	    model.addAttribute("folder_no", folder_no);
	    // list2.jsp로 이동합니다.
	    return ".archive.list2";
		
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
}