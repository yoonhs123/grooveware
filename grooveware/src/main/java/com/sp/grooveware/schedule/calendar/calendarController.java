package com.sp.grooveware.schedule.calendar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sp.grooveware.common.MyUtil;
import com.sp.grooveware.member.SessionInfo;


@Controller("calendar.calendarController")
@RequestMapping("schedule/calendar/*")
public class calendarController {
	
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private ScheduleService service;
		
 
	@GetMapping("main")
	public ModelAndView main(
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		List<Schedule> listCategory = service.listCategory(map);
		
		ModelAndView mav = new ModelAndView(".schedule.calendar.main");
		mav.addObject("listCategory", listCategory);
		return mav;
	}
	
	@GetMapping("write")
	public String writeForm(@ModelAttribute(value = "dto") Schedule dto,
			HttpSession session,
			Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Schedule> listCategory = service.listCategory(map);
		System.out.println("listCategory:" + listCategory);
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		
		
		return ".schedule.calendar.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Schedule dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			if(dto.getCategory_num() == 0) {
				dto.setColor("#5882FA");
			} else if(dto.getCategory_num() == 1) {
				dto.setColor("#91CC75");
			} else {
				dto.setColor("#EE6666");
			}
			
			dto.setEmp_no(info.getEmp_no());
			service.insertSchedule(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/schedule/calendar/main";
	}
	
	// 월별 일정 - AJAX : JSON 
	@GetMapping(value="month")
	@ResponseBody
	public Map<String, Object> month (
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam(required = false) List<Integer> categorys,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		System.out.println(categorys);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("categoryList", categorys);
		map.put("start", start);
		map.put("end", end);
		map.put("emp_no", info.getEmp_no());
		
		List<Schedule> list=service.listMonth(map);
		for(Schedule dto:list) {
	    	if(dto.getStime()==null) {
	    		dto.setAllDay(true);
	    	} else {
	    		dto.setAllDay(false);
	    	}
	    	
	    	if(dto.getStime()!=null && dto.getStime().length()!=0) {
	    		// 2021-10-10T10:10
	    		dto.setStart(dto.getSday()+"T" + dto.getStime());
	    	} else {
	    		dto.setStart(dto.getSday());
	    	}
	    	
	    	if(dto.getEtime()!=null && dto.getEtime().length()!=0) {
	    		dto.setEnd(dto.getEday()+"T" + dto.getEtime());
	    	} else {
	    		dto.setEnd(dto.getEday());
	    	}
	    	
	    	if(dto.getRepeat()!=0) { // 반복 일정인 경우
	    		if( dto.getStart().substring(0,4).compareTo(start.substring(0,4)) != 0 ) {
	    			dto.setStart(start.substring(0,4)+dto.getStart().substring(5));
	    		}
	    	}	    	
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam int num,
			HttpSession session,
			Model model) throws Exception {
		
		Schedule dto = service.readSchedule(num);
		if(dto == null) {
			return "redirect:/schedule/calendar/main";
		}
		
		if(dto.getStime() == null) {
			dto.setAll_day("1");
			try {
				String s = dto.getEday().replaceAll("\\-|\\.|/", "");

				int y = Integer.parseInt(s.substring(0, 4));
				int m = Integer.parseInt(s.substring(4, 6));
				int d = Integer.parseInt(s.substring(6));

				Calendar cal = Calendar.getInstance();
				cal.set(y, m - 1, d);

				cal.add(Calendar.DATE, -1);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				dto.setEday( sdf.format(cal.getTime()) );
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Schedule> listCategory = service.listCategory(map);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return ".schedule.calendar.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Schedule dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			if(dto.getCategory_num() == 0) {
				dto.setColor("#5882FA");
			} else if(dto.getCategory_num() == 1) {
				dto.setColor("#91CC75");
			} else {
				dto.setColor("#EE6666");
			}
			dto.setEmp_no(info.getEmp_no());
			service.updateSchedule(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/schedule/calendar/main";
	}

	// 일정을 드래그 한 경우 수정 완료 - AJAX : JSON
	@PostMapping("updateDrag")
	@ResponseBody
	public Map<String, Object> updateDragSubmit(Schedule dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		try {
			dto.setEmp_no(info.getEmp_no());
			
			// 반복일정은 종료날짜등이 수정되지 않도록 설정
			if(dto.getRepeat() == 1 && dto.getRepeat_cycle() != 0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			
			service.updateSchedule(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 일정 삭제 - AJAX : JSON
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		String state = "true";
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("emp_no", info.getEmp_no());
			map.put("num", num);
			service.deleteSchedule(map);
		}catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	 
	
	
}
