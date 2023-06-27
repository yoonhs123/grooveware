package com.sp.grooveware.notice;

import org.springframework.web.multipart.MultipartFile;

// 그룹웨어_공지
// dept_no : null 이면 전체 공지


public class Notice {

	private long noti_id;
	private long emp_no;
	private String emp_name;
	private Long dept_id;
	private String noti_title;
	private String noti_content;
	private String noti_regdate; 
	private String noti_hitcount;
	
	private String save_filename;
	private String original_filename;
	private MultipartFile selectFile;
	
	private long gap;

	public long getNoti_id() {
		return noti_id;
	}

	public void setNoti_id(long noti_id) {
		this.noti_id = noti_id;
	}

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

	public Long getDept_id() {
		return dept_id;
	}

	public void setDept_id(Long dept_id) {
		this.dept_id = dept_id;
	}

	public String getNoti_title() {
		return noti_title;
	}

	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}

	public String getNoti_content() {
		return noti_content;
	}

	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}

	public String getNoti_regdate() {
		return noti_regdate;
	}

	public void setNoti_regdate(String noti_regdate) {
		this.noti_regdate = noti_regdate;
	}

	public String getNoti_hitcount() {
		return noti_hitcount;
	}

	public void setNoti_hitcount(String noti_hitcount) {
		this.noti_hitcount = noti_hitcount;
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

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}


}
