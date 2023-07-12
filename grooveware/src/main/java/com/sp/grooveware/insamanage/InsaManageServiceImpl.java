package com.sp.grooveware.insamanage;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("insamanage.insaManageService")
public class InsaManageServiceImpl implements InsaManageService  {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
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
	public void insertEmp(InsaManage dto, String pathname) throws Exception {
		
		try {

			long seq = dao.selectOne("insaManage.seq");
			String empsavaFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(empsavaFilename != null) {
				dto.setEmp_save_filename(empsavaFilename);
			}

			dto.setHistory_no(seq);
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
			// 모든 직위
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
	public InsaManage readProfile(long emp_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.readProfile", emp_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int getAnnualLeave(long emp_no) {
		int annualLeave = 0;
		
		try {
			annualLeave = dao.selectOne("insaManage.readAnnualLeave", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return annualLeave;
	}
	

	@Override
	public InsaManage readInsaCard(long emp_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.readProfile", emp_no);
			
			int annualLeave = dao.selectOne("insaManage.readAnnualLeave", emp_no);
			dto.setAnnual_leave(annualLeave);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	
	@Override
	public void updatePosDept(InsaManage dto) throws Exception {
		try {
			dao.updateData("insaManage.updatePosDept", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public InsaManage readPosDept(long emp_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.selectPosDept", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void insertPosDept(InsaManage dto) throws Exception {
		try {
			dao.insertData("insaManage.insertPosDept", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	@Override
	public void updateEmpStatus(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("insaManage.updateEmpStatus", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateEmpStatus2(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("insaManage.updateEmpStatus2", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<InsaManage> workList(Map<String, Object> map) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listWork", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int workDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("insaManage.workDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<InsaManage> readWorkTime(Map<String, Object> map, long emp_no) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listWorkRecord", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InsaManage getWork(long emp_no) {
		InsaManage dto = null;
		
		try {
			dto = dao.selectOne("insaManage.workCount", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	@Override
	public List<InsaManage> posHistoryList(long emp_no) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.posHistoryList", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<InsaManage> deptHistoryList(long emp_no) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.deptHistoryList", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int holidayCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("insaManage.holidayDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<InsaManage> holidayMemberList(Map<String, Object> map) {
		List<InsaManage> list = null;
		
		try {
			list = dao.selectList("insaManage.listholidayMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
