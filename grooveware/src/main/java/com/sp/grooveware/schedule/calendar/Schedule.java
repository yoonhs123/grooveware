package com.sp.grooveware.schedule.calendar;

import java.util.List;

public class Schedule {
	private long num;
	private long emp_no;
	private String userName;
	private String subject;
	private String memo;
	private String sday;
	private String eday;
	private String all_day;
	private String stime;
	private String etime;
	private int repeat;
	private int repeat_cycle;
	private String reg_date;

	private Long category_num;
	private String category;
	
	private String sharedId;
	private List<String> sharedUsers;
	
	
	// 풀캘린더에 무조건 들어가야할 변수들
	private long id; 
	private String title; // 글제목
	private boolean allDay; // 전체일정 여부
	private String start; // 시작 날
	private String end; // 끝 날
	private String color; // 달력의 색깔
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	public String getAll_day() {
		return all_day;
	}
	public void setAll_day(String all_day) {
		this.all_day = all_day;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public int getRepeat_cycle() {
		return repeat_cycle;
	}
	public void setRepeat_cycle(int repeat_cycle) {
		this.repeat_cycle = repeat_cycle;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Long getCategory_num() {
		return category_num;
	}
	public void setCategory_num(Long category_num) {
		this.category_num = category_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSharedId() {
		return sharedId;
	}
	public void setSharedId(String sharedId) {
		this.sharedId = sharedId;
	}
	public List<String> getSharedUsers() {
		return sharedUsers;
	}
	public void setSharedUsers(List<String> sharedUsers) {
		this.sharedUsers = sharedUsers;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
