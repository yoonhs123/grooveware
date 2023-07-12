package com.sp.grooveware.task;

import java.util.List;
import java.util.Map;

public interface TaskService {
	
	public String readGoalname(long goal_no);
	
	public void insertTask(Task dto, String pathname) throws Exception;
	public List<Task> listGoalmember(Map<String, Object> map);
	
	public int newTaskCount(long emp_no);
	
	public List<Task> listTask(Map<String, Object> map);
	public List<Task> listTask1(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int dataCount1(Map<String, Object> map);
	
	public Task readTask(long task_no);
	public Task readTask1(long task_no);
	
	public void submitTask(Task dto, String pathname) throws Exception;
	
	public void updateTask(Task dto, String pathname) throws Exception;
	
	public int matchTaskmember(long task_no);
}
