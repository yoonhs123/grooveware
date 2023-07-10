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
		// TODO Auto-generated method stub
		
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

	
	
}
