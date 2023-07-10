package com.sp.grooveware.task;

import java.util.List;
import java.util.Map;

public interface TaskService {
	
	public String readGoalname(long goal_no);
	
	public void insertTask(Task dto, String pathname) throws Exception;
	public List<Task> listGoalmember(Map<String, Object> map);
}
