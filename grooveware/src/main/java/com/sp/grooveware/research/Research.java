package com.sp.grooveware.research;

public class Research {
	// 설문조사
	private long research_id;
	private long emp_no;
	private String research_title;
	private String research_content;
	private String research_regdate;
	private String research_startdate;
	private String research_enddate;
	private int research_status;
	
	// 설문조사 - 질문
	private long question_no;
	private String question_content;
	
	// 설문조사 - 객관식 옵션
	private long answer_no;
	private String ans_option_content;
	
	// 설문조사 - 실제 응답
	private long response_no;
	private String response_date;
	private String response_content;
	
	public long getResearch_id() {
		return research_id;
	}
	public void setResearch_id(long research_id) {
		this.research_id = research_id;
	}
	public long getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(long emp_no) {
		this.emp_no = emp_no;
	}
	public String getResearch_title() {
		return research_title;
	}
	public void setResearch_title(String research_title) {
		this.research_title = research_title;
	}
	public String getResearch_content() {
		return research_content;
	}
	public void setResearch_content(String research_content) {
		this.research_content = research_content;
	}
	public String getResearch_regdate() {
		return research_regdate;
	}
	public void setResearch_regdate(String research_regdate) {
		this.research_regdate = research_regdate;
	}
	public String getResearch_startdate() {
		return research_startdate;
	}
	public void setResearch_startdate(String research_startdate) {
		this.research_startdate = research_startdate;
	}
	public String getResearch_enddate() {
		return research_enddate;
	}
	public void setResearch_enddate(String research_enddate) {
		this.research_enddate = research_enddate;
	}
	public int getResearch_status() {
		return research_status;
	}
	public void setResearch_status(int research_status) {
		this.research_status = research_status;
	}
	public long getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(long question_no) {
		this.question_no = question_no;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public long getAnswer_no() {
		return answer_no;
	}
	public void setAnswer_no(long answer_no) {
		this.answer_no = answer_no;
	}
	public String getAns_option_content() {
		return ans_option_content;
	}
	public void setAns_option_content(String ans_option_content) {
		this.ans_option_content = ans_option_content;
	}
	public long getResponse_no() {
		return response_no;
	}
	public void setResponse_no(long response_no) {
		this.response_no = response_no;
	}
	public String getResponse_date() {
		return response_date;
	}
	public void setResponse_date(String response_date) {
		this.response_date = response_date;
	}
	public String getResponse_content() {
		return response_content;
	}
	public void setResponse_content(String response_content) {
		this.response_content = response_content;
	}
}
