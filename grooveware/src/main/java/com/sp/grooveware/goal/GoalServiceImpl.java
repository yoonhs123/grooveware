package com.sp.grooveware.goal;

import java.util.HashMap;
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
	public void insertGoal1(Goal dto, String pathname) throws Exception {
		try {
			// 최상위 목표로 인서트
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.insertData("goal.insertGoal1",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertGoal2(Goal dto, String pathname) throws Exception {
		try {
			// 자식 목표로 인서트
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("group_no", dto.getGroup_no());
			map.put("order_no", dto.getOrder_no());
			map.put("depth", dto.getDepth());
			
			
			dao.updateData("goal.updateOrderno",map);
			
			dao.insertData("goal.insertGoal2", dto);
		
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
	public void deleteGoal(long goal_no) {
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

	@Override
	public Goal selectParent(long parent) {	// 셀렉트박스에서 상위목표 정보읽어오기
		Goal dto = null;
		
		try {
			dto = dao.selectOne("goal.readGoalparent", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Goal readPjname(long pj_no) {
		Goal dto = null;
		
		try {
			dto = dao.selectOne("goal.readPjname", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Goal readGoal(long goal_no) {
		Goal dto = null;
		
		try {
			dto = dao.selectOne("goal.readGoal", goal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public List<Goal> readGoalmember(Map<String, Object> map) {
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.readGoalmember",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(long pj_no) {

		int dataCount = 0;
		
		try {
			dataCount = dao.selectOne("goal.dataCount", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}



}
