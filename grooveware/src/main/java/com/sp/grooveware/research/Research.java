package com.sp.grooveware.research;

import java.util.List;

public class Research {
	// 설문조사
	private long research_id;
	private long emp_no;
	private String emp_name;
	private String research_title;
	private String research_content;
	private String research_regdate;
	private String research_startdate;
	private String research_enddate;
	private int research_status;
	
	// 설문조사 - 질문
	private long question_no;
	private String question_content;
	private long question_num;
	private long question_category;
	
	// 설문조사 - 객관식 옵션
	private long answer_no;
	private String ans_option_content;
	private int ans_option_num;
	
	// 설문조사 - 실제 응답
	private String response_date;
	private String response_content;
	private int multiple_choice;
	
	private List<String> ans_option_contents;
	private List<Integer> ans_option_nums;
	
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	public long getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(long question_num) {
		this.question_num = question_num;
	}
	public long getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(long question_category) {
		this.question_category = question_category;
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
	public int getAns_option_num() {
		return ans_option_num;
	}
	public void setAns_option_num(int ans_option_num) {
		this.ans_option_num = ans_option_num;
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
	public List<String> getAns_option_contents() {
		return ans_option_contents;
	}
	public void setAns_option_contents(List<String> ans_option_contents) {
		this.ans_option_contents = ans_option_contents;
	}
	public List<Integer> getAns_option_nums() {
		return ans_option_nums;
	}
	public void setAns_option_nums(List<Integer> ans_option_nums) {
		this.ans_option_nums = ans_option_nums;
	}
	public int getMultiple_choice() {
		return multiple_choice;
	}
	public void setMultiple_choice(int multiple_choice) {
		this.multiple_choice = multiple_choice;
	}
	

}
