package com.sp.grooveware.myInsa;

import java.util.List;
import java.util.Map;

public interface MyInsaService {
	// insaCard
	public int getAnnualLeave(long emp_no);
	public MyInsa readInsaCard(long emp_no);
	
	// profile
	public MyInsa readProfile(long emp_no);
	
	// profile 수정
	public void profileUpdate(MyInsa dto, String pathname) throws Exception;
	
	// 출퇴근 기록
	public int dataCount(Map<String, Object> map);
	public List<MyInsa> readWorkTime(Map<String, Object> map, long emp_no);
	public MyInsa getWork(long emp_no);
}
