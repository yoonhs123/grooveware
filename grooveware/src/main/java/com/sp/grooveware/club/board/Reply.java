package com.sp.grooveware.club.board;

public class Reply {
	private long club_id;
	private String club_name;
	private long emp_no;
	private String emp_name;
	
	private long club_board_no;
	private long board_category;
	
	private long reply_no;
	private String reply_content;
	private String reply_regdate;
	private String reply_answer;
	private int reply_show;
	
	private int answerCount;
	private int likeCount;
	
	public long getClub_id() {
		return club_id;
	}
	public void setClub_id(long club_id) {
		this.club_id = club_id;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
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
	public long getClub_board_no() {
		return club_board_no;
	}
	public void setClub_board_no(long club_board_no) {
		this.club_board_no = club_board_no;
	}
	public long getBoard_category() {
		return board_category;
	}
	public void setBoard_category(long board_category) {
		this.board_category = board_category;
	}
	public long getReply_no() {
		return reply_no;
	}
	public void setReply_no(long reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public String getReply_answer() {
		return reply_answer;
	}
	public void setReply_answer(String reply_answer) {
		this.reply_answer = reply_answer;
	}
	public int getReply_show() {
		return reply_show;
	}
	public void setReply_show(int reply_show) {
		this.reply_show = reply_show;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
