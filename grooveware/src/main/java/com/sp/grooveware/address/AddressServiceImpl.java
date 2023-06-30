package com.sp.grooveware.address;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;
import com.sp.grooveware.insamanage.InsaManage;

@Service("Address.AddressService")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
  	int result = 0;
		
		try {
			result = dao.selectOne("Address.dataCount", map);
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
	public void insertEmp(Address dto, String pathname) throws Exception {
		
	
	}

	@Override
	public Address readDeptCategory(long dept_no) {
       Address dto = null;
		
		try {
			dto = dao.selectOne(".readDeptCategory", dept_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Address> listDeptCategory() {
        List<Address> list = null;
		
		try {
			list = dao.selectList("address.listDeptCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Address> listDeptSubCategory(long top_dept_no) {
		List<Address> list = null;
		
		try {
			list = dao.selectList("address.listDeptSubCategory", top_dept_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Address readPosCategory(long pos_no) {
        Address dto = null;
		
		try {
			dto  = dao.selectOne("address.readPosCategory", pos_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Address> listPosCategory() {
		List<Address> list = null;
		
		try {
			// 모든 직위
			list = dao.selectList("address.listPosCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Address> listPosSubCategory(long top_pos_no) {
       List<Address> list = null;
		
		try {
			list = dao.selectList("address.listPosSubCategory", top_pos_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Address readProfile(long emp_no) {
		Address dto = null;
		
		try {
			dto = dao.selectOne("address.readProfile", emp_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int getAnnualLeave(long emp_no) {
		
		return 0;
	}

	@Override
	public Address readAddressCard(long emp_no) {
		
		return null;
	}

	@Override
	public void updateEmpStatus(Map<String, Object> map) throws Exception {
		
		
	}



}
