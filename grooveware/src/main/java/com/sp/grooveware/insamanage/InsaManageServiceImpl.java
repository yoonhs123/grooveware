package com.sp.grooveware.insamanage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("insamanage.insaManageService")
public class InsaManageServiceImpl implements InsaManageService  {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertEmp(InsaManage dto, String pathname) throws Exception {
		try {
			Long seq = dao.selectOne("insaManage.seq");
			
			dto.setHistory_no(seq);
			
			dao.insertData("insaManage.insertEmp", dto);
			dao.insertData("insaManage.insertHistory", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	

}
