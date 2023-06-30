package com.sp.grooveware.goal;

import java.util.List;
import java.util.Map;

public interface GoalService {
    public void insertGoal(Goal dto, String pathname, String mode) throws Exception;
    
    public List<Goal> listGoal(Map<String, Object> map);
    
    public void updateGoal(Goal dto) throws Exception;
    
    public void deleteGoal(int goal_no);
    
    public List<Goal> listEmp(Map<String, Object> map);
    
    public List<Goal> listDepth1(Map<String, Object> map);
    public List<Goal> listDepth2(Map<String, Object> map);
}
