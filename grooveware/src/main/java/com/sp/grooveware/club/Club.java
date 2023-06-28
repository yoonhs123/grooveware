package com.sp.grooveware.club;

import org.springframework.web.multipart.MultipartFile;

public class Club {
	private long club_id;
	private int approve_status;
	private String club_name;
	private int club_status;
	private String club_content;
	private String club_startdate;
	private String club_picture;
	
	private MultipartFile selectFile;
	
	private long emp_no;
	private String emp_name;
	private long member_count;
	private int member_authority;
	private int member_status;
	private String member_joindate;
	
	public long getClub_id() {
		return club_id;
	}
	public void setClub_id(long club_id) {
		this.club_id = club_id;
	}
	public int getApprove_status() {
		return approve_status;
	}
	public void setApprove_status(int approve_status) {
		this.approve_status = approve_status;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public int getClub_status() {
		return club_status;
	}
	public void setClub_status(int club_status) {
		this.club_status = club_status;
	}
	public String getClub_content() {
		return club_content;
	}
	public void setClub_content(String club_content) {
		this.club_content = club_content;
	}
	public String getClub_startdate() {
		return club_startdate;
	}
	public void setClub_startdate(String club_startdate) {
		this.club_startdate = club_startdate;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public int getMember_authority() {
		return member_authority;
	}
	public void setMember_authority(int member_authority) {
		this.member_authority = member_authority;
	}
	public int getMember_status() {
		return member_status;
	}
	public void setMember_status(int member_status) {
		this.member_status = member_status;
	}
	public String getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}
	public long getMember_count() {
		return member_count;
	}
	public void setMember_count(long member_count) {
		this.member_count = member_count;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getClub_picture() {
		return club_picture;
	}
	public void setClub_picture(String club_picture) {
		this.club_picture = club_picture;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	
}
