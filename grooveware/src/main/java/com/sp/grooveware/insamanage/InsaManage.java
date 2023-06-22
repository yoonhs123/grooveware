package com.sp.grooveware.insamanage;

import org.springframework.web.multipart.MultipartFile;

public class InsaManage {
	private Long emp_no;
	private String emp_pwd;
	private String emp_name;
	private String emp_rrn;
	private String emp_email;
	private String emp_tel;
	private String emp_address;
	private String emp_join_date;
	private String emp_resign_date;
	private Long emp_status;
	private MultipartFile emp_picture;
	
	private Long history_no;
	private int pos_no;
	private String pos_startdate;
	private String pos_enddate;
	private Long dept_no;
	private String dept_startdate;
	private String dept_enddate;
	
	public Long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(Long emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_rrn() {
		return emp_rrn;
	}
	public void setEmp_rrn(String emp_rrn) {
		this.emp_rrn = emp_rrn;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public String getEmp_address() {
		return emp_address;
	}
	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}
	public String getEmp_join_date() {
		return emp_join_date;
	}
	public void setEmp_join_date(String emp_join_date) {
		this.emp_join_date = emp_join_date;
	}
	public String getEmp_resign_date() {
		return emp_resign_date;
	}
	public void setEmp_resign_date(String emp_resign_date) {
		this.emp_resign_date = emp_resign_date;
	}
	public Long getEmp_status() {
		return emp_status;
	}
	public void setEmp_status(Long emp_status) {
		this.emp_status = emp_status;
	}
	public int getPos_no() {
		return pos_no;
	}
	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}
	public String getPos_startdate() {
		return pos_startdate;
	}
	public void setPos_startdate(String pos_startdate) {
		this.pos_startdate = pos_startdate;
	}
	public String getPos_enddate() {
		return pos_enddate;
	}
	public void setPos_enddate(String pos_enddate) {
		this.pos_enddate = pos_enddate;
	}
	public Long getDept_no() {
		return dept_no;
	}
	public void setDept_no(Long dept_no) {
		this.dept_no = dept_no;
	}
	public String getDept_startdate() {
		return dept_startdate;
	}
	public void setDept_startdate(String dept_startdate) {
		this.dept_startdate = dept_startdate;
	}
	public String getDept_enddate() {
		return dept_enddate;
	}
	public void setDept_enddate(String dept_enddate) {
		this.dept_enddate = dept_enddate;
	}
	public MultipartFile getEmp_picture() {
		return emp_picture;
	}
	public void setEmp_picture(MultipartFile emp_picture) {
		this.emp_picture = emp_picture;
	}
	public Long getHistory_no() {
		return history_no;
	}
	public void setHistory_no(Long history_no) {
		this.history_no = history_no;
	}
	
	
}
