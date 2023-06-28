package com.sp.grooveware.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public void insertReservation(Reservation dto) throws Exception;
	public List<Reservation> listMonth(Map<String,Object> map) throws Exception;
	public Reservation readReservation(long meroom_res_no) throws Exception;
	
	public void deleteReservation(long meroom_res_no) throws Exception;
	
}
