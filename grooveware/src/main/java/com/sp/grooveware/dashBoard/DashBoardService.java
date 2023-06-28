package com.sp.grooveware.dashBoard;

public interface DashBoardService {
	// 출퇴근기록 
	public void insertWorkTime(WorkTime dto) throws Exception;
	public WorkTime readWorkTime(long emp_no);
	public void updateWorkTime(WorkTime dto) throws Exception;
	
	
}
