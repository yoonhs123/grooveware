package com.sp.grooveware.dashBoard;

public class WorkTime {
	private long emp_no;
	private String emp_name;

	// 출퇴근
	private long record_no;
	private String work_date;
	private String work_starttime;
	private String work_endtime;
	private int work_status;
	
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public long getRecord_no() {
		return record_no;
	}
	public void setRecord_no(long record_no) {
		this.record_no = record_no;
	}
	public String getWork_date() {
		return work_date;
	}
	public void setWork_date(String work_date) {
		this.work_date = work_date;
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
	public int getWork_status() {
		return work_status;
	}
	public void setWork_status(int work_status) {
		this.work_status = work_status;
	}	
}
