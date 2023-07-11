package com.sp.grooveware.approval;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Approval {
	
	private String emp_name;
	private String doc_emp_name;
	private String dept_name;
	private String pos_name;
	
	
	private long doc_no;
	private long emp_no;
	private int doc_status;
	private int urgent;
	private String doc_name;
	private String draft_date;
	private String draft_deadline;
	private int approval_step;
	private String approval_finaldate;
	private String submit_date;
	private int important;
	private int is_visible;
	
	// 결재 상세 
	private int approval_status_id;
	private int approval_status;
	private String approval_date;
	private String reject_reason;
	
	
	// 내부결재용 양식
	private int draft_category;
	private String draft_content;
	
	// 문서파일
	private long file_no;

	private String save_filename;
	private String original_filename;
	private List<MultipartFile> selectFile;
	
	// 휴가구분
	private int holiday_id;
	private String holiday_name;
	
	// 휴가신청 양식
	private String annual_reason;
	private int annual_type;
	private int annual_count;
	private String annual_startdate;
	private String annual_enddate;

	// 결재권자
	private List<Long> emp_nos;
	private List<Long> history_emp_nos;
	
	private String emp_save_filename;
 
	
  
	public String getEmp_save_filename() {
		return emp_save_filename;
	}
	public void setEmp_save_filename(String emp_save_filename) {
		this.emp_save_filename = emp_save_filename;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDoc_emp_name() {
		return doc_emp_name;
	}
	public void setDoc_emp_name(String doc_emp_name) {
		this.doc_emp_name = doc_emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public long getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(long doc_no) {
		this.doc_no = doc_no;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public int getDoc_status() {
		return doc_status;
	}
	public void setDoc_status(int doc_status) {
		this.doc_status = doc_status;
	}
	public int getUrgent() {
		return urgent;
	}
	public void setUrgent(int urgent) {
		this.urgent = urgent;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDraft_date() {
		return draft_date;
	}
	public void setDraft_date(String draft_date) {
		this.draft_date = draft_date;
	}
	public String getDraft_deadline() {
		return draft_deadline;
	}
	public void setDraft_deadline(String draft_deadline) {
		this.draft_deadline = draft_deadline;
	}
	public int getApproval_step() {
		return approval_step;
	}
	public void setApproval_step(int approval_step) {
		this.approval_step = approval_step;
	}
	public String getApproval_finaldate() {
		return approval_finaldate;
	}
	public void setApproval_finaldate(String approval_finaldate) {
		this.approval_finaldate = approval_finaldate;
	}
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}
	public int getImportant() {
		return important;
	}
	public void setImportant(int important) {
		this.important = important;
	}
	public int getIs_visible() {
		return is_visible;
	}
	public void setIs_visible(int is_visible) {
		this.is_visible = is_visible;
	}
	public int getApproval_status_id() {
		return approval_status_id;
	}
	public void setApproval_status_id(int approval_status_id) {
		this.approval_status_id = approval_status_id;
	}
	public int getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(int approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_date() {
		return approval_date;
	}
	public void setApproval_date(String approval_date) {
		this.approval_date = approval_date;
	}
	public String getReject_reason() {
		return reject_reason;
	}
	public void setReject_reason(String reject_reason) {
		this.reject_reason = reject_reason;
	}
	public int getDraft_category() {
		return draft_category;
	}
	public void setDraft_category(int draft_category) {
		this.draft_category = draft_category;
	}
	public String getDraft_content() {
		return draft_content;
	}
	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}
	public long getFile_no() {
		return file_no;
	}
	public void setFile_no(long file_no) {
		this.file_no = file_no;
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
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getHoliday_id() {
		return holiday_id;
	}
	public void setHoliday_id(int holiday_id) {
		this.holiday_id = holiday_id;
	}
	public String getHoliday_name() {
		return holiday_name;
	}
	public void setHoliday_name(String holiday_name) {
		this.holiday_name = holiday_name;
	}
	public String getAnnual_reason() {
		return annual_reason;
	}
	public void setAnnual_reason(String annual_reason) {
		this.annual_reason = annual_reason;
	}
	public int getAnnual_type() {
		return annual_type;
	}
	public void setAnnual_type(int annual_type) {
		this.annual_type = annual_type;
	}
	public int getAnnual_count() {
		return annual_count;
	}
	public void setAnnual_count(int annual_count) {
		this.annual_count = annual_count;
	}
	public String getAnnual_startdate() {
		return annual_startdate;
	}
	public void setAnnual_startdate(String annual_startdate) {
		this.annual_startdate = annual_startdate;
	}
	public String getAnnual_enddate() {
		return annual_enddate;
	}
	public void setAnnual_enddate(String annual_enddate) {
		this.annual_enddate = annual_enddate;
	}
	public List<Long> getEmp_nos() {
		return emp_nos;
	}
	public void setEmp_nos(List<Long> emp_nos) {
		this.emp_nos = emp_nos;
	}
	public List<Long> getHistory_emp_nos() {
		return history_emp_nos;
	}
	public void setHistory_emp_nos(List<Long> history_emp_nos) {
		this.history_emp_nos = history_emp_nos;
	}
	
	
	 
	
}


