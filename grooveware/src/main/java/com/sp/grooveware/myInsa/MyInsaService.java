package com.sp.grooveware.myInsa;

import java.util.List;
import java.util.Map;

public interface MyInsaService {
	// 사원 연차
	public int getAnnualLeave(long emp_no);
	// insaCard
	public MyInsa readInsaCard(long emp_no);
	
	// profile
	public MyInsa readProfile(long emp_no);
	
	// profile 수정
	public void profileUpdate(MyInsa dto, String pathname) throws Exception;
	
	// 출퇴근 기록
	public int dataCount(Map<String, Object> map);
	public List<MyInsa> readWorkTime(Map<String, Object> map, long emp_no);
	public MyInsa getWork(long emp_no);
	
	// PosHistoryList 
	public List<MyInsa> posHistoryList(long emp_no);
	// DeptHistoryList
	public List<MyInsa> deptHistoryList(long emp_no);
	
	
	// 부서 리스트
	public List<MyInsa> listDept();
}
