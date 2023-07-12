package com.sp.grooveware.goal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;
import com.sp.grooveware.task.Task;

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
			
			dao.insertData("goal.defaultInsert", dto);
			
			
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
			
			dao.insertData("goal.defaultInsert", dto);
		
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
	public void updateGoal(Goal dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() !=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("goal.updateGoal1", dto);
			dao.updateData("goal.updateGoal2", dto);
			
			// 멤버 수정이 없을경우. 추가안했을때
			if(dto.getEmps() != null) {
				
				insertGoalmember(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	
	@Override
	public void insertGoalmember(Goal dto) throws Exception {
		try {
			dao.insertData("goal.insertGoalmember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}




	

	@Override
	public void deleteGoal(long pj_no, long goal_no, long emp_no, String pathname) throws Exception{
		try {
			Goal dto = readGoal(goal_no);
			
			int qualify = 0;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pj_no", pj_no);
			map.put("login_emp", emp_no);
			qualify = dao.selectOne("goal.readAcess", map);
			
			if(dto == null || !(qualify == 0 || qualify == 1) ) {
				return;
			}
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			
			// 하위 업무 삭제
			
			
			// 목표 삭제
			
			if(dto.getDepth() == 0) {	// 최상위목표삭제
				dao.deleteData("goal.deleteGoal1-1", goal_no);	// goal_member 테이블 삭제

			} else if(dto.getDepth() == 1) {	// 상위목표삭제
				dao.deleteData("goal.deleteGoal2-1", goal_no);	// goal_member 테이블 삭제
				dao.deleteData("goal.deleteGoal2-2", goal_no);	// goal_member 테이블 삭제

				
			} else if(dto.getDepth() == 2) {	// 하위목표삭제
				dao.deleteData("goal.deleteGoal3-1", goal_no);	// goal 테이블 삭제
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
	public List<Goal> readGoalmember(long goal_no) {
		List<Goal> list = null;
		
		try {
			list = dao.selectList("goal.readGoalmember",goal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Task> readTaskmember(long goal_no) {
		List<Task> list = null;
		
		try {
			list = dao.selectList("goal.readTask", goal_no);
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

	

	@Override
	public int readstatus(long pj_no) {

		int pj_status = 0;
		
		try {
			pj_status = dao.selectOne("goal.readstatus", pj_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pj_status;
	}
	
	
	
	@Override
	public String readparentname(long num) {
		
		String readparentname = "";
		
		try {
			readparentname = dao.selectOne("goal.readparentname", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return readparentname;
	}

	@Override
	public String readprojectname(long num) {
		
		String readprojectname = "";
		
		try {
			readprojectname = dao.selectOne("goal.readprojectname", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return readprojectname;
	}

	@Override
	public int readAcess(Map<String, Object> map) {
		
		int qualify = 0;
		
		try {
			qualify = dao.selectOne("goal.readAcess", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return qualify;
	}

	@Override
	public void deleteGoalmember(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("goal.deleteGoalmember", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int taskCount(long goal_no) {
		int taskCount = 0;
		
		try {
			taskCount = dao.selectOne("goal.taskCount", goal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return taskCount;
		
	}

	@Override
	public int finishCount(long goal_no) {
		int finishCount = 0;
		
		try {
			finishCount = dao.selectOne("goal.finishCount", goal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return finishCount;
	}

	
}
