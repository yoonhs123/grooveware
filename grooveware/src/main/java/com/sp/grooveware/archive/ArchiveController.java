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
	 
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String writeSubmit(Archive dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setEmp_no(info.getEmp_no());
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
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteFile(@RequestParam(required = false) List<String> file_no,
			@RequestParam(required = false) List<String> folder_no,
			@RequestParam String root_folder,
			HttpSession session,
			Model model) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "archive";
		
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
	
	@RequestMapping(value="archive/{folder_no}")
	public String folder(@PathVariable long folder_no,
			@RequestParam(defaultValue = "1") long preFolder_no,
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
		
		
		if(root_folderNum == 1) {
			sub_folders = service.getSubFolders(folder_no);
			sub_files = service.getSubFiles(folder_no);			
		} else {
			sub_folders = service.getPrivateSubFolders(folder_no, emp_no);
			sub_files = service.getPrivateSubFiles(folder_no, emp_no);	
		}
		
		if(sub_files.isEmpty() && sub_folders.isEmpty()) {
			msg = "하위 폴더 및 파일이 없습니다.";
		}
		
		model.addAttribute("root_folderNum", root_folderNum);
	    model.addAttribute("sub_folders", sub_folders);
	    model.addAttribute("sub_files", sub_files);
	    model.addAttribute("msg", msg);
	    model.addAttribute("folder_no", folder_no);
	    model.addAttribute("preFolder_no", preFolder_no);
	    // list2.jsp로 이동합니다.
	    return ".archive.list2";
		
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
}