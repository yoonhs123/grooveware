package com.sp.grooveware.member;

// 세션에 저장할 정보(사원번호, 이름, 부서코드 등)
public class SessionInfo {
	private long emp_no;
	private String emp_name;
	private long dept_no;
	
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
	public long getDept_no() {
		return dept_no;
	}
	public void setDept_no(long dept_no) {
		this.dept_no = dept_no;
	}
	
}
