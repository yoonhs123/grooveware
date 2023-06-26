package com.sp.grooveware.insamanage;

import java.util.List;
import java.util.Map;

public interface InsaManageService {
	// 사원 수
	public int dataCount(Map<String, Object> map);
	// 사원 리스트
	public List<InsaManage> listinsaMember(Map<String, Object> map);
	
	// 사원 등록
	public void insertEmp(InsaManage dto) throws Exception;
	
	// 부서 상위 카테고리 목록
	public InsaManage readDeptCategory(long dept_no);
	// 부서 상위 카테고리 목록
	public List<InsaManage> listDeptCategory();
	// 부서 하위 카테고리 목록
	public List<InsaManage> listDeptSubCategory(long top_dept_no);
	
	
	public InsaManage readPosCategory(long pos_no);
	// 직위 상위 목록 
	public List<InsaManage> listPosCategory();
	// 하위 직위 목록
	public List<InsaManage> listPosSubCategory(long top_pos_no);
	
	// 사원 인사정보
	public InsaManage readProfile(String emp_no);
	
	// 사원 기록 카드
	public InsaManage readInsaCard(String emp_no);
}
