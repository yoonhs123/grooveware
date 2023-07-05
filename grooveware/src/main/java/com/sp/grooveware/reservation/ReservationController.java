package com.sp.grooveware.reservation;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.grooveware.member.SessionInfo;

@Controller("reservation.ReservationController")
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	private ReservationService service;
	
	@RequestMapping(value="main")
	public String main(
			@RequestParam(required = false) String date,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		Calendar cal = Calendar.getInstance();
		if(date == null) {
			date = String.format("%tF", cal);
		}
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		LocalDate localDate = LocalDate.parse(date);
		LocalDate preLocalDate = localDate.minusDays(1);
		LocalDate nextLocalDate = localDate.plusDays(1);
		
		String preDate = preLocalDate.format(dtf);
		String nextDate = nextLocalDate.format(dtf);
	
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		map.put("meroom_resdate", date);
		
		List<Reservation> listByDate = service.listResByDate(map);
		for(Reservation vo : listByDate) {
			vo.setStarttime(Integer.parseInt(vo.getRes_starttime().substring(0, 2)));
			vo.setEndtime(Integer.parseInt(vo.getRes_endtime().substring(0, 2)));
		}
		
		List<Reservation> listMr = service.listMeetingroom();
		
		List<Reservation> listToday = service.listResBytoday(map);
		
		model.addAttribute("listByDate", listByDate);
		model.addAttribute("listMr", listMr);
		
		model.addAttribute("list", listToday);
		
		model.addAttribute("date", date);
		model.addAttribute("preDate", preDate);
		model.addAttribute("nextDate", nextDate);
	
		return ".schedule.reservation.main"; 
		
	}
	
	@RequestMapping(value="myres")
	public String myres(
			@RequestParam(required = false) String year,
			@RequestParam(required = false) String month,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Calendar cal = Calendar.getInstance();
		int currentYear = cal.get(Calendar.YEAR);
				
		String date = null;
		if(year == null || month == null) {
			year = String.format("%04d",cal.get(Calendar.YEAR));
			month = String.format("%02d",cal.get(Calendar.MONTH)+1);
		}
		date = year + month;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", info.getEmp_no());
		map.put("meroom_resdate", date);
		
		List<Reservation> list = service.listMyResByMonth(map);
		for(Reservation vo : list) {
			vo.setStarttime(Integer.parseInt(vo.getRes_starttime().substring(0, 2)));
			vo.setEndtime(Integer.parseInt(vo.getRes_endtime().substring(0, 2)));
		}
		
		model.addAttribute("list", list);
		
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return ".schedule.reservation.myres"; 
		
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String resForm(Model model) {
		
		List<Reservation> listMeetingroom = service.listMeetingroom();
		
		model.addAttribute("mode","write");
		model.addAttribute("listMeetingroom", listMeetingroom);
		
		return ".schedule.reservation.resform";
		
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(Reservation dto, HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			
			dto.setEmp_no(info.getEmp_no());
			
			service.insertReservation(dto);
			
		} catch (Exception e) {
		}

		return "redirect:/reservation/main";
	}

	@RequestMapping(value= "roominfo", method=RequestMethod.GET)
	public String roominfo(@RequestParam long meroom_id,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Reservation dto = service.Meetingroom(meroom_id);

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("meroom_id", meroom_id);
		map.put("emp_no", info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return "schedule/reservation/roominfo";
	}
	
	@RequestMapping(value= "resinfo", method=RequestMethod.GET)
	public String readDetail(@RequestParam long meroom_res_no,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Reservation dto = service.readReservation(meroom_res_no);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("meroom_res_no", meroom_res_no);
		map.put("emp_no", info.getEmp_no());
		
		model.addAttribute("dto", dto);
		
		return "schedule/reservation/resinfo"; // 모달로 띄우기(예약번호별)
		// 포워딩 시켜서 데이터 읽어오기
	}

	@RequestMapping(value = "delete")
	public String delete(@RequestParam long meroom_res_no
			) throws Exception {

		try {
			service.deleteReservation(meroom_res_no);
		} catch (Exception e) {
		}

		return "redirect:/reservation/myres";
	}
}
	
