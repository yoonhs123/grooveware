package com.sp.grooveware.goal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("goal.goalService")
public class GoalServiceImpl implements GoalService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertGoal(Goal dto, String pathname, String mode) throws Exception {
		try {
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			long seq = dao.selectOne("board.seq");
			
			if(mode.equals("write")) {	// 최상위 목표로 작성할때
				dto.setGoal_no(seq);
				dto.setGroup_no(0);
				dto.setDepth(0);
				dto.setOrder_no(0);
				dto.setParent(0);
				dto.setGoal_achv(0);
			} 
			
			
			
			
			dao.insertData("goal.insertGoal", dto);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Goal> listGoal(Map<String, Object> map) {
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.listGoal",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateGoal(Goal dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoal(int goal_no) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<Goal> listEmp(Map<String, Object> map) {	// 목표참여멤버 모달
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.listEmp",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Goal> listDepth1(Map<String, Object> map) {		// write에서 목표레벨 설정
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.listDepth0",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List<Goal> listDepth2(Map<String, Object> map) {		// write에서 목표레벨 설정
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.listDepth1",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return list;
	}	


}
