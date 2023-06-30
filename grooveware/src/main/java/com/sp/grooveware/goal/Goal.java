package com.sp.grooveware.goal;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Goal {
    private long goal_no;
    private long pj_no;
    private String pj_name;
    private String goal_name;
    private String goal_start_date;
    private String goal_end_date;
    private String goal_content;
    private int goal_achv;
    private long parent;
    private int group_no;
    private int depth;
    private int order_no;
    
	private long emp_no;
	private List<Long> emps;
	private String emp_name;
	private String pos_name;
	private String dept_name;
    
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile;
	public long getGoal_no() {
		return goal_no;
	}
	public void setGoal_no(long goal_no) {
		this.goal_no = goal_no;
	}
	public long getPj_no() {
		return pj_no;
	}
	public void setPj_no(long pj_no) {
		this.pj_no = pj_no;
	}
	public String getPj_name() {
		return pj_name;
	}
	public void setPj_name(String pj_name) {
		this.pj_name = pj_name;
	}
	public String getGoal_name() {
		return goal_name;
	}
	public void setGoal_name(String goal_name) {
		this.goal_name = goal_name;
	}
	public String getGoal_start_date() {
		return goal_start_date;
	}
	public void setGoal_start_date(String goal_start_date) {
		this.goal_start_date = goal_start_date;
	}
	public String getGoal_end_date() {
		return goal_end_date;
	}
	public void setGoal_end_date(String goal_end_date) {
		this.goal_end_date = goal_end_date;
	}
	public String getGoal_content() {
		return goal_content;
	}
	public void setGoal_content(String goal_content) {
		this.goal_content = goal_content;
	}
	public int getGoal_achv() {
		return goal_achv;
	}
	public void setGoal_achv(int goal_achv) {
		this.goal_achv = goal_achv;
	}
	public long getParent() {
		return parent;
	}
	public void setParent(long parent) {
		this.parent = parent;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public List<Long> getEmps() {
		return emps;
	}
	public void setEmps(List<Long> emps) {
		this.emps = emps;
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
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
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