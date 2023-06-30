package com.sp.grooveware.myInsa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;


@Service("myInsa.MyInsaService")
public class MyInsaServiceImpl implements MyInsaService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int getAnnualLeave(long emp_no) {
		int annualLeave = 0;
		
		try {
			annualLeave = dao.selectOne("myInsa.readAnnualLeave", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return annualLeave;
	}

	@Override
	public MyInsa readInsaCard(long emp_no) {
		MyInsa dto = null;
		
		try {
			dto = dao.selectOne("myInsa.readProfile", emp_no);
			
			int annualLeave = dao.selectOne("myInsa.readAnnualLeave", emp_no);
			dto.setAnnual_leave(annualLeave);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public MyInsa readProfile(long emp_no) {
		MyInsa dto  = null;
		
		try {
			dto = dao.selectOne("myInsa.readProfile2", emp_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void profileUpdate(MyInsa dto, String pathname) throws Exception {
		try {
			String emp_picture = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(emp_picture != null) {
				if(dto.getEmp_picture() != null && dto.getEmp_picture().length() != 0) {
					fileManager.doFileDelete(dto.getEmp_picture(), pathname);
				}
				
				dto.setEmp_picture(emp_picture);
			}
			
			dao.updateData("myInsa.updateProfile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
