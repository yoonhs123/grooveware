package com.sp.grooveware.insamanage;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("insamanage.insaManageService")
public class InsaManageServiceImpl implements InsaManageService  {
	@Autowired
	private CommonDAO dao;

	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("insaManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<InsaManage> listinsaMember(Map<String, Object> map) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listinsaMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
	public void insertEmp(InsaManage dto) throws Exception {
		try {

			long seq = dao.selectOne("insaManage.seq");
			
			String dept_name = dao.selectOne("insaManage.listDeptCategory");
			String pos_name = dao.selectOne("insaManage.listPosCategory");
			
			dto.setHistory_no(seq);
			dto.setDept_name(dept_name);
			dto.setPos_name(pos_name);
			
			dao.insertData("insaManage.insertEmp", dto);
			dao.insertData("insaManage.insertHistory", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public InsaManage readDeptCategory(long dept_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.readDeptCategory", dept_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<InsaManage> listDeptCategory() {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listDeptCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<InsaManage> listDeptSubCategory(long top_dept_no) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listDeptSubCategory", top_dept_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InsaManage readPosCategory(long pos_no) {
		InsaManage dto = null;
		
		try {
			dto  = dao.selectOne("insaManage.readPosCategory", pos_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public List<InsaManage> listPosCategory() {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listPosCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<InsaManage> listPosSubCategory(long top_pos_no) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listPosSubCategory", top_pos_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InsaManage readProfile(String emp_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.readProfile", emp_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
