package com.sp.grooveware.club;

public class ClubNotice {
	private long club_id;
	private String club_name;
	private long emp_no;
	
	private long club_noti_no;
	private String club_noti_title;
	private String club_noti_content;
	private String club_noti_regdate;
	private long club_noti_hitcount;
	private String save_filename;
	private String original_filename;
	
	public long getClub_noti_no() {
		return club_noti_no;
	}
	public void setClub_noti_no(long club_noti_no) {
		this.club_noti_no = club_noti_no;
	}
	public long getClub_id() {
		return club_id;
	}
	public void setClub_id(long club_id) {
		this.club_id = club_id;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getClub_noti_title() {
		return club_noti_title;
	}
	public void setClub_noti_title(String club_noti_title) {
		this.club_noti_title = club_noti_title;
	}
	public String getClub_noti_content() {
		return club_noti_content;
	}
	public void setClub_noti_content(String club_noti_content) {
		this.club_noti_content = club_noti_content;
	}
	public String getClub_noti_regdate() {
		return club_noti_regdate;
	}
	public void setClub_noti_regdate(String club_noti_regdate) {
		this.club_noti_regdate = club_noti_regdate;
	}
	public long getClub_noti_hitcount() {
		return club_noti_hitcount;
	}
	public void setClub_noti_hitcount(long club_noti_hitcount) {
		this.club_noti_hitcount = club_noti_hitcount;
	}
	public String getSave_filename() {
		return save_filename;
	}
	public void setSave_filename(String save_filename) {
		this.save_filename = save_filename;
	}
	public String getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	
}
