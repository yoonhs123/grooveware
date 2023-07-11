package com.sp.grooveware.insamanage;

import java.util.List;
import java.util.Map;

public interface InsaManageService {
	// 사원 수
	public int dataCount(Map<String, Object> map);
	// 사원 리스트
	public List<InsaManage> listinsaMember(Map<String, Object> map);
	
	// 사원 등록
	public void insertEmp(InsaManage dto, String pathname) throws Exception;
	
	// 부서
	public InsaManage readDeptCategory(long dept_no);
	// 부서 상위 카테고리 목록
	public List<InsaManage> listDeptCategory();
	// 부서 하위 카테고리 목록
	public List<InsaManage> listDeptSubCategory(long top_dept_no);
	
	// 직위
	public InsaManage readPosCategory(long pos_no);
	// 직위 상위 목록 
	public List<InsaManage> listPosCategory();
	// 하위 직위 목록
	public List<InsaManage> listPosSubCategory(long top_pos_no);
	
	// 사원 인사정보
	public InsaManage readProfile(long emp_no);
	
	// 직위/부서 변경
	public void updatePosDept(InsaManage dto) throws Exception;
	// 직위/부서 상태 article
	public InsaManage readPosDept(long emp_no);
	// 직위/부서 insert
	public void insertPosDept(InsaManage dto) throws Exception;
	
	
	// 사원 연차
	public int getAnnualLeave(long emp_no);
	// 사원 기록 카드
	public InsaManage readInsaCard(long emp_no);
	
	
	// 사원 상태 변경
	public void updateEmpStatus(Map<String, Object> map) throws Exception;
	public void updateEmpStatus2(Map<String, Object> map) throws Exception;
	
	// 근태 사원 리스트
	public List<InsaManage> workList(Map<String, Object> map);
	// 근태 사원 수
	public int workDataCount(Map<String, Object> map);
	// 사원 근태 계산
	public InsaManage getWork(long emp_no);
	// 사원 근태 상세
	public List<InsaManage> readWorkTime(Map<String, Object> map, long emp_no);
	
	
	// PosHistoryList 
	public List<InsaManage> posHistoryList(long emp_no);
	// DeptHistoryList
	public List<InsaManage> deptHistoryList(long emp_no);
	
	
	// 휴가 직원 count
	public int holidayCount(Map<String, Object> map);
	// 휴가 사원 리스트
	public List<InsaManage> holidayMemberList(Map<String, Object> map);
}
