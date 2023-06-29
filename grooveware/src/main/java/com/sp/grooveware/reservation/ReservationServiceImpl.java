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
	public void insertReservation(Reservation dto) throws Exception {
		// 예약
		try {
			dao.insertData("reservation.insertMrRes", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reservation> listMonth(Map<String, Object> map) throws Exception {
		// 예약 현황 조회
		List<Reservation> list = null;
		
		try {
			list = dao.selectList("", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Reservation readReservation(long meroom_res_no) throws Exception {
		// 예약 보기
		Reservation dto = null;
		try {
			dto = dao.selectOne("reservation.articleRes", meroom_res_no);
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

}
