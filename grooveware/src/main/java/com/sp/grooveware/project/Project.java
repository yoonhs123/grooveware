package com.sp.grooveware.project;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Project {
	private long pj_no;
	private String pj_name;
	private String pj_content;
	private long pj_creator;
	private String pj_start_date;
	private String pj_end_date;
	private int pj_status;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile;
	
	
	private String client_name;
	
	private long pj_member_no;
	private int pj_join_type;
	private String pj_member_join_date;
	
	private int category;	
	
	private long emp_no;
	private List<Long> emps;
	private String emp_name;
	private String pos_name;
	private String dept_name;
	
	
	
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
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
	public String getPj_content() {
		return pj_content;
	}
	public void setPj_content(String pj_content) {
		this.pj_content = pj_content;
	}
	public long getPj_creator() {
		return pj_creator;
	}
	public void setPj_creator(long pj_creator) {
		this.pj_creator = pj_creator;
	}
	public String getPj_start_date() {
		return pj_start_date;
	}
	public void setPj_start_date(String pj_start_date) {
		this.pj_start_date = pj_start_date;
	}
	public String getPj_end_date() {
		return pj_end_date;
	}
	public void setPj_end_date(String pj_end_date) {
		this.pj_end_date = pj_end_date;
	}
	public int getPj_status() {
		return pj_status;
	}
	public void setPj_status(int pj_status) {
		this.pj_status = pj_status;
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
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public long getPj_member_no() {
		return pj_member_no;
	}
	public void setPj_member_no(long pj_member_no) {
		this.pj_member_no = pj_member_no;
	}
	public int getPj_join_type() {
		return pj_join_type;
	}
	public void setPj_join_type(int pj_join_type) {
		this.pj_join_type = pj_join_type;
	}
	public String getPj_member_join_date() {
		return pj_member_join_date;
	}
	public void setPj_member_join_date(String pj_member_join_date) {
		this.pj_member_join_date = pj_member_join_date;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	

	
	
	

	
	
	
}
