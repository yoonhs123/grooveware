package com.sp.grooveware.insamanage;

import java.util.List;

public interface InsaManageService {
	
	// 사원 등록
	public void insertEmp(InsaManage dto) throws Exception;
	
	// 부서 상위 카테고리 목록
	public InsaManage readDeptCategory(long dept_no);
	// 부서 상위 카테고리 목록
	public List<InsaManage> listDeptCategory();
	// 부서 하위 카테고리 목록
	public List<InsaManage> listDeptSubCategory(long top_dept_no);
	// 직위 목록
	public List<InsaManage> listPosCategory();
}
