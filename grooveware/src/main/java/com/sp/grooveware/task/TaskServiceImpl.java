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
			dataCount = dao.selectOne("goal.dataCount", map);
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

	
	
}
