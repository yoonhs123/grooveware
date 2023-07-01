package com.sp.grooveware.address;

import java.util.List;
import java.util.Map;


public interface AddressService {
	
		public int dataCount(Map<String, Object> map);
		public List<Address> listAddressMember(Map<String, Object> map);
		
		public int friendCount(Map<String, Object> map);
		public List<Address> listAddressFriend(Map<String, Object> map);
		public void insertAddressFriend(Long emp_no, List<Long> emp_nos) throws Exception;
		public void deleteAddressFriend(Long emp_no, List<Long> emp_nos) throws Exception;		

}
