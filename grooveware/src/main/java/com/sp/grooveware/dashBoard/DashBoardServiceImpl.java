package com.sp.grooveware.dashBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;

@Service("dashBoard.DashBoard")
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertWorkTime(WorkTime dto) throws Exception {
		// 출퇴근 기록 - 출근찍기
		try {
			
			WorkTime vo = readWorkTime(dto.getEmp_no());
			if(vo != null) {
				return;
			}
			
			dao.insertData("dashBoard.insertWorkTime", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public WorkTime readWorkTime(long emp_no) {
		// 당일 출퇴근기록 보기
		WorkTime dto = null;
		
		try {
			dto = dao.selectOne("dashBoard.readWorkTime", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void updateWorkTime(WorkTime dto) throws Exception {
		// 출퇴근 기록 - 퇴근찍기
		try {
			dao.updateData("dashBoard.updateWorkTime", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	
}
