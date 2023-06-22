package com.sp.grooveware.project;

import org.springframework.web.multipart.MultipartFile;

public class Project {
	private long pj_no;
	private String pj_name;
	private String pj_content;
	private long pj_creator;
	private String pj_start_date;
	private String pj_end_date;
	private String pj_status;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile;
	
	private String client_name;
	
	private long emp_no;
	
	
	
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
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
	public String getPj_status() {
		return pj_status;
	}
	public void setPj_status(String pj_status) {
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
	
	
	
}
