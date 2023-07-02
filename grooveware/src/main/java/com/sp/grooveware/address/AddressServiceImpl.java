package com.sp.grooveware.address;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("Address.AddressService")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private CommonDAO dao;
		
	
	@Override
	public int dataCount(Map<String, Object> map) {
  	int result = 0;
		
		try {
			result = dao.selectOne("address.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Address> listAddressMember(Map<String, Object> map) {
        List<Address> list = null;
		
		try {
			list = dao.selectList("address.listAddressMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int friendCount(Map<String, Object> map) {
			int result = 0;
			
			try {
				result = dao.selectOne("address.friendCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
	}

	@Override
	public List<Address> listAddressFriend(Map<String, Object> map) {
		   List<Address> list = null;
			
			try {
				list = dao.selectList("address.listAddressFriend", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
	}

	@Override
	public void insertAddressFriend(Long emp_no, List<Long> emp_nos) throws Exception {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp_no", emp_no);
			
			for(Long no : emp_nos) {
				map.put("friend_no", no);
				dao.insertData("address.insertAddressFriend", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAddressFriend(Long emp_no, List<Long> emp_nos) throws Exception {
		
		try {
			
			
			dao.deleteData("address.deleteAddressFriend");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



}
