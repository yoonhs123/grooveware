package com.sp.grooveware.task;

import org.springframework.web.multipart.MultipartFile;

public class Task {
	private long task_no;
	private String task_name;
	private String task_content;
	private String task_start_date;
	private String task_end_date;
	private long goal_no;
	private String goal_name;
	private long task_manager;		// 업무요청하는사람(로그인아이디)
	
	private String task_comment;
	private long task_member_no;	// 업무요청받는사람
	private int task_percent;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile;
	
	private String dept_name;
	private String emp_name;
	private String pos_name;
	private long emp_no;
	
	
	
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public long getTask_no() {
		return task_no;
	}
	public void setTask_no(long task_no) {
		this.task_no = task_no;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_content() {
		return task_content;
	}
	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}
	public String getTask_start_date() {
		return task_start_date;
	}
	public void setTask_start_date(String task_start_date) {
		this.task_start_date = task_start_date;
	}
	public String getTask_end_date() {
		return task_end_date;
	}
	public void setTask_end_date(String task_end_date) {
		this.task_end_date = task_end_date;
	}
	public long getGoal_no() {
		return goal_no;
	}
	public void setGoal_no(long goal_no) {
		this.goal_no = goal_no;
	}
	public String getGoal_name() {
		return goal_name;
	}
	public void setGoal_name(String goal_name) {
		this.goal_name = goal_name;
	}
	public long getTask_manager() {
		return task_manager;
	}
	public void setTask_manager(long task_manager) {
		this.task_manager = task_manager;
	}
	public String getTask_comment() {
		return task_comment;
	}
	public void setTask_comment(String task_comment) {
		this.task_comment = task_comment;
	}
	public long getTask_member_no() {
		return task_member_no;
	}
	public void setTask_member_no(long task_member_no) {
		this.task_member_no = task_member_no;
	}
	public int getTask_percent() {
		return task_percent;
	}
	public void setTask_percent(int task_percent) {
		this.task_percent = task_percent;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}	

	
	
	
}
