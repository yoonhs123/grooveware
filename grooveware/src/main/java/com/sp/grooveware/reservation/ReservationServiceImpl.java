package com.sp.grooveware.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("reservation.ReservationService")
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Reservation> listMeetingroom() {
		// 회의실 조회
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("reservation.listMeetingroom");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Reservation Meetingroom(long meroom_id) {
		// 회의실 정보 가져오기
		Reservation dto = null;
		
		try {
			dto = dao.selectOne("reservation.Meetingroom");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	
	@Override
	public void insertReservation(Reservation dto) throws Exception {
		// 예약
		try {
			dto.setRes_starttime(dto.getMeroom_resdate() + " " + dto.getRes_starttime() + ":00");
			dto.setRes_endtime(dto.getMeroom_resdate() + " " + dto.getRes_endtime() + ":00");
			
			dao.insertData("reservation.insertMrRes", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reservation> listResByDate(Map<String, Object> map) {
		// 일별 예약 현황 조회
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("listResByDate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Reservation> listMyRes(Map<String, Object> map) {
		// 내 예약 현황 조회
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("reservation.readResByEmpNo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Reservation readReservation(long meroom_res_no) {
		// 예약 보기(예약번호별)
		Reservation dto = null;
		try {
			dto = dao.selectOne("reservation.readResByResno", meroom_res_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteReservation(long meroom_res_no) throws Exception {
		// 예약 취소
		try {
			dao.deleteData("reservation.deleteMrRes", meroom_res_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public List<Reservation> listResBytoday(Map<String, Object> map) {
		// 회의실 당일 예약 리스트 보기
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("reservation.listResBytoday", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Reservation> listMyResByMonth(Map<String, Object> map) {
		// 내 예약 리스트 보기(월별)
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("reservation.listMyResByMonth", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}




}
