package com.sp.grooveware.notice;

import org.springframework.web.multipart.MultipartFile;

// 그룹웨어

public class Notice {

	private long num;
	private int not_id;
	private long emp_no;
	private int dept_id;
	private long dept_no;
	private String noti_title;
	private String noti_content;
	private String noti_regdate; 
	private String noti_hitcount;
	
	
	private String save_filename;
	private String original_filename;
	private MultipartFile selectFile;
	
	//파일의 크기
	private long fileSize; 

	// 해당 게시물에 첨부된 파일의 개수
	private long fileCount;

	// 스프링에서 파일 업로드용 객체 
	// <input type="file" name="selectFile">와 같이 클라이언트로부터
	// 전송된 파일을 받아오는 역할
	
	/*
	private List<MultipartFile> selectFile; // <input type="file" name="selectFile"
	*/
	
	private long gap;

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public int getNot_id() {
		return not_id;
	}

	public void setNot_id(int not_id) {
		this.not_id = not_id;
	}

	public long getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public long getDept_no() {
		return dept_no;
	}

	public void setDept_no(long dept_no) {
		this.dept_no = dept_no;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public long getFileCount() {
		return fileCount;
	}

	public void setFileCount(long fileCount) {
		this.fileCount = fileCount;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}

	
	
	
	
}
