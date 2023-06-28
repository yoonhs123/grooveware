package com.sp.grooveware.goal;

import java.util.List;

public interface GoalService {
    public void addGoal(Goal goal);
    public Goal getGoalByNo(int goalNo);
    public List<Goal> getAllGoals();
    public List<Goal> getChildGoals(int parentGoalNo);
    public void updateGoal(Goal goal);
    public void deleteGoal(int goalNo);
    public void deleteSubgoal(int goalNo);
}
