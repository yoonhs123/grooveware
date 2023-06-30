package com.sp.grooveware.address;

import java.util.List;
import java.util.Map;


public interface AddressService {
	
	    // 사원 수
		public int dataCount(Map<String, Object> map);
		// 사원 리스트
		public List<Address> listAddressMember(Map<String, Object> map);
		
		// 사원 등록
		public void insertEmp(Address dto, String pathname) throws Exception;
		
		// 부서
		public Address readDeptCategory(long dept_no);
		// 부서 상위 카테고리 목록
		public List<Address> listDeptCategory();
		// 부서 하위 카테고리 목록
		public List<Address> listDeptSubCategory(long top_dept_no);
		
		// 직위
		public Address readPosCategory(long pos_no);
		// 직위 상위 목록 
		public List<Address> listPosCategory();
		// 하위 직위 목록
		public List<Address> listPosSubCategory(long top_pos_no);
		
		// 사원 인사정보
		public Address readProfile(long emp_no);
		
		
		// 사원 연차
		public int getAnnualLeave(long emp_no);
		// 사원 기록 카드
		public Address readAddressCard(long emp_no);
		
		
		// 사원 상태 변경
		public void updateEmpStatus(Map<String, Object> map) throws Exception;
		
	
		
}
