package com.sp.grooveware.insamanage;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author user
 *
 */
public class InsaManage {
	private long qualifer;
	private long emp_no;
	private String emp_pwd;
	private String emp_name;
	private String emp_rrn;
	private String emp_email;
	private String emp_tel;
	private String emp_address;
	private String emp_join_date;
	private String emp_resign_date;
	private long emp_status;
	private MultipartFile emp_picture;
	
	private long history_no;
	private String pos_startdate;
	private String pos_enddate;
	private String dept_startdate;
	private String dept_enddate;
	
	private long dept_no;
	private String dept_name;
	private int dept_status;
	private long top_dept_no;
	
	private int pos_no;
	private String pos_name;
	private long top_pos_no;
	
	public long getQualifer() {
		return qualifer;
	}
	public void setQualifer(long qualifer) {
		this.qualifer = qualifer;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
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
	public MultipartFile getEmp_picture() {
		return emp_picture;
	}
	public void setEmp_picture(MultipartFile emp_picture) {
		this.emp_picture = emp_picture;
	}
	public long getHistory_no() {
		return history_no;
	}
	public void setHistory_no(long history_no) {
		this.history_no = history_no;
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
	public int getDept_status() {
		return dept_status;
	}
	public void setDept_status(int dept_status) {
		this.dept_status = dept_status;
	}
	public long getTop_dept_no() {
		return top_dept_no;
	}
	public void setTop_dept_no(long top_dept_no) {
		this.top_dept_no = top_dept_no;
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
	public long getTop_pos_no() {
		return top_pos_no;
	}
	public void setTop_pos_no(long top_pos_no) {
		this.top_pos_no = top_pos_no;
	}
}
