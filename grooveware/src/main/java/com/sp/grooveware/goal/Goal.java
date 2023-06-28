package com.sp.grooveware.goal;

public class Goal {
    private int goalNo;
    private String goalName;
    private int topGoalNo;  // 상위 Goal 번호
    
	public int getGoalNo() {
		return goalNo;
	}
	public void setGoalNo(int goalNo) {
		this.goalNo = goalNo;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public int getTopGoalNo() {
		return topGoalNo;
	}
	public void setTopGoalNo(int topGoalNo) {
		this.topGoalNo = topGoalNo;
	}
    
    
    
}