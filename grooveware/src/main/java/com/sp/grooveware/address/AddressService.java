package com.sp.grooveware.address;

import java.util.List;
import java.util.Map;


public interface AddressService {
	
		public int dataCount(Map<String, Object> map);
		public List<Address> listAddressMember(Map<String, Object> map);
		public void insertEmp(Address dto, String pathname) throws Exception;
		public Address readDeptCategory(long dept_no);	
		public List<Address> listDeptCategory();
		public List<Address> listDeptSubCategory(long top_dept_no);
		public Address readPosCategory(long pos_no);
		public List<Address> listPosCategory();
		public List<Address> listPosSubCategory(long top_pos_no);	
		public Address readProfile(long emp_no);
		public int getAnnualLeave(long emp_no);
		public Address readAddressCard(long emp_no);
    	public void updateEmpStatus(Map<String, Object> map) throws Exception;
			
}
