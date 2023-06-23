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
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reservation> listMonth(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation readReservation(long num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReservation(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
