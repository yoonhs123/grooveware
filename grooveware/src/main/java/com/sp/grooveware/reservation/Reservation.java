package com.sp.grooveware.reservation;

public class Reservation {
	private long meroom_id;
	private String meroom_name;
	private String meroom_info;
	private int meroom_status;
	
	private long meroom_res_no;
	private long emp_no;
	private String meroom_resdate;
	private String res_starttime;
	private String res_enddate;
	private String res_content;
	
	public long getMeroom_id() {
		return meroom_id;
	}
	public void setMeroom_id(long meroom_id) {
		this.meroom_id = meroom_id;
	}
	public String getMeroom_name() {
		return meroom_name;
	}
	public void setMeroom_name(String meroom_name) {
		this.meroom_name = meroom_name;
	}
	public String getMeroom_info() {
		return meroom_info;
	}
	public void setMeroom_info(String meroom_info) {
		this.meroom_info = meroom_info;
	}
	public int getMeroom_status() {
		return meroom_status;
	}
	public void setMeroom_status(int meroom_status) {
		this.meroom_status = meroom_status;
	}
	public long getMeroom_res_no() {
		return meroom_res_no;
	}
	public void setMeroom_res_no(long meroom_res_no) {
		this.meroom_res_no = meroom_res_no;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getMeroom_resdate() {
		return meroom_resdate;
	}
	public void setMeroom_resdate(String meroom_resdate) {
		this.meroom_resdate = meroom_resdate;
	}
	public String getRes_starttime() {
		return res_starttime;
	}
	public void setRes_starttime(String res_starttime) {
		this.res_starttime = res_starttime;
	}
	public String getRes_enddate() {
		return res_enddate;
	}
	public void setRes_enddate(String res_enddate) {
		this.res_enddate = res_enddate;
	}
	public String getRes_content() {
		return res_content;
	}
	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}

}
