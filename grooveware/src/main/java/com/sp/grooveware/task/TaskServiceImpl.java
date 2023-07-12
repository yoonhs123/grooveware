package com.sp.grooveware.task;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.FileManager;
import com.sp.grooveware.common.dao.CommonDAO;

@Service("task.taskService")
public class TaskServiceImpl implements TaskService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertTask(Task dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.insertData("task.insertTask", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public String readGoalname(long goal_no) {

		String goalname = "";
		
		try {
			goalname = dao.selectOne("task.readGoalname", goal_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return goalname;
	}

	
	@Override
	public List<Task> listGoalmember(Map<String, Object> map) {
		List<Task> list = null;
		
		try {
			list = dao.selectList("task.listGoalmember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	// 알림표시
	@Override
	public int newTaskCount(long emp_no) {
		int result = 0;
		
		try {
			result = dao.selectOne("task.newTaskCount", emp_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public int dataCount(Map<String, Object> map) {

		int dataCount = 0;
		
		try {
			dataCount = dao.selectOne("task.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}

	
	@Override
	public int dataCount1(Map<String, Object> map) {
		int dataCount = 0;
		
		try {
			dataCount = dao.selectOne("task.dataCount1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}

	
	
	
	@Override
	public List<Task> listTask(Map<String, Object> map) {
		List<Task> list = null;
		
		try {
			list = dao.selectList("task.listTask", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Task> listTask1(Map<String, Object> map) {
		List<Task> list = null;
		
		try {
			list = dao.selectList("task.listTask1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Task readTask(long task_no) {
		Task dto = null;
		
		try {
			dto = dao.selectOne("task.readTask", task_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Task readTask1(long task_no) {
	Task dto = null;
		
		try {
			dto = dao.selectOne("task.readTask1", task_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void submitTask(Task dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() !=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("task.updateTaskCount", dto);
			dao.updateData("task.submitTask", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateTask(Task dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() !=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("task.updateTask1", dto);
			dao.updateData("task.updateTask2", dto);
			dao.updateData("task.updateTask3", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int matchTaskmember(long task_no) {
		
		int taskmember = 0;
		
		try {
			taskmember = dao.selectOne("task.matchTaskmember", task_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return taskmember;
	}

	@Override
	public Task readsendfile(long task_no) {
		Task dto = null;
		
		try {
			dto = dao.selectOne("task.readTask3", task_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	
}
