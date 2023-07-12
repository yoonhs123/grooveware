package com.sp.grooveware.dashBoard;

/**
 * @author wlgus
 *
 */
public class DashBoard {
	private long emp_no;
	private String emp_name;
	private String emp_save_filename;

	// 휴가통계
	private long holiday_id;
	private String holiday_name;
	private long annual_no;
	private String annual_count;
	
	// 전자결재
	private long doc_no;
	private String doc_name;
	private int doc_status;
	
	// 프로젝트 목표 현황
	private long goal_no;
	private long pj_no;
	private String goal_name;
	private long goal_achv;
	private String goal_start_date;
	private String goal_end_date;
	
	// 전체 공지사항 & 부서 공지사항
	private long noti_id;
	private long dept_id;
	private String noti_title;
	private String noti_emp_no;
	private String noti_regdate;
	
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
	public String getEmp_save_filename() {
		return emp_save_filename;
	}
	public void setEmp_save_filename(String emp_save_filename) {
		this.emp_save_filename = emp_save_filename;
	}
	public long getHoliday_id() {
		return holiday_id;
	}
	public void setHoliday_id(long holiday_id) {
		this.holiday_id = holiday_id;
	}
	public String getHoliday_name() {
		return holiday_name;
	}
	public void setHoliday_name(String holiday_name) {
		this.holiday_name = holiday_name;
	}
	public long getAnnual_no() {
		return annual_no;
	}
	public void setAnnual_no(long annual_no) {
		this.annual_no = annual_no;
	}
	public String getAnnual_count() {
		return annual_count;
	}
	public void setAnnual_count(String annual_count) {
		this.annual_count = annual_count;
	}

	public long getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(long doc_no) {
		this.doc_no = doc_no;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public int getDoc_status() {
		return doc_status;
	}
	public void setDoc_status(int doc_status) {
		this.doc_status = doc_status;
	}
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
	public String getGoal_name() {
		return goal_name;
	}
	public void setGoal_name(String goal_name) {
		this.goal_name = goal_name;
	}
	public long getGoal_achv() {
		return goal_achv;
	}
	public void setGoal_achv(long goal_achv) {
		this.goal_achv = goal_achv;
	}
	public long getNoti_id() {
		return noti_id;
	}
	public void setNoti_id(long noti_id) {
		this.noti_id = noti_id;
	}
	public long getDept_id() {
		return dept_id;
	}
	public void setDept_id(long dept_id) {
		this.dept_id = dept_id;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_emp_no() {
		return noti_emp_no;
	}
	public void setNoti_emp_no(String noti_emp_no) {
		this.noti_emp_no = noti_emp_no;
	}
	public String getNoti_regdate() {
		return noti_regdate;
	}
	public void setNoti_regdate(String noti_regdate) {
		this.noti_regdate = noti_regdate;
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
	
}
