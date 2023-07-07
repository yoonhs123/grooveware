package com.sp.grooveware.myInsa;

import org.springframework.web.multipart.MultipartFile;

public class MyInsa {
	private long emp_no;
	private long emp_pwd;
	private String emp_name;
	private String emp_rrn;
	private String emp_email;
	private String emp_tel;
	private String emp_address;
	private String emp_join_date;
	private String emp_resign_date;
	private long emp_status;
	private String emp_picture;
	private String emp_zip;
	private String emp_addr1;
	private String emp_addr2;
	private String top_dept_name;
	
	private MultipartFile selectFile;
	
	// 연차
	private int annual_leave;

	private long top_dept_no;
	private long dept_no;
	private String dept_name;
	private String dept_startdate;
	private String dept_enddate;
	
	private int pos_no;
	private String pos_name;
	private String pos_startdate;
	private String pos_enddate;
	
	// 출퇴근
	private long record_no;
	private String work_day;
	private String work_starttime;
	private String work_endtime;
	private String work_status;
	
	private String work_year;
	private long work_Count;
	private long workLate_Count;
	private long workAbsence_Count;
	private long workLateEarly_Count;
	
	
	public long getWork_Count() {
		return work_Count;
	}
	public void setWork_Count(long work_Count) {
		this.work_Count = work_Count;
	}
	public long getWorkLate_Count() {
		return workLate_Count;
	}
	public void setWorkLate_Count(long workLate_Count) {
		this.workLate_Count = workLate_Count;
	}
	public long getWorkAbsence_Count() {
		return workAbsence_Count;
	}
	public void setWorkAbsence_Count(long workAbsence_Count) {
		this.workAbsence_Count = workAbsence_Count;
	}
	public long getRecord_no() {
		return record_no;
	}
	public void setRecord_no(long record_no) {
		this.record_no = record_no;
	}
	public String getWork_day() {
		return work_day;
	}
	public void setWork_day(String work_day) {
		this.work_day = work_day;
	}
	public String getWork_starttime() {
		return work_starttime;
	}
	public void setWork_starttime(String work_starttime) {
		this.work_starttime = work_starttime;
	}
	public String getWork_endtime() {
		return work_endtime;
	}
	public void setWork_endtime(String work_endtime) {
		this.work_endtime = work_endtime;
	}
	public String getWork_status() {
		return work_status;
	}
	public void setWork_status(String work_status) {
		this.work_status = work_status;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public long getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(long emp_pwd) {
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
	public long getEmp_status() {
		return emp_status;
	}
	public void setEmp_status(long emp_status) {
		this.emp_status = emp_status;
	}
	public String getEmp_picture() {
		return emp_picture;
	}
	public void setEmp_picture(String emp_picture) {
		this.emp_picture = emp_picture;
	}
	public int getAnnual_leave() {
		return annual_leave;
	}
	public void setAnnual_leave(int annual_leave) {
		this.annual_leave = annual_leave;
	}
	public long getDept_no() {
		return dept_no;
	}
	public void setDept_no(long dept_no) {
		this.dept_no = dept_no;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getPos_no() {
		return pos_no;
	}
	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	
	public String getEmp_zip() {
		return emp_zip;
	}
	public void setEmp_zip(String emp_zip) {
		this.emp_zip = emp_zip;
	}
	public String getEmp_addr1() {
		return emp_addr1;
	}
	public void setEmp_addr1(String emp_addr1) {
		this.emp_addr1 = emp_addr1;
	}
	public String getEmp_addr2() {
		return emp_addr2;
	}
	public void setEmp_addr2(String emp_addr2) {
		this.emp_addr2 = emp_addr2;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public long getWorkLateEarly_Count() {
		return workLateEarly_Count;
	}
	public void setWorkLateEarly_Count(long workLateEarly_Count) {
		this.workLateEarly_Count = workLateEarly_Count;
	}
	public String getWork_year() {
		return work_year;
	}
	public void setWork_year(String work_year) {
		this.work_year = work_year;
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
	public long getTop_dept_no() {
		return top_dept_no;
	}
	public void setTop_dept_no(long top_dept_no) {
		this.top_dept_no = top_dept_no;
	}
	public String getTop_dept_name() {
		return top_dept_name;
	}
	public void setTop_dept_name(String top_dept_name) {
		this.top_dept_name = top_dept_name;
	}
}
