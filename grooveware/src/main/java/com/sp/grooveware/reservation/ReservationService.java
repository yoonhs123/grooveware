package com.sp.grooveware.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public List<Reservation> listMeetingroom();
	public void insertReservation(Reservation dto) throws Exception;
	public List<Reservation> listResByDate(Map<String,Object> map);
	public List<Reservation> listMyRes(Map<String,Object> map);
	public Reservation readReservation(long meroom_res_no);
	
	public void deleteReservation(long meroom_res_no) throws Exception;
	
}
