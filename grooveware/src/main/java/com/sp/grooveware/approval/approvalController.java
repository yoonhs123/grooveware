package com.sp.grooveware.approval;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.grooveware.member.SessionInfo;


@Controller("approval.approvalController")
@RequestMapping("/approval/*")
public class approvalController {
	@Autowired
	private ApprovalService service;
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String method() {
		return ".approval.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".approval.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public  String writeSubmit(Approval dto, HttpSession session ) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "approval";

			dto.setEmp_no(info.getEmp_no());
			service.insertApproval(dto, pathname);
		} catch (Exception e) {
		}


		return "redirect:/approval/list";
	}
	
}
